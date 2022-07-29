<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="a" uri="/WEB-INF/tlds/customTag" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2022
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic"
            rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="<a:ReadFromContextTag url="/assets/css/style.css"></a:ReadFromContextTag>">
    <title>Dashboard</title>
</head>
<body class="vh-100">
<div class="h-100 d-flex flex-column">
    <jsp:include page="header.jsp"></jsp:include>
    <main class="d-flex align-items-start h-auto container-fluid flex-grow-1">
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="card w-100 p-4 h-100">
            <div class="card-body d-flex flex-column">
                <h3>Employee List</h3>
                <hr>
                <div>
                    <form action="dashboard" method="get" class="d-flex justify-content-around w-75 float-end" id="search-form">
                        <div class="input-group w-50">
                            <span class="input-group-text border-end-0">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                            <input type="text" name="keyword" id="search" class="form-control border-start-0"
                                   placeholder="User search">
                        </div>
                        <div class="input-group w-auto">
                            <span class="input-group-text border-end-0">
                                <i class="fa fa-filter" aria-hidden="true"></i>
                                &nbsp;Filter by
                            </span>
                            <select class="form-select" name="type">
                                <option selected value="name">Name</option>
                                <option value="phone">Phone</option>
                                <option value="address">Address</option>
                                <option value="departmentName">Department</option>
                            </select>
                        </div>
                        <div class="input-group w-auto">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
                <div class="mt-4">
                    <c:choose>
                        <c:when test="${listEmployee.size() gt 0}">
                            <table class="table table-bordered table-striped">
                                <thead class="table-secondary">
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Date of birth</th>
                                    <th>Address</th>
                                    <th>Phone number</th>
                                    <th>Deparment</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="employee" items="${listEmployee}">
                                    <tr>
                                        <th scope="row">${employee.employeeId}</th>
                                        <th>${employee.name}</th>
                                        <th>${employee.dateOfBirth}</th>
                                        <th>${employee.address}</th>
                                        <th>${employee.phone}</th>
                                        <th>${employee.departmentName}</th>
                                        <th class="text-primary"><i class="fa fa-eye" aria-hidden="true"></i>View</th>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <h3>No data found</h3>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${errorType ne null}">
                        <p class="text-danger">${errorType}</p>
                    </c:if>
                </div>
                <div class="mt-4">
                    <nav aria-label="navigation">
                        <ul class="pagination">
                            <li class="page-item <c:if test="${currentPage <= 1}"><c:out value="disabled"></c:out></c:if>">
                                <a class="page-link" href="<a:ReadFromContextTag url="/dashboard"></a:ReadFromContextTag>?page=${currentPage -1}<c:if test="${keyword ne null and type ne null}"><c:out value="&keyword=${keyword}&type=${type}"></c:out></c:if>">Previous</a></li>
                            <c:forEach begin="1" end="${pageSize}" var="page">
                                <li class="page-item <c:if test="${currentPage == page}"><c:out value="active"></c:out></c:if>">
                                    <a class="page-link"
                                       href="<a:ReadFromContextTag url="/dashboard"></a:ReadFromContextTag>?page=${page}<c:if test="${keyword ne null and type ne null}"><c:out value="&keyword=${keyword}&type=${type}"></c:out></c:if>">${page}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${currentPage >= pageSize}"><c:out value="disabled"></c:out></c:if>">
                                <a class="page-link" href="<a:ReadFromContextTag url="/dashboard"></a:ReadFromContextTag>?page=${currentPage +1}<c:if test="${keyword ne null and type ne null}"><c:out value="&keyword=${keyword}&type=${type}"></c:out></c:if>">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>
</div>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
crossorigin="anonymous"></script>
<c:if test="${sessionScope.insertStatus ne null}">
    <!-- Modal -->
    <div class="modal hide" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                        ${sessionScope.insertStatus}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        var myModal = new bootstrap.Modal(document.getElementById('myModal'), {})
        myModal.toggle()
    </script>
    <c:remove var="insertStatus" scope="session"></c:remove>
</c:if>
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
<script src="<a:ReadFromContextTag url="/assets/js/searchValidate.js"></a:ReadFromContextTag>"></script>
</body>
</html>
