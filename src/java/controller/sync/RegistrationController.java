/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author phamp
 */
public class RegistrationController extends HttpServlet {

    private static final String ERROR_URL = "error.jsp";
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//
//        }
//    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String url = ERROR_URL;

            String message = null;
            AccountDAO dao = new AccountDAO();

            String newUsername = request.getParameter("username");
            String newPassword = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String newDisplayName = request.getParameter("displayName");
            String newAddress = request.getParameter("address");
            String newemail = request.getParameter("email");
            String newPhone = request.getParameter("phone");

            if (dao.getAccountUsername(newUsername) != null || dao.getAccountInfoByEmail(newemail) != null || !(newPassword.trim().matches("[0-9A-Za-z._]+")) || !(confirmPassword.equals(newPassword)) || newDisplayName.length() <= 1 || newAddress.length() <= 1 || newemail.length() <= 3 || newPhone.length() <= 3) {
                if (dao.getAccountUsername(newUsername) != null) {
                    message = "Username already exists";
                }else if (dao.getAccountInfoByEmail(newemail) != null) {
                    message = "The account already exists in the system! Please use another email to login";
                }else if(newUsername.trim().length() < 6 || newUsername.trim().length() > 20){
                    message = "Username must be between 6-20 characters ";
                }else if (!newUsername.trim().matches("[A-Za-z0-9._]+")){
                     message = "Username must not contains special characters or space";
                }else if (!(newPassword.trim().matches("[0-9A-Za-z._]+"))) {
                    message = "Password must not contains special characters or space";
                }else if(newPassword.trim().length() < 6 || newPassword.trim().length() > 20){
                    message = "Password must be between 6-20 characters ";
                } else if (!(confirmPassword.equals(newPassword))) {
                    message = "Password does not match";
                } else if (newDisplayName.trim().length() <= 1) {
                    message = "The displayName should be more than 1 character";
                }else if (newAddress.trim().length() < 1 || newAddress.trim().length() > 20) {
                    message = "Address must be between 6-20 characters";
                }else if(!newAddress.trim().matches("^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\ ]+$")){
                     message = "Please enter your Address";
                }
                else if (!newemail.trim().matches("^[a-zA-Z][-_.a-zA-Z0-9]{5,29}@g(oogle)?mail.com$")) {
                    message = "Please enter your Email (a-Z-0-9@gmail.com)";
                }else if (!newPhone.trim().matches("(84|0[3|5|7|8|9])+([0-9]{3,8})\\b")) {
                    message = "Please enter your Phone (03+,05+,07+,09+,84+)";
                }
            }
            if (message != null) {
                url = "register.jsp";
                request.setAttribute("username", newUsername);
                request.setAttribute("password", newPassword);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("displayName", newDisplayName);
                request.setAttribute("address", newAddress);
                request.setAttribute("email", newemail);
                request.setAttribute("phone", newPhone);
                request.setAttribute("message", message);
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                Account account = new Account(0, newUsername, newPassword, newDisplayName, newAddress, newemail, newPhone, 1, 0);
                boolean check = dao.insertAccount(account);
                if (check) {
                    request.setAttribute("MSG_SUCCESS", "You have successfully registered an account!");
                    
                    request.getRequestDispatcher("register.jsp").forward(request, response);

                }
            }

        } catch (Exception ex) {
            log("Error at RegistrationController: " + ex.toString());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
