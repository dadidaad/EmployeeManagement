<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="a" uri="/WEB-INF/tlds/customTag" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/26/2022
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic"
            rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="<a:ReadFromContextTag url="/assets/css/style.css"></a:ReadFromContextTag>">
    <title>Login</title>
</head>
<body>
<div class="container position-relative vh-100">
    <div class="card position-absolute top-50 start-50 translate-middle w-25">
        <div class="card-body pb-0">
            <div class="p-4 text-center">
                <h3>Member Login</h3>
            </div>
            <form method="POST" class="row" id="login-form" action="login" novalidate>
                <div class="col-12">
                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-text bg-transparent border-end-0">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </div>
                            <input type="text" name="username" id="username"
                                   class="form-control border-start-0 w-75" placeholder="Username" value="${username}">
                        </div>
                        <div class="small text-danger"></div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-text bg-transparent border-end-0">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </div>
                            <input type="password" name="password" id="password"
                                   class="form-control border-start-0 w-75 " placeholder="Password" value="${password}">
                        </div>
                        <div  class="small text-danger"></div>
                    </div>
                </div>
                <c:if test="${errorNotification ne null}">
                    <div class="col-12 mb-3">
                        <p class="text-danger small">${errorNotification}</p>
                    </div>
                </c:if>
                <div class="col-12 mb-3">
                    <button type="submit" class="btn btn-success w-100 opacity-75">Login</button>
                </div>
            </form>
        </div>
        <div class="card-footer text-center">
            <a class="text-decoration-none text-black-50" href="#">Forgot password?</a>
        </div>
    </div>
</div>
<!-- Validate using libary -->
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
<script src="<a:ReadFromContextTag url="/assets/js/loginValidate.js"></a:ReadFromContextTag>"></script>

<!-- Demo validate -->
<!-- <script>
    const validateForm = () =>{
        let emailLen = document.getElementById('email').value.length;
        if( emailLen >= 8 && emailLen <=  30){
            document.getElementById('noti').innerHTML = "OK";
            return true;
        }
        else{
            document.getElementById('noti').innerHTML = "Not OK";
            return false;
        }
        return true;
    }
    document.getElementById('login-form').addEventListener('submit', (ev) => {
        validateForm() ? ev.submit() : ev.preventDefault() ;
    });
</script> -->
</body>

</html>