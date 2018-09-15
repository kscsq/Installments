package ru.kscsq.installments.models;

import java.time.LocalDate;

public class Student {

    private String lastname;
    private String firstname;
    private double amount;
    private LocalDate date;
    private String transferMethod;

    public Student() {
    }

    public Student(String lastname, String firstname, double amount, LocalDate date, String transferMethod) {
        this.lastname = lastname;
        this.firstname = firstname;
        this.amount = amount;
        this.date = date;
        this.transferMethod = transferMethod;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getTransferMethod() {
        return transferMethod;
    }

    public void setTransferMethod(String transferMethod) {
        this.transferMethod = transferMethod;
    }
}
