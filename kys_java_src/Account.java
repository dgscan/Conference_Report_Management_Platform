/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kys_deneme1;

import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author user
 */
public class Account {
    protected String email;
    protected String name;
    protected String surname;
    protected String password;
    protected String type;
    protected String university;
    protected String subject;
    
    public Account(String email, String name, String surname, String password, String type, String university){
        SetEmail(email);
        SetName(name);
        SetSurname(surname);
        SetPassword(password);
        SetType(type);
        SetUniversity(university);
    }
    
    public Account(String email, String name, String surname, String password, String type, String university, String subject){
        SetEmail(email);
        SetName(name);
        SetSurname(surname);
        SetPassword(password);
        SetType(type);
        SetUniversity(university);
        SetSubject(subject);
    }

    Account() {
        this ("","","","","","","");
    }
    
    public void SetEmail(String email){
        this.email=email;
    }
    public void SetName (String name){
        this.name=name;
    }
    public void SetSurname(String surname){
        this.surname=surname;
    }
    public void SetPassword(String password){
        this.password=password;
    }
    public void SetType(String type){
        this.type=type;
    }
    public void SetUniversity(String university){
        this.university=university;
    }
    public void SetSubject(String subject){
        this.subject=subject;
    }
    
    public String GetEmail(){
        return email;
    }
    public String GetName(){
        return name;
    }
    public String GetSurname(){
        return surname;
    }
    public String GetPassword(){
        return password;
    }
    public String GetType(){
        return type;
    }
    public String GetUniversity(){
        return university;
    }
    public String GetSubject(){
        return subject;
    }


  
    
}
