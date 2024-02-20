<%-- 
    Document   : orderDetailAdmin
    Created on : Feb 20, 2024, 9:30:02 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <section class="h-100">
                    <div class="container py-4 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-lg-10 col-xl-8" style="width: 100%;">
                                <div class="card" style="border-radius: 10px;">
                                    <div class="card-body p-4" style="width: 100%;">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <p class="fw-bold small text-muted mb-0">MÃ ĐƠN HÀNG : 1KAU9-84UIL</p>
                                        </div>
                                        <div class="card shadow-0 border mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <img src="./images/Lovecake.png"
                                                             class="img-fluid" alt="Phone">
                                                    </div>
                                                    <div class="col-md-6 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0">Samsung Galaxy</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">Số lượng: 2</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">100.000</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card shadow-0 border mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <img src="./images/Lovecake.png"
                                                             class="img-fluid" alt="Phone">
                                                    </div>
                                                    <div class="col-md-6 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0">Samsung Galaxy</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">Số lượng: 2</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <p class="text-muted mb-0 small">100.000</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-between pt-2">
                                            <p class="fw-bold mb-0">Chi tiết đơn hàng</p>
                                        </div>

                                        <div class="d-flex justify-content-between pt-2">
                                            <p class="text-muted mb-0"><span class="me-2">Người đặt hàng:</span>user1</p>
                                            <p class="text-muted mb-0"><span class="me-2">Số điện thoại:</span>09123456</p>
                                        </div>
                                        
                                        <div class="d-flex justify-content-between">
                                            <p class="text-muted mb-0"><span class="me-2">Ngày đặt hàng:</span>10/02/2024</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="text-muted mb-0"><span class="me-2">Địa chỉ:</span>21/15B New York, Quận Hải Phòng, Thành Phố Hồ Chí Minh</p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-5">
                                            <p class="text-muted mb-0"><span class="fw-bold me-4">Trạng thái: </span>Đang giao</p>
                                            <p class="text-muted mb-0"><span class="fw-bold me-4">Phương thức thanh toán: </span>COD</p>
                                        </div>
                                    </div>
                                    <div class="card-footer border-0 px-4 py-5"
                                         style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Tổng tiền : <span class="h2 mb-0 ms-2 text-white">200.000</span></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
