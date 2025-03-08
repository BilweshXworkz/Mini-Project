package com.xworkz.xworkzapp.repository;

import com.xworkz.xworkzapp.entity.UserRegistrationEntity;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.time.LocalDateTime;

@Service
public class UserRegistrationRepositoryImpl implements UserRegistrationRepository{
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("user");
    @Override
    public Boolean save(UserRegistrationEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegistrationEntity checkAuthenticateUser(String emailId, String password) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            TypedQuery<UserRegistrationEntity> query = entityManager.createNamedQuery("authenticateUser", UserRegistrationEntity.class);
            query.setParameter("emailId", emailId);
            query.setParameter("password", password);
            UserRegistrationEntity user = query.getSingleResult();

            if (user != null){
                if (user.getAccountLockedUntil() != null && user.getAccountLockedUntil().isAfter(LocalDateTime.now())) {
                    System.out.println("Account is locked until "+user.getAccountLockedUntil());
                    return null;
                }
                resetFailedAttempts(user);
            }
            return user;
        } catch (NoResultException e) {
            System.out.println(e.getMessage());
            updateFailedAttemps(emailId);
            return null;
        }finally {
            entityManager.close();
        }
    }

    private void resetFailedAttempts(UserRegistrationEntity user){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            user.setFailedAttempts(0);
            user.setAccountLockedUntil(null);
            entityManager.merge(user);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            entityManager.close();
        }
    }

    private void updateFailedAttemps(String emailId){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            UserRegistrationEntity user = fetchEmail(emailId);

            if (user != null){
                int attempts = user.getFailedAttempts() + 1;
                user.setFailedAttempts(attempts);

                if (attempts >= 3){
                    user.setAccountLockedUntil(LocalDateTime.now().plusHours(1));
                    System.out.println("Account is locked for 24 hours");
                }
                entityManager.merge(user);
                entityManager.getTransaction().commit();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegistrationEntity fetchEmail(String emailId) {
        if (emailId == null || emailId.trim().isEmpty()) {
            System.out.println("Invalid emailId provided.");
            return null;
        }
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createNamedQuery("fetchByEmail", UserRegistrationEntity.class)
                    .setParameter("emailId", emailId.trim().toLowerCase())
                    .getSingleResult();
        } catch (NoResultException e) {
            System.out.println("No user found with email: " + emailId);
            return null;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        } finally {
            entityManager.close();
        }
    }


    @Override
    public Boolean saveUpdate(UserRegistrationEntity entity, boolean updatePassword) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();

            Query query = entityManager.createNamedQuery("updateUserByEmail");
            query.setParameter("name", entity.getName());
            query.setParameter("phoneNumber", entity.getPhoneNumber());
            query.setParameter("age", entity.getAge());
            query.setParameter("location", entity.getLocation());
            query.setParameter("emailId", entity.getEmailId());

            int updatedRows = query.executeUpdate();
            System.out.println("Rows updated: " + updatedRows);

            if (updatePassword && updatedRows > 0) {
                Query passwordQuery = entityManager.createNamedQuery("updateUserPassword");
                passwordQuery.setParameter("password", entity.getPassword());
                passwordQuery.setParameter("emailId", entity.getEmailId());
                passwordQuery.executeUpdate();
                System.out.println("Password updated for: " + entity.getEmailId());
            }

            entityManager.getTransaction().commit();
            return updatedRows > 0; // Return true if update is successful

        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return false;
        } finally {
            entityManager.close();
        }
    }

}
