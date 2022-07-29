package fa.training.employeemanagement.filter;

import fa.training.employeemanagement.dto.AccountDTO;
import fa.training.employeemanagement.util.AppUtil;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "PreventAccessJSPFilter", urlPatterns = "/*")
public class PreventAccessJSPFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String uriPath = request.getRequestURI();
        String servletPath = request.getServletPath();
        /*if uri contain .jsp that user access directly to jsp page, return home*/
        if(uriPath.contains(".jsp")){
            AccountDTO loginUser = AppUtil.getLoginedUser(request.getSession());
            if(loginUser == null){
                response.sendRedirect("login");
            }
            else{
                response.sendRedirect("dashboard");
            }
            return;
        }
        chain.doFilter(request, response);
    }
}
