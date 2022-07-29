package fa.training.employeemanagement.controller;

import fa.training.employeemanagement.dto.AccountDTO;
import fa.training.employeemanagement.model.Account;
import fa.training.employeemanagement.model.Employee;
import fa.training.employeemanagement.service.AccountService;
import fa.training.employeemanagement.service.EmployeeService;
import fa.training.employeemanagement.util.AppUtil;
import fa.training.employeemanagement.validations.FieldValidation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddEmployeeController", value = "/employee")
public class AddEmployeeController extends HttpServlet {
    private final static String JSP_URL = "./view/addEmployee.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (AppUtil.getLoginedUser(request.getSession(false)) == null) {
                response.sendRedirect("login");
                return;
            }
            request.setAttribute("employee", "");
            request.getRequestDispatcher(JSP_URL).forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phoneNumber = request.getParameter("phone");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String account = request.getParameter("account");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            String departmentName = request.getParameter("department");
            String remark = request.getParameter("remark");
            LocalDate dateOfBirthParse = LocalDate.parse(dateOfBirth, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            Employee employee = new Employee(firstName, lastName, gender.equals("male") ? 1 : 0,
                    dateOfBirthParse, phoneNumber, address, departmentName, remark);
            List<String> validateEmployee = new FieldValidation().validateEmployee(employee);
            boolean flag = true;
            if (!validateEmployee.isEmpty()) {
                request.setAttribute("validateEmp", validateEmployee.get(0));
                flag = false;
            }
            Account newAccount = new Account(account, email, password, status.equals("active") ? 1 : 0);
            List<String> validateAccount = new FieldValidation().validateAccount(newAccount);
            if (!validateAccount.isEmpty()) {
                request.setAttribute("validateAcc", validateAccount.get(0));
                flag = false;
            }
            AccountService accountService = new AccountService();
            AccountDTO searchAccountDTO = accountService.findByUsername(account);
            if (searchAccountDTO != null) {
                request.setAttribute("checkExistsAccount", "Account is exists");
                flag = false;
            }
            searchAccountDTO = accountService.findByEmail(email);
            if (searchAccountDTO != null) {
                request.setAttribute("checkExistsEmail", "Email is exists");
                flag = false;
            }
            if (flag) {
                EmployeeService employeeService = new EmployeeService();
                employeeService.insert(employee);
                newAccount.setEmployee(employee);
                employee.setAccount(newAccount);
                accountService.create(newAccount);
                HttpSession session = request.getSession(false);
                //save message in session
                session.setAttribute("insertStatus", "Insert successfully");
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }
            request.setAttribute("insertEmp", employee);
            request.setAttribute("insertAccount", newAccount);
            request.getRequestDispatcher(JSP_URL).forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
