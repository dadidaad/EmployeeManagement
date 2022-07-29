package fa.training.employeemanagement.validations;

import fa.training.employeemanagement.model.Account;
import fa.training.employeemanagement.model.Employee;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FieldValidation {
    public boolean validateLength(String inputField) {
        inputField = inputField.trim();
        return inputField.length() > 50 || inputField.isEmpty();
    }

    public boolean validatePassword(String password) {
        return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,100}$");
    }

    public boolean validateTrueFalse(int boole) {
        return boole == 1 || boole == 0;
    }

    public boolean validatePhone(String phone) {
        return phone.matches("^\\d{8,20}$");
    }

    public boolean validateEmail(String email) {
        return email.matches("^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$");
    }

    public boolean validateDateOfBirth(LocalDate dateOfBirth) {
        return dateOfBirth.isAfter(LocalDate.now()) || dateOfBirth.isBefore(LocalDate.of(1900, 1, 1));
    }

    public List<String> validateAccount(Account account) {
        List<String> validateAccount = new ArrayList<String>();
        if (validateLength(account.getAccount())) {
            validateAccount.add("Account shouldn't empty or longer than 50 characters");
        }
        if (!validateEmail(account.getEmail())) {
            validateAccount.add("Invalid format email");
        }
        if (!validateTrueFalse(account.getStatus())) {
            validateAccount.add("Only access 1 or 0");
        }
        if (!validatePassword(account.getPassword())) {
            validateAccount.add("Password must contain 1 upper, 1 lower, 1 number and at least 6 character");
        }
        return validateAccount;
    }
    public static boolean isNumeric(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
    }
    public boolean validateLogin(String username, String password){
        return username == null || username.trim().isEmpty() || password == null ||  password.trim().isEmpty();
    }
    public List<String> validateEmployee(Employee employee){
        List<String> validateEmployee = new ArrayList<String>();
        if(validateLength(employee.getFirstName()) && validateLength(employee.getLastName())){
            validateEmployee.add("First name and last name shouldn't empty or longer than 50 characters");
        }
        if(!validateTrueFalse(employee.getGender())){
            validateEmployee.add("Only access 1 or 0");
        }
        if(validateDateOfBirth(employee.getDateOfBirth())){
            validateEmployee.add("Date of birth must before today and after 1900s");
        }
        if(!validatePhone(employee.getPhone())){
            validateEmployee.add("Phone must contains number only and from 8-20 characters");
        }
        if(employee.getAddress().length() > 50){
            validateEmployee.add("Address must less than 50 characters");
        }
        if(validateLength(employee.getDepartmentName())){
            validateEmployee.add("Department name shouldn't empty or longer than 50 characters");
        }
        if(employee.getRemark().length() > 1000){
            validateEmployee.add("Remark shouldn't longer than 1000 characters");
        }
        return validateEmployee;
    }
    public boolean validateFields(String field){
        List<String> fields = List.of("name", "departmentName", "address", "phone");
        return fields.contains(field);
    }
}
