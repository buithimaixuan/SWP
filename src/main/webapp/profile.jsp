<%-- 
    Document   : profile
    Created on : Feb 21, 2024, 10:05:18 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <style>
            .form-label {
                font-weight: bold;
            }

            .form-control {
                border-radius: 0;
            }


            .avatar img:hover {
                transform: scale(1.1);
                transition: transform 0.3s ease;
            }

            #back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: block; /* Ẩn nút ban đầu */
                background-color: #f7bb09; /* Màu nền của nút */
                color: #fff; /* Màu chữ của nút */
                padding: 1px 5px;
                border-radius: 5px;
                cursor: pointer;
            }

            #back-to-top:hover {
                background-color: #ccccff; /* Màu nền của nút khi rê chuột vào */
            }



        </style>
    </head>

    <body>


        <%@include file="headOfCart.jsp" %>
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center avatar">
                                <img src="${account.avatar}" alt="">
                                <!--                                <img src=""
                                                                     alt="avatar" class="normal-avatar rounded-circle img-fluid" style="width: 150px;">-->
                                <h5 class="my-3">${account.fullname}</h5>
                                <!--<p class="text-muted mb-4">Can Tho</p>-->
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="#updateProfile" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Update Profile</a>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-lg-8">
                        <h3 style="color:rgb(247, 187, 9);" class="my-3">Information</h3>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">FullName</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.fullname}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.phone_number}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">UserName</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.username}</p>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- CHANGE PASSWORD - CODE UYEN -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body" style="text-align: center;">
                                        <p class="mb-4"><span class="font-italic me-1" style="color:rgb(247, 187, 9);">Change
                                                Pasword</span>
                                        </p>
                                        <p class="mb-1" style="font-size: .77rem;">Ấn dô đây để đổi Mật khẩu</p>
                                        <p class="mb-1" style="font-size: .77rem;">Mật khẩu gồm chữ ,số và ...</p>
                                    </div>
                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="#changePass" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Change Password</a>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Update Information</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form id="updateForm" action="UpdateCustomerController" method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="fullname" class="col-sm-2 col-form-label">FullName</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" value="${account.fullname}" required=""/>
                                            <span id="fullnameError" class="error"></span>
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3" type="hidden">
                                        <!--<label type="hidden" for="username" class="col-sm-2 col-form-label">UserName</label>-->
                                        <div class="col-sm-10">
                                            <input type="hidden" type="text" id="username" name="username" class="form-control form-control-lg" value="${account.username}" required=""/>
                                            <span id="usernameError" class="error"></span>
                                            <span class="text-danger" id="duplicateUserNameError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="email" name="email" class="form-control form-control-lg" value="${account.email}" required=""/>
                                            <span id="emailError" class="error"></span>
                                            <span class="text-danger" id="duplicateEmailError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" value="${account.phone_number}" required=""/>
                                            <span id="phoneError" class="error"></span>
                                            <span class="text-danger" id="duplicatePhoneError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>




                                    <div class="row mb-3">
                                        <div class="col-md-9">
                                            <label for="avatar" class="col-sm-2 col-form-label">Avatar</label>
                                            <div class="col-sm-10">
                                                <input type="file" class="form-control" id="avatar" name="avatar">
                                                <input type="hidden" id="avatar_old" class="form-control" name="avatar_old" value="${account.avatar}">

                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <img src="${account.avatar}" alt="" style="max-width: 70%;">
                                        </div>
                                    </div>

                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button name="btnUpdatefProfile" type="submit" style="background-color: rgb(247, 187, 9);" class="btn">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>



                        <div class="col-lg-8" id="changePass">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Change Password</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="UpdateCustomerController" method="post" enctype="multipart/form-data" >
                                    <div class="row mb-3">
                                        <label for="old" class="col-sm-2 col-form-label">Old Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="old" value=""
                                                   name="oldPass">
                                            <div id="oldError" class="text-danger"></div>
                                            <span class="text-danger" id="duplicatePassError"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newP" class="col-sm-2 col-form-label">New Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="newP" name="newP"
                                                   placeholder="Enter your new password">
                                            <div id="errorDiv"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="confirm" class="col-sm-2 col-form-label">Confirm Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="confirm" name="confirm"
                                                   placeholder="Enter new password again">
                                            <div id="errorDiv"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button type="submit" style="background-color: rgb(247, 187, 9);" class="btn" name="btnChangePass">Change</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <a href="#" id="back-to-top" title="Go to top">↑</a>
        <footer>
            <%@include file="footerOfHome.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script>
            // Kiểm tra biến session để xác định xem có hiển thị popup hay không
            var updateSuccess = <%= session.getAttribute("updateSuccess")%>;
            if (updateSuccess) {
                $('#successChangePass').modal('show'); // Hiển thị popup modal
                setTimeout(function () {
                    $('#successChangePass').modal('hide'); // Tự động ẩn popup modal sau 3 giây
                }, 3000);
            }
        </script>
        <!-- ===END FORM== -->
        <script>
            // Kiểm tra nếu có lỗi trùng lặp được trả về từ servelet
            <%
                String duplicateError = (String) session.getAttribute("duplicateError");
                String emailCk = (String) session.getAttribute("emailCk");
                String phoneCk = (String) session.getAttribute("phoneCk");
                String usernameUserCk = (String) session.getAttribute("usernameUserCk");

                if (duplicateError != null) {
                    String errorMessage = "";
                    if (duplicateError.equals("both")) {
                        errorMessage = emailCk + " and " + phoneCk + " are already existed!";
                        out.println("document.getElementById('duplicateEmailPhoneError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("username")) {
                        errorMessage = "Please re-enter, " + usernameUserCk + " already exists";
                        // Hiển thị thông báo trùng email
                        out.println("document.getElementById('duplicateUserError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("email")) {
                        errorMessage = "Please re-enter, " + emailCk + " already exists";
                        // Hiển thị thông báo trùng email
                        out.println("document.getElementById('duplicateEmailError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("phone")) {
                        errorMessage = "Please re-enter, " + phoneCk + " already exists";
                        // Hiển thị thông báo trùng phone
                        out.println("document.getElementById('duplicatePhoneError').innerText = '" + errorMessage + "';");

                    } else if (duplicateError.equals("PassError")) {
                        errorMessage = "Incorrect password! You can not change password!!!";
                        // Hiển thị thông báo trùng phone
                        out.println("document.getElementById('duplicatePassError').innerText = '" + errorMessage + "';");
                    }
            %>
            // Xóa thuộc tính duplicateError khỏi session sau khi hiển thị cảnh báo
            <%
                    session.removeAttribute("duplicateError");
                }
            %>
        </script>
        <!--<script src="/JS/validPro.js"></script>-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var newPInput = document.getElementById("newP");
                var confirmInput = document.getElementById("confirm");
                var errorDiv = document.getElementById("errorDiv");

                function validatePassword() {
                    if (newPInput.value !== confirmInput.value) {
                        errorDiv.innerHTML = "Mật khẩu không khớp";
                    } else {
                        errorDiv.innerHTML = "";
                    }
                }

                newPInput.addEventListener("keyup", validatePassword);
                confirmInput.addEventListener("keyup", validatePassword);
            });
        </script>
        <script>
            document.getElementById('updateForm').addEventListener('submit', function (event) {
                var fullname = document.getElementById('fullname').value;
                var phone = document.getElementById('phone').value;
                var email = document.getElementById('email').value;
                var fullnameError = document.getElementById('fullnameError');
                var phoneError = document.getElementById('phoneError');
                var emailError = document.getElementById('emailError');

                // Kiểm tra Fullname không được để trống và không chứa kí tự đặc biệt
                if (fullname.trim() === '' || !/^[a-zA-Z\s]+$/.test(fullname)) {
                    fullnameError.textContent = 'Fullnamephải chứa ít nhất một kí tự không phải số hoặc kí tự đặc biệt.';
                    event.preventDefault();
                } else {
                    fullnameError.textContent = '';
                }

                // Kiểm tra Phone có đúng định dạng và bắt đầu bằng số 0
                if (!/^(0)\d{9}$/.test(phone)) {
                    phoneError.textContent = 'Số điện thoại không hợp lệ.';
                    event.preventDefault();
                } else {
                    phoneError.textContent = '';
                }

                // Kiểm tra Email có đúng định dạng
                if (!/^\S+@\S+\.\S+$/.test(email)) {
                    emailError.textContent = 'Email không hợp lệ, vui lòng nhập lại đúng định dạng.';
                    event.preventDefault();
                } else {
                    emailError.textContent = '';
                }
            });
        </script>


    </body>

</html>
