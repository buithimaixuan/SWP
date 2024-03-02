<%-- 
    Document   : checkOut
    Created on : Feb 16, 2024, 6:18:21 PM
    Author     : Vu Minh Uyen
--%>

<%@page import="Models.Cart"%>
<%@page import="Models.Product"%>
<%@page import="DAOs.CartDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.Customer"%>
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
            <h3 style="color: #631bf3;">Group4 Store</h3>
            <form class="row g-3" action="OrderController" method="post">
                <%
                    String[] listCartBuy = (String[]) request.getSession().getAttribute("finalCart");
                    double amount = 0;
                %>
                <div class="col-4 order-md-last">
                    <h6 class="d-flex justify-content-between align-item-center">
                        <span class="text-muted">Đơn hàng</span>
                        <c:choose>
                            <c:when test="${finalPro != null}">
                                <span class="badge bg-secondary rounded-pill">1</span>
                            </c:when>
                            <c:when test="${finalCart != null}">
                                <span class="badge bg-secondary rounded-pill"><%= listCartBuy.length%></span>
                            </c:when>
                        </c:choose>
                    </h6>

                    <c:choose>
                        <c:when test="${finalCart != null}">
                            <ul class="list-group">
                                <%
                                    Customer getCusWhenPay = (Customer) request.getSession().getAttribute("account");
                                    ProductDAO pDAO = new ProductDAO();
                                    CartDAO caDAO = new CartDAO();
                                    for (int i = 0; i < listCartBuy.length; i++) {
                                        int proID = Integer.parseInt(listCartBuy[i]);
                                        Product getProInCheckout = pDAO.getProductByID(proID);
                                        Cart getCartInCheckout = caDAO.getCartByProAndCusID(getCusWhenPay.getCus_id(), proID);

                                %>
                                <li class="list-group-item d-flex justify-content-between">
                                    <img src="/<%= getProInCheckout.getPro_image()%>" style="width: 15%;" alt="">
                                    <div>
                                        <h6><%= getProInCheckout.getPro_name()%></h6>
                                        <span class="text-muted"><%= getProInCheckout.getBrand()%></span>
                                    </div>
                                    <%
                                        if (getProInCheckout.getDiscount() < getProInCheckout.getPro_price()) {
                                            amount += getProInCheckout.getDiscount() * getCartInCheckout.getPro_quantity();
                                    %>
                                    <span class="text-muted"><%= getProInCheckout.getDiscount() * getCartInCheckout.getPro_quantity()%>đ</span>
                                    <%
                                    } else {
                                        amount += getProInCheckout.getPro_price() * getCartInCheckout.getPro_quantity();
                                    %>
                                    <span class="text-muted"><%= getProInCheckout.getPro_price() * getCartInCheckout.getPro_quantity()%>đ</span>
                                    <%
                                        }
                                    %>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </c:when>
                        <c:when test="${finalPro != null}">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between">
                                    <img src="/${finalPro.pro_image}" style="width: 15%;" alt="">
                                    <div>
                                        <input type="hidden" name="proIDBill" value="${finalPro.pro_id}">
                                        <input type="hidden" name="quantityBill" value="${quantityBuyNow}">
                                        <h6>${finalPro.pro_name}</h6>
                                        <span class="text-muted">${finalPro.brand}</span>
                                    </div>
                                    <c:choose>
                                        <c:when test="${finalPro.discount < finalPro.pro_price}">
                                            <span class="text-muted">${finalPro.discount*quantityBuyNow}đ</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted">${finalPro.pro_price*quantityBuyNow}đ</span>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </c:when>
                    </c:choose>

                    <hr>
                    <li class="d-flex justify-content-between">
                        <div>
                            <h6>Tổng cộng</h6>
                        </div>
                        <c:choose>
                            <c:when test="${finalCart != null}">
                                <h4 style="color: #00ffa2;"><%= amount%>đ </h4>
                            </c:when>
                            <c:when test="${finalCart != null}">
                                <c:choose>
                                    <c:when test="${finalPro.discount < finalPro.pro_price}">
                                        <h4 style="color: #00ffa2;">${finalPro.discount*quantityBuyNow}đ </h4>
                                    </c:when>
                                    <c:otherwise>
                                        <h4 style="color: #00ffa2;">${finalPro.pro_price*quantityBuyNow}đ </h4>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </li>
                    <br>
                    <div style="display: flex;">
                        <a style="margin-right: auto; text-decoration: none;" href="">
                            < Quay về giỏ hàng</a>

                        <button name="payBtn" type="submit" class="dathangButon btn mb-4"
                                style="width: 50%;background-color: rgb(104, 39, 255);"
                                onclick="validateForm()">ĐẶT HÀNG</button>
                    </div>
                </div>
                
                <div class="col-8">
                    <div class="row">
                        <div class="col-6">
                            <h6>Thông tin giao hàng</h6>
                            <c:if test="${account != null}">
                                <div id="checkoutForm" onsubmit="return false;">
                                    <div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input readonly="" name="fullname" class="input" required type="text" id="username" value="${account.fullname}"
                                                       style="width: 100%;">
                                                <label class="label" for="username">FullName</label>
                                            </div>
                                            <div class="error-message" id="username-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input readonly="" name="phonenumber" class="input" required type="tel" id="phone" value="${account.phone_number}" style="width: 100%;">
                                                <label class="label" for="phone">SĐT</label>
                                            </div>
                                            <div class="error-message" id="phone-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input readonly="" name="email" class="input" required type="email" id="email" value="${account.email}" style="width: 100%;">
                                                <label class="label" for="email">Email</label>
                                            </div>
                                            <div class="error-message" id="email-error"></div>
                                        </div>
                                        <div class="col-12" style="padding-bottom: 15px;">
                                            <div class="input-group">
                                                <input name="address1" class="input" required type="text" id="address" style="width: 100%;">
                                                <label class="label" for="address">Address</label>
                                            </div>
                                            <div class="error-message" id="address-error"></div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>


                        <div class="col-6">
                            <h6>Vận chuyển</h6>
                            <div class="form-check">
                                <li class="list-group-item d-flex justify-content-between">
                                    <div>
                                        <!-- <input type="checkbox" class="form-check-input cod" name="paymentMethod"> -->
                                        <h6 class="text-success">Giao hàng tận nhà</h6>
                                    </div>
                                    <span class="text-muted">Miễn phí</span>
                                </li>
                            </div>


                            <h6 style="padding-top: 50px;">Thanh toán</h6>

                            <div class="form-check">
                                <li class="list-group-item d-flex justify-content-between">
                                    <div>
                                        <input type="radio" class="form-check-input cod" name="paymentMethod" value="COD" checked>
                                        <label class="form-check-label">Thanh toán COD</label>
                                    </div>
                                    <img src="https://th.bing.com/th/id/R.8ea4398b8e3f3bd9243156d01387c4e2?rik=73MFykivpgJj2w&pid=ImgRaw&r=0"
                                         alt="" style="width: 10%;">
                                </li>
                            </div>

                            <div class="form-check">
                                <li class="list-group-item d-flex justify-content-between">
                                    <div>
                                        <input type="radio" class="form-check-input cod" name="paymentMethod" value="VNPay">
                                        <label class="form-check-label">VNPay</label>
                                    </div>
                                    <img src="https://th.bing.com/th/id/OIP.8A3oGCqKXQ3uYNyfTXyNNgAAAA?w=181&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
                                         alt="" style="width: 10%;">
                                </li>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
            </form>
            <hr>
        </div>




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
