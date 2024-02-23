/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class CustomerDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CustomerDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Customer getCustomer(int acc_id) {
        Customer cus = null;
        String sql = "select * from customer where acc_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cus = new Customer(rs.getInt("cus_id"), rs.getInt("acc_id"),
                        rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("avatar"), rs.getString("phone_number"),
                        rs.getString("email"), rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cus;
    }

    public int createCus(Customer cus) {
        int count = 0;
        String sql = "insert into customer values(?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cus.getAcc_id());
            ps.setString(2, cus.getUsername());
            ps.setString(3, Utils.Hashing.getMd5(cus.getPassword()));
            ps.setString(4, cus.getFullname());
            ps.setString(5, cus.getAvatar());
            ps.setString(6, cus.getPhone_number());
            ps.setString(7, cus.getEmail());
            ps.setInt(8, 0);
            ps.setInt(9, 0);
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int editPassword(String password, String email) {
        int count = 0;
        String sql = "update Customer set password=? where email=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, Utils.Hashing.getMd5(password));
            ps.setString(2, email);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

}
