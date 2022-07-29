package fa.training.employeemanagement.service;

import fa.training.employeemanagement.dao.EmployeeDao;
import fa.training.employeemanagement.dao.impl.EmployeeDaoImpl;
import fa.training.employeemanagement.dto.EmployeeDTO;
import fa.training.employeemanagement.model.Employee;
import org.hibernate.HibernateException;

import java.util.List;
import java.util.stream.Collectors;

public class EmployeeService {
    EmployeeDao employeeDao;
    private static final int PAGE_SIZE = 3;

    public EmployeeService() {
        employeeDao = new EmployeeDaoImpl();
    }

    public List<EmployeeDTO> getByPagination(int pageNumber) throws HibernateException {
        return employeeDao.getByPagination(PAGE_SIZE, pageNumber).stream()
                .map(EmployeeDTO::new).collect(Collectors.toList());
    }

    public void insert(Employee employee) throws HibernateException{
        employeeDao.create(employee);
    }
    public int getMaxPageSize() throws HibernateException {
        Long countRecord = employeeDao.getTotalRecord();
        return (int)Math.ceil(countRecord.doubleValue() / PAGE_SIZE);
    }

    public int getMaxPageSizeForSearching(String keyword, String columnFind) throws HibernateException {
        Long countRecord = employeeDao.getTotalRecordForSearching(columnFind, keyword);
        return (int)Math.ceil(countRecord.doubleValue() / PAGE_SIZE);
    }

    public List<EmployeeDTO> findEmployeesAndPagination(int pageNumber, String keyword, String columnFind) throws HibernateException {
        if(keyword.isEmpty()){
            return employeeDao.getByPagination(PAGE_SIZE, pageNumber).stream()
                    .map(EmployeeDTO::new).collect(Collectors.toList());
        }
        return employeeDao.findEmployeesAndPagination(PAGE_SIZE, pageNumber, columnFind, keyword).stream()
                .map((EmployeeDTO::new)).collect(Collectors.toList());
    }
}
