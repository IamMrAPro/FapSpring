/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examplecrud.demo.Controller;

import com.examplecrud.demo.Service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author anhha
 */
@Controller
public class StudentController {
    private StudentService studentService;
    @RequestMapping("/")
    public String ShowStudent(Model model){
        model.addAttribute("listStudent",studentService.getAllStudent() );
        return "home";
    }
}
