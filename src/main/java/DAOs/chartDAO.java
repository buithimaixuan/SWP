/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Chart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Uyen
 */
public class chartDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public chartDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //coi nguyên bảng "có ngày,tháng ,năm"
    public List<Chart> getChartData() {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT OrderDate, TotalAmount FROM chart ORDER BY OrderDate ASC ";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String orderDate = resultSet.getString("OrderDate");
                double totalAmount = resultSet.getDouble("TotalAmount");
                chartDataList.add(new Chart(orderDate, totalAmount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chartDataList;
    }

    //coi nguyên bảng "có tháng ,năm "
    public List<Chart> getCMonth() {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalAmount) AS TotalAmount FROM chart GROUP BY YEAR(OrderDate), MONTH(OrderDate) ORDER BY Year ASC, Month ASC";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int year = resultSet.getInt("Year");
                int month = resultSet.getInt("Month");
                double totalAmount = resultSet.getDouble("TotalAmount");
                String monthToString = String.format("%04d-%02d", year, month);
                chartDataList.add(new Chart(monthToString, totalAmount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chartDataList;
    }
//    biểu đồ chỉ nhập năm
    public List<Chart> getMonthInYear(int year) {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT MONTH(OrderDate) AS Month, SUM(TotalAmount) AS TotalAmount FROM chart WHERE YEAR(OrderDate) = ? GROUP BY MONTH(OrderDate)";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, year);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int month = resultSet.getInt("Month");
                    double totalAmount = resultSet.getDouble("TotalAmount");
                    String monthToString = String.format("%04d-%02d", year, month);
                    chartDataList.add(new Chart(monthToString, totalAmount));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chartDataList;
    }
    
    
    
    //biểu đồ chỉ nhập tháng
    public List<Chart> getMonthInMonth(int year, int month) {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT DAY(OrderDate) AS Day, SUM(TotalAmount) AS TotalAmount FROM chart WHERE YEAR(OrderDate) = ? AND MONTH(OrderDate) = ? GROUP BY DAY(OrderDate)";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, year);
            preparedStatement.setInt(2, month);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int day = resultSet.getInt("Day");
                    double totalAmount = resultSet.getDouble("TotalAmount");
                    String date = String.format("%02d", day);
                    chartDataList.add(new Chart(date, totalAmount));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chartDataList;
    }

//    public List<Chart> getDateInMonthInYear(int year, int month) {
//        List<Chart> chartDataList = new ArrayList<>();
//        String sql = "SELECT MONTH(OrderDate) AS Month, SUM(TotalAmount) AS TotalAmount FROM chart WHERE YEAR(OrderDate) = ? AND MONTH(OrderDate) = ? GROUP BY MONTH(OrderDate)";
//        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
//            preparedStatement.setInt(1, year);
//            preparedStatement.setInt(2, month);
//            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
//                while (resultSet.next()) {
//
//                    double totalAmount = resultSet.getDouble("TotalAmount");
//                    String monthToString = String.format("%04d-%02d", year, month);
//                    chartDataList.add(new Chart(monthToString, totalAmount));
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return chartDataList;
//    }
}
