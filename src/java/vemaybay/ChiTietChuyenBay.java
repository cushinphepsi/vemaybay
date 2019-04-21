
package vemaybay;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CuShinPhepSi
 */
@WebServlet(name = "ChiTietChuyenBay", urlPatterns = {"/chitietcb"})
public class ChiTietChuyenBay extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int maDSCB = Integer.parseInt(request.getParameter("btnChon"));
        ChuyenBay cb = new ChuyenBay();
        cb.chiTietChuyenBay(maDSCB);
        request.setAttribute("chitiet", cb);
        RequestDispatcher rd = request.getRequestDispatcher("chitietchuyenbay.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
