<%-- 
    Document   : detailProAdmin
    Created on : Feb 28, 2024, 12:28:46 AM
    Author     : Dell
--%>

<%-- 
    Document   : UpdateProForm
    Created on : Jan 21, 2024, 1:14:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
        <title>Chi tiết sản phẩm</title>
        <style>
            .form-hover:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 0.5rem;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="post" action="ProductController" enctype="multipart/form-data" 
                      class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px" onsubmit="return validateAddProduct()">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Chi tiết sản phẩm</span>
                    </div>
                    <div class="d-flex" style="gap: 20px">
                        <div class="w-100">
                            <div class="form-outline w-100 form-group hover-shadow">
                                <div class="form-hover">
                                    <input type="text" id="proId" name="proId" placeholder="Ma SP" value="${pEdit.pro_id}"
                                           class="form-control form-control-lg" readonly />
                                    <label for="proName" class="form-label">Mã sản phẩm</label>
                                </div>
                                <span class="error errorProName text-danger fw-bold font-italic"></span>
                            </div>
                            <div class="form-outline w-100 form-group hover-shadow mt-4">
                                <div class="form-hover">
                                    <input type="text" id="proName" name="proName" placeholder="Tên sản phẩm" value="${pEdit.pro_name}"
                                           class="form-control form-control-lg" readonly />
                                    <label for="proName" class="form-label">Tên sản phẩm</label>
                                </div>
                                <span class="error errorProName text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="number" id="price" name="price" placeholder="Giá gốc" value="${pEdit.pro_price}"
                                           class="form-control form-control-lg" readonly/>
                                    <label for="price" class="form-label">Giá bán</label>
                                </div>
                                <span class="error errorPrice text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="number" id="realPrice" name="realPrice" placeholder="Giá bán" value="${pEdit.discount}"
                                           class="form-control form-control-lg" readonly />
                                    <label for="realPrice" class="form-label">Giá khuyến mãi</label>
                                </div>
                                <span class="error errorRealPrice text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="number" id="quantity" name="quantity" placeholder="Số lượng" value="${pEdit.pro_quantity}" readonly
                                           class="form-control form-control-lg" />
                                    <label for="quantity" class="form-label">Số lượng</label>
                                </div>
                                <span class="error errorQuantity text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="text" id="brand" name="brand" placeholder="Thương hiệu" 
                                           class="form-control form-control-lg" value="${pEdit.brand}" readonly/>
                                    <label class="form-label">Thương hiệu (option)</label>
                                </div>
                                <span class="error errorBrand text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="text" id="mass" name="mass" placeholder="Khối lượng"
                                           class="form-control form-control-lg" value="${pEdit.mass}" readonly/>
                                    <label class="form-label">Khối lượng (option)</label>
                                </div>
                                <span class="error errorMass text-danger fw-bold font-italic"></span>
                            </div>
                        </div>

                        <div class="w-100">
                            <div class="form-group form-outline w-100">
                                <div class="form-hover">
                                    <input type="text" id="ingredient" name="ingredient" placeholder="Thành phần"
                                           class="form-control form-control-lg" value="${pEdit.ingredient}" readonly/>
                                    <label class="form-label">Thành phần (option)</label>
                                </div>
                                <span class="error errorIngredient text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-outline mt-3 w-100 mb-0">
                                <label class="form-label h5">Loại sản phẩm</label>
                                <div class="form-hover">
                                    <select class="w-100 form-control form-control-lg" name="cat_id" readonly>
                                        <c:forEach items="${listCat}" var="c">
                                            <option value="${c.cat_id}"  <c:if test="${pEdit.cat_id==c.cat_id}"> selected</c:if>>${c.typeCategories}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-outline mt-3">
                                <label class="form-label h5">Xuất xứ</label>
                                <div class="form-hover">
                                    <select class="w-100 form-control form-control-lg" name="origin" readonly>
                                        <option value="Việt Nam" <c:if test="${pEdit.origin=='Việt Nam'}"> selected</c:if>>Việt Nam</option>
                                        <option value="Trung quốc"  <c:if test="${pEdit.origin=='Trung quốc'}"> selected</c:if>>Trung quốc</option>
                                        <option value="Mỹ"  <c:if test="${pEdit.origin=='Mỹ'}"> selected</c:if>>Mỹ</option>
                                        <option value="Hàn"  <c:if test="${pEdit.origin=='Hàn'}"> selected</c:if>>Hàn</option>
                                        <option value="Thái Lan"  <c:if test="${pEdit.origin=='Thái Lan'}"> selected</c:if>>Thái Lan</option>
                                    </select>
                                </div>
                            </div>



                            <div class="form-outline mt-4">
                                <label class="form-label h5">Ngày tạo sản phẩm</label>
                                <div class="form-hover">
                                    <input type="date" id="dayWriteNews" name="dayWriteNews" value="${pEdit.create_date}" class="form-control form-control-lg" readonly/>
                                    <span id="dateError" class="text-danger fw-bold font-italic"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <label class="form-label h5 mt-4">Hình ảnh sản phẩm: </label>
                    <div class="d-flex mt-0" style="gap: 20px">
                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 1</label>
                                        <div class="form-hover">
                                            <div class="d-flex">
                                                <input type="file" name="proPic1" id="proPic1" accept="image/*" onchange="displayImage(event, 'displayImage1')" 
                                                       class="border form-control form-control-lg" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage1" class="mt-2 h-75">
                                    <img src="/${pEdit.pro_image}" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 2</label>
                                        <div class="form-hover">
                                            <div class="d-flex">
                                                <input type="file" name="proPic2" id="proPic2" accept="image/*" onchange="displayImage(event, 'displayImage2')" 
                                                       class="border form-control form-control-lg" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage2" class="mt-2 h-75">
                                    <img src="/${listPI[0].image_url}" alt="No Image" id="defaultImage1"
                                         style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 3</label>
                                        <div class="form-hover">
                                            <div class="d-flex">
                                                <input type="file" name="proPic3" id="proPic3" accept="image/*" onchange="displayImage(event, 'displayImage3')" 
                                                       class="border form-control form-control-lg" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage3" class="mt-2 h-75">
                                    <img src="/${listPI[1].image_url}" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 4</label>
                                        <div class="form-hover">
                                            <div class="d-flex">
                                                <input type="file" name="proPic4" id="proPic4" accept="image/*" onchange="displayImage(event, 'displayImage4')" 
                                                       class="border form-control form-control-lg" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage4" class="mt-2 h-75">
                                    <img src="/${listPI[2].image_url}" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group form-outline mt-5    ">
                        <div class="form-hover">
                            <textarea type="text" id="description" name="description" placeholder="Mô tả và thông tin khác"
                                      class="form-control form-control-lg" rows="8" cols="10" readonly
                                      style="max-height: 150px;">${pEdit.pro_description}</textarea>
                            <label class="form-label">Mô tả và thông tin khác</label>
                        </div>
                        <span class="error errorDescription text-danger font-italic fw-bold"></span>
                    </div>
                    <div class="form-outline mb-3 mt-4">
                        <a class="btn btn-success w-100 text-decoration-none" href="/AdminController/adminListPro" style="font-size: 20px" >Quay về danh sách sản phẩm</a>
                    </div> 
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>
</html>
