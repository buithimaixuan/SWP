/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ProductImages;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu MInh Uyen
 */
public class ProductImagesDAO {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductImagesDAO() {
        try {
            connection = DB.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int addProductImage(ProductImages productImage) {
        int count = 0;
        String query = "INSERT INTO product_images VALUES (?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, productImage.getPro_id());
            ps.setString(2, productImage.getImage_url());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductImagesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public LinkedList<ProductImages> getProductImagesByProductId(int productId) throws SQLException {
        LinkedList<ProductImages> productImages = new LinkedList<>();
        String query = "SELECT * FROM product_images WHERE pro_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ProductImages productImage = new ProductImages();
                    productImage.setPro_img_id(resultSet.getInt("pro_img_id"));
                    productImage.setPro_id(resultSet.getInt("pro_id"));
                    productImage.setImage_url(resultSet.getString("image_url"));
                    productImages.add(productImage);
                }
            }
        }
        return productImages;
    }

    public int deleteProductImageByProductId(int productId) throws SQLException {
        String query = "DELETE FROM product_images WHERE pro_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            int deleteIs = statement.executeUpdate();
            if (deleteIs > 0) {
                return 1;
            } else {
                return 0;
            }
        }
    }
}
