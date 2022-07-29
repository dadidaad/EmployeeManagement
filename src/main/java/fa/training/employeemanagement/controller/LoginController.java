package fa.training.employeemanagement.controller;

import fa.training.employeemanagement.dto.AccountDTO;
import fa.training.employeemanagement.service.AccountService;
import fa.training.employeemanagement.util.AppUtil;
import fa.training.employeemanagement.validations.FieldValidation;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private final static  String JSP_URL = "./view/login.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{
            request.getRequestDispatcher(JSP_URL).forward(request, response);
        }
        catch (Exception ex){
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            FieldValidation fieldValidation = new FieldValidation();
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            if(fieldValidation.validateLogin(username, password)){
                request.setAttribute("errorNotification", "Invalid username or password");
                request.getRequestDispatcher(JSP_URL).forward(request, response);
                return;
            }
            AccountService accountService = new AccountService();
            AccountDTO accountDTO = accountService.findByUsername(username);
            if(accountDTO == null){
                request.setAttribute("errorNotification", "Can not find username");
                request.getRequestDispatcher(JSP_URL).forward(request, response);
                return;
            }
            boolean checkPassword = accountService.compareUsernameAndPassword(accountDTO, password);
            if(checkPassword){
                AppUtil.storeLoginedUser(request.getSession(false), accountDTO);
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }
            request.setAttribute("errorNotification", "Incorrect password");
            request.getRequestDispatcher(JSP_URL).forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
