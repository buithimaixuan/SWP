/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class AccountDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AccountDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccount(String us, String pass) {

        Account acc = null;
        String sql = "select * from account where username=? and password=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, us);
            ps.setString(2, Utils.Hashing.getMd5(pass));
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new Account(rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;

    }
    
    public int createAcc(Account acc) {
        int count = 0;
        String sql = "insert into account values(?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, acc.getUsername());
            ps.setString(2, Utils.Hashing.getMd5(acc.getPassword()));
            ps.setString(3, acc.getFullname());
            ps.setString(4, acc.getPhone_number());
            ps.setString(5, acc.getEmail());
            ps.setInt(6, 0);
            ps.setInt(7, 0);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public LinkedList<String> getAllUserName() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select username from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("username");
                list.add(name);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedList<String> getAllEmail() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select email from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                list.add(email);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedList<String> getAllPhone() {
        LinkedList<String> list = new LinkedList<>();
        String sql = "select phone_number from account";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String phone = rs.getString("phone_number");
                list.add(phone);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int updateOTP(String otp, String email) {
        int count = 0;
        String sql = "update Account set code_reset=? where email=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, otp);
            ps.setString(2, email);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }
    
    public int getResetCodeByEmail(String email) {
        String sql = "select code_reset from Account where email=?";
        int otp = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                 otp = Integer.parseInt(rs.getString("code_reset"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return otp;
    }

}
