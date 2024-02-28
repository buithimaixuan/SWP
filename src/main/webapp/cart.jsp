<%-- 
    Document   : cart
    Created on : Feb 13, 2024, 12:14:36 PM
    Author     : Dell
--%>

<%@page import="DAOs.CartDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.Product"%>
<%@page import="Models.Cart"%>
<%@page import="Models.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="headOfCart.jsp" %>

        <div class="container">
            <%
                CartDAO cdao = new CartDAO();
            %>
            <form class="form-inline container mt-5 row" action="CartController" method="post">
                <div class="fs-5 title">Giỏ hàng</div> 
                <div class="col-lg-9">

                    <%
                        ProductDAO pdao = new ProductDAO();
                        LinkedList<Cart> listCart = (LinkedList<Cart>) request.getAttribute("listCart");
                        if (listCart.isEmpty()) {
                    %>
                    <h3 style="font-size: 18px; color: #3e3e3e1f; font-style: italic;">Chưa có sản phẩm trong giỏ hàng</h3>
                    <%
                    } else {
                    %>
                    <table id="example" class="display w-100">
                        <thead class="bg-body-secondary border-bottom border-top">
                            <tr style="line-height: 40px;">
                                <th>Chọn mua</th>
                                <th>Sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th style="text-align: center;">Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Cancel</th>
                            </tr>
                        </thead>
                        <tbody class="content_table">
                            <%
                                Customer cus = (Customer) request.getSession().getAttribute("account");
                                for (Cart item : listCart) {
                                    Product pro = pdao.getProductByID(item.getPro_id());
                            %>
                            <tr class="border border-1">
                                <td class="mx-2">
                                    <input value="<%= pro.getPro_id()%>" type="checkbox" name="checkBoxID" class="checkBuy mx-2">
                                </td>
                                <td>
                                    <img class="pt-2" src="/<%= pro.getPro_image()%>" alt="image"
                                         style="width: 70px; height: 70px;">
                                </td>

                                <td>
                                    <%= pro.getPro_name()%>
                                </td>
                                <td>
                                    <span class="unitPrice">
                                        <%
                                            if (pro.getDiscount() < pro.getPro_price()) {
                                        %>
                                        <%= pro.getDiscount()%>
                                        <%
                                        } else {
                                        %>
                                        <%= pro.getPro_price()%>
                                        <%
                                            }
                                        %>

                                    </span>
                                </td>
                                <td>
                                    <div class="form-group d-flex justify-content-center">
                                        <button name="decrease_quan" value="<%= pro.getPro_id()%>" class="decrease_quan btn btn-sm btn-decre" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); DecreaseQuan(this);"><i class="fas fa-minus-square fs-3 mt-1 text-black-50"></i></button>
                                        <input type="number" name="quantity" class="proQuantity form-control text-center" min="1" max="<%= pro.getPro_quantity()%>" value="<%= item.getPro_quantity()%>" style="width: 50px;">
                                        <button name="increase_quan" value="<%= pro.getPro_id()%>" class="increase_quan btn bnt-sm btn-incre" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); IncreaseQuan(this);"><i class="fas fa-plus-square fs-3 mt-1 text-black-50"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <span class="price_cart"></span>
                                </td>
                                <td><a onclick="return confirm('Do you want to delete this cart?')" href="/CartController/delete/<%= item.getPro_id()%>"
                                       class="btn btn-sm btn-danger">Xóa</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <%
                        }
                    %>
                    <span class="error mt-2"></span>
                </div>
                <div class="col-lg-3">
                    <span class="fs-5 d-block fw-bold border-bottom" style="line-height: 40px;">Thông tin đơn
                        hàng</span>
                    <div style="line-height: 80px;">
                        <span class="fs-4">Tổng tiền: <span class="total_price text-danger"></span></span>

                    </div>
                    <%
                        if (!listCart.isEmpty()) {
                    %>
                    <input type="submit" class="btn btn-outline-info text-black fs-5" value="Tiến hành đặt hàng"
                           name="btnBuyInCart">
                    <%
                        }
                    %>


                </div>
            </form>
        </div>
    </body>

</html>