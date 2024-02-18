<%-- 
    Document   : DashBoardSlideBarVer2
    Created on : Feb 16, 2024, 8:00:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <link rel="stylesheet" href="./CSS/dashboardnamver2.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="sidebar">
            <div class="header_sidebar">
                <div class="logo">
                    <a href="#">
                        <img src="images/Lovecake.png" alt="">
                    </a>
                </div>
                <span>Dashboard</span>
            </div>
            <ul>
                <li>
                    <a href="#"><i class="fa-solid fa-user"></i>Account manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-brands fa-product-hunt"></i>Product manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-solid fa-layer-group"></i>Categories manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i>Order manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-solid fa-newspaper"></i>News manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-solid fa-clipboard-user"></i>Staff manage</a>
                </li>
                <li>
                    <a href="#"><i class="fa-solid fa-clipboard-user"></i>Customer manage</a>
                </li>
            </ul>
            <div class="bot_sidebar">
                <a class="btn_logout" href="#"><i class="fa-solid fa-right-from-bracket"></i>Log out</a>
            </div>
        </div>
    </body>
</html>