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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author phamp
 */
public class OrderDAO {

    private static final String GET_ALL_ORDERS = "SELECT [id]\n"
            + "      ,[account_id]\n"
            + "      ,[totalPrice]\n"
            + "      ,[note]\n"
            + "      ,[created_date]\n"
            + "      ,[shipping_id]\n"
            + "  FROM [dbo].[Orders]";

    public List<Order> getAllOrders() throws SQLException {
        List<Order> list = new ArrayList<>();

        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            Connection conn = new DBContext().getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_ORDERS);
                rs = psm.executeQuery();
                while (rs.next()) {
                    Order ord = Order.builder()
                            .accountId(rs.getInt(1))
                            .totalPrice(rs.getFloat(2))
                            .note(rs.getString(3))
                            .createdDate(rs.getString(4))
                            .shippingId(rs.getInt(5))
                            .build();
                    list.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }

        }
        return list;
    }

    public int createReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([account_id]\n"
                    + "           ,[totalPrice]\n"
                    + "           ,[note]\n"
                    + "           ,[shipping_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getAccountId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setString(3, order.getNote());
            ps.setInt(4, order.getShippingId());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
