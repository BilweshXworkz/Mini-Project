package com.xworkz.xworkzapp.repository;

import com.xworkz.xworkzapp.entity.UserRegistrationEntity;

public interface UserRegistrationRepository {
    Boolean save(UserRegistrationEntity entity);
    UserRegistrationEntity checkAuthenticateUser(String emailId, String password);
    UserRegistrationEntity fetchEmail(String emailId);
    public Boolean saveUpdate(UserRegistrationEntity entity, boolean updatePassword);
}
