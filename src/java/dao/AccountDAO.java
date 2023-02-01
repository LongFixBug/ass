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
import model.Account;
import model.Category;

/**
 *
 * @author phamp
 */
public class AccountDAO {

    static final String GET_AN_ACCOUNT = "SELECT id, username, password, displayName, address, email, phone, status, role FROM Account WHERE email = ? AND password = ?";
    private static final String GET_ACCOUNTS = "SELECT [id]\n"
            + "      ,[username]\n"
            + "      ,[password]\n"
            + "      ,[displayName]\n"
            + "      ,[address]\n"
            + "      ,[email]\n"
            + "      ,[phone]\n"
            + "      ,[status]\n"
            + "      ,[role]\n"
            + "  FROM [dbo].[Account]";
    private static final String UPDATE_ACCOUNT_STATUS = "UPDATE Accounts Set status = ? WHERE email = ?";
    private static final String UPDATE_ACCOUNT = "UPDATE [dbo].[Account]\n"
            + "   SET [username] = ?\n"
            + "      ,[password] = ?\n"
            + "      ,[displayName] = ?\n"
            + "      ,[address] = ?\n"
            + "      ,[email] = ?\n"
            + "      ,[phone] = ?\n"
            + "      ,[status] = 1\n"
            + "      ,[role] = 0\n"
            + " WHERE id = ?";
    private static final String INSERT_ACCOUNT = "INSERT INTO [dbo].[Account]\n"
            + "           ([username]\n"
            + "           ,[password]\n"
            + "           ,[displayName]\n"
            + "           ,[address]\n"
            + "           ,[email]\n"
            + "           ,[phone]\n"
            + "           ,[status]\n"
            + "           ,[role])\n"
            + "     VALUES\n"
            + "           (?,?,?,?,?,?,?,?)";
    private static final String GET_ACCOUNT_INFO_BY_EMAIL = "SELECT [id]\n"
            + "      ,[username]\n"
            + "      ,[password]\n"
            + "      ,[displayName]\n"
            + "      ,[address]\n"
            + "      ,[email]\n"
            + "      ,[phone]\n"
            + "      ,[status]\n"
            + "      ,[role]\n"
            + "  FROM [dbo].[Account]\n"
            + "\n"
            + "where email = ?";
    private static final String GET_AN_ACCOUNT_BY_ID = "SELECT [id]\n"
            + "      ,[username]\n"
            + "      ,[password]\n"
            + "      ,[displayName]\n"
            + "      ,[address]\n"
            + "      ,[email]\n"
            + "      ,[phone]\n"
            + "      ,[status]\n"
            + "      ,[role]\n"
            + "  FROM [dbo].[Account]\n"
            + "\n"
            + "where id = ?";

    public Account login(String username, String password) {

        try {
            String sql = "select * from Account where username = ? and password = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .password(rs.getString(7))
                        .status(rs.getInt(8))
                        .role(rs.getInt(9))
                        .build();
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Account getAccountInfoByEmail(String email) throws SQLException {

        try {
            String sql = "SELECT [id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[displayName]\n"
                    + "      ,[address]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[status]\n"
                    + "      ,[role]\n"
                    + "  FROM [dbo].[Account]\n"
                    + "\n"
                    + "where email = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .password(rs.getString(7))
                        .status(rs.getInt(8))
                        .role(rs.getInt(9))
                        .build();
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Account> getAccounts() throws SQLException {
        List<Account> list = new ArrayList<>();
        Statement stm = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                stm = conn.createStatement();
                rs = stm.executeQuery(GET_ACCOUNTS);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String displayName = rs.getString("displayName");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    Account acc = Account.builder()
                            .id(rs.getInt(1))
                            .username(rs.getString(2))
                            .password(rs.getString(3))
                            .displayName(rs.getString(4))
                            .address(rs.getString(5))
                            .email(rs.getString(6))
                            .phone(rs.getString(7))
                            .status(rs.getInt(8))
                            .role(rs.getInt(9))
                            .build();
                    list.add(acc);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean insertAccount(Account account) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT_ACCOUNT);
                stm.setString(1, account.getUsername());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getDisplayName());
                stm.setString(4, account.getAddress());
                stm.setString(5, account.getEmail());
                stm.setString(6, account.getPhone());
                stm.setInt(7, account.getStatus());
                stm.setInt(8, account.getRole());

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

    public void create(Account account) {
        try {

            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[displayName]\n"
                    + "           ,[address]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[status]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            //mở kết nối
            Connection conn = new DBContext().getConnection();
            //đưa câu lệnh sql vào chuẩn bị thực thi
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getDisplayName());
            ps.setString(4, account.getAddress());
            ps.setString(5, account.getEmail());
            ps.setString(6, account.getPhone());
            ps.setInt(7, account.getStatus());
            ps.setInt(8, account.getRole());

            //thực thi và trả về kết quả 
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountInfoById(int id) {

        try {
            String sql = "SELECT [id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[displayName]\n"
                    + "      ,[address]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[status]\n"
                    + "      ,[role]\n"
                    + "  FROM [dbo].[Account]\n"
                    + "\n"
                    + "where id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .status(rs.getInt(8))
                        .role(rs.getInt(9))
                        .build();
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    
        public Account getAccountUsername(String newUsername) {

        try {
            String sql = "SELECT [id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[displayName]\n"
                    + "      ,[address]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[status]\n"
                    + "      ,[role]\n"
                    + "  FROM [dbo].[Account]\n"
                    + "\n"
                    + "where username = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newUsername);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                         .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .status(rs.getInt(8))
                        .role(rs.getInt(9))
                        .build();
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public boolean updateAccount(Account updateAcc) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = new DBContext().getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_ACCOUNT);
                stm.setString(1, updateAcc.getUsername());
                stm.setString(2, updateAcc.getPassword());
                stm.setString(3, updateAcc.getDisplayName());
                stm.setString(4, updateAcc.getAddress());
                stm.setString(5, updateAcc.getEmail());
                stm.setString(6, updateAcc.getPhone());
                stm.setInt(7, updateAcc.getId());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

}
