<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vemaybay.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@include file="vemaybay.html" %>
<% 
    Vector<ChuyenBay> vector = (Vector<ChuyenBay>) request.getAttribute("chuyenbay");
    int dem = 0; 
    String noiDi="",noiDen = "";
    Date ngayDi = null;
    for (ChuyenBay data : vector) {
        noiDi = data.getNoiDi();
        noiDen = data.getNoiDen();
        ngayDi = data.getNgayDi();
        dem++;
    }
    SimpleDateFormat formatter = new SimpleDateFormat(" E dd/MM/yyyy");
    String strDate = formatter.format(ngayDi);
    

%>
<link rel="stylesheet" type="text/css" href="style.css" />
</div>
<div id="content">
<div id="danhsachcb">
        <div class="thanhtieude" style="height:50px">
            <p class="tieude">Chuyến đi : <% out.print(noiDi);%> , Việt Nam -> <% out.print(noiDen);%> , Việt Nam</p>
            <p id="ngaydi"> <% out.print(strDate);  out.print(" (" + dem + " chuyến bay )");%> </p>
        </div>
        <div id="danhsach">
            <form action="chitietcb" method="post">  
                <table id="table">
                <tr id="tieude">
                    <td>Hãng hàng không</td>
                    <td>Nơi đi</td>
                    <td>Nơi đến</td>
                    <td>Ngày đi</td>
                    <td>Giờ đi</td>
                    <td>Giờ đến</td>
                    <td style="width : 90px">Giá</td>
                    <td style="width : 60px"></td>
                </tr>
                    <%
                     formatter = new SimpleDateFormat(" dd/MM/yyyy");
                     strDate = formatter.format(ngayDi);
            for (ChuyenBay data : vector) {
                out.print("<tr id=chitiet>");
                out.print("<td>" + data.getTenHang());
                out.print("</td>");
                
                out.print("<td>" + data.getNoiDi());
                out.print("</td>");
                //-----------------------------------
                out.print("<td>" + data.getNoiDen());
                out.print("</td>");
               
                out.print("<td>" + strDate);
                out.print("</td>");
                //-----------------------------------
                out.print("<td>" + data.getGioDi());
                out.print("</td>");
                //-----------------------------------
                 out.print("<td>" + data.getGioDen());
                out.print("</td>");
                //-----------------------------------
                out.print("<td>" + data.getTongTien());
                out.print("</td>");
                
                out.print("<td>" + " <button name=btnChon value=" + data.getMaDSChuyenBay() + ">Chọn</button> ");
                out.print("</td>");
                
                out.print("</tr>");
                
                 
            }
        %>
                
            </table>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.html" %>

 