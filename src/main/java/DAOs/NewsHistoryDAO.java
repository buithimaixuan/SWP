/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.NewsHistory;
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
 * @author Admin
 */
public class NewsHistoryDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public NewsHistoryDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public LinkedList<NewsHistory> getAll() {
        LinkedList<NewsHistory> list = new LinkedList<>();
        String sql = "Select * from news_history";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                NewsHistory newsHistoty = new NewsHistory(rs.getInt("news_his_id"), rs.getInt("news_id"), rs.getInt("staff_id"),
                        rs.getString("action"), rs.getString("title"), rs.getString("image_url"), rs.getString("title_content"),
                        rs.getString("content1"), rs.getString("content2"), rs.getString("content3"), rs.getDate("create_date"), rs.getInt("isDelete"));
                list.add(newsHistoty);
            }
        } catch (SQLException e) {
            Logger.getLogger(NewsHistoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public int AddNewsHistory(NewsHistory newsHis) {
        int count = 0;
        String sql = "insert into [news_history] values(?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, 0);
            ps.setInt(2, newsHis.getNews_id());
            ps.setInt(3, newsHis.getStaff_id());
            ps.setString(4, newsHis.getTitle());
            ps.setString(5, newsHis.getImage_url());
            ps.setString(6, newsHis.getTitle_content());
            ps.setString(7, newsHis.getContent1());
            ps.setString(8, newsHis.getContent2());
            ps.setString(9, newsHis.getContent3());
            ps.setDate(10, new java.sql.Date(newsHis.getCreate_date().getTime()));
            ps.setInt(11, 0);
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
    
}
