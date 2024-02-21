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
                            <img src="https://th.bing.com/th/id/OIP.YEb__fTopff_H61Ouq69UAHaFj?w=219&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
                                alt="avatar" class="normal-avatar rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">Mih Uyn</h5>
                            <p class="text-muted mb-4">Can Tho</p>
                            <div class="d-flex justify-content-center mb-2">
                                <button type="submit" class="btn" style="background-color: #9d00ff;"
                                    data-bs-toggle="modal" onclick="$('#updateProfile').modal('show')">Update
                                    Profile</button>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush rounded-3">
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-instagram fa-lg" style="color: #3b5998;"></i>
                                    <p class="mb-0">link ins</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                    <p class="mb-0">link face</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <h3 style="color: #9d00ff;" class="my-3">Information</h3>
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Vu Minh Uyen</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">uyenuyen@gmail.com</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">0123 456 789</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">UserName</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">uyenvu</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">KienGiang</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <div class="card mb-4 mb-md-0">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <h5 style="color: #9d00ff;" class="mb-0">Thống kê đơn hàng</h5>
                                </div>
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <p class="mb-0">Bánh</p>
                                    <p class="mb-0" style="font-size: .77rem;">20/1</p>
                                    <p class="mb-0" style="font-size: .77rem;">20k</p>
                                </div>
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <p class="mb-0">Bánh</p>
                                    <p class="mb-0" style="font-size: .77rem;">20/1</p>
                                    <p class="mb-0" style="font-size: .77rem;">20k</p>
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
                                    <button type="button" class="btn" style="background-color: #9d00ff;"
                                        data-bs-toggle="modal" onclick="$('#changePass').modal('show')">Change
                                        Password</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- ====POPUP  - FORM UPDATE PROFILE ==== CODE UYEN -->

    <div class="modal fade" id="updateProfile" tabindex="-1" role="dialog" aria-labelledby="updateProfile"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateProfile">Update Profile</h5>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="row mb-3">
                            <label for="fullName" class="col-sm-2 col-form-label">FullName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="fullName" value="Vu Minh Uyen"
                                    placeholder="Enter your full name">
                                <div id="fullNameError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" value="uyen@gmail.com"
                                    placeholder="Enter your email">
                                <div id="emailError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="phone" value="0123 789 456"
                                    placeholder="Enter your phone number">
                                <div id="phoneError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="address" value="KienGiang"
                                    placeholder="Enter your address">
                                <div id="addressError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="avatar" class="col-sm-2 col-form-label">Avatar</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" id="avatar">
                            </div>
                        </div>
                        <div class="row mb-6">
                            <div class="col-md-12 d-flex justify-content-end">
                                <button type="submit" style="background-color: #9d00ff;" class="btn">Update</button>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
    </div>
    <!-- ===END FORM== -->

    <!-- ====POPUP -- FORM CHANGE PASSWORD ===code UYEN -->
    <div class="modal fade" id="changePass" tabindex="-1" role="dialog" aria-labelledby="changePass" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changePass">Change Password</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <label for="old" class="col-sm-2 col-form-label">Old Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="old" value="passwordOld"
                                    placeholder="Enter your full name">
                                <div id="oldError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="newP" class="col-sm-2 col-form-label">New Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="newP" value="passwordUyen"
                                    placeholder="Enter your email">
                                <div id="newError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="confirm" class="col-sm-2 col-form-label">Cònirm Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="confirm" value="passwordUyen"
                                    placeholder="Enter your phone number">
                                <div id="confirmError" class="text-danger"></div>

                            </div>
                        </div>

                        <div class="row mb-6">
                            <div class="col-md-12 d-flex justify-content-end">
                                <button type="submit" style="background-color: #9d00ff;" class="btn">Change</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
     <footer>
             <%@include file="footerOfHome.jsp" %>
        </footer>
    <!-- ===END FORM== -->

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
