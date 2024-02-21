<%-- 
    Document   : ListOrderCusVer2
    Created on : Feb 21, 2024, 2:30:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/ListOrderCusStyleVer2.css">
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

                <section class="order">
                    <div class="top_order">
                        <div class="chitiet">
                            <h4 style="font-weight: 700;">Danh mục đơn hàng</h4>
                        </div>

                        <div class="thongtin">
                            <div class="user_infor_o_detail">
                                <p class="label_order">Người đặt hàng: <span>Trần Phương Nam</span></p>
                                <p class="label_order">Số điện thoại: <span>(+84) 816560544</span></p>
                            </div>
                        </div>

                    </div>

                    <div class="bot_order">
                        <div class="danhsachdonhang">
                            <!-- CARD ORDER -->
                            <div class="donhang">
                                <div class="top_donhang">
                                    <div class="left_thongtindonhang">
                                        <p>Mã đơn hàng: <span>240120DBMHGQGU</span></p>
                                        <p>Địa chỉ: <span>An Giang</span></p>
                                        <p>Ngày đặt hàng: <span>21/02/2024</span></p>
                                    </div>
                                    <div class="right_thongtindonhang">
                                        <p>Phương thức thanh toán: <span>COD</span></p>
                                        <p>Trạng thái đơn hàng: <span>Đang giao hàng</span></p>
                                        <p>Tổng tiền: <span>đ50.000</span></p>
                                    </div>
                                </div>
                                <div class="bot_donhang">
                                    <div class="thaotac">
                                        <a class="xemchitiet" href="#">Xem chi tiết</a>
                                        <a class="huydon" href="#">Hủy đơn</a>
                                    </div>
                                </div>
                            </div>
                            <!-- END CARD ORDER -->

                            <!-- CARD ORDER -->
                            <div class="donhang">
                                <div class="top_donhang">
                                    <div class="left_thongtindonhang">
                                        <p>Mã đơn hàng: <span>240120DBMHGQGU</span></p>
                                        <p>Địa chỉ: <span>An Giang</span></p>
                                        <p>Ngày đặt hàng: <span>21/02/2024</span></p>
                                    </div>
                                    <div class="right_thongtindonhang">
                                        <p>Phương thức thanh toán: <span>COD</span></p>
                                        <p>Trạng thái đơn hàng: <span>Đang giao hàng</span></p>
                                        <p>Tổng tiền: <span>đ50.000</span></p>
                                    </div>
                                </div>
                                <div class="bot_donhang">
                                    <div class="thaotac">
                                        <a class="xemchitiet" href="#">Xem chi tiết</a>
                                        <a class="huydon" href="#">Hủy đơn</a>
                                    </div>

                                </div>
                            </div>
                            <!-- END CARD ORDER -->
                        </div>
                    </div>
                </section>
            </section>
        </main>
        <!--END NAM CODE-->
    </body>
</html>
