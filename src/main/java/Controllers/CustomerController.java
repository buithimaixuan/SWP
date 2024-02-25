/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import Models.Account;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedList;

/**
 *
 * @author Dell
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String path = request.getRequestURI();
        if (path.endsWith("/CustomerController/Create")) {
            request.getRequestDispatcher("/AddCusAdmin.jsp").forward(request, response);
        }else  if (path.endsWith("/CustomerController/ok")) {
            request.getRequestDispatcher("/ok.jsp").forward(request, response);
        }
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
        HttpSession session = request.getSession();

        AccountDAO accdao = new AccountDAO();
        CustomerDAO cusdao = new CustomerDAO();

        String usern = request.getParameter("user");
        LinkedList<String> listUsername = accdao.getAllUserName();
        for (String s : listUsername) {
            if (s.equals(usern)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("This username is already existed!");
                break;
            }
        }

        String emailUser = request.getParameter("email");
        LinkedList<String> listEmail = accdao.getAllEmail();
        for (String s : listEmail) {
            if (s.equals(emailUser)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("This email is already existed!");
                break;
            }
        }

//        check duplicate username
        String userPhone = request.getParameter("phone");
        LinkedList<String> listPhone = accdao.getAllPhone();
        for (String s : listPhone) {
            if (s.equals(userPhone)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("This phone is already existed!");
                break;
            }
        }

         String fileName = null;
            String pathAvatar = request.getParameter("avatar_old");

            try {
                Part part = request.getPart("newsPic");
                String realPart = request.getServletContext().getRealPath("/images");

                // Kiểm tra nếu có file mới được chọn
                if (part != null && part.getSize() > 0) {
                    fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    if (!Files.exists(Paths.get(realPart))) {
                        Files.createDirectory(Paths.get(realPart));
                    }
                    part.write(realPart + "/" + fileName);
                    pathAvatar = "images/" + fileName; // Lưu đường dẫn của hình mới
                } else {
                    // Không có file mới được chọn, sử dụng giá trị hình cũ
                    pathAvatar = request.getParameter("avatar_old");

                }
            } catch (Exception e) {
                e.printStackTrace();
            }


        if (request.getParameter("btn-AddNews") != null) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            String passowrd = request.getParameter("pass");
            Account acc = new Account(0, username, passowrd, fullname, phone, email, 0, 0);
            int acc_id = accdao.createAcc(acc);
            if (acc_id != 0) {
                Customer cus = new Customer(0, acc_id, username, passowrd, fullname, pathAvatar, phone, email, 0, 0);
                int createCus = cusdao.createCus(cus);
                if (createCus != 0) {
                    response.sendRedirect("/AdminController/adminListCustomer");
                } else {
                    response.sendRedirect("/CustomerController");
                }

            } else {
                response.sendRedirect("/CustomerController");
            }

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
