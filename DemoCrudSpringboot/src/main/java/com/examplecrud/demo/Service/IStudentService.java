/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examplecrud.demo.Service;

import com.examplecrud.demo.Model.Student;
import java.util.List;

/**
 *
 * @author anhha
 */
public interface IStudentService {

    List<Student> getAllStudent();

    void updateTodo(Student student);

    void addTodo();

    void deleteTodo(int id);

    void saveTodo(Student student);

}
