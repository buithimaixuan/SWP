
<%-- 
    Document   : chart
    Created on : Feb 29, 2024, 10:05:18 AM
    Author     : Vu Minh Uyen
--%>

<%@page import="DAOs.OrderDAO"%>
<%@page import="DAOs.StaffDAO"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page import="Models.Chart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../CSS/thongke.css"/>


</head>
<body>

    <%@include file="DashBoardSlideBarVer2.jsp" %>
    <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
         left: 265px;
         top: 0;
         width: 80%;">
        <%
            // Gọi hàm countCustomers() từ DAO để lấy số lượng khách hàng
            CustomerDAO cdao = new CustomerDAO();
            int numberOfCustomers = cdao.countCustomers();
            StaffDAO sdao = new StaffDAO();
            int numberOfStaffs = sdao.countStaffs();
            OrderDAO odao = new OrderDAO();
            double sumMoney = odao.SumMoney();

        %>

        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="khung card border-secondary">
                        <div class="card-body text-white" style="background-color: #ffffff">
                            <div class="row">
                                <div class="col-3">
                                    <div class="continuous-circle">
                                        <i class="fa fa-user-tie fa-5x" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
                                    </div>
                                </div>
                                <div class="col-9 text-right">
                                    <h1><%= numberOfCustomers%></h1>
                                    <h4>Customers</h4>
                                </div>
                            </div>
                        </div>
                        <a href="/AdminController/adminListCustomer">
                            <div class="card-footer" style="background-color: #f4bb14;">
                                <span class="float-left" style="text-decoration: none">Details</span>
                                <span class="float-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6" style="margin-top: 20px">
                    <div class="card border-secondary">
                        <div class="card-body text-white" style="background-color: #ffffff">
                            <div class="row">
                                <div class="continuous-circle">
                                    <i class="fa fa-user-tie fa-5x"></i>
                                </div>
                                <div class="col-9 text-right">
                                    <h1><%= numberOfStaffs%></h1>
                                    <h4>Staffs</h4>
                                </div>
                            </div>
                        </div>
                        <a href="/AdminController/adminListStaff">
                            <div class="card-footer" style="background-color: #f4bb14">
                                <span class="float-left">Details</span>
                                <span class="float-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6" style="margin-top: 20px">
                    <div class="card border-success">
                        <div class="card-body text-white" style="background-color: #ffffff">
                            <div class="row">
                                <div class="continuous-circle">
                                    <i class="fa fa-university fa-5x"></i>
                                </div>
                                <div class="col-9 text-right" >
                                    <h1 id="customer-count"> <%= sumMoney%> </h1>
                                    <h4>Sales</h4>
                                </div>
                            </div>
                        </div>
                        <a href="/AdminController/adminListOrderHistory">
                            <div class="card-footer" style="background-color: #f4bb14">
                                <span class="float-left">Details</span>
                                <span class="float-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>







        <%


        %>


        <div class="row">
            <h1 style="margin-top: 50px" class='txtretroshadow'>Biểu đồ Thống kê</h1>
            <div class="col-7"  style="margin-top: 20px;margin-left: 80px;">

                <canvas id="myChart" style="width:100%;max-width:1000px;color: #99ccff"></canvas> 
            </div>
            <div class="col-4" style="margin-top: 130px;">
                <form id="chartForm" action="ChartController" method="post">
                    <div style="margin-left: 85px">
                        <marquee width="80%">Nhập thời gian bạn muốn xem thống kê.</marquee>
                    </div>
                    <div class="col-14 mb-4"  style="margin-left: 90px">
                        <label for="year" style="color: #3333ff">Năm:</label>
                        <select id="year" name="year" style="color: #3333ff" required>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                        </select>
                        <label for="month" style="color: #3333ff;margin-left: 20px">Tháng:</label>
                        <select id="month" name="month" style="color: #3333ff" required>
                            <option value="0">Chọn tháng</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </div>
                    <div class="col-12" >

                        <button style="margin-left: 80px;font-weight: bold" name="xemBieuDo" type="submit" class="custom-btn btn-5"><span>Biểu đồ Năm</span></button>
                        <button  style="font-weight: bold" name="xemBieuDoThang" type="submit" class="custom-btn btn-5"><span>Biểu đồ Tháng</span></button>
                        <hr>
                        <button style="margin-left: 170px;font-weight: bold" class="custom-btn btn-5"<span><a type="button" href="/ChartController/Chart" style="text-decoration: none; color: black">Biểu đồ Chung</span></button>

                    </div>

                </form>

            </div>
        </div>




        <%        //       *******hiện theo lựa chọn********
            List<Chart> chartDataList = (List<Chart>) request.getAttribute("chartData");
            StringBuilder xValues = new StringBuilder();
            StringBuilder yValues = new StringBuilder();

            for (Chart chartData : chartDataList) {
                xValues.append("'" + chartData.getOrderDate() + "',");
                yValues.append(chartData.getTotalAmount() + ",");
            }

            if (xValues.length() > 0) {
                xValues.deleteCharAt(xValues.length() - 1);
                yValues.deleteCharAt(yValues.length() - 1);
            }

            //       *******hiện nguyên bảng)********
            //        chartDAO chartDAO = new chartDAO();
            List<Chart> chartDataListYear = odao.getCMonth();
            StringBuilder mValues = new StringBuilder();
            StringBuilder nValues = new StringBuilder();
            for (Chart chartData : chartDataListYear) {
                mValues.append("'" + chartData.getOrderDate() + "',");
                nValues.append(chartData.getTotalAmount() + ",");
            }
            mValues.deleteCharAt(mValues.length() - 1);
            nValues.deleteCharAt(nValues.length() - 1);
        %>

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy các phần tử select
            var yearSelect = document.getElementById("year");
            var monthSelect = document.getElementById("month");

            // Lấy giá trị đã lưu trong sessionStorage
            var selectedYear = sessionStorage.getItem("selectedYear");
            var selectedMonth = sessionStorage.getItem("selectedMonth");

            // Thiết lập lại giá trị cho select năm và tháng nếu có
            if (selectedYear) {
                yearSelect.value = selectedYear;
            }
            if (selectedMonth) {
                monthSelect.value = selectedMonth;
            }

            // Lưu giá trị khi thay đổi năm
            yearSelect.addEventListener("change", function () {
                sessionStorage.setItem("selectedYear", yearSelect.value);
            });

            // Lưu giá trị khi thay đổi tháng
            monthSelect.addEventListener("change", function () {
                sessionStorage.setItem("selectedMonth", monthSelect.value);
            });
        });
    </script>
  <script>
            function animateNumber(finalNumber, duration = 5000, startNumber = 0, callback) {
                let currentNumber = startNumber
                const interval = window.setInterval(updateNumber, 17)
                function updateNumber() {
                    if (currentNumber >= finalNumber) {
                        clearInterval(interval)
                    } else {
                        let inc = Math.ceil(finalNumber / (duration / 17))
                        if (currentNumber + inc > finalNumber) {
                            currentNumber = finalNumber
                            clearInterval(interval)
                        } else {
                            currentNumber += inc
                        }
                        callback(currentNumber)
                    }
            }
            }

            document.addEventListener('DOMContentLoaded', function () {
             
                animateNumber( <%= sumMoney%>, 3000, 0, function (number) {
                    const formattedNumber = number.toLocaleString()
                    document.getElementById('customer-count').innerText = formattedNumber
                })
            })</script>


    <script>
        const xValues = [<%= xValues.toString()%>];
        const yValues = [<%= yValues.toString()%>];
        const areaColors = ["rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)"]; // Add more colors if needed

        new Chart("myChart", {
            type: "line",
            data: {
                labels: xValues,
                datasets: [{
                        borderColor: "red", // Màu của đường
                        backgroundColor: areaColors, // Màu của vùng dưới đường
                        data: yValues
                    }]
            },

            options: {
                legend: {display: false},
                title: {
                    display: true,
                    text: "Biểu đồ thống kê doanh thu theo ngày tháng năm."
                }
            }
        });
    </script>


</body>
</html>
