<%-- 
    Document   : OrderDetailCusVer2
    Created on : Feb 21, 2024, 2:40:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/OrderDetailCusVer2Style.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="headOfCart.jsp" %>
        <style>
            a{
                text-decoration: none;
            }
            ul{
                padding: 0;
            }
        </style>
        
        <!--NAM CODE-->
        <main>
            <section class="content">
                <aside>
                    <div class="top_aside">
                        <div class="avatar_aside">
                            <a href="#">
                                <img src="./Lovecake.png" alt="">
                            </a>
                        </div>
                        <div class="infor_aside">
                            <span>Trần Phương Nam</span>
                            <a href="#"><i class="fa-solid fa-pen"></i>Sửa hồ sơ</a>
                        </div>
                    </div>
                    <ul>
                        <li>
                            <a href="#"><i class="fa-solid fa-user"></i> Tài khoản của tôi</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa-solid fa-rectangle-list"></i> Đơn mua</a>
                        </li>
                    </ul>
                </aside>

                <section class="o_detail">
                    <div class="top_o_detail">
                        <div class="chitiet">
                            <h4>Chi tiết đơn hàng</h4>
                        </div>

                        <div class="thongtin">
                            <div class="user_infor_o_detail">
                                <p class="label_order">Người đặt hàng: <span>Trần Phương Nam</span></p>
                                <p class="label_order">Địa chỉ: <span>An Giang</span></p>
                                <p class="label_order">Số điện thoại: <span>(+84) 816560544</span></p>
                            </div>
                            <div class="order_infor_o_detail">
                                <p class="label_order">Mã đơn hàng: <span>SPXVN043256401731</span></p>
                                <p class="label_order">Ngày đặt hàng: <span>20/2/2024</span></p>
                                <p class="label_order">Số lượng: <span>02</span></p>
                                <p class="label_order">Phương thức thanh toán: <span class="phuongthuc">COD</span></p>
                                <p class="label_order">
                                    Trạng thái:
                                    <span class="trangthai">
                                        Đã xác nhận
                                    </span>
                                </p>
                            </div>
                        </div>

                    </div>

                    <div class="bot_o_detail">
                        <h2>Danh sách đơn hàng</h2>
                        <div class="danhsachsanpham">
                            <!-- CARD -->
                            <div class="sanpham">
                                <div class="thongtinsanpham">
                                    <div class="anhsanpham">
                                        <img src="./Lovecake.png" alt="">
                                    </div>
                                    <div class="thongtinconlai">
                                        <h3>Banh bong lan trung muoi</h3>
                                        <p>The loai: <span>Banh bong lan</span></p>
                                        <p>So luong: <span>01</span></p>
                                    </div>
                                </div>
                                <div class="giasanpham">
                                    <p class="giathat">đ60.000</p>
                                    <p class="giagiam">đ50.000</p>
                                </div>
                            </div>
                            <!-- END CARD -->

                            <!-- CARD -->
                            <div class="sanpham">
                                <div class="thongtinsanpham">
                                    <div class="anhsanpham">
                                        <img src="./Lovecake.png" alt="">
                                    </div>
                                    <div class="thongtinconlai">
                                        <h3>Banh bong lan trung muoi</h3>
                                        <p>The loai: <span>Banh bong lan</span></p>
                                        <p>So luong: <span>01</span></p>
                                    </div>
                                </div>
                                <div class="giasanpham">
                                    <p class="giathat">đ60.000</p>
                                    <p class="giagiam">đ50.000</p>
                                </div>
                            </div>
                            <!-- END CARD -->
                        </div>
                        <div class="tongtien">
                            <div class="thongkegia">
                                <p><i class="fa-solid fa-money-bill"></i><span>Thành tiền: </span></p>
                                <span class="giacuoicung">đ50.000</span>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </main>
        <!--END NAM CODE-->
    </body>
</html>
