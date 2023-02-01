/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;

/**
 *
 * @author phamp
 */
public class ProductDAO {

    private static final String GET_PRODUCTS = "SELECT [id]\n"
            + "      ,[name]\n"
            + "      ,[quantity]\n"
            + "      ,[price]\n"
            + "      ,[description]\n"
            + "      ,[image_url]\n"
            + "      ,[start_date]\n"
            + "      ,[end_date]\n"
            + "      ,[category_id]\n"
            + "      ,[status]\n"
            + "  FROM [dbo].[Product] order by start_date";
    private static final String INSERT_PRODUCT = "INSERT INTO [dbo].[Product]\n"
            + "           ([name]\n"
            + "           ,[quantity]\n"
            + "           ,[price]\n"
            + "           ,[description]\n"
            + "           ,[image_url]\n"
            + "           ,[start_date]\n"
            + "           ,[end_date]\n"
            + "           ,[category_id]\n"
            + "           ,[status])\n"
            + "     VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_PRODUCT = "UPDATE [dbo].[Product]\n"
            + "   SET [name] = ?\n"
            + "      ,[quantity] = ?\n"
            + "      ,[price] = ?\n"
            + "      ,[description] = ?\n"
            + "      ,[image_url] = ?\n"
            + "      ,[start_date] = ?\n"
            + "      ,[end_date] = ?\n"
            + "      ,[category_id] = ?\n"
            + "      ,[status] = ?\n"
            + " WHERE id = ?";

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image_url]\n"
                    + "      ,[start_date]\n"
                    + "      ,[end_date]\n"
                    + "      ,[category_id]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Product] order by start_date";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where Product.category_id = ? ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            //offset = bo qua
            //bo qua (0-1)*6 = 0 ban ghi
            String sql = "select * from Product order by start_date\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public int getTotalProducts() {
        try {
            //offset = bo qua
            //bo qua (0-1)*6 = 0 ban ghi
            String sql = "select count(id) from Product";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where name like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(int productId) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image_url]\n"
                    + "      ,[start_date]\n"
                    + "      ,[end_date]\n"
                    + "      ,[category_id]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Product] where id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();

                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getProductByName(String name) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image_url]\n"
                    + "      ,[start_date]\n"
                    + "      ,[end_date]\n"
                    + "      ,[category_id]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Product] where name = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .startDate(rs.getString(7))
                        .endDate(rs.getString(8))
                        .categoryId(rs.getInt(9))
                        .status(rs.getInt(10))
                        .build();

                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insertProduct(Product createproduct) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT_PRODUCT);
                stm.setString(1, createproduct.getName());
                stm.setInt(2, createproduct.getQuantity());
                stm.setDouble(3, createproduct.getPrice());
                stm.setString(4, createproduct.getDescription());
                stm.setString(5, createproduct.getImageUrl());
                stm.setString(6, createproduct.getStartDate());
                stm.setString(7, createproduct.getEndDate());
                stm.setInt(8, createproduct.getCategoryId());
                stm.setInt(9, createproduct.getStatus());

                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProduct(Product updateproduct) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_PRODUCT);
                stm.setString(1, updateproduct.getName());
                stm.setInt(2, updateproduct.getQuantity());
                stm.setDouble(3, updateproduct.getPrice());
                stm.setString(4, updateproduct.getDescription());
                stm.setString(5, updateproduct.getImageUrl());
                stm.setString(6, updateproduct.getStartDate());
                stm.setString(7, updateproduct.getEndDate());
                stm.setInt(8, updateproduct.getCategoryId());
                stm.setInt(9, updateproduct.getStatus());
                stm.setInt(10, updateproduct.getId());

                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Map<Integer, String> getAllProductsMap() throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_PRODUCTS);
                rs = psm.executeQuery();
                if (rs != null) {

                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
