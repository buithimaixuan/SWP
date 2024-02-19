/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    /**
     *
     */
    public ProductDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public LinkedList<Product> getListProByCatId(int cat_id) {
//        LinkedList<Product> list = new LinkedList<>();
//        String sql = "select * from product where cat_id=?";
//        try {
//
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, cat_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Product pro = new Product(rs.getInt("pro_id"),
//                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
//                        rs.getString("origin"), rs.getString("brand"),
//                        rs.getDouble("mass"), rs.getString("ingredient"),
//                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
//                        rs.getDouble("discount"),
//                        rs.getNString("pro_description"), rs.getDate("create_date"),
//                        rs.getInt("isDelete"));
//                list.add(pro);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return list;
//    }
    /**
     *
     * @param cat_name
     * @return linkedlist<Product>
     * show all product of cat name ex: all product of cat name = Bot lam banh
     */
    public LinkedList<Product> getListProByCatName(String cat_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT *\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.cat_name = ? and isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, cat_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     * show all product at link 'danh muc san pham'
     *
     * @return
     */
    public LinkedList<Product> getAllPro() {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where isDelete=0";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     *
     * @return
     */
    public int getTotalPro() {
        int count = 0;
        String sql = "select COUNT(*) from product where isDelete=0";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    /**
     *
     * @param typeCategories
     * @return
     */
    public int getTotalProByTypeCategories(String typeCategories) {
        int count = 0;
        String sql = "SELECT count(*)\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE typeCategories=? and isDelete=0;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, typeCategories);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    /**
     *
     * @param index
     * @return
     */
    public LinkedList<Product> pagingAllPro(int index) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where isDelete=0\n"
                + "order by pro_id\n"
                + "offset ? rows fetch next 16 rows only";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 16);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    /**
     *
     * @param index
     * @return
     */
    public LinkedList<Product> pagingProByCategories(int index, String typeCategories) {
        LinkedList<Product> list = new LinkedList<>();

        String sql = "SELECT *\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.typeCategories = ? and isDelete=0\n"
                + "order by pro_id\n"
                + "offset ? rows fetch next 16 rows only";

        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, typeCategories);
            ps.setInt(2, (index - 1) * 16);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    /**
     *
     * @param cat_name
     * @return
     */
    public LinkedList<Product> get4ProByCatName(String cat_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT top 4*\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE categories.cat_name = ?;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, cat_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     *
     * @param typeCategories
     * @return
     */
    public LinkedList<Product> get4ProByTypeCategories(String typeCategories) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "SELECT top 4*\n"
                + "FROM product\n"
                + "INNER JOIN categories ON product.cat_id = categories.cat_id\n"
                + "WHERE typeCategories = ?;";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, typeCategories);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    /**
     * KHOA code
     * @param pro_name
     * @return linkedlist<Product>
     * show all product of pro_name
     */
    public LinkedList<Product> getListProByProName(String pro_name) {
        LinkedList<Product> list = new LinkedList<>();
        String sql = "select * from product where pro_name like N'%"+pro_name+"%';";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt("pro_id"),
                        rs.getInt("cat_id"), rs.getString("pro_name"), rs.getString("pro_image"),
                        rs.getString("origin"), rs.getString("brand"),
                        rs.getDouble("mass"), rs.getString("ingredient"),
                        rs.getInt("pro_quantity"), rs.getDouble("pro_price"),
                        rs.getDouble("discount"),
                        rs.getNString("pro_description"), rs.getDate("create_date"),
                        rs.getInt("isDelete"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        try {
            LinkedList<Product> list = dao.pagingAllPro(1);
            if (!list.isEmpty()) {
                System.out.println("coa list");
                for (Product product : list) {
                    System.out.println(product.getPro_description());
                }
            } else {
                System.out.println("null oi");
            }

//            CategoriesDAO catdao = new CategoriesDAO();
//            ProductDAO pdao = new ProductDAO();
//            LinkedList<String> cat = catdao.getAllCatName();
//            Map<String, LinkedList<Product>> map = new HashMap<>();
//            LinkedList<Product> pro = new LinkedList<>();
//
//            for (String c : cat) {
//                pro = pdao.get4ProByCatName(c);
//                System.out.println(pro.get(0).getCat_id());
//                map.put(c, pro);
//                pro = new LinkedList<>();
//            }
        } catch (Exception e) {
        }

    }

}
