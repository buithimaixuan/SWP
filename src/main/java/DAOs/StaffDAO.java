/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Staff;
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
public class StaffDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public StaffDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Staff getStaff(int acc_id) {
        Staff Staff = null;
        String sql = "select * from staff where acc_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff = new Staff(rs.getInt("staff_id"), rs.getInt("acc_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone_number"), rs.getString("email"),
                        rs.getDate("birthday"), rs.getString("gender"), rs.getString("address"),
                        rs.getString("position"), rs.getDate("begin_work"), rs.getDate("end_work"), rs.getInt("code_reset"), rs.getInt("isDelete"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Staff;
    }

    public int editPassword(String password, String email) {
        int count = 0;
        String sql = "update Staff set password=? where email=?";
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

    public int updateStaff(Staff staff) {
        int count = 0;
        String sql = "UPDATE staff SET acc_id =? , username =? , password=?, fullname = ? ,"
                + " phone_number = ?, email = ? ,birthday =? ,gender=?,address=?,"
                + "position=?,begin_work=?,end_work=?, code_reset= ? , isDelete= ? WHERE staff_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, staff.getAcc_id());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getFullname());
            ps.setString(5, staff.getPhone_number());
            ps.setString(6, staff.getEmail());
            ps.setDate(7, staff.getBirthday());
            ps.setString(8, staff.getGender());
            ps.setString(9, staff.getAddress());
            ps.setString(10, staff.getPosition());
            ps.setDate(11, staff.getBegin_word());
            ps.setDate(12, staff.getEnd_word());
            ps.setInt(13, 0);
            ps.setInt(14, 0);
            ps.setInt(15, staff.getStaff_id());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
