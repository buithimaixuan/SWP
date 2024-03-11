<%-- 
    Document   : newsDetail
    Created on : Feb 22, 2024, 1:57:01 PM
    Author     : HP
--%>

<%@page import="Models.Product"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.News"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAOs.NewsDAO"%>
<%@page import="DAOs.StaffDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tin tức</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <%@include file="headOfHome.jsp" %>
        <link rel="stylesheet" href="../CSS/newsDetail.css"/>
        <link rel="stylesheet" href="/CSS/style.css">

    </head>
    <body>

        <section id="main">
            <div class="address">
                <!--<a href="">Trang chủ</a> <span class="from_to"></span>-->
                <a style="font-size: 1.3rem" class="fw-bold" href="/HomeController">Trang chủ</a> <i class="fa-solid fa-chevron-right"></i>
                <a style="font-size: 1.3rem" class="fw-bold" href="listNews">Blog</a> <i class="fa-solid fa-chevron-right"></i>
                <span style="font-size: 1.3rem" class="name_product_add fw-bold">${news.getTitle()}</span>
            </div>

            <div class="content">

                <div class="main_content">
                    <div class="title">
                        <h2>${news.getTitle()}</h2>
                    </div>
                    <div class="infor_news">
                        <div class="time_publish">
                            <i class="fa-regular fa-clock"></i> ${news.getCreate_date()}
                        </div>
                        <div class="author">
                            <i class="fa-solid fa-feather-pointed"></i> ${news.getStaff_id()}
                        </div>
                    </div>
                    <div class="img_news">
                        <div>
                            <img src="/${news.getImage_url()}" alt="">
                        </div>
                    </div>
                    <div>
                        <div class="paragraph content_1">
                            <div class="title_content text-lg-start">${news.getTitle_content()}</div>
                            <div>
                                <p>${news.getContent1()}</p>
                            </div>
                        </div>
                        <div class="paragraph content_2">
                            <!--<div class="title_content">Ăn kẹo sáp thế nào là đúng cách?</div>-->
                            <div>
                                <p>${news.getContent2()}</p>
                            </div>
                        </div>
                        <div class="paragraph content_3">
                            <!--<div class="title_content">Kẹo sáp là gì?</div>-->
                            <div>
                                <p>${news.getContent3()}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <aside class="more_content">
                    <div class="more_title">
                        Các bài viết khác
                    </div>
                    <div class="other_list">
                        <%
                            StaffDAO staffDAO = new StaffDAO();
                            NewsDAO newsDAO = new NewsDAO();
                            LinkedList<News> listNews = newsDAO.getTop3News();
                            for (News element : listNews) {
                                String fullname = staffDAO.getFullNameByID(element.getStaff_id());
                        %>
                        <div class="card_news">
                            <a href="./newsDetail?news_id=<%= element.getNews_id()%>" class="other_img">
                                <img src="/<%= element.getImage_url()%>" alt="">
                            </a>

                            <div class="card_news_bot">
                                <a href="./newsDetail"><%= element.getTitle()%></a>
                                <div class="other_infor">
                                    <span><i class="fa-regular fa-clock"></i> <%= element.getCreate_date()%></span>
                                    <span><i class="fa-solid fa-feather-pointed"></i> <%= fullname%></span>
                                </div>
                            </div>
                        </div>
                        <%                            
                            }
                        %>
                    </div>
                </aside>
            </div>

            <div class="hot_product">
                <div class="hot_product_title">
                    SẢN PHẨM HOT NHẤT
                </div>
                <div class="row">
                    <%
                        ProductDAO proDAO = new ProductDAO();
                        LinkedList<Product> listPro = proDAO.getTop4Pro();
                        for (Product element : listPro) {
                    %>
                    <div class="card_product col-lg-3">
                        <input type="hidden" name="product-id" value="<%= element.getPro_id()%>"/>
                        <a href="/ProductController/DetailProduct/<%= element.getPro_id()%>" class="card_img">
                            <img class="h-75" src="/<%= element.getPro_image()%>" alt="">
                        </a>

                        <div class="card_content">
                            <div class="card_top">
                                <a href="#" class="card_title">${p.pro_name}</a>
                            </div>

                            <div class="card_infor">
                                <div class="card_price">
                                    <c:if test="<%= element.getDiscount() == 0%>">
                                        <%= element.getPro_price()%>đ
                                    </c:if>
                                    <c:if test="<%= element.getDiscount() > 0%>">
                                        <span class="discount"><%= element.getDiscount()%>đ</span>
                                        <span class="real_price" style=" text-decoration: line-through;"><%= element.getPro_price()%>đ</span>    
                                    </c:if>

                                </div>
                                <button class="card_buy" type="submit" name="btnAddCart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span>Thêm</span>
                                </button>
                            </div>
                        </div>
                        </form>   
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
    </body>
    <%@include file="footerOfHome.jsp" %>
    <style>
        a {
            color: #3e3e3e;
            text-decoration: none;
            transition: 0.15s;
        }

    </style>
</html>
