package com.xworkz.xworkzapp.dto;

import lombok.*;

import javax.persistence.Column;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class UserRegistrationDto {
    private Integer id;
    private String name;
    private Long phoneNumber;
    private String emailId;
    private String password;
    private String conformPassword;
    private String location;
    private String gender;
    private Integer age;
    private String date;
}
