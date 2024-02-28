/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    Connection conn;

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
            PreparedStatement ps = conn.prepareStatement("Insert into [orders] values(?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, obj.getCus_id());
            ps.setString(2, obj.getPayment());
            ps.setString(3, obj.getAddress());
            ps.setString(4, obj.getStatus());
            ps.setDate(5, obj.getO_date());
            ps.setDouble(6, obj.getTotal_price());
            ps.setInt(7, obj.getIsDelete());
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
    
    public Order getOrderWhenPay(int cus_id) {
        Order obj = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select top 1 * from [orders] where cus_id=? order by o_id desc");
            ps.setInt(1, cus_id);
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
    
}
