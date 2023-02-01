/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author long
 */
public class AdminCreateProduct extends HttpServlet {

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
         //   int status = Integer.parseInt(request.getParameter("status"));

            

            String messagename = null;
            String messagequantity = null;
            String messageprice = null;
            String messagedescription = null;
            String messageimageUrl = null;
         //   String messagestartDate = null;
         //   String messageendDate = null;
            String messagecategoryId = null;
         //   String messagestatus = null;

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
            

            if (messagename == null && messagequantity == null && messageprice == null && messagedescription == null && messageimageUrl == null && messagecategoryId == null ) {

                Product createproduct = new Product(0, name, quantity, price, description, imageUrl, startDate, endDate, categoryId, 1);

                boolean check = dao.insertProduct(createproduct);
                if (check) {
                    
                    request.setAttribute("MSG_SUCCESS", "You have successfully Course!");
                    
                    request.getRequestDispatcher("createproduct.jsp").forward(request, response);

                }

            }
            

            request.setAttribute("messagename", messagename);
            request.setAttribute("messagequantity", messagequantity);
            request.setAttribute("messageprice", messageprice);
            request.setAttribute("messagedescription", messagedescription);
            request.setAttribute("messageimageUrl", messageimageUrl);
         //   request.setAttribute("messagestartDate", messagestartDate);
         //   request.setAttribute("messageendDate", messageendDate);
            request.setAttribute("messagecategoryId", messagecategoryId);
   //         request.setAttribute("messagestatus", messagestatus);
           
            
            request.getRequestDispatcher("createproduct.jsp").forward(request, response);
            

        } catch (SQLException ex) {
            Logger.getLogger(AdminUpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
        } 
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
        processRequest(request, response);
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
