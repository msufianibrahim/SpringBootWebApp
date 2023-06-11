package com.sufian.project.dao.test.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import com.sufian.project.dao.test.DepartmentDao;
import com.sufian.project.entity.test.Department;

@Repository
@Transactional
public class DepartmentDaoImpl implements DepartmentDao {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Department> getAllDepartments() {
        String query = "SELECT d FROM Department d";
        return entityManager.createQuery(query, Department.class).getResultList();
    }

    @Override
    public Department getDepartmentById(Long id) {
        return entityManager.find(Department.class, id);
    }

    @Override
    public void createDepartment(Department department) {
        entityManager.persist(department);
    }

    @Override
    public void updateDepartment(Department department) {
        entityManager.merge(department);
    }

    @Override
    public void deleteDepartment(Long id) {
        Department department = entityManager.find(Department.class, id);
        if (department != null) {
            entityManager.remove(department);
        }
    }
}
