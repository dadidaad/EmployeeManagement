package fa.training.employeemanagement.dto;

import fa.training.employeemanagement.model.Account;

public class AccountDTO {
    private int accountId;
    private String account;
    private String email;
    private boolean status;

    public AccountDTO() {
    }

    public AccountDTO(int accountId, String account, String email, int status) {
        this.accountId = accountId;
        this.account = account;
        this.email = email;
        this.status = status == 1;
    }

    public AccountDTO(Account account){
        this.accountId = account.getAccountId();
        this.account = account.getAccount();
        this.email = account.getEmail();
        this.status = account.getStatus() == 1;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status == 1;
    }

    @Override
    public String toString() {
        return "AccountDTO{" +
                "accountId=" + accountId +
                ", account='" + account + '\'' +
                ", email='" + email + '\'' +
                ", status=" + status +
                '}';
    }
}
