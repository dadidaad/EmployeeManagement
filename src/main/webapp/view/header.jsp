<%@ page import="fa.training.employeemanagement.util.AppUtil" %>
<%@ page import="fa.training.employeemanagement.dto.AccountDTO" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2022
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="d-flex justify-content-between p-2  align-items-center flex-grow-0">
    <div class="header-left d-flex align-items-center">
        <i class="fa fa-building" aria-hidden="true"></i>
        <h3 class="fw-bold fs-4 m-0">Employee</h3>
    </div>
    <div class="header-right d-flex text-primary align-items-center">
        <p class="m-0">Welcome <% if (AppUtil.getLoginedUser(request.getSession()) != null){%>
            <%=AppUtil.getLoginedUser(request.getSession(false)).getAccount()%>
            <%}%>
        </p>
        <a href="" class=" text-decoration-none px-4">
            <i class="fa fa-sign-out"
               aria-hidden="true"></i>
            Logout
        </a>
    </div>
</header>