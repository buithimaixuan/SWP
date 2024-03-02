<%-- 
    Document   : index
    Created on : Jan 18, 2024, 12:24:33 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <title>LoveCake Shop</title>
        <link rel="icon" type="image/png" href="images/Lovecake.png">
        <link rel="stylesheet" href="/CSS/style.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <!--  -->
        <div style="background-color: rgb(69, 68, 69);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-3 col-sm-3 categories border rounded-top border-dark" style="margin-top: 20px;">
                        <a href="/ProductController" class="text-decoration-none text-black">
                            <p class="hidden-sm hidden-xs text-center">DANH MỤC SẢN PHẨM</p>
                        </a>

                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-3 pt-2 pb-2 text-center d-flex align-items-center justify-content-center">
                        <a href="/HomeController" class="d-flex align-items-center justify-content-center rounded-circle" style="height: 80px; width: 80px; overflow: hidden">
                            <img class="border rounded-circle" src="/images/Lovecake.png" alt="logo">
                        </a>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-7 d-flex align-items-center p-0">
                        <form class="search-box" method="post" action="ProductController">
<!--                            <input class="form-control border rounded-pill border-2" type="text" placeholder="search"
                                   id="example-search-input">
                            <span class="input-group-append">
                                <button class="btn btn-outline-secondary bg-white border rounded-pill ms-n3 border-2"
                                        type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>-->

                            <!--NAM CODE HERE-->
                            <input name="value-search" type="text" value="${getSearch}"  placeholder="Search...">
                            <button id="searchBtn" name="search-btn" type="submit" class="search-box-btn">
                                <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                            </button>
                        </form>
                    </div>
                    <div
                        class="col-lg-3 col-md-3 col-sm-3 d-flex align-items-center justify-content-between text-white pt-2 ps-5 px-0">
                        <c:if test="${account!=null}">
                            <div style="margin-top: 14px;">
                                <span class="input-group-append ps-2">
                                    <a class="text-white" href="/CartController"><i class="fa fa-cart-plus fs-5 ps-2 px-2"></i></a>
                                </span>
                                <p>Giỏ hàng</p>
                            </div>
                            <div style="margin-top: 14px;">
                                <span class="input-group-append ms-4">
                                    <a href="" class="text-white"><i class="fa fa-newspaper-o"></i></a>
                                </span>
                                <p>Đơn hàng</p>
                            </div>

                            <div class="user" style="margin-bottom: 7px;">
                                <div class="avartar">
                                    <img src="/images/Lovecake.png" alt="">
                                </div>
                            </div>

                            <div class="user_option">
                                <div class="top_user_option">
                                    <i class="fa-solid fa-xmark"></i>
                                    <div>
                                        <span class="email_display text-black">${account.email}</span>
                                    </div>
                                </div>
                                <div class="mid_user_option">
                                    <div class="avatar_display border border-1">
                                        <img src="/${account.avatar}" alt="">
                                    </div>
                                    <div class="hello_user text-black">
                                        <span>Hello ${account.fullname}</span>
                                    </div>
                                </div>
                                <div class="bot_user_option">
                                    <a href="/LogoutController" class="signout_btn">
                                        <i class="fa-solid fa-right-from-bracket"></i>
                                        <span>Sign out</span>
                                    </a>
                                    <a href="/UpdateCustomerController" class="view_profile">
                                        <i class="fa-solid fa-user"></i>
                                        <span>View profile</span>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${account==null}">
                            <div style="margin-top: 14px;">
                                <span class="input-group-append ps-2">
                                    <a class="text-white" href="/LoginController"><i class="fa-solid fa-user fs-5 ps-2 px-2 ms-3"></i></a>
                                </span>
                                <p>Đăng nhập</p>
                            </div>
                        </c:if>


                        <!-- <div>
                            <span class="input-group-append ms-4">
                                <a href="" class="text-white"><i class="fa fa-newspaper-o"></i></a>
                            </span>
                            <p>Đơn hàng</p>
                        </div> -->


                        <!-- <div>
                            <span class="input-group-append ms-3">
                                <a class="text-white" href=""><i class="fa fa-user fs-5 ps-2 px-2"></i></a>
                            </span>
                            <p>Tài khoản</p>
                        </div> -->



                    </div>

                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.sub-btn').click(function () {
                    $(this).next('.sub-menu').slideToggle();
                });
            });
        </script>
        <script src="/JS/profile.js"></script>
    </body>

</html>