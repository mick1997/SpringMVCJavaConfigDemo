package com.snva.smvcjava.controller;

import com.snva.smvcjava.command.Employee;
import com.snva.smvcjava.command.UserLogin;
import com.snva.smvcjava.service.DataServicesImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private DataServicesImpl dataServices;

    @RequestMapping(path="/login", method = RequestMethod.GET)
    public ModelAndView getLogin(ModelMap modelMap) {
        ModelAndView modelAndView = new ModelAndView();
//        List<Employee> employeeList = dataServices.loadUsers();
        // pass jsp file name in setViewName
        modelAndView.setViewName("login");
        return new ModelAndView("login", "command", new UserLogin());
    }

    @RequestMapping(path = "/dashboard", method = RequestMethod.POST)
    public ModelAndView doLogin(ModelMap modelMap, UserLogin userLogin, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        // get user information from loadUsers() method
        List<Employee> employeeList = dataServices.loadUsers();
        // loop through employeeList
        for (Employee emp : employeeList) {
            // check emp email and password is the same user email and password
            if (emp.getEmail().equalsIgnoreCase(userLogin.getEmail())) {
                if (emp.getPassword().equalsIgnoreCase(userLogin.getPassword())) {
                    modelAndView.setViewName("dashboard");
                    modelMap.put("user", emp);
                    return new ModelAndView("dashboard", "user", emp);
                }
                else {
                    modelAndView.setViewName("login");
                }
            }
            else {
                modelAndView.setViewName("login");
            }
        }
        return modelAndView;
    }
}
