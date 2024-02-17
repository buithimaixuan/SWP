<%-- 
    Document   : cart
    Created on : Feb 13, 2024, 12:14:36 PM
    Author     : Dell
--%>

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

    <div class="container">
        <form method="post" class="form-inline container mt-3 row" action="OrderController"
            onsubmit="return validateCheckBox()">
            <!-- <div class="col-lg-"></div> -->
            <div class="col-lg-9">
                <table id="example" class="display w-100">
                    <thead class="bg-body-secondary border-bottom border-top">
                        <tr style="line-height: 40px;">
                            <th>Chọn mua</th>
                            <th>Sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border border-1">
                            <td class="mx-2">
                                <input type="checkbox" name="checkbox" class="checkBuy mx-2">
                            </td>
                            <td>
                                <img class="pt-2" src="Images/Lovecake.png" alt="image"
                                    style="width: 70px; height: 70px;">
                            </td>

                            <td>
                                Bột làm bánh bao mikko 1kg
                            </td>
                            <td>
                                57.000
                            </td>
                            <td>
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="#"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                                    <a class="btn bnt-sm btn-incre" href="#"><i class="fas fa-plus-square"></i></a>
                                </div>
                            </td>
                            <td>
                                57.000
                            </td>
                            <td><a onclick="return confirm('Do you want to delete this cart?')" href="#"
                                    class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <tr class="border border-1">
                            <td>
                                <input type="checkbox" name="checkbox" class="checkBuy mx-2">
                            </td>
                            <td>
                                <img class="pt-2" src="Images/Lovecake.png" alt="image"
                                    style="width: 70px; height: 70px;">
                            </td>

                            <td>
                                Bột làm bánh bao mikko 1kg
                            </td>
                            <td>
                                57.000
                            </td>
                            <td class="w-25">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="#"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                                    <a class="btn bnt-sm btn-incre" href="#"><i class="fas fa-plus-square"></i></a>
                                </div>
                            </td>
                            <td>
                                57.000
                            </td>
                            <td><a onclick="return confirm('Do you want to delete this cart?')" href="#"
                                    class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <tr class="border border-1">
                            <td>
                                <input type="checkbox" name="checkbox" class="checkBuy mx-2">
                            </td>
                            <td>
                                <img class="pt-2" src="Images/Lovecake.png" alt="image"
                                    style="width: 70px; height: 70px;">
                            </td>


                            <td>
                                Bột làm bánh bao mikko 1kg
                            </td>
                            <td>
                                57.000
                            </td>
                            <td class="w-25">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="#"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                                    <a class="btn bnt-sm btn-incre" href="#"><i class="fas fa-plus-square"></i></a>
                                </div>
                            </td>
                            <td>
                                57.000
                            </td>
                            <td><a onclick="return confirm('Do you want to delete this cart?')" href="#"
                                    class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <span class="error mt-2"></span>
            </div>
            <div class="col-lg-3">
                <span class="fs-5 d-block fw-bold border-bottom" style="line-height: 40px;">Thông tin đơn
                    hàng</span>
                <div style="line-height: 80px;">
                    <span class="fs-4">Tổng tiền: <span class="text-danger">120000đ</span></span>

                </div>
                <input type="submit" class="btn btn-outline-info text-black fs-5" value="Tiến hành đặt hàng"
                    name="btnBuy">
            </div>
        </form>
    </div>
</body>

</html>