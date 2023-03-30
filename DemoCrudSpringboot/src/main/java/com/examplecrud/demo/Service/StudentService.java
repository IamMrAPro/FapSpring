/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examplecrud.demo.Service;

import com.examplecrud.demo.Model.Student;
import com.examplecrud.demo.Repository.StudentRepository;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author anhha
 */
public class StudentService implements IStudentService {

    private StudentRepository studentRepository;

    @Override
    public List<Student> getAllStudent() {
        return studentRepository.findAll();
    }

    @Override
    public void updateTodo(Student student) {
        studentRepository.save(student);
    }

    @Override
    public void addTodo() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteTodo(int id) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            studentRepository.delete(student.get());
        }
    }

    @Override
    public void saveTodo(Student student) {
        studentRepository.save(student);
    }

}
