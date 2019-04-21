package vemaybay;

import java.io.IOException;
import java.sql.Date;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DanhSachChuyenBay extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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
        
        String noiDi = request.getParameter("noidi");
        String noiDen = request.getParameter("noiden");
        String ngayDi = request.getParameter("ngaydi");
        String ngayVe = request.getParameter("ngayve");
        ChuyenBay chuyenBay = new ChuyenBay();
        Vector<ChuyenBay> vector = new Vector<ChuyenBay>();
        if(ngayVe.equals("")){
            vector = chuyenBay.timKiemMotChieu(noiDi,noiDen, Date.valueOf(ngayDi)) ;
        }
        else
            vector = chuyenBay.timKiemKhuHoi(noiDi,noiDen, Date.valueOf(ngayDi),Date.valueOf(ngayVe)) ;
        request.setAttribute("chuyenbay", vector);

        request.setAttribute("ngayDi", ngayDi);
        RequestDispatcher rd = request.getRequestDispatcher("danhsachcb.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
//    date = new SimpleDateFormat("MM/dd/yyyy").parse(ngayDi);
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//            strDate = formatter.format(date);

}
