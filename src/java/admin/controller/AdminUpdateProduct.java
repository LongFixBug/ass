/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import dao.AccountDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Product;

/**
 *
 * @author long
 */
public class AdminUpdateProduct extends HttpServlet {

//    private final String ERROR_PAGE = "adminUpdate";
//    private final String LOGIN_PAGE = "loginController";
//    String url = "error.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            
//
//            String name = request.getParameter("name");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            double price = Double.parseDouble(request.getParameter("price"));
//            String description = request.getParameter("description");
//            String imageUrl = request.getParameter("imageUrl");
//            String startDate_raw = request.getParameter("startDate");
//            String endDate_raw = request.getParameter("endDate");
////         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
////            Date startDate = simpleDateFormat.parse(startDate_raw);
////            Date endDate = simpleDateFormat.parse(endDate_raw);
//            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//            //      int status = Integer.parseInt(request.getParameter("status"));
//           int status = Integer.parseInt(request.getParameter("status"));
//   // boolean newstatus = Boolean.parseBoolean(request.getParameter("status")); 
//
//            Product updateproduct = new Product(productId, name, quantity, price, description, imageUrl, startDate_raw, endDate_raw, categoryId, status);
//
//            ProductDAO dao = new ProductDAO();
//
//            boolean check = dao.updateProduct(updateproduct);
//            if (check) {
//                request.setAttribute("MSG_SUCCESS", "You have successfully Course!");
//                 
//                request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
//
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Ban da update course thanh cong\\r\\n');");
//
//                out.println("</script>");
//            }
//
//        } catch (Exception ex) {
//            log("Error at adminUpdater " + ex.toString());
//        }
    }

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

        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = new ProductDAO().getProductById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        processRequest(request, response);
//        try (PrintWriter out = response.getWriter()) {

//            int productId = Integer.parseInt(request.getParameter("id"));
//
//            String name = request.getParameter("name");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            double price = Double.parseDouble(request.getParameter("price"));
//            String description = request.getParameter("description");
//            String imageUrl = request.getParameter("imageUrl");
//            String startDate_raw = request.getParameter("startDate");
//            String endDate_raw = request.getParameter("endDate");
////         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
////            Date startDate = simpleDateFormat.parse(startDate_raw);
////            Date endDate = simpleDateFormat.parse(endDate_raw);
//            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//            //      int status = Integer.parseInt(request.getParameter("status"));
//            int status = Integer.parseInt(request.getParameter("status"));
//            // boolean newstatus = Boolean.parseBoolean(request.getParameter("status")); 
            
            
 //           String messagename = null;
//            String messagequantity = null;
//            String messageprice = null;
//            String messagedescription = null;
//            String messageimageUrl = null;
//            String messagestartDate = null;
//            String messageendDate = null;
//            String messagecategoryId = null;
//            String messagestatus = null;
//
//            Product updateproduct = new Product(productId, name, quantity, price, description, imageUrl, startDate_raw, endDate_raw, categoryId, status);
//
//            ProductDAO dao = new ProductDAO();
//
//            boolean check = dao.updateProduct(updateproduct);
//            if (check) {
//                request.setAttribute("MSG_SUCCESS", "You have successfully Course!");
//                Product product = new ProductDAO().getProductById(productId);
//                request.setAttribute("product", product);
//                request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
//            }
//
//        } catch (Exception ex) {
//            log("Error at adminUpdater " + ex.toString());
//        }

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
     

            String name = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String imageUrl = request.getParameter("imageUrl");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int status = Integer.parseInt(request.getParameter("status"));

            int productId = Integer.parseInt(request.getParameter("id"));

            String messagename = null;
            String messagequantity = null;
            String messageprice = null;
            String messagedescription = null;
            String messageimageUrl = null;
            String messagestartDate = null;
            String messageendDate = null;
            String messagecategoryId = null;
            String messagestatus = null;

            ProductDAO dao = new ProductDAO();

            if (!(name.length() >= 6 && name.length() <= 20) ) {              
                    messagename = "Course name phai tu 6 den 20 ki tu";
            }
            if (!(quantity > 0 && quantity <= 1000)) {
                messagequantity = "So luong phai tu 1 den 1000";

            }
            if (!(price > 0 && price <= 1000000)) {
                messageprice = "Gia phai tu 1 den 1000000";

            }
            if (!(description.length() >0 && description.length() <= 100)) {
                messagedescription = "Description phai tu 1 den 100 ki tu";

            }
            if (!(imageUrl.length() > 0 && imageUrl.length() <= 30)) {
                messageimageUrl = "Go theo mau ./images/X.jpg voi X la ten hinh trong file images";

            }
            if (!(categoryId > 0 && categoryId <= 3)) {
                messagecategoryId = "Nhap 1 (Piano), 2(guitar), 3(Drawing)";

            }
            if (!(status >= 0 && status <= 1)) {
                messagestatus = "Chon 1 de set Active - 0 de set Not Active)";

            }

            if (messagename == null && messagequantity == null && messageprice == null && messagedescription == null && messageimageUrl == null && messagestartDate == null && messageendDate == null && messagecategoryId == null && messagestatus == null) {

                Product updateproduct = new Product(productId, name, quantity, price, description, imageUrl, startDate, endDate, categoryId, status);

                boolean check = dao.updateProduct(updateproduct);
                if (check) {
                    Product product = dao.getProductById(productId);
                    request.setAttribute("MSG_SUCCESS", "You have successfully Course!");
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("updateproduct.jsp").forward(request, response);

                }

            }

            request.setAttribute("messagename", messagename);
            request.setAttribute("messagequantity", messagequantity);
            request.setAttribute("messageprice", messageprice);
            request.setAttribute("messagedescription", messagedescription);
            request.setAttribute("messageimageUrl", messageimageUrl);
            request.setAttribute("messagestartDate", messagestartDate);
            request.setAttribute("messageendDate", messageendDate);
            request.setAttribute("messagecategoryId", messagecategoryId);
            request.setAttribute("messagestatus", messagestatus);
             Product product = dao.getProductById(productId);
             request.setAttribute("product", product);
            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
            

        } catch (SQLException ex) {
            Logger.getLogger(AdminUpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
