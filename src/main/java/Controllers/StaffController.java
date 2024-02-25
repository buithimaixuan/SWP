/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Account;
import Models.Customer;
import Models.Staff;
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
import java.sql.Date;
import java.time.LocalDate;
import java.util.LinkedList;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "StaffController", urlPatterns = {"/StaffController"})

public class StaffController extends HttpServlet {

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
            out.println("<title>Servlet StaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();//tao session
        String path = request.getRequestURI();
        if (path.endsWith("/StaffController")) {
            request.getRequestDispatcher("/profileStaff.jsp").forward(request, response);
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
        Account as = (Account) request.getSession().getAttribute("account");

        Staff ss = (Staff) request.getSession().getAttribute("staff");
//        String name = ss.getUsername();

        String phoneNumber = ss.getPhone_number();
        String email = ss.getEmail();
        String username = ss.getUsername();

        AccountDAO adao = new AccountDAO();
        CustomerDAO cdao = new CustomerDAO();
        StaffDAO sdao = new StaffDAO();

        if (request.getParameter(
                "btnChangePassStaff") != null) {

            System.out.println("done connect");
            String oldPassword = request.getParameter("oldPass");

            String newPassword = request.getParameter("newP");
            String newPasswordHashed = Utils.Hashing.getMd5(newPassword);

            String confirmPassword = request.getParameter("confirm");

            if (!adao.checkPassword(oldPassword)) {
                response.sendRedirect("/StaffController");
                return;
            }

            System.out.println("done check OldPass");

            // lấy account trong session
//            String username = as.getUsername();
            String fullname = ss.getFullname();

            //lấy customer trong session
            //lấy staff trong session
            String gender = ss.getGender();
            String address = ss.getAddress();
            String position = ss.getPosition();
            Date birthday = ss.getBirthday();
            Date begin = ss.getBegin_work();
            Date end = ss.getEnd_work();
            int accId = ss.getAcc_id();
            int staffId = ss.getStaff_id();

//            int staId = ss.getStaff_id();
            System.out.println(username + ".." + accId);

            Account acdc = new Account(accId, username, newPasswordHashed, fullname, phoneNumber, email, 0, 0);
            Staff sss = new Staff(staffId, accId, username, newPasswordHashed, fullname, phoneNumber, email, birthday, gender, address, position, begin, end, 0, 0);

            System.out.println("day");
            int resultAcc = adao.updateAcc(acdc);
            int resultSS = sdao.updateStaff(sss);
//            int resultSta = sdao.updateStaff(sta);

            System.out.println("ok update account");
            if (resultAcc > 0 && resultSS > 0) {

                response.sendRedirect("/StaffController");

            } else {
                //thất bại
                session.setAttribute("fail", "That bai");
                response.sendRedirect("/StaffController");
            }
        }
        if (request.getParameter("btnUpdatefStaff") != null) {
//            String usern = request.getParameter("username");
//            LinkedList<String> listUsername = adao.getAllUserName();
//            for (String s : listUsername) {
//                if (!usern.equals(name)) {
//                    if (s.equals(usern)) {
//                        response.setContentType("text/html");
//                        PrintWriter out = response.getWriter();
//                        out.print("This username is already existed!");
//                        break;
//                    }
//                }
//            }

            String emailUser = request.getParameter("email");

            LinkedList<String> listEmail = adao.getAllEmail();
            for (String s : listEmail) {
                if (!emailUser.equals(email)) {
                    if (s.equals(emailUser)) {
                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.print("This email is already existed!");
                        break;
                    }
                }
            }

            String userPhone = request.getParameter("phone");

            LinkedList<String> listPhone = adao.getAllPhone();
            for (String s : listPhone) {
                if (!userPhone.equals(phoneNumber)) {
                    if (s.equals(userPhone)) {
                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.print("This phone is already existed!");
                        break;
                    }
                }
            }
            System.out.println("done connect upStaff");

            String fullnameU = request.getParameter("fullname");
            String emailU = request.getParameter("email");
            String phoneU = request.getParameter("phone");
//            String positionU = request.getParameter("position");
            String addressU = request.getParameter("address");
            Date birthdayU = Date.valueOf(request.getParameter("birthday"));

//            Date birthdayU = ss.getBirthday();
            Date beginU = ss.getBegin_work();
            Date endU = ss.getEnd_work();

            int accId = ss.getAcc_id();
            int staffId = ss.getStaff_id();
            String gender = ss.getGender();
            String password = ss.getPassword();
//            String usernameU = ss.getUsername();
            String positionU = ss.getPosition();

            System.out.println(username + ".update." + accId);
            Account acdc = new Account(accId, username, password, fullnameU, phoneU, emailU, 0, 0);
            Staff sss = new Staff(staffId, accId, username, password, fullnameU, phoneU, emailU, birthdayU, gender, addressU, positionU, beginU, endU, 0, 0);

            int resultAcc = adao.updateAcc(acdc);
            int resultStt = sdao.updateStaff(sss);

            System.out.println("ok update account");
            if (resultAcc > 0 && resultStt > 0) {

                session.setAttribute("staff", sss);
                response.sendRedirect("/StaffController");
            } else {
                session.setAttribute("fail", "That bai");
                response.sendRedirect("/StaffController");
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
