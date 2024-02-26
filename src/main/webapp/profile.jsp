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

            .btn:hover {
                color: white;
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
                                    <!--                                    <button type="submit" class="btn" style="background-color: rgb(247, 187, 9);"
                                                                                data-bs-toggle="modal"  >Update
                                                                            Profile</button>-->

                                    <button type="button" class="btn" style="background-color: rgb(247, 187, 9);" 
                                            onclick="scrollToElement('updateProfile')">Update Profile</button>


                                    <!--<a  style="background-color: rgb(247, 187, 9);">Update Profile</a>-->

                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-lg-8">
                        <h3 style="color: #9d00ff;" class="my-3">Information</h3>
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
                                        <p class="mb-4"><span class="font-italic me-1" style="color: #9d00ff;">Change
                                                Pasword</span>
                                        </p>
                                        <p class="mb-1" style="font-size: .77rem;">Ấn dô đây để đổi Mật khẩu</p>
                                        <p class="mb-1" style="font-size: .77rem;">Mật khẩu gồm chữ ,số và ...</p>
                                    </div>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn" style="background-color: rgb(247, 187, 9);" 
                                                onclick="scrollToElement('changePass')">Change Pass</button>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: #9d00ff;" class="my-3">Update Information</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form id="updateForm" action="UpdateCustomerController" method="post" enctype="multipart/form-data" onsubmit="return validateResgisterCus();">
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">FullName</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="fullname" name="fullname"
                                                   class="form-control form-control-lg" value="${account.fullname}" />
                                            <span class="error"></span>
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" id="email" name="email"
                                                   class="form-control form-control-lg" value="${account.email}"/>
                                            <span class="error""></span>
                                            <span class="text-danger" id="resultEmail"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="phone" name="phone"
                                                   class="form-control form-control-lg" value="${account.phone_number}" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="resultPhone"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="avatar" class="col-sm-2 col-form-label">Avatar</label>
                                        <div class="col-sm-10">
                                            <input type="file" class="form-control" id="avatar" name="avatar">
                                            <input type="hidden" id="avatar_old" class="form-control" name="avatar_old" value="${account.avatar}">

                                        </div>
                                        <img src="${account.avatar}" alt="">
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button name="btnUpdatefProfile" type="submit" style="background-color: #9d00ff;" class="btn">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>



                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: #9d00ff;" class="my-3">Change Password</h3>
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
                                            <button type="submit" style="background-color: #9d00ff;" class="btn" name="btnChangePass">Change</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer>
            <%@include file="footerOfHome.jsp" %>
        </footer>
        <!-- ===END FORM== -->

        <script src="/JS/validate.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $('#user').change(function () {
                                            var user = $('#user').val();
                                            $.ajax({
                                                type: 'POST',
                                                data: {user: user},
                                                url: 'UpdateCustomerController',
                                                success: function (result) {
                                                    $('#result').html(result);
                                                }

                                            });
                                        });
                                    });
                                    $(document).ready(function () {
                                        $('#email').change(function () {
                                            var email = $('#email').val();
                                            $.ajax({
                                                type: 'POST',
                                                data: {email: email},
                                                url: 'UpdateCustomerController',
                                                success: function (result) {
                                                    $('#resultEmail').html(result);
                                                }

                                            });
                                        });
                                    });
                                    $(document).ready(function () {
                                        $('#phone').change(function () {
                                            var phone = $('#phone').val();
                                            $.ajax({
                                                type: 'POST',
                                                data: {phone: phone},
                                                url: 'UpdateCustomerController',
                                                success: function (result) {
                                                    $('#resultPhone').html(result);
                                                }

                                            });
                                        });
                                    });
        </script>


        <script>
            function scrollToElement(elementId) {
                var element = document.getElementById(elementId);
                if (element) {
                    element.scrollIntoView({behavior: 'smooth', block: 'start'});
                }
            }
        </script>


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
            $(document).ready(function () {
                $('#submitBtn').click(function () {
                    var newPassword = $('#newP').val();
                    var confirmPassword = $('#confirm').val();

                    $.ajax({
                        url: "/checkPassword",
                        type: "POST",
                        data: {newP: newPassword, confirm: confirmPassword},
                        success: function (response) {
                            if (response === "success") {
                                // Thành công
                                // Tiếp tục xử lý hoặc hiển thị thông báo thành công
                            } else {
                                // Lỗi
                                $('#errorDiv').html("Mật khẩu không trùng khớp");
                            }
                        },
                        error: function (xhr, status, error) {
                            // Xử lý lỗi nếu có
                        }
                    });
                });
            });
        </script>
        <!-- ====CODE UYEN === -->
        <script>
            document.getElementById("updateForm").addEventListener("submit", function (event) {
                var fullName = document.getElementById("fullName").value;
                var email = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var address = document.getElementById("address").value;

                var fullNameError = document.getElementById("fullNameError");
                var emailError = document.getElementById("emailError");
                var phoneError = document.getElementById("phoneError");
                var addressError = document.getElementById("addressError");

                fullNameError.innerHTML = '';
                emailError.innerHTML = '';
                phoneError.innerHTML = '';
                addressError.innerHTML = '';

                if (fullName.trim() === '') {
                    fullNameError.innerHTML = 'Please enter your full name.';
                    event.preventDefault();
                }
                if (email.trim() === '') {
                    emailError.innerHTML = 'Please enter your email.';
                    event.preventDefault();
                } else if (!isValidEmail(email)) {
                    emailError.innerHTML = 'Please enter valid email.';
                    event.preventDefault();
                }
                if (phone.trim() === '') {
                    phoneError.innerHTML = 'Please enter your phone number.';
                    event.preventDefault();
                } else if (!isValidPhone(phone)) {
                    phoneError.innerHTML = 'Please enter valid phone number.';
                    event.preventDefault();
                }
                if (address.trim() === '') {
                    addressError.innerHTML = 'Please enter your address.';
                    event.preventDefault();
                }
            }
            );

            function isValidEmail(email) {
                var regex = /\S+@\S+\.\S+/;
                return regex.test(email);
            }

            function isValidPhone(phone) {
                var regex = /^\d{10}$/;
                return regex.test(phone);
            }

        </script>


        <script>
            document.getElementById("changePass").addEventListener("submit", function (event) {
                var old = document.getElementById("old").value;
                var newP = document.getElementById("newP").value;
                var confirm = document.getElementById("confirm").value;

                var oldError = document.getElementById("oldError");
                var newError = document.getElementById("newError");
                var confirmError = document.getElementById("confirmError");

                old.innerHTML = '';
                newP.innerHTML = '';
                confirm.innerHTML = '';

                if (old.trim() === '') {
                    oldError.innerHTML = 'Please enter your old pass.';
                    event.preventDefault();
                }
                if (newP.trim() === '') {
                    newError.innerHTML = 'Please enter your new pass.';
                    event.preventDefault();
                }
                if (confirm.trim() === '') {
                    confirmError.innerHTML = 'Please Confirm pass';
                    event.preventDefault();
                }
            }
            );

        </script>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-EMFwnos9CVM0zC+tlw5PfjGzg4dbsi6/l9m5iGzPtp8tvZm/JYrOZh2V6eihvlmX"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-/A5s8qEvcxGkc/Ysrbj0s2Wjq30KlqKTOtRQobD7/7g9cD+6qD+OvA/HGDb5Or1Q"
        crossorigin="anonymous"></script>
        <!-- POP-UP -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- POP-UP -->
    </body>

</html>
