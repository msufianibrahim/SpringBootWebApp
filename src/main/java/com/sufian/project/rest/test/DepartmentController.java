package com.sufian.project.rest.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.sufian.project.entity.test.Department;
import com.sufian.project.service.DepartmentService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@RestController
@RequestMapping("/department")
public class DepartmentController {
    private final DepartmentService departmentService;
    
    private static final Logger logger = LoggerFactory.getLogger(DepartmentController.class);
    
    @Autowired
    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
    
    @RequestMapping(value = "/index")
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("indexDepartment");
        return modelAndView;
    }
    
    @RequestMapping(value = "/create")
    public ModelAndView create() {
        ModelAndView modelAndView = new ModelAndView("createDepartment");
        return modelAndView;
    }
    
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("editDepartment");
        modelAndView.addObject("departmentId", id); // Pass the department ID to the view
        return modelAndView;
    }

    @GetMapping("/list")
    public ResponseEntity<List<Department>> getAllDepartments() {
        List<Department> departments = departmentService.getAllDepartments();
        logger.info("::::::::::::::::::::::::::::::::::" + departments.toString());
        return new ResponseEntity<>(departments, HttpStatus.OK);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Department> getDepartment(@PathVariable("id") Long id) {
        Department department = departmentService.getDepartmentById(id);
        return new ResponseEntity<>(department, HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<Department> createDepartment(@RequestBody Department department) {
        logger.info("create1");
        logger.info("::::::::::::::::::::::::::::::::::" + department.toString());
        logger.info("create2");
        Department createdDepartment = departmentService.createDepartment(department);
        return new ResponseEntity<>(createdDepartment, HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Department> updateDepartment(@PathVariable("id") Long id, @RequestBody Department department) {
        logger.info("::::::::::::::::::::::::::::::::::" + department.toString());
        Department updatedDepartment = departmentService.updateDepartment(id, department);
        return new ResponseEntity<>(updatedDepartment, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDepartment(@PathVariable("id") Long id) {
        departmentService.deleteDepartment(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
