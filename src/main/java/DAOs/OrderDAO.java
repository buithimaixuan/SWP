/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Chart;
import Models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Uyen
 */
public class OrderDAO {

    Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<Order> getAllOrders() {
        LinkedList<Order> orderList = new LinkedList<>();
        String sql = "select * from [orders]";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Order ord = new Order(rs.getInt("o_id"), rs.getInt("cus_id"),
                        rs.getString("payment"), rs.getString("address"), rs.getString("status"), rs.getDate("o_date"),
                        rs.getDouble("total_price"), rs.getInt("isDelete"));
                orderList.add(ord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderList;
    }

    public Order getOrderByID(int o_id) {
        Order obj = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [orders] where o_id=?");
            ps.setInt(1, o_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                obj = new Order(rs.getInt("o_id"), rs.getInt("cus_id"),
                        rs.getString("payment"), rs.getString("address"), rs.getString("status"), rs.getDate("o_date"),
                        rs.getDouble("total_price"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public int addOrder(Order obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into [orders] values(?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, obj.getO_id());
            ps.setInt(2, obj.getCus_id());
            ps.setString(3, obj.getPayment());
            ps.setString(4, obj.getAddress());
            ps.setString(5, obj.getStatus());
            ps.setDate(6, obj.getO_date());
            ps.setDouble(7, obj.getTotal_price());
            ps.setInt(8, obj.getIsDelete());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int editOrder(int o_id, Order obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update [orders] set payment=?, address=?, status=?, o_date=?. total_price=?, isDelete=? where o_id=?");
            ps.setString(1, obj.getPayment());
            ps.setString(2, obj.getAddress());
            ps.setString(3, obj.getStatus());
            ps.setDate(4, obj.getO_date());
            ps.setDouble(5, obj.getTotal_price());
            ps.setInt(6, obj.getIsDelete());
            ps.setInt(7, o_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteOrder(int o_id) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update [orders] set isDelete=1 where o_id=?");
            ps.setInt(1, o_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int editOrderStatus(int o_id, Order obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update [orders] set status=? where o_id=?");
            ps.setString(1, obj.getStatus());
            ps.setInt(2, o_id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public LinkedList<Order> getAllOrdersByCusId(int cus_id) {
        LinkedList<Order> orderList = new LinkedList<>();
        String sql = "select * from [orders] where cus_id=?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, cus_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Order ord = new Order(rs.getInt("o_id"), rs.getInt("cus_id"),
                        rs.getString("payment"), rs.getString("address"), rs.getString("status"), rs.getDate("o_date"),
                        rs.getDouble("total_price"), rs.getInt("isDelete"));
                orderList.add(ord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderList;
    }

    public Order getOrderWhenPay() {
        Order obj = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select top 1 * from [orders] order by o_id desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                obj = new Order(rs.getInt("o_id"), rs.getInt("cus_id"),
                        rs.getString("payment"), rs.getString("address"), rs.getString("status"), rs.getDate("o_date"),
                        rs.getDouble("total_price"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public double SumMoney() throws SQLException {
        double count = 0;

        try {
            String query = "SELECT SUM(total_price) AS sumMoney FROM orders where status = 'ok'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getDouble("sumMoney");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public double thongke() throws SQLException {
        double count = 0;

        try {
            String query = " SELECT status, o_date,total_price FROM orders";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getDouble("sumMoney");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }


    public List<Chart> getMonthInYear(int year) {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT MONTH([o_date]) AS Month, SUM(total_price) AS TotalAmount FROM orders WHERE YEAR([o_date]) = ? and status ='ok' GROUP BY MONTH([o_date])";
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

    public List<Chart> getMonthInMonth(int year, int month) {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT DAY([o_date]) AS Day, SUM(total_price) AS TotalAmount FROM orders WHERE YEAR([o_date]) = ? AND MONTH([o_date]) = ? adn status ='ok'GROUP BY DAY([o_date])";
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

    public List<Chart> getChartData() {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT [o_date], total_price FROM orders where status ='ok' ORDER BY [o_date] ASC";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String orderDate = resultSet.getString("o_date");
                double totalAmount = resultSet.getDouble("total_price");
                chartDataList.add(new Chart(orderDate, totalAmount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chartDataList;
    }
    

      public List<Chart> getCMonth() {
        List<Chart> chartDataList = new ArrayList<>();
        String sql = "SELECT YEAR(o_date) AS Year, MONTH(o_date) AS Month, SUM(total_price) AS TotalAmount FROM orders GROUP BY YEAR(o_date), MONTH(o_date) ORDER BY Year ASC, Month ASC";
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
}
