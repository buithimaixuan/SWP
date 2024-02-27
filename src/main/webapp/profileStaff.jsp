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


        <%@include file="headOfHome.jsp" %>
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center avatar">

                                <!--                                <img src=""
                                                                     alt="avatar" class="normal-avatar rounded-circle img-fluid" style="width: 150px;">-->
                                <h5 class="my-3">${staff.fullname}</h5>
                                <!--<p class="text-muted mb-4">Can Tho</p>-->
                                <div class="d-flex justify-content-center mb-2">
                                    <!--                                    <button type="submit" class="btn" style="background-color: rgb(247, 187, 9);"
                                                                                data-bs-toggle="modal"  >Update
                                                                            Profile</button>-->


                                    <a href="#updateProfile" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Update Profile</a>


                                    <!--<a  style="background-color: rgb(247, 187, 9);">Update Profile</a>-->

                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-lg-8">
                        <h3 style="color: rgb(247, 187, 9);" class="my-3">Information</h3>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">FullName</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.fullname}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.phone_number}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">UserName</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.username}</p>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- CHANGE PASSWORD - CODE UYEN -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body" style="text-align: center;">
                                        <p class="mb-4"><span class="font-italic me-1" style="color: rgb(247, 187, 9);">Change
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


                        <!--//        public Staff(int staff_id, int acc_id, String username, String password, String fullnameRR,
                        //            String phone_numberRR, String emailRR, Date birthdayR, String genderRS, String addressR,
                        //            String positionRR, Date begin_workRS, Date end_workRS, int code_reset, int isDelete)-->

                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Update Information</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form id="updateForm" action="StaffController" method="post" enctype="multipart/form-data">
                                    <span class="text-danger" id="duplicateEmailPhoneUsernameError"></span>
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">FullName</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" value="${staff.fullname}" required=""/>
                                            <span class="error"></span>
                                            <span class="text-danger" id="fullnameError"></span> <!-- Error message for FullName -->
                                        </div>
                                    </div>
                                    <div class="row mb-3" type="hidden">
                                        <div class="col-sm-10">
                                            <input type="hidden" id="username" name="username" class="form-control form-control-lg" value="${staff.username}" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="duplicateUserError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" id="email" name="email" class="form-control form-control-lg" value="${staff.email}" required=""/>
                                            <span class="error"></span>
                                            <span class="text-danger" id="emailError"></span> <!-- Error message for Email -->
                                            <span class="text-danger" id="duplicateEmailError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" value="${staff.phone_number}" required="" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="phoneError"></span> <!-- Error message for Phone -->
                                            <span class="text-danger" id="duplicatePhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">Birthday</label>
                                        <div class="col-sm-10">
                                            <input type="date" id="birthday" name="birthday" class="form-control form-control-lg" value="${staff.birthday}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">Address</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="address" name="address" class="form-control form-control-lg" value="${staff.address}" required="" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="addressError"></span> <!-- Error message for Address -->
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">Position</label>
                                        <div class="col-sm-10">
                                            <input readonly="" type="text" id="position" name="position" class="form-control form-control-lg" value="${staff.position}" />
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button name="btnUpdatefStaff" type="submit" style="background-color: rgb(247, 187, 9);" class="btn">Update</button>
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
                                <form action="StaffController" method="post" enctype="multipart/form-data" >
                                    <div class="row mb-3">
                                        <label for="old" class="col-sm-2 col-form-label">Old Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="oldPass" 
                                                   name="oldPass" required="">
                                            <div id="oldError" class="text-danger"></div>     
                                            <span class="text-danger" id="duplicatePassError"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newP" class="col-sm-2 col-form-label">New Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="newP" name="newP"
                                                   placeholder="Enter your new password" required="">
                                            <div id="errorDiv"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="confirm" class="col-sm-2 col-form-label">Confirm Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="confirm" name="confirm"
                                                   placeholder="Enter new password again" required="">
                                            <div id="errorDiv"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button type="submit" style="background-color: rgb(247, 187, 9);" class="btn" name="btnChangePassStaff">Change</button>
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
        <!-- ===END FORM== -->
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


        <script src="/JS/validPro.js"></script>
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
            document.addEventListener("DOMContentLoaded", function () {
                const form = document.getElementById("updateForm");
                const fullnameInput = document.getElementById("fullname");
                const phoneInput = document.getElementById("phone");
                const emailInput = document.getElementById("email");
                const addressInput = document.getElementById("address");

                form.addEventListener("submit", function (event) {
                    let isValid = true;

                    // Xóa thông báo lỗi cũ
                    clearErrors();

                    // Kiểm tra FullName
                    if (!fullnameInput.value.trim()) {
                        showError(fullnameInput, "Fullname is required.", "fullnameError");
                        isValid = false;
                    } else if (!/^[a-zA-Z\s]+$/.test(fullnameInput.value)) {
                        showError(fullnameInput, "Fullname should only contain letters and spaces.", "fullnameError");
                        isValid = false;
                    }

                    // Kiểm tra Email
                    if (!emailInput.value.trim()) {
                        showError(emailInput, "Email is required.", "emailError");
                        isValid = false;
                    } else if (!/\S+@\S+\.\S+/.test(emailInput.value)) {
                        showError(emailInput, "Invalid email address.", "emailError");
                        isValid = false;
                    }

                    // Kiểm tra Phone
                    if (!phoneInput.value.trim()) {
                        showError(phoneInput, "Phone number is required.", "phoneError");
                        isValid = false;
                    } else if (!/^0[0-9]{9}$/.test(phoneInput.value)) {
                        showError(phoneInput, "Phone number should start with 0 and have 10 digits.", "phoneError");
                        isValid = false;
                    }

                    // Kiểm tra Address
                    if (!addressInput.value.trim()) {
                        showError(addressInput, "Address is required.", "addressError");
                        isValid = false;
                    } else if (!/^[a-zA-Z\s]+$/.test(addressInput.value)) {
                        showError(addressInput, "Address should only contain letters and spaces.", "addressError");
                        isValid = false;
                    }

                    // Nếu form không hợp lệ, ngăn chặn gửi form
                    if (!isValid) {
                        event.preventDefault();
                    }
                });

                // Function để hiển thị thông báo lỗi dưới trường nhập
                function showError(input, message, errorSpanId) {
                    const errorSpan = document.getElementById(errorSpanId);
                    errorSpan.textContent = message;
                }

                // Function để xóa thông báo lỗi
                function clearErrors() {
                    const errors = document.querySelectorAll('.text-danger');
                    errors.forEach(function (error) {
                        error.textContent = '';
                    });
                }
            });
        </script>


</html>
