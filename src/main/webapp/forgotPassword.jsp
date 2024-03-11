<%-- 
    Document   : forgotPassword
    Created on : Jan 6, 2024, 9:48:53 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>forgot password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/validate.css"/>
    </head>
    <body>
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="forgot">
                        <h2>Bạn quên mật khẩu ?</h2>
                        <p>Thay đổi mật khẩu của bạn qua 3 bước. Nó sẽ giúp bạn bảo vệ mật khẩu của bạn.!</p>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>Nhập Email của bạn.</li>
                            <li><span class="text-primary text-medium">2. </span>Hệ thống sẽ gửi mã OTP đến Email của bạn.s</li>
                            <li><span class="text-primary text-medium">3. </span>Enter the OTP on the 
                                next page</li>
                        </ol>
                    </div>
                    <form class="card mt-4" action="ResetPasswordController" method="post" onsubmit="return enterEmail();">
                        <div class="card-body">
                            <div class="form-group validate">
                                <label for="email-for-pass">Enter your email address</label> 
                                <input class="form-control" type="text" name="email" id="email"><small
                                    class="form-text text-muted">Enter the registered email address . Then we'll
                                    email a OTP to this address.</small>
                                <span class="error"></span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" type="submit" name="btnForgotPass">Submit</button>
                            <a class="btn btn-danger" href="/LoginController">Back to
                                Login</a>
                        </div>
                    </form>
                    <c:if test="${messageErrorEmail!=null}">
                        <span class="text-danger">Not found this email!</span>
                    </c:if>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="./JS/forgotPass.js"></script>
    </body>
</html>
