/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Cart;
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
public class CartDAO {

    private Connection connection;

    public CartDAO() {
        try {
            connection = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public CartDAO(Connection connection) {
        this.connection = connection;
    }

    public Cart getCartById(int cartID) throws SQLException {
        String query = "SELECT * FROM cart WHERE cart_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartID);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCus_id(resultSet.getInt("cus_id"));
                    cart.setPro_id(resultSet.getInt("pro_id"));
                    cart.setPro_quantity(resultSet.getInt("pro_quantity"));
                    cart.setCart_price(resultSet.getDouble("cart_price"));
                    return cart;
                }
            }
        }
        return null; // không tìm thấy giỏ hàng với id tương ứng
    }

    public LinkedList<Cart> getAllCarts(int cus_id) throws SQLException {
        LinkedList<Cart> carts = new LinkedList<>();
        String query = "SELECT * FROM cart WHERE cus_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cus_id);
            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCus_id(resultSet.getInt("cus_id"));
                    cart.setPro_id(resultSet.getInt("pro_id"));
                    cart.setPro_quantity(resultSet.getInt("pro_quantity"));
                    cart.setCart_price(resultSet.getDouble("cart_price"));
                    carts.add(cart);
                }
            }
        }
        return carts;
    }

    public int editCart(int proId, Cart cart) throws SQLException {
        String query = "UPDATE cart SET pro_quantity = ?, cart_price = ? WHERE pro_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getPro_quantity());
            statement.setDouble(2, cart.getCart_price());
            statement.setInt(3, proId);
            // statement.executeUpdate();
            int editStatus = statement.executeUpdate();
            return editStatus;
        }
    }

    
//    NAM CODE
    public int createCart(Cart cart) throws SQLException {
        String query = "INSERT INTO cart (cus_id, pro_id, pro_quantity, cart_price) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getCus_id());
            statement.setInt(2, cart.getPro_id());
            statement.setInt(3, cart.getPro_quantity());
            statement.setDouble(4, cart.getCart_price());
            // statement.executeUpdate();
            int deleteIs = statement.executeUpdate();
            return deleteIs;
        }
    }
        
    public Cart getCartByProId(int pro_id) throws SQLException {
        String query = "SELECT * FROM cart WHERE pro_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, pro_id);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCus_id(resultSet.getInt("cus_id"));
                    cart.setPro_id(resultSet.getInt("pro_id"));
                    cart.setPro_quantity(resultSet.getInt("pro_quantity"));
                    cart.setCart_price(resultSet.getDouble("cart_price"));
                    return cart;
                }
            }
        }
        return null; // không tìm thấy giỏ hàng với id tương ứng
    }
    
    public int delete(int cus_id, int pro_id){
        int isDelete = 0;
        String sql = "Delete from cart where cus_id = ? AND pro_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cus_id);
            ps.setInt(2, pro_id);
            
            isDelete = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isDelete;
    }
    
    public int editCart(int cus_id, int proId, Cart cart) throws SQLException {
        String query = "UPDATE cart SET pro_quantity = ?, cart_price = ? WHERE pro_id = ? and cus_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getPro_quantity());
            statement.setDouble(2, cart.getCart_price());
            statement.setInt(3, proId);
            statement.setInt(4, cus_id);
            // statement.executeUpdate();
            int editStatus = statement.executeUpdate();
            return editStatus;
        }
    }
    
    // Khoa's Code
    // Lay Pro ID cua khach hang khac nhau
    public Cart getCartByProAndCusID(int cus_id, int pro_id) {
        Cart obj = null;
        try {
            PreparedStatement ps = connection.prepareStatement("select * from [cart] where cus_id=? and pro_id=?");
            ps.setInt(1, cus_id);
            ps.setInt(2, pro_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                obj = new Cart(rs.getInt("cus_id"), rs.getInt("pro_id"), rs.getInt("pro_quantity"), rs.getDouble("cart_price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
}
