package fa.training.employeemanagement.service;

import fa.training.employeemanagement.dao.AccountDao;
import fa.training.employeemanagement.dao.impl.AccountDaoImpl;
import fa.training.employeemanagement.dto.AccountDTO;
import fa.training.employeemanagement.model.Account;
import fa.training.employeemanagement.util.PasswordUtil;
import org.hibernate.HibernateException;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    AccountDao accountDao;

    public AccountService() {
        accountDao = new AccountDaoImpl();
    }

    public List<AccountDTO> getAll() throws HibernateException {
        return accountDao.getAll().stream().map(AccountDTO::new).collect(Collectors.toList());
    }

    public AccountDTO findByUsername(String username) throws HibernateException {
        Account account = accountDao.findByUsername(username);
        if (account == null) {
            return null;
        }
        return new AccountDTO(account);
    }

    public AccountDTO findByEmail(String email) throws HibernateException {
        Account account = accountDao.findByEmail(email);
        if (account == null) {
            return null;
        }
        return new AccountDTO(account);
    }
    public boolean compareUsernameAndPassword(AccountDTO accountDTO, String password)
            throws HibernateException, NoSuchAlgorithmException, InvalidKeySpecException {
        Account account = accountDao.findByUsername(accountDTO.getAccount());
        if (account == null) {
            return false;
        }
        return PasswordUtil.validatePassword(password, account.getPassword());
    }

    public void create(Account account) throws HibernateException, NoSuchAlgorithmException, InvalidKeySpecException {
        account.setPassword(PasswordUtil.generatePasswordHash(account.getPassword()));
        accountDao.create(account);
    }
}
