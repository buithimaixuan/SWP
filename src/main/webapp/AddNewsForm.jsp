<%-- 
    Document   : AddNewsForm
    Created on : Feb 13, 2024, 4:17:51 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./CSS/AddNewsForm.css"/>

        <style>
            .font-italic{
                font-style: italic;
            }
        </style>
        <title>Create News</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="" action="" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px" onsubmit="return validateForm()">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Thêm mới thông tin</span>
                    </div>

                    <div class="form-group w-100">
                        <input type="text" id="title" name="title" placeholder="Tiêu đề" class="form-control form-control-lg"/>
                        <label for="title" class="form-label">Tiêu đề</label>
                        <span class="errorTitle text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline mt-4 w-100">
                        <div class="validate form-outline col">
                            <label class="form-label h5">Hình ảnh</label>
                            <input type="file" name="newsPic" id="newsPic" accept="image/*" onchange="displayImage(event, 'displayImage')" class="border form-control form-control-lg">
                        </div>
                        <div id="displayImage" class="mt-2 w-25">
                            <img src="./images/no_image.png" alt="No Image" id="defaultImage" style="max-width: 100%;">
                        </div>
                    </div>

                    <div class="form-outline form-group mt-4 w-100">
                        <textarea type="text" id="contentMain" name="contentMain" placeholder="Nội dung chính"
                                  class="form-control form-control-lg" rows="8" cols="10" style="max-height: 150px;"></textarea>
                        <label class="form-label" for="contentMain">Nội dung chính</label>
                        <span class="errorContentMain text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline form-group mt-4 w-100">
                        <textarea type="text" id="content1" name="content1" placeholder="Nội dung 1"
                                  class="form-control form-control-lg" rows="8" cols="10" style="max-height: 100px;"></textarea>
                        <label class="form-label" for="content1">Nội dung 1</label>
                        <span class="errorContent1 text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline form-group w-100 mt-4">
                        <textarea type="text" id="content2" name="content2" placeholder="Nội dung 2"
                                  class="form-control form-control-lg" rows="8" cols="10" style="max-height: 100px;"></textarea>
                        <label class="form-label" for="content2">Nội dung 2</label>
                        <span class="errorContent2 text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline form-group mt-4 w-100">
                        <textarea type="text" id="content3" name="content3" placeholder="Nội dung 3"
                                  class="form-control form-control-lg" rows="8" cols="10" style="max-height: 100px;"></textarea>
                        <label class="form-label" for="content3">Nội dung 3</label>
                        <span class="errorContent3 text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline mt-4">
                        <label class="form-label h5">Ngày viết</label>
                        <input type="date" id="dayWriteNews" name="dayWriteNews" class="form-control form-control-lg" />
                        <span id="dateError" class="text-danger fw-bold font-italic"></span>
                    </div>

                    <span class="error text-danger fw-bold font-italic text-center"></span>

                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="" class="btn btn-success w-100" style="font-size: 20px" value="Create News"/>
                    </div>  
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <script src="./JS/AddNewsForm.js"></script>
        <script >
        </script>
    </body>
</html>
