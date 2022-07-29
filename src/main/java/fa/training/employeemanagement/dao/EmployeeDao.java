package fa.training.employeemanagement.dao;

import fa.training.employeemanagement.model.Employee;
import org.hibernate.HibernateException;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeDao {

    public List<Employee> getAll() throws HibernateException;

    public Employee findById(int empId) throws HibernateException;

    public void create(Employee employee) throws HibernateException;

    public List<Employee> getByPagination(int pageSize, int pageNumber) throws HibernateException;

    public Long getTotalRecord() throws HibernateException;

    public Long getTotalRecordForSearching(String columnFind, String keyword) throws HibernateException;
    public List<Employee> findEmployeesAndPagination(int pageSize, int pageNumber, String columnFind, String keyword) throws HibernateException;
}
