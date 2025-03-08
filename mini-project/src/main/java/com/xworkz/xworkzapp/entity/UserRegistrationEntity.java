    package com.xworkz.xworkzapp.entity;

    import lombok.Getter;
    import lombok.NoArgsConstructor;
    import lombok.Setter;
    import lombok.ToString;

    import javax.persistence.*;
    import java.time.LocalDateTime;

    @Getter
    @Setter
    @NoArgsConstructor
    @ToString
    @Entity
    @Table(name = "user_table")
    @NamedQuery(name = "authenticateUser", query ="Select user from UserRegistrationEntity user where  user.emailId = : emailId AND user.password =: password")
    @NamedQuery(name = "fetchByEmail", query = "SELECT u FROM UserRegistrationEntity u WHERE LOWER(u.emailId) = LOWER(:emailId)")
    @NamedQuery(
            name = "updateUserByEmail",
            query = "UPDATE UserRegistrationEntity u SET " +
                    "u.name = :name, " +
                    "u.phoneNumber = :phoneNumber, " +
                    "u.age = :age, " +
                    "u.location = :location " +
                    "WHERE u.emailId = :emailId"
    )
    @NamedQuery(
            name = "updateUserPassword",
            query = "UPDATE UserRegistrationEntity u SET u.password = :password WHERE u.emailId = :emailId"
    )

    @NamedQuery(
            name = "updateUserFailedAttempts",
            query = "UPDATE UserRegistrationEntity u SET u.failedAttempts = :failedAttempts, u.accountLockedUntil = :accountLockedUntil WHERE u.emailId = :emailId"
    )


    public class UserRegistrationEntity {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id")
        private Integer id;
        @Column(name = "name")
        private String name;
        @Column(name = "phone_number")
        private Long phoneNumber;
        @Column(name = "email_id")
        private String emailId;
        @Column(name = "password")
        private String password;
        @Column(name = "conform_password")
        private String conformPassword;
        @Column(name = "location")
        private String location;
        @Column(name = "gender")
        private String gender;
        @Column(name = "age")
        private Integer age;
        @Column(name = "date")
        private String date;
        @Column(name = "failed_attempts")
        private Integer failedAttempts = 0;
        @Column(name = "account_locked_until")
        private LocalDateTime accountLockedUntil;
    }
