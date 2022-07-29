package fa.training.employeemanagement.dto;

import fa.training.employeemanagement.model.Employee;

import java.time.LocalDate;

public class EmployeeDTO {
    private int employeeId;
    private String name;
    private boolean gender;
    private LocalDate dateOfBirth;
    private String phone;
    private String address;
    private String departmentName;
    private String remark;

    public EmployeeDTO() {
    }

    public EmployeeDTO(Employee employee) {
        this.employeeId = employee.getEmployeeId();
        this.name = employee.getName();
        this.gender = employee.getGender() == 1;
        this.dateOfBirth = employee.getDateOfBirth();
        this.phone = employee.getPhone();
        this.address = employee.getAddress();
        this.departmentName = employee.getDepartmentName();
        this.remark = employee.getRemark();
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }


    public boolean getGender() {
        return gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setGender(int gender) {
        this.gender = gender == 1;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
