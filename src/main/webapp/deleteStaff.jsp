<%-- 
    Document   : deleteStaff
    Created on : Feb 21, 2024, 4:37:42 PM
    Author     : DELL
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
        <title>Delete Staff</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="" action="" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px" onsubmit="return validateAddStaff()">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Xóa thông tin nhân viên</span>
                    </div>

                    <div class="form-group w-100">
                        <input type="text" id="userStaff" name="userStaff" placeholder="UserName" class="form-control form-control-lg" value="uyenvu" readonly=""/>
                        <label for="title" class="form-label">UserName</label>
                        <span id="errorUserStaff" class="errorUserStaff text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-group w-100 mt-4">
                        <input type="text" id="nameStaff" name="nameStaff" placeholder="FullName" class="form-control form-control-lg" value="Vu Minh Uyen" readonly=""/>
                        <label for="title" class="form-label">FullName</label>
                        <span id="errorNameStaff" class="errorNameStaff text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <input type="text" id="phoneStaff" name="phoneStaff" placeholder="Phone" class="form-control form-control-lg"value="0789 6165 73" readonly=""/>
                        <label for="title" class="form-label">Phone</label>
                        <span id="errorPhoneStaff" class="errorPhoneStaff text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <input type="text" id="emailStaff" name="emailStaff" placeholder="Tiêu đề" class="form-control form-control-lg" value="ssss@gmail" readonly=""/>
                        <label for="title" class="form-label">Email</label>
                        <span id="errorEmailStaff" class="errorEmailStaff text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <input type="text" id="addressStaff" name="addressStaff" placeholder="Address" class="form-control form-control-lg"value="Kien Giang"  readonly=""/>
                        <label for="title" class="form-label">Address</label>
                        <span id="errorAddressStaff" class="errorAddressStaff text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <input type="text" id="positionStaff" name="positionStaff" placeholder="Position" class="form-control form-control-lg" value="ahihi" readonly=""/>
                        <label for="title" class="form-label">Position</label>
                        <span id="errorPositionStaff" class="errorPositionStaff text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-outline mt-4">
                        <label class="form-label h5">Birthday</label>
                        <input type="date" id="dayWriteNews" name="dayWriteNews" class="form-control form-control-lg" value="10/10/2003" readonly="" />
                        <span id="errorDayWriteNews" class="text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-outline mt-4">
                        <label class="form-label h5">Gender</label>
                        <select id="gender" class="form-select" readonly="">
                            <option value="" disabled selected>Select Gender</option>
                            <option value="female">Female</option>
                            <option value="male">Male</option>
                            <option value="other">Other</option>
                        </select>
                    </div> 

             
                               <div class="form-outline mt-4">
                        <label class="form-label h5">Begin Work</label>
                        <input type="date" id="dayBegin" name="dayBegin" class="form-control form-control-lg" value="10/10/2003" readonly="" />
                        <span id="errorDayBegin" class="text-danger fw-bold font-italic"></span>
                    </div>
                               <div class="form-outline mt-4">
                        <label class="form-label h5">End Work</label>
                        <input type="date" id="dayEnd" name="dayEnd" class="form-control form-control-lg" value="10/10/2003" readonly="" />
                        <span id="dayEnd" class="text-danger fw-bold font-italic"></span>
                    </div>
          
                    <div class="form-outline mt-4 w-100">
                        <div class="validate form-outline col">
                            <label class="form-label h5">Hình ảnh</label>
                            <input type="file" name="newsPic" id="newsPic" accept="image/*" onchange="displayImage(event, 'displayImage')" class="border form-control form-control-lg" readonly="">
                        </div>
                        <div id="displayImage" class="mt-2 w-25">
                            <img src="./images/no_image.png" alt="No Image" id="defaultImage" style="max-width: 100%;">
                        </div>
                    </div>
                    <!--<span class="error text-danger fw-bold font-italic text-center"></span>-->

                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="" class="btn btn-success w-100" style="font-size: 20px" value="Delete Staff"/>
                    </div>  
                </form>
            </div>
        </div>

            


            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        
        <script src="./JS/staff.js"></script>
        <script >
        </script>
    </body>
</html>
