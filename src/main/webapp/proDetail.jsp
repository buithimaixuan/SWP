<%-- 
    Document   : proDetail
    Created on : Feb 13, 2024, 12:59:29 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="/CSS/proDetail.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%--<%@include file="headOfCart.jsp" %>--%>
        <%@include file="headOfHome.jsp" %>
        <main>
            <div class="content">

                <div id="address_page">
                    <a href="#" class="text-decoration-none" style=" color: #ff6123;">Trang chủ</a> <span class="from_to">></span>
                    <a href="#" class="text-decoration-none" style=" color: #ff6123;">Nguyên liệu làm bánh</a> <span class="from_to">></span>
                    <span class="name_product_add">${pro_name}</span>
                </div>

                <div id="product_detail_container">

                    <div class="img_product_gallery">
                        <div class="main_img">
                            <span class="control next">
                                <i class="fa-solid fa-arrow-right"></i>
                            </span>
                            <span class="control prev">
                                <i class="fa-solid fa-arrow-left"></i>
                            </span>
                            <div class="img_wrap">
                                <img src="./images/no_image.png" alt="Lovecake">
                            </div>
                        </div>
                        <div class="list_img">
                            <div>
                                <img src="/${pro_image}" alt="">
                            </div>
                            <c:forEach items="${productImages}" var="pro">
                            <div>
                                <img src="/${pro.getImage_url()}" alt="">
                            </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="infor_product">

                        <div class="intro_product">
                            <div class="name_product">${pro_name}</div>
                            <div class="id_product">Mã sản phẩm: <span>${pro_id}</span></div>
                            <div class="cost_product"></div>
                        </div>

                        <div class="choose_option">
                            <div class="quantity_product">
                                <span class="quantity_label">Số lượng: </span>
                                <div class="choose_quantity">
                                    <span class="decrease"
                                          onclick="this.parentNode.querySelector('input[type=number]').stepDown();">
                                        <i class="fa-solid fa-minus"></i>
                                    </span>
                                    <input type="number" value="1" min="1" max="10">
                                    <span class="increase"
                                          onclick="this.parentNode.querySelector('input[type=number]').stepUp();">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="option_product">
                                <a href="#" class="buyNow_btn text-decoration-none">
                                    <div>
                                        <i class="fa-solid fa-bag-shopping"></i>Mua ngay
                                    </div>
                                    <div>
                                        Giao hàng tận tay quý khách
                                    </div>
                                </a>
                                <a href="#" class="addCart_btn text-decoration-none">
                                    <div>
                                        <i class="fa-solid fa-cart-shopping"></i>Thêm vào giỏ hàng
                                    </div>
                                    <div>
                                        Chọn vào giỏ hàng để mua
                                    </div>
                                </a>
                            </div>
                        </div>

                        <div class="more_infor">
                            <div class="freeShip">
                                <div></div>
                                Sản phẩm luôn nhận giao hàng Online. Freeship mọi đơn từ 500K nhập "FREESHIP"
                            </div>
                            <div class="more_infor_content">
                                <div class="brand">
                                    - Thương hiệu: <span>${brand}</span>
                                </div>
                                <div class="origin">
                                    - Xuất xứ: <span>${origin}</span>
                                </div>
                                <div class="component">
                                    - Thành phần: <span>${ingredient}</span>
                                </div>
                                <div class="weight">
                                    - Trọng lượng: <span>${mass}kg</span>
                                </div>
                                <div class="usesage">
                                    - Công dụng: <span>${pro_description}</span>
                                </div>
                                <div class="preserve">
                                    - Số lượng trong kho: <span>${pro_quantity}</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- SẢN PHẨM HOT -->
                <div class="hot_product">
                    <!-- SELECT 5 PRODUCT -->
                    <div class="hot_product_title">
                        SẢN PHẨM HOT NHẤT
                    </div>

                    <div class="list_card_product">
                        <div class="card_product">
                            <div class="top_card"></div>
                            <div class="bot_card"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <script src="/JS/product_detail.js"></script>
    </body>
</html>
