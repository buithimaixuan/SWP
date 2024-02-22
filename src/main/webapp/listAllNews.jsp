<%-- 
    Document   : listAllNews
    Created on : Feb 22, 2024, 1:31:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All News</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <%@include file="headOfCart.jsp" %>
        <link rel="stylesheet" href="./CSS/listAllNews.css"/></head>
    <body>
        <section class="banner">
            <i class="fa-solid fa-circle control prev"></i>
            <i class="fa-solid fa-circle control next"></i>
            <div class="wrapper">
                <img src="./images/slider_1_blog.jpeg" alt="">
            </div>
            <div class="list_img">
                <img src="./images/slider_1_blog.jpeg" alt="">
                <img src="./images/slider_3_blog.jpeg" alt="">
            </div>
        </section>

        <div class="content">
            <div class="layout1">
                <div class="layout1_title">
                    <a href="#">Các bài viết nổi bật</a>
                </div>
                <div class="layout1_content">
                    <aside>
                        <a href="#" class="other_img">
                            <img src="./images/slider_3_blog.jpeg" alt="">
                        </a>
                        <div class="card_news_bot">
                            <a href="#">[Blog] Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                            <div class="read_more">
                                <span>
                                    <span>Trên thị trường bánh sinh nhật có rất nhiều mẫu mã đa dạng, nhưng để chọn bánh sinh nhật cho người lớn tuổi không hề</span>
                                    <a href="#">[Đọc tiếp]</a>
                                </span>
                            </div>
                        </div>
                    </aside>
                    <div class="layout1_right">
                        <div class="right_card">
                            <a href="#">
                                <img src="./images/slider_1_blog.jpeg" alt="">
                            </a>
                            <div class="bot_right_card">
                                <a href="#">[Cập nhật] Mẫu bánh sinh nhật cho bạn thân hài hước, hot tren 2024</a>
                                <div class="card_right_infor">
                                    <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                </div>
                                <div class="card_right_read_more">
                                    <p>Sinh nhật của bạn thân sắp đến rồi, bên cạnh món quà chuẩn bị, bạn vẫn lo lắng về abc xyz</p>
                                </div>
                            </div>
                        </div>
                        <div class="right_card">
                            <a href="#">
                                <img src="./images/slider_1_blog.jpeg" alt="">
                            </a>
                            <div class="bot_right_card">
                                <a href="#">[Cập nhật] Mẫu bánh sinh nhật cho bạn thân hài hước, hot tren 2024</a>
                                <div class="card_right_infor">
                                    <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                </div>
                                <div class="card_right_read_more">
                                    <p>Sinh nhật của bạn thân sắp đến rồi, bên cạnh món quà chuẩn bị, bạn vẫn lo lắng về abc xyz</p>
                                </div>
                            </div>
                        </div>
                        <div class="right_card">
                            <a href="#">
                                <img src="./images/slider_1_blog.jpeg" alt="">
                            </a>
                            <div class="bot_right_card">
                                <a href="#">[Cập nhật] Mẫu bánh sinh nhật cho bạn thân hài hước, hot tren 2024</a>
                                <div class="card_right_infor">
                                    <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                </div>
                                <div class="card_right_read_more">
                                    <p>Sinh nhật của bạn thân sắp đến rồi, bên cạnh món quà chuẩn bị, bạn vẫn lo lắng về abc xyz</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layout2">
                <div class="layout2_title">
                    <h3>Tất cả các bài viết</h3>
                </div>
                <div class="list_card_news">
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                    <!-- CARD OTHER -->
                    <div class="card_news">
                        <a href="#" class="other_img">
                            <img src="./images/slider_1_blog.jpeg" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="#">Bánh sinh nhật tặng mẹ</a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> Wed, 06/12/2023</span>
                                <span><i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam</span>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD OTHER -->
                </div>
            </div>
        </div>
    </body>
    <%@include file="" %>
    <script src="./JS/listAllNews.js"></script>
</html>
