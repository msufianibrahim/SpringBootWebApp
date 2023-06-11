package com.sufian.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sufian.project.dao.test.DepartmentDao;
import com.sufian.project.entity.test.Department;
import com.sufian.project.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    private final DepartmentDao departmentDao;

    @Autowired
    public DepartmentServiceImpl(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Override
    public List<Department> getAllDepartments() {
        return departmentDao.getAllDepartments();
    }

    @Override
    public Department getDepartmentById(Long id) {
        return departmentDao.getDepartmentById(id);
    }

    @Override
    public Department createDepartment(Department department) {
    	departmentDao.createDepartment(department);
        return department;
    }

    @Override
    public Department updateDepartment(Long id, Department department) {
        Department existingDepartment = departmentDao.getDepartmentById(id);
        if (existingDepartment != null) {
        	existingDepartment.setDepartmentName(department.getDepartmentName());
        	departmentDao.updateDepartment(existingDepartment); // Use entityManager.merge() to update the book entity
            return existingDepartment;
        }
        return null;
    }

    @Override
    public void deleteDepartment(Long id) {
        departmentDao.deleteDepartment(id);
    }
}
