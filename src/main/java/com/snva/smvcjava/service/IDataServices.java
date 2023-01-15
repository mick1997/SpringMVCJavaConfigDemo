package com.snva.smvcjava.service;

import com.snva.smvcjava.command.Employee;

import java.util.List;

public interface IDataServices {

    void init();
    String saveUser(Employee employee);
    String saveUsers(List<Employee> employees);
    List<Employee> loadUsers();
    List<Employee> loadUser();
}
