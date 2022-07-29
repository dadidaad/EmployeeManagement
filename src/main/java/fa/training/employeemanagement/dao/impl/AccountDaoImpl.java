package fa.training.employeemanagement.dao.impl;

import fa.training.employeemanagement.dao.AccountDao;
import fa.training.employeemanagement.model.Account;
import fa.training.employeemanagement.util.HibernateUtil;
import org.hibernate.HibernateException;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.sql.SQLException;
import java.util.List;

public class AccountDaoImpl extends HibernateUtil implements AccountDao {
    @Override
    public List<Account> getAll() throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Account> accountCriteriaQuery = criteriaBuilder.createQuery(Account.class);
        Root<Account> accountRoot = accountCriteriaQuery.from(Account.class);
        CriteriaQuery<Account>  allAccount = accountCriteriaQuery.select(accountRoot);
        TypedQuery<Account> allQueryAccount = entityManager.createQuery(allAccount);
        return allQueryAccount.getResultList();
    }

    @Override
    public Account findByUsername(String username) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Account> criteriaQuery = criteriaBuilder.createQuery(Account.class);
        Root<Account> accountRoot = criteriaQuery.from(Account.class);
        Predicate usernamePredicate = criteriaBuilder.equal(accountRoot.get("account"), username);
        criteriaQuery.where(usernamePredicate);
        TypedQuery<Account> accountTypedQuery = entityManager.createQuery(criteriaQuery);
        return accountTypedQuery.getResultList().stream().findFirst().orElse(null);
    }

    @Override
    public Account findByEmail(String email) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Account> criteriaQuery = criteriaBuilder.createQuery(Account.class);
        Root<Account> accountRoot = criteriaQuery.from(Account.class);
        Predicate usernamePredicate = criteriaBuilder.equal(accountRoot.get("email"), email);
        criteriaQuery.where(usernamePredicate);
        TypedQuery<Account> accountTypedQuery = entityManager.createQuery(criteriaQuery);
        return accountTypedQuery.getResultList().stream().findFirst().orElse(null);
    }

    @Override
    public void create(Account account) throws HibernateException {
        EntityManager entityManager = getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(account);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
