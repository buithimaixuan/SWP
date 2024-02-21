<%-- 
    Document   : UpdateProForm
    Created on : Jan 21, 2024, 1:14:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/AddNewsForm.css"/>
        <title>Delete Product</title>
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
                <form method="" action="" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px" onsubmit="return validateAddPro()">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Xóa sản phẩm</span>
                    </div>
                    <div class="d-flex" style="gap: 20px">
                        <div class="w-100">
                            <div class="form-outline w-100 form-group">
                                <div class="form-hover">
                                    <input readonly type="text" id="proName" name="proName" value="san pham 1" placeholder="Tên sản phẩm" 
                                           class="form-control form-control-lg" />
                                    <label for="proName" class="form-label">Tên sản phẩm</label>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input readonly type="number" id="price" name="price" value="2" placeholder="Giá gốc"
                                           class="form-control form-control-lg" />
                                    <label for="price" class="form-label">Giá gốc</label>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input readonly type="number" id="realPrice" name="realPrice" value="1" placeholder="Giá bán"
                                           class="form-control form-control-lg" />
                                    <label for="realPrice" class="form-label">Giá bán</label>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input readonly type="number" id="quantity" name="quantity" value="3" placeholder="Số lượng"
                                           class="form-control form-control-lg" />
                                    <label for="quantity" class="form-label">Số lượng</label>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input readonly type="text" id="" name="" placeholder="Thương hiệu" value="abc"
                                           class="form-control form-control-lg" />
                                    <label class="form-label">Thương hiệu (option)</label>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input readonly type="text" id="" name="" placeholder="Khối lượng" value="15"
                                           class="form-control form-control-lg" />
                                    <label class="form-label">Khối lượng (option)</label>
                                </div>
                            </div>
                        </div>

                        <div class="w-100">
                            <div class="form-group form-outline w-100">
                                <div class="form-hover">
                                    <input readonly type="text" id="" name="" placeholder="Thành phần" value="xyz"
                                           class="form-control form-control-lg" />
                                    <label class="form-label">Thành phần (option)</label>
                                </div>
                            </div>

                            <div class="form-outline mt-3 w-100 mb-0">
                                <label class="form-label h5">Loại sản phẩm</label>
                                <div class="form-hover">
                                    <select class="w-100 form-control form-control-lg" >
                                        <option value="value">Việt Nam</option>
                                        <option value="value">Trung quốc</option>
                                        <option value="value">Mỹ</option>
                                        <option value="value">Hàn</option>
                                        <option value="value">Thái Lan</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-outline mt-3">
                                <label class="form-label h5">Xuất xứ</label>
                                <div class="form-hover">
                                    <select class="w-100 form-control form-control-lg">
                                        <option value="value">Việt Nam</option>
                                        <option value="value">Trung quốc</option>
                                        <option value="value">Mỹ</option>
                                        <option value="value">Hàn</option>
                                        <option value="value">Thái Lan</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-outline mt-4">
                                <label class="form-label h5">Ngày tạo sản phẩm</label>
                                <div class="form-hover">
                                    <input readonly type="date" id="dayWriteNews" name="dayWriteNews" value="2024-02-12" class="form-control form-control-lg" />
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
                                        <div class="d-flex">
                                            <div class="form-hover">
                                                <input readonly type="file" name="proPic1" id="proPic1" accept="image/*" onchange="displayImage(event, 'displayImage1')" 
                                                       class="border form-control form-control-lg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage1" class="mt-2 h-75">
                                    <img src="./images/no_image.png" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 2</label>
                                        <div class="d-flex">
                                            <div class="form-hover">
                                                <input readonly type="file" name="proPic1" id="proPic1" accept="image/*" onchange="displayImage(event, 'displayImage2')" 
                                                       class="border form-control form-control-lg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage2" class="mt-2 h-75">
                                    <img src="./images/no_image.png" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 3</label>
                                        <div class="d-flex">
                                            <div class="form-hover">
                                                <input readonly type="file" name="proPic1" id="proPic1" accept="image/*" onchange="displayImage(event, 'displayImage3')" 
                                                       class="border form-control form-control-lg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage3" class="mt-2 h-75">
                                    <img src="./images/no_image.png" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-0 w-100">
                            <div class="form-outline mt-4 w-100 col">
                                <div class="d-flex">
                                    <div class="validate form-outline col">
                                        <label class="form-label h5">Hình ảnh 4</label>
                                        <div class="d-flex">
                                            <div class="form-hover">
                                                <input readonly type="file" name="proPic1" id="proPic1" accept="image/*" onchange="displayImage(event, 'displayImage4')" 
                                                       class="border form-control form-control-lg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="displayImage4" class="mt-2 h-75">
                                    <img src="./images/no_image.png" alt="No Image" id="defaultImage1" style="max-width: 100%;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group form-outline mt-5    ">
                        <div class="form-hover">
                            <textarea type="text" id="description" name="description"  placeholder="Mô tả và thông tin khác"
                                      class="form-control form-control-lg" rows="8" cols="10" 
                                      style="max-height: 150px;">Mo ta 1</textarea>
                            <label class="form-label">Mô tả và thông tin khác</label>
                        </div>
                    </div>
                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="btn-DeleteProduct" class="btn btn-success w-100" style="font-size: 20px" value="Delete Product"/>
                    </div> 
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>
</html>
