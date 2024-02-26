/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;


import DAOs.CustomerDAO;
import DAOs.OrderStatusHistoryDAO;
=======
import DAOs.NewsDAO;
import DAOs.NewsHistoryDAO;
import Models.News;
import Models.NewsHistory;
import Models.Staff;

import DAOs.ProductDAO;
import DAOs.ProductHistoryDAO;
import Models.Customer;
import Models.OrderStatusHistory;
import Models.ProHis;
import Models.Product;
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
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
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
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/AdminController")) {
            request.getRequestDispatcher("/DashBoardSlideBarVer2.jsp").forward(request, response);
        } else if (path.endsWith("/AdminController/adminListPro")) {
            ProductDAO pdao = new ProductDAO();
            LinkedList<Product> listPro = pdao.getAllPro();
            request.setAttribute("listPro", listPro);
            request.getRequestDispatcher("/adminListPro.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/adminListProHistory")) {
            ProductHistoryDAO phdao = new ProductHistoryDAO();
            LinkedList<ProHis> listProHis = phdao.getAllProHis();
            request.setAttribute("listProHis", listProHis);
            request.getRequestDispatcher("/adminListProHis.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/adminListOrder")) {
            request.getRequestDispatcher("/adminListOrder.jsp").forward(request, response);
        } else if (path.endsWith("/AdminController/adminListOrderHistory")) {
            OrderStatusHistoryDAO ohdao = new OrderStatusHistoryDAO();
            LinkedList<OrderStatusHistory> listOrdHis = ohdao.getAllOrderStatus();
            System.out.println("show order his ");
            request.setAttribute("listOrdHis", listOrdHis);
             System.out.println("set order ");
            request.getRequestDispatcher("/adminListOrderHis.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/adminListNews")) {
            NewsDAO newsDAO = new NewsDAO();
            LinkedList<News> listNews = newsDAO.getAll();
            request.setAttribute("listNews", listNews);
            request.getRequestDispatcher("/adminListNews.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/AddNews")) {
            request.getRequestDispatcher("/AddNewsForm.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/UpdateNews")) {
            int news_id = Integer.parseInt(request.getParameter("news_id"));

            NewsDAO newsDAO = new NewsDAO();
            News news = newsDAO.getNews(news_id);

            String images_url = (news != null && news.getImage_url() != null) ? news.getImage_url() : "no_image.jpg";
            // Đặt thông tin tin tức vào thuộc tính của request để truyền tới trang UpdateNewsForm.jsp
            request.setAttribute("news_id", news_id);

            request.setAttribute("title", news.getTitle());
            request.setAttribute("contentMain", news.getTitle_content());
            request.setAttribute("image_url", images_url);
            request.setAttribute("content1", news.getContent1());
            request.setAttribute("content2", news.getContent2());
            request.setAttribute("content3", news.getContent3());
            request.setAttribute("dayWriteNews", news.getCreate_date());

            // Chuyển hướng tới trang UpdateNewsForm.jsp
            request.getRequestDispatcher("/UpdateNewsForm.jsp").forward(request, response);
        } else if (path.endsWith("/AdminController/DeleteNews")) {
            int news_id = Integer.parseInt(request.getParameter("news_id"));

            NewsDAO newsDAO = new NewsDAO();
            News news = newsDAO.getNews(news_id);

            String images_url = (news != null && news.getImage_url() != null) ? news.getImage_url() : "no_image.jpg";
            // Đặt thông tin tin tức vào thuộc tính của request để truyền tới trang UpdateNewsForm.jsp
            request.setAttribute("news_id", news_id);

            request.setAttribute("title", news.getTitle());
            request.setAttribute("contentMain", news.getTitle_content());
            request.setAttribute("image_url", images_url);
            request.setAttribute("content1", news.getContent1());
            request.setAttribute("content2", news.getContent2());
            request.setAttribute("content3", news.getContent3());
            request.setAttribute("dayWriteNews", news.getCreate_date());

            // Chuyển hướng tới trang UpdateNewsForm.jsp
            request.getRequestDispatcher("/DeleteNewsForm.jsp").forward(request, response);
        } else if (path.endsWith("/AdminController/adminListNewsHistory")) {
            request.getRequestDispatcher("/adminListNewsHis.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/adminListStaff")) {
            request.getRequestDispatcher("/adminListStaff.jsp").forward(request, response);

        } else if (path.endsWith("/AdminController/adminListCustomer")) {
            CustomerDAO cdao = new CustomerDAO();
            LinkedList<Customer> listCus = cdao.getAllCus();
            request.setAttribute("listCus", listCus);
            request.getRequestDispatcher("/adminListCustomer.jsp").forward(request, response);
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
        NewsDAO newsDAO = new NewsDAO();
        Staff staff = new Staff();
        HttpSession session = request.getSession();
        staff = (Staff) session.getAttribute("staff");

        if (request.getParameter("btn-AddNews") != null) {
            try {
                String fileName1 = null;
                Part part = request.getPart("newsPic");
                if (part != null && part.getSize() > 0) {
                    String realPart = getServletContext().getRealPath("/images");
                    fileName1 = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    if (fileName1 == null || fileName1.equals("")) {
                        fileName1 = "no_image.png";
                    }
                    if (!Files.exists(Paths.get(realPart))) {
                        Files.createDirectory(Paths.get(realPart));
                    }
                    part.write(realPart + "/" + fileName1);
                } else {
                    // Nếu không có ảnh được chọn, sử dụng ảnh mặc định
                    fileName1 = "no_image.png";
                }

                if (staff != null && staff.getStaff_id() > 0) {
                    int staff_id = staff.getStaff_id();
                    String title = request.getParameter("title");
                    String image_url = fileName1; // Sử dụng tên file ảnh đã lấy được
                    String title_content = request.getParameter("contentMain");
                    String content1 = request.getParameter("content1");
                    String content2 = request.getParameter("content2");
                    String content3 = request.getParameter("content3");
                    Date create_date = Date.valueOf(request.getParameter("dayWriteNews"));

                    newsDAO.AddNewNews(staff_id, title, "images/" + image_url, title_content, content1, content2, content3, create_date);
                    response.sendRedirect(request.getContextPath() + "/AdminController/adminListNews");
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Xử lý lỗi khi có ngoại lệ xảy ra
                // Có thể redirect về trang lỗi hoặc hiển thị thông báo lỗi
                request.setAttribute("error", "Đã xảy ra lỗi khi thêm tin tức.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } else if (request.getParameter("btn-UpdateNews") != null) {

            if (staff != null && staff.getStaff_id() > 0) {
                int news_id = Integer.parseInt(request.getParameter("news_id"));
                String title = request.getParameter("title");
                String image_url = request.getParameter("newsPic");
                String title_content = request.getParameter("contentMain");
                String content1 = request.getParameter("content1");
                String content2 = request.getParameter("content2");
                String content3 = request.getParameter("content3");
                Date create_date = Date.valueOf(request.getParameter("dayWriteNews"));

                News news = new News(news_id, staff.getStaff_id(), title, image_url, title_content, content1, content2, content3, create_date, 0);
                newsDAO.UpdateNews(news, news_id);

                response.sendRedirect(request.getContextPath() + "/AdminController/adminListNews");
            }
        } else if (request.getParameter("btn-DeleteNews") != null) {
            int news_id = Integer.parseInt(request.getParameter("news_id"));

            newsDAO.DeleteNews(news_id);

            response.sendRedirect(request.getContextPath() + "/AdminController/adminListNews");
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
