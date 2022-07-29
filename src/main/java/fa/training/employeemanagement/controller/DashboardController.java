package fa.training.employeemanagement.controller;

import fa.training.employeemanagement.dto.EmployeeDTO;
import fa.training.employeemanagement.service.EmployeeService;
import fa.training.employeemanagement.util.AppUtil;
import fa.training.employeemanagement.validations.FieldValidation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "DashboardController", value = "/dashboard")
public class DashboardController extends HttpServlet {
    private final static String JSP_URL = "/view/dashboard.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            if (AppUtil.getLoginedUser(request.getSession(false)) == null) {
                response.sendRedirect("login");
                return;
            }
            EmployeeService employeeService = new EmployeeService();
            int page = 1;
            int maxNoPage = employeeService.getMaxPageSize();
            if (request.getParameter("page") != null
                    && FieldValidation.isNumeric(request.getParameter("page"))) {
                page = Integer.parseInt(request.getParameter("page"));
                if (page > maxNoPage) {
                    page = maxNoPage;
                }
            }
            if (request.getParameter("keyword") != null) {
                doGet_Search(request, response, employeeService, page);
            } else {
                List<EmployeeDTO> employeeDTOList = employeeService.getByPagination(page);
                request.setAttribute("listEmployee", employeeDTOList);
                request.setAttribute("pageSize", maxNoPage);
            }
            if(request.getParameter("insertStatus") != null){
                request.setAttribute("insertStatus", "Insert successfully");
            }
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher(JSP_URL).forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doGet_Search(HttpServletRequest request, HttpServletResponse response,
                                EmployeeService employeeService, int page) throws IOException, ServletException {
        String keyword = request.getParameter("keyword").trim();
        String type = request.getParameter("type").trim();
        FieldValidation validation = new FieldValidation();
        if (validation.validateFields(type)) {
            List<EmployeeDTO> employeeDTOList = employeeService.findEmployeesAndPagination(page, keyword, type);
            request.setAttribute("keyword", keyword);
            request.setAttribute("type", type);
            request.setAttribute("pageSize", employeeService.getMaxPageSizeForSearching(keyword, type));
            request.setAttribute("listEmployee", employeeDTOList);
            return;
        }
        request.setAttribute("errorType", "Incorrect data");
    }
}
