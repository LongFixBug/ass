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
import model.Category;

/**
 *
 * @author phamp
 */
public class CategoryDAO { 
// thao tac voi bang Category
    //  dung CategoryDAO de lay du lieu tu DATABASE 

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from Category";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category =  Category.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .build();
                list.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    private static final String GET_CATEGORIES = "SELECT cateId, cateName FROM Categories";
    private static final String UPDATE_CATEGORY_INFO = "UPDATE Categories SET cateName = ? WHERE cateId = ?";
    private static final String INSERT_NEW_CATEGORY = "INSERT INTO Categories (cateName) VALUES (?)";

    public boolean insertNewCategory(String cateName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_NEW_CATEGORY);
                psm.setString(1, cateName);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateCategoryInfo(int cateId, String cateName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_CATEGORY_INFO);
                psm.setString(1, cateName);
                psm.setInt(2, cateId);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Map<Integer, String> getCategories() throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
             conn = new DBContext().getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_CATEGORIES);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int cateId = rs.getInt("cateId");
                        String cateName = rs.getString("cateName");
                        list.put(cateId, cateName);
                    }
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
    
//                public static void main(String[] args) { 
//        CategoryDAO studentDAO = new CategoryDAO();
//        List<Category> list = studentDAO.getAllCategories();
//                    for (Category category : list) {
//                        System.out.println(category);
//                    }
////        Student studentInsert = new Student(0, "hair@gmail", "0000", "hail", "0123", 0, 0);
////        studentDAO.create(studentInsert);
////studentDAO.delete(10);
//
//        }
}
