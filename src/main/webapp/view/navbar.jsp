<%@ taglib prefix="a" uri="/WEB-INF/tlds/customTag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav flex-column nav-pills me-3 h-100" role="tablist" aria-orientation="vertical">
    <a href="dashboard" class="nav-link"> <i class="fa fa-dashcube" aria-hidden="true"></i> Dashboard</a>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
           aria-expanded="false"><i class="fa fa-bar-chart" aria-hidden="true"></i> Employee manager</a>
        <ul class="dropdown-menu border-0 mx-2 w-100 bg-transparent">
            <% String url = request.getServletPath();%>
            <li><a class="dropdown-item text-primary w-100 py-2 <%=url.contains("dashboard") ? "active" : ""%>" href="<a:ReadFromContextTag url="/dashboard"></a:ReadFromContextTag>"> <i class="fa fa-list" aria-hidden="true"></i> Employee list</a></li>
            <li><a class="dropdown-item text-primary w-100 py-2 <%=url.contains("Employee") ? "active" : ""%>" href="<a:ReadFromContextTag url="/employee"></a:ReadFromContextTag>"><i class="fa fa-plus" aria-hidden="true"></i>Add employee</a></li>
        </ul>
    </li>
</div>
