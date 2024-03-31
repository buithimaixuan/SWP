<%-- 
    Document   : DeleteStaff
    Created on : Feb 25, 2024, 4:10:37 PM
    Author     : Admin
--%>

<%@page import="DAOs.StaffDAO"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xóa nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
        <style>
            .font-italic{
                font-style: italic;
            }
            .form-hover:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 0.5rem;
            }
            input{
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <form id="staffForm" method="post" action="StaffController" class="border border-2 rounded-4 p-4 pt-2">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Xóa nhân viên</span>
                    </div>
                    <%
                        Staff getStaff = (Staff) session.getAttribute("getStaff");
                        
                        AccountDAO adao = new AccountDAO();
                        StaffDAO sdao = new StaffDAO();
                    %>
                    <input type="hidden" name="idStaff" value="<%= getStaff.getStaff_id() %>"/>
                    <input type="hidden" name="idAcc" value="<%= getStaff.getAcc_id()%>"/>
                    
                    <div class="d-flex" style="gap: 20px">
                        <div class="w-100">
                            
                            <div class="form-outline w-100 form-group">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getUsername() %>" type="text" id="username" name="username" placeholder="Tên đăng nhập" readonly="" class="form-control form-control-lg" />
                                    <label for="username" class="form-label">Tên đăng nhập</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getPassword() %>" type="password" id="password" name="password" placeholder="Mật khẩu" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="password" class="form-label">Mật khẩu</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getFullname() %>" type="text" id="fullname" name="fullname" placeholder="Tên nhân viên" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="fullname" class="form-label">Tên nhân viên</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getPhone_number() %>" type="text" id="phone" name="phone" placeholder="Số điện thoại" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getEmail() %>" type="email" id="email" name="email" placeholder="Email" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="email" class="form-label">Email</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getBirthday() %>" type="date" id="birthday" name="birthday" placeholder="Ngày sinh" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="birthday" class="form-label">Ngày sinh</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>
                        </div>

                        <div class="w-100">

                            <div class="form-outline mt-3 w-100 mb-0">
                                <label class="form-label h5">Giới tính</label>
                                <div class="form-hover">
                                    <select id="gender" name="gender" class="w-100 form-control form-control-lg">
                                        <option value="<%= getStaff.getGender() %>"><%= getStaff.getGender() %></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getAddress() %>" type="text" id="address" name="address" placeholder="Địa chỉ" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="address" class="form-label">Địa chỉ</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getPosition()%>" type="text" id="position" name="position" placeholder="Vị trí" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="position" class="form-label">Vị trí</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input value="<%= getStaff.getBegin_work()%>" type="date" id="begin_work" name="begin_work" placeholder="Ngày làm việc" readonly=""
                                           class="form-control form-control-lg" />
                                    <label for="begin_work" class="form-label">Ngày làm việc</label>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                        </div>
                    </div>

                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="btnDeleteStaff" class="btn btn-success w-100" style="font-size: 20px" value="Xóa nhân viên" />
                    </div>
                </form>
            </div>
        </div>
        
         <!--JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="/JS/ValidateStaffForm.js"></script>
    </body>
</html>
