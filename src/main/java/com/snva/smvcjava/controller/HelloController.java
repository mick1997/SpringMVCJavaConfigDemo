package com.snva.smvcjava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@RestController
@Controller
public class HelloController {

    @RequestMapping("/")
    public ModelAndView getIndex(ModelMap modelMap){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelMap.put("message","from the server");
        return modelAndView;
    }

    static List<String> empNames = new ArrayList<>();
    @RequestMapping(value = "/processForm")
    public ModelAndView showDashobard(@RequestParam("empName") String empName, Model model) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        empNames.add(empName);
        model.addAttribute("empNames", empNames);
        return modelAndView;
    }
}
