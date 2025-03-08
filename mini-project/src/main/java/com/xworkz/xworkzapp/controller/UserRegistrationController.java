package com.xworkz.xworkzapp.controller;

import com.xworkz.xworkzapp.dto.UserRegistrationDto;
import com.xworkz.xworkzapp.entity.UserRegistrationEntity;
import com.xworkz.xworkzapp.service.UserRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Component
@RequestMapping("/")
public class UserRegistrationController {

    @Autowired
    UserRegistrationService userRegistrationService;

    @RequestMapping ("signup")
    public String SignUp(){
        return "home.jsp";
    }

    @RequestMapping ("index")
    public String Index(){
        return "index.jsp";
    }

    @RequestMapping ("addUser")
    public String addUser(UserRegistrationDto dto, Model model){
        String errorMessage = userRegistrationService.validAndSave(dto);
        if (errorMessage != null){
            model.addAttribute("error", errorMessage);
            return "home.jsp";
        }
        return "response.jsp";
    }

    @RequestMapping ("signin")
    public String signIn(){
        return "signin.jsp";
    }

    @RequestMapping ("login")
    public ModelAndView loginUser(@RequestParam("emailId") String emailId,
                                  @RequestParam("password") String password){
        UserRegistrationEntity user = userRegistrationService.authenticateUser(emailId, password);
        if (user != null){
            return new ModelAndView("welcome.jsp", "user", user);
        }
        return new ModelAndView("signin.jsp", "errorMessage", "Invalid Email or password.");
    }

    @RequestMapping ("fetchByEmail")
    public String fetchByEmail(@RequestParam("emailId") String emailId, Model model){
        UserRegistrationDto dto = userRegistrationService.fetchByEmail(emailId);
        model.addAttribute("user", dto);
        return "update.jsp";
    }

    @RequestMapping ("update")
    public String updateAndSave(UserRegistrationDto dto, Model model){
        Boolean updateUser = userRegistrationService.updateUser(dto);
        if (updateUser){
            model.addAttribute("msg","User Data Updated Successfully");
        }else {
            model.addAttribute("msg", "User Data Not Updated");
        }
        return "update.jsp";
    }


}
