package fa.training.employeemanagement.dao;

import fa.training.employeemanagement.model.Account;
import org.hibernate.HibernateException;

import java.util.List;

public interface AccountDao {

    public List<Account> getAll() throws HibernateException;

    public Account findByUsername(String username) throws HibernateException;

    public Account findByEmail(String email) throws HibernateException;
    public void create(Account account) throws HibernateException;

}
