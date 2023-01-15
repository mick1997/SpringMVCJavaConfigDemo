package com.snva.smvcjava.controller;

import com.snva.smvcjava.command.Employee;
import com.snva.smvcjava.service.DataServicesImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private DataServicesImpl dataServices;
    static List<Employee> employees = new ArrayList<>();

    @RequestMapping(path = "/addemployee", method = RequestMethod.GET)
    public ModelAndView employee(ModelMap modelMap) {
        return new ModelAndView("employee","command", new Employee());
    }

    @RequestMapping(path = "/addemployee", method = RequestMethod.POST)
    public ModelAndView employeeAdd(@ModelAttribute("command") @Valid Employee employee,
                                    BindingResult bindingResult,
                                    ModelMap modelMap){
        if (bindingResult.hasErrors()){
        }
        else{
//            employee.setPassword("1234");
            dataServices.saveUser(employee);
            modelMap.put("employees", employees);
        }
        //return new ModelAndView("employee","command",new Employee());
        return  new ModelAndView("employee");
    }

//    static  List<String> empNames = new ArrayList<>();
//    @RequestMapping(value = "/processForm")
//    public ModelAndView showDashobard(@RequestParam("empName") String empName, Model model ) {
//
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("index");
//        empNames.add(empName);
//        model.addAttribute("empNames", empNames);
//        return modelAndView;
//    }
}
