package com.snva.smvcjava.command;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

public class Employee implements Serializable {

    @NotEmpty
    @Size(min = 1 , message = "This field is required, please enter a valid name!")
    private String firstName;
    @NotEmpty
    @Size(min = 1 , message = "This field is required, please enter a valid name!")
    private  String lastName;
    @NotEmpty
    @Pattern(regexp = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@edu*(\\.[a-zA-Z]{1,6}))?$",
            message = "Only the college students with a valid edu can signup")
    private String email;
    @NotNull()
    @Size(min = 1 , message = "This field is required, please enter a valid Phone number!")
    private String contactNumber;
    @NotNull()
    @Size(min = 1 , message = "This field is required, please enter a valid password!")
    private String password;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
