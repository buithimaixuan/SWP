<%-- 
    Document   : newsDetail
    Created on : Feb 22, 2024, 1:57:01 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <%@include file="headOfCart.jsp" %>
        <link rel="stylesheet" href="./CSS/newsDetail.css"/>
    </head>
    <body>
        <section id="main">

            <div class="address">
                <a href="#">Trang chủ</a> <span class="from_to">></span>
                <a href="#">Blog</a> <span class="from_to">></span>
                <span class="name_product_add">Kẹo sáp là gì? Cách làm món kẹo sáp độc đáo tại nhà</span>
            </div>

            <div class="content">

                <div class="main_content">
                    <div class="title">
                        <h2>Kẹo sáp là gì? Cách làm món kẹo sáp độc đáo tại nhà</h2>
                    </div>
                    <div class="infor_news">
                        <div class="time_publish">
                            <i class="fa-regular fa-clock"></i> Wed, 06/12/2023
                        </div>
                        <div class="author">
                            <i class="fa-solid fa-feather-pointed"></i> Tran Phuong Nam
                        </div>
                    </div>
                    <div class="img_news">
                        <div>
                            <img src="./images/Lovecake.png" alt="">
                        </div>
                    </div>
                    <div class="content_news">
                        <div class="paragraph content_1">
                            <div class="title_content">Kẹo sáp là gì?</div>
                            <div>
                                <p>Kẹo sáp là một loại kẹo được làm từ siro và sáp ong hoặc sáp thực vật như sáp carnauba.
                                    Sáp ong thường được sử dụng nhiều hơn vì tính chất kết dính tốt và khả năng tạo độ bóng
                                    cho kẹo. Quá trình tạo nên kẹo sáp thường bao gồm việc đun nóng sáp,
                                    sau đó thêm siro vào và khuấy trộn để tạo thành hỗn hợp đồng đều trước khi đổ vào khuôn
                                    hình.
                                    Vì được tùy biến theo từng khuôn hình, phù hợp với nhu cầu của bản thân nên kẹo sáp có
                                    nhiều hình dạng và màu sắc khác nhau và thường được sản xuất theo các hình dạng hấp dẫn
                                    như hình trái cây, hoa văn, hoặc các hình khác nhau tùy thuộc vào mùa lễ hoặc sự kiện cụ
                                    thể.
                                </p>
                            </div>
                        </div>
                        <div class="paragraph content_2">
                            <div class="title_content">Ăn kẹo sáp thế nào là đúng cách?</div>
                            <div>
                                <p>
                                    Đầu tiên, bắt đầu bẻ đầu chiếc kẹo để tách phần đầu của nó. Tiếp theo, hấp thụ toàn bộ
                                    nước bên trong kẹo bằng cách mút nhẹ. Sau đó, đặt kẹo vào miệng và nhai cho đến khi mọi
                                    hương vị của nó được trải nghiệm hết. Trong quá trình nhai, bạn sẽ cảm nhận được sự thơm
                                    ngon đặc trưng từ các loại hương vị của kẹo.Kẹo sáp vẫn nuốt được nhưng chúng tớ khuyên
                                    rằng bạn không nên nuốt. Dù vỏ kẹo được làm từ sáp ong an toàn với sức khỏe nhưng thành
                                    phần này khá khó tiêu nên khi nuốt vào bạn sẽ dễ gặp những trường hợp như đầy bụng, bụng
                                    khó chịu,…Nên khi ăn kẹo sáp hãy lưu ý rằng chỉ nhai cho đến khi hết vị ngọt tựa như ăn
                                    kẹo cao su vậy, sau đó bỏ phần sáp đi.
                                </p>
                            </div>
                        </div>
                        <div class="paragraph content_3">
                            <div class="title_content">Kẹo sáp là gì?</div>
                            <div>
                                <p>Kẹo sáp là một loại kẹo được làm từ siro và sáp ong hoặc sáp thực vật như sáp carnauba.
                                    Sáp ong thường được sử dụng nhiều hơn vì tính chất kết dính tốt và khả năng tạo độ bóng
                                    cho kẹo. Quá trình tạo nên kẹo sáp thường bao gồm việc đun nóng sáp,
                                    sau đó thêm siro vào và khuấy trộn để tạo thành hỗn hợp đồng đều trước khi đổ vào khuôn
                                    hình.
                                    Vì được tùy biến theo từng khuôn hình, phù hợp với nhu cầu của bản thân nên kẹo sáp có
                                    nhiều hình dạng và màu sắc khác nhau và thường được sản xuất theo các hình dạng hấp dẫn
                                    như hình trái cây, hoa văn, hoặc các hình khác nhau tùy thuộc vào mùa lễ hoặc sự kiện cụ
                                    thể.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <aside class="more_content">
                    <div class="more_title">
                        Các bài viết khác
                    </div>
                    <div class="other_list">

                        <!-- CARD OTHER -->
                        <div class="card_news">
                            <a href="#" class="other_img">
                                <img src="./images/Lovecake.png" alt="">
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
                                <img src="./images/Lovecake.png" alt="">
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
                                <img src="./images/Lovecake.png" alt="">
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
                </aside>

            </div>

            <div class="hot_product">
                <div class="hot_product_title">
                    SẢN PHẨM HOT NHẤT
                </div>
                <div class="cards">

                    <!-- CARD PRODUCT -->
                    <div class="card">
                        <a href="#" class="card_img">
                            <img src="./images/Lovecake.png" alt="">
                        </a>

                        <div class="card_content">
                            <div class="card_top">
                                <a href="#" class="card_title">[SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong </a>
                            </div>

                            <div class="card_infor">
                                <div class="card_price">89.000d</div>
                                <a href="#" class="card_buy">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span>MUA</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD PRODUCT -->
                    <!-- CARD PRODUCT -->
                    <div class="card">
                        <a href="#" class="card_img">
                            <img src="./images/Lovecake.png" alt="">
                        </a>

                        <div class="card_content">
                            <div class="card_top">
                                <a href="#" class="card_title">[SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong </a>
                            </div>

                            <div class="card_infor">
                                <div class="card_price">89.000d</div>
                                <a href="#" class="card_buy">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span>MUA</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD PRODUCT -->
                    <!-- CARD PRODUCT -->
                    <div class="card">
                        <a href="#" class="card_img">
                            <img src="./images/Lovecake.png" alt="">
                        </a>

                        <div class="card_content">
                            <div class="card_top">
                                <a href="#" class="card_title">[SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong </a>
                            </div>

                            <div class="card_infor">
                                <div class="card_price">89.000d</div>
                                <a href="#" class="card_buy">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span>MUA</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD PRODUCT -->
                    <!-- CARD PRODUCT -->
                    <div class="card">
                        <a href="#" class="card_img">
                            <img src="./images/Lovecake.png" alt="">
                        </a>

                        <div class="card_content">
                            <div class="card_top">
                                <a href="#" class="card_title">[SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong  [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong [SNL] Keo Nougat truyen thong </a>
                            </div>

                            <div class="card_infor">
                                <div class="card_price">89.000d</div>
                                <a href="#" class="card_buy">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span>MUA</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- END CARD PRODUCT -->
                </div>
            </div>
        </section>
    </body>
</html>
