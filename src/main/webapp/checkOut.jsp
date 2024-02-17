<%-- 
    Document   : checkOut
    Created on : Feb 16, 2024, 6:18:21 PM
    Author     : Vu Minh Uyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : checkOut
    Created on : Feb 16, 2024, 5:49:59 PM
    Author     : DELL
--%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Checkout page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
              type="text/css">


        <style>
            .invalid-field {
                border-color: #ff0000;
            }

            .error-message {
                color: #ff0000;
                font-size: 0.8rem;
            }

     

            .dathangButon:hover {
                background-color: rgb(255, 0, 64);
                color: white;
            }

            .input-group {
                --primary: #74e3ff;
           }

            .input {
                all: unset;
                color: #000000;
                padding: 1rem;
                border: 1px solid #9e9e9e;
                border-radius: 20px;
                transition: 150ms cubic-bezier(1, 1, 1, 1);

            }

            .label {
                position: absolute;
                top: 1rem;
                left: 1rem;
                color: #d4d4d4;
                pointer-events: none;
                transition: 150ms cubic-bezier(0.4, 0, 0.2, 1);

            }


            .input:focus {
                border: 1px solid var(--primary);
            }

            .input:focus~label,
            .input:valid~label {
                transform: translateY(-120%) scale(0.7);
                background-color: #ffffff;
                padding-inline: 0.1rem;
                color: var(--primary);
            }

            body {
                font-size: small;
            }
        </style>
    </head>

    <body>
        
        
        <%@include file="headOfCart.jsp" %>
        <div class="container col-10 my-5 br-2 rounded">
            <h5 style="color: #631bf3;">Group4 Store</h3>
                <div class="row g-3">
                    <div class="col-4 order-md-last">
                        <h6 class="d-flex justify-content-between align-item-center">
                            <span class="text-muted">Đơn hàng</span>
                            <span class="badge bg-secondary rounded-pill">3</span>
                        </h6>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between">
                                <img src="https://th.bing.com/th/id/OIP.T38QuPgKeLn42Xu72MF21wHaHa?rs=1&pid=ImgDetMain" style="width: 15%;" alt="">
                                <div>
                                    <h6>Bánh kẹo</h6>
                                    <span class="text-muted">Bánh kẹp ngon Hàn Quốc</span>
                                </div>
                                <span class="text-muted">50.000đ</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between ">
                                <img src="https://th.bing.com/th/id/OIP.T38QuPgKeLn42Xu72MF21wHaHa?rs=1&pid=ImgDetMain" style="width: 15%;" alt="">
                                <div>
                                    <h6>Bánh kẹo</h6>
                                    <span class="text-muted">Bánh kẹp ngon Hàn Quốc</span>
                                </div>
                                <span class="text-muted">50.000đ</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <img src="https://th.bing.com/th/id/OIP.T38QuPgKeLn42Xu72MF21wHaHa?rs=1&pid=ImgDetMain" style="width: 15%;" alt="">
                                <div>
                                    <h6>Bánh kẹo</h6>
                                    <span class="text-muted">Bánh kẹp ngon Hàn Quốc</span>
                                </div>
                                <span class="text-muted">50.000đ</span>
                            </li>

                        </ul>

                        <br>
                        <li class=" d-flex justify-content-between">
                            <div>
                                <h6>Tạm tính</h6>
                            </div>
                            <span class="text-muted">180.000đ</span>
                        </li>
                        <li class="d-flex justify-content-between">
                            <div>
                                <h6>Phí Vận chuyển</h6>
                            </div>
                            <span class="text-muted">20.000đ</span>
                        </li>



                        <hr>
                        <li class="d-flex justify-content-between">
                            <div>
                                <h6>Tổng cộng</h6>
                            </div>
                            <h4 style="color: #00ffa2;">200.000đ </h4>
                        </li>
                        <br>
                        <div style="display: flex;">
                            <a style="margin-right: auto; text-decoration: none;" href="">
                                < Quay về giỏ hàng</a>

                            <button type="submit" class="dathangButon btn mb-4"
                                    style="width: 50%;background-color: rgb(104, 39, 255);"
                                    onclick="validateForm()">ĐẶT HÀNG</button>



                        </div>


                    </div>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <h6>Thông tin giao hàng</h6>
                                <form id="checkoutForm" onsubmit="return false;">
                                    <div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input class="input" required type="text" id="username"
                                                       style="width: 100%;">
                                                <label class="label" for="username">FullName</label>
                                            </div>
                                            <div class="error-message" id="username-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input class="input" required type="tel" id="phone" style="width: 100%;">
                                                <label class="label" for="phone">SĐT</label>
                                            </div>
                                            <div class="error-message" id="phone-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input class="input" required type="email" id="email" style="width: 100%;">
                                                <label class="label" for="email">Email</label>
                                            </div>
                                            <div class="error-message" id="email-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input class="input" required type="text" id="address" style="width: 100%;">
                                                <label class="label" for="address">Address</label>
                                            </div>
                                            <div class="error-message" id="address-error"></div>
                                        </div>


                                        <div class="col-12" style="padding-bottom: 15px;margin-right: 10px;">
                                            <label class="form-label" for="district">Tỉnh <select class="form-select"
                                                                                                  id="district">
                                                    <option>Kiên Giang</option>
                                                    <option>Tân Hiệp</option>
                                                </select></label>
                                            <label class="form-label" for="district">Huyện <select class="form-select"
                                                                                                   id="district">
                                                    <option>Cần Thơ</option>
                                                    <option>Tân Hiệp</option>
                                                </select></label>

                                        </div>

                                        <div class="col-12" style="padding-bottom: 15px; width: 100%;">
                                            <div class="input-group">
                                                <!-- <textarea class="input" rows="3" cols="51" id="note"></textarea> -->
                                                <input class="input" required type="text" style="width: 100%;">
                                                <label class="label" for="username">Notes</label>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>


                            <div class="col-6">
                                <h6>Vận chuyển</h6>
                                <div class="form-check">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div>
                                            <!-- <input type="checkbox" class="form-check-input cod" name="paymentMethod"> -->
                                            <h6 class="text-success">Giao hàng tận nhà</h6>
                                        </div>
                                        <span class="text-muted">20.000đ</span>
                                    </li>
                                </div>


                                <h6 style="padding-top: 50px;">Thanh toán</h6>

                                <div class="form-check">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div>
                                            <input type="radio" class="form-check-input cod" name="paymentMethod" checked>
                                            <label class="form-check-label">Thanh toán COD</label>
                                        </div>
                                        <img src="https://th.bing.com/th/id/R.8ea4398b8e3f3bd9243156d01387c4e2?rik=73MFykivpgJj2w&pid=ImgRaw&r=0"
                                             alt="" style="width: 10%;">
                                    </li>
                                </div>
                                <div class="form-check">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div>
                                            <input type="radio" class="form-check-input cod" name="paymentMethod">
                                            <label class="form-check-label">Banking</label>
                                        </div>
                                        <img src="https://th.bing.com/th/id/OIP.CzeBJe1U2Z9GMtcmRLtTigHaEo?w=238&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
                                             alt="" style="width: 10%;">
                                    </li>
                                </div>

                                <div class="form-check">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div>
                                            <input type="radio" class="form-check-input cod" name="paymentMethod">
                                            <label class="form-check-label">Momo</label>
                                        </div>
                                        <img src="https://th.bing.com/th/id/OIP.8A3oGCqKXQ3uYNyfTXyNNgAAAA?w=181&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
                                             alt="" style="width: 10%;">
                                    </li>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- <div style="padding-left: 450px;">
                <a href="" style="text-decoration: none;">Thank You</a>
            </div> -->




                <script>
                    function validateForm() {
                        var form = document.getElementById('checkoutForm');
                        var inputs = form.querySelectorAll('input[required]');
                        var isValid = true;

                        var phoneRegex = /^\d{10,11}$/;
                        var emailRegex = /^\S+@\S+\.\S+$/;

                        inputs.forEach(function (input) {
                            var errorId = input.id + '-error';
                            var errorMessage = '';

                            if (!input.value.trim()) {
                                errorMessage = 'Vui lòng nhập thông tin.';
                                isValid = false;
                            } else if (input.id === 'phone' && !phoneRegex.test(input.value)) {
                                errorMessage = 'Số điện thoại không hợp lệ.';
                                isValid = false;
                            } else if (input.id === 'email' && !emailRegex.test(input.value)) {
                                errorMessage = 'Email không hợp lệ.';
                                isValid = false;
                            }

                            document.getElementById(errorId).textContent = errorMessage;
                            input.classList.toggle('invalid-field', errorMessage !== '');
                        });

                        return isValid;
                    }
                </script>


                </body>

                </html>
