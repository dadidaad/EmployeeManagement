package fa.training.employeemanagement.dao.impl;

import fa.training.employeemanagement.dao.EmployeeDao;
import fa.training.employeemanagement.model.Employee;
import fa.training.employeemanagement.util.HibernateUtil;
import org.hibernate.HibernateException;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class EmployeeDaoImpl extends HibernateUtil implements EmployeeDao {
    @Override
    public List<Employee> getAll() throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);
        Root<Employee> employeeRoot = criteriaQuery.from(Employee.class);
        CriteriaQuery<Employee> allEmployee = criteriaQuery.select(employeeRoot);
        TypedQuery<Employee> employeeTypedQuery = entityManager.createQuery(allEmployee);
        return employeeTypedQuery.getResultList();
    }

    @Override
    public Employee findById(int empId) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);
        Root<Employee> employeeRoot = criteriaQuery.from(Employee.class);
        Predicate empIdPredicate = criteriaBuilder.equal(employeeRoot.get("employeeId"), empId);
        criteriaQuery.where(empIdPredicate);
        TypedQuery<Employee> employeeTypedQuery = entityManager.createQuery(criteriaQuery);
        return employeeTypedQuery.getResultList().stream().findFirst().orElse(null);
    }

    @Override
    public void create(Employee employee) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(employee);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public List<Employee> getByPagination(int pageSize, int pageNumber) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);
        Root<Employee> employeeRoot = criteriaQuery.from(Employee.class);
        CriteriaQuery<Employee> allEmployee = criteriaQuery.select(employeeRoot);
        TypedQuery<Employee> employeeTypedQuery = entityManager.createQuery(allEmployee);
        employeeTypedQuery.setFirstResult((pageNumber - 1) * pageSize);
        employeeTypedQuery.setMaxResults(pageSize);
        return employeeTypedQuery.getResultList();
    }

    @Override
    public List<Employee> findEmployeesAndPagination(int pageSize, int pageNumber, String columnFind, String keyword) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);
        Root<Employee> employeeRoot = criteriaQuery.from(Employee.class);
        Predicate empIdPredicate = criteriaBuilder.like(employeeRoot.get(columnFind), String.format("%%%s%%", keyword));
        CriteriaQuery<Employee> allEmployee = criteriaQuery.select(employeeRoot).where(empIdPredicate);
        TypedQuery<Employee> employeeTypedQuery = entityManager.createQuery(allEmployee);
        employeeTypedQuery.setFirstResult((pageNumber - 1) * pageSize);
        employeeTypedQuery.setMaxResults(pageSize);
        return employeeTypedQuery.getResultList();
    }

    @Override
    public Long getTotalRecord() throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQueryLong = criteriaBuilder.createQuery(Long.class);
        criteriaQueryLong.select(criteriaBuilder.count(criteriaQueryLong.from(Employee.class)));
        return entityManager.createQuery(criteriaQueryLong).getSingleResult();
    }

    @Override
    public Long getTotalRecordForSearching(String columnFind, String keyword) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> criteriaQuery = builder.createQuery(Employee.class);
        Root<Employee> entity_ = criteriaQuery.from(Employee.class);
        entity_.alias("employee"); //assign alias to entity root
        criteriaQuery.where(builder.like(entity_.get(columnFind), String.format("%%%s%%", keyword)));
        // Generic retrieve count
        CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);
        Root<Employee> entity__ = countQuery.from(criteriaQuery.getResultType());
        entity__.alias("employee"); //use the same alias in order to match the restrictions part and the selection part
        countQuery.select(builder.count(entity_));
        Predicate restriction = criteriaQuery.getRestriction();
        if (restriction != null) {
            countQuery.where(restriction); // Copy restrictions
        }
        return entityManager.createQuery(countQuery).getSingleResult();
    }
}
