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
    <title>Employee</title>
</head>
<body class="vh-100">
<div class="h-100 d-flex flex-column">
    <jsp:include page="header.jsp"></jsp:include>
    <main class="d-flex align-items-start h-auto container-fluid flex-grow-1">
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="card w-100 p-4 h-100">
            <div class="card-body d-flex flex-column">
                <h3>Add employee</h3>
                <hr>
                <form action="employee" method="post" class="d-flex w-100 flex-column" id="insert-form">
                    <c:if test="${insertEmp ne null and insertAccount ne null}">
                        <c:set var="emp" value="${insertEmp}"></c:set>
                        <c:set var="acc" value="${insertAccount}"></c:set>
                    </c:if>
                    <div class="mb-3">
                        <label for="firstName" class="form-label form-required">First name</label>
                        <input type="text" class="form-control" name="firstName" id="firstname"
                               placeholder="First name" value="${emp.firstName}">
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label form-required">Last name</label>
                        <input type="text" class="form-control" name="lastName" id="lastname" placeholder="Last name"
                               value="${emp.lastName}">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label form-required">Phone number</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone"
                               value="${emp.phone}">
                    </div>
                    <div class="mb-3">
                        <label for="dateOfBirth" class="form-label form-required">Date of birth</label>
                        <input type="date" class="form-control" name="dateOfBirth" id="dateofbirth"
                               placeholder="Date of birth" value="${emp.dateOfBirth}">
                    </div>
                    <label for="gender" class="form-label form-required">Gender</label>
                    <div class="d-flex" id="radio-gender-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="male" <c:if
                                    test="${emp.gender == 1}"><c:out value="checked"></c:out></c:if>>
                            <label class="form-check-label" for="male">
                                Male
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="female" <c:if
                                    test="${emp.gender == 0}"><c:out value="checked"></c:out></c:if>>
                            <label class="form-check-label" for="female">
                                Female
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="account" class="form-label form-required">Account</label>
                        <input type="text" class="form-control" name="account" id="account" placeholder="Account" value="${acc.account}">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label form-required">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Account" value="${acc.email}">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label form-required">Password</label>
                        <input type="password" class="form-control" name="password" id="password"
                               placeholder="Password" value="${acc.password}">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" name="address" id="address" rows="3" content="${emp.address}"></textarea>
                    </div>
                    <label for="status" class="form-label">Status</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="active" id="status" name="status" <c:if
                                test="${acc.status == 1}"><c:out value="checked"></c:out></c:if>>
                        <label class="form-check-label" for="status">
                            Active
                        </label>
                    </div>
                    <div class="mb-3">
                        <label for="department" class="form-label form-required">Department</label>
                        <select class="form-control" name="department" id="department">
                            <option selected value="Fsoft Academy">Fsoft Academy</option>
                            <option value="Banking">Banking</option>
                            <option value="Facebook">Facebook</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="remark" class="form-label">Remark</label>
                        <textarea class="form-control" name="remark" id="remark" rows="3"></textarea>
                    </div>
                    <div class="mb-3 d-flex flex-column">
                        <p class="small text-danger">
                            <c:if test="${validateEmp ne null}">
                                <c:out value="${validateEmp}"></c:out>
                                <br>
                            </c:if>
                            <c:if test="${validateAcc ne null}">
                                <c:out value="${validateAcc}"></c:out>
                                <br>
                            </c:if>
                            <c:if test="${checkExistsAccount ne null}">
                                <c:out value="${checkExistsAccount}"></c:out>
                                <br>
                            </c:if>
                            <c:if test="${checkExistsEmail ne null}">
                                <c:out value="${checkExistsEmail}"></c:out>
                                <br>
                            </c:if>
                        </p>
                    </div>
                    <div class="input-group d-flex  justify-content-around w-25">
                        <button type="button" class="btn btn-info btn-lg">Back</button>
                        <button type="reset" class="btn btn-warning btn-lg">Reset</button>
                        <button type="submit" class="btn btn-success btn-lg">Add</button>
                    </div>
                </form>
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
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
<script src="<a:ReadFromContextTag url="/assets/js/insertEmpValidate.js"></a:ReadFromContextTag>"></script>
</body>
</html>
