<%-- 
    Document   : adminListProHis
    Created on : Feb 21, 2024, 5:46:12 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" type="image/png" href="images/Lovecake.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.0/css/dataTables.bootstrap5.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>

        <style>
            
            .btn{
                cursor: pointer;
            }
            ul, ol{
                padding-left: 0;
            }
            a{
                color: #3e3e3e;
                text-decoration: none;
            }

            .admin-dashboard{
                display: flex;
            }

            .nv-tab{
                width: 10%;
            }

            .date-tab{
                width: 20%;
            }

            .proid-tab{
                width: 18%;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Lịch sử sản phẩm </h1>
                <div class="mx-2 ms-1 border border-2 p-2 m-2"> 
                    <table id="example" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start nv-tab">Mã NV</th>
                                <th class="text-start proid-tab">Mã sản phẩm</th>
                                <th class="text-start">Tên sản phẩm</th>
                                <th class="text-start">Thao tác</th>
                                <th class="text-start date-tab">Ngày thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listProHis}" var="listPH">
                                <tr>
                                    <td class="text-start align-middle nv-tab">${listPH.staff_id}</td>
                                    <td class="text-start align-middle proid-tab">${listPH.pro_id}</td>
                                    <td class="text-start align-middle">${listPH.pro_name}</td>
                                    <td class="text-start align-middle ">
                                        ${listPH.action}
                                    </td>
                                    <td class="text-start align-middle date-tab">${listPH.create_date}</td>
                                </tr>
                            </c:forEach>
                        </tbody><!-- comment -->
                    </table>
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
        </script>
    </body>
</html>

