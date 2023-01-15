package com.snva.smvcjava.service;

import com.snva.smvcjava.command.Employee;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
@PropertySource("classpath:users.properties")
public class DataServicesImpl implements IDataServices {

    @Value("${mypath}")
    private String path;

    @Override
    public void init() {}

    @Override
    public String saveUser(Employee employee) {
        try {
            ObjectOutputStream objectOutputStream= new ObjectOutputStream(new FileOutputStream(path + "/" + employee.getFirstName()));
            objectOutputStream.writeObject(employee);
            objectOutputStream.close();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        return "File was written successfully";
    }

    @Override
    public String saveUsers(List<Employee> employees) {
        return null;
    }

    @Override
    public List<Employee> loadUsers() {
        File file = new File(path);
        File[] files = file.listFiles();
        List<Employee> employees = new ArrayList<>();

        for (File file1: files) {
            try {
                ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream(file1.getAbsolutePath()));

                Employee employee = (Employee) objectInputStream.readObject();
                employees.add(employee);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return employees;
    }

    @Override
    public List<Employee> loadUser() {
        return null;
    }
}
