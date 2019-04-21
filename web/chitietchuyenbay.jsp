
<%@page import="vemaybay.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@include file="vemaybay.html" %>
<link rel="stylesheet" type="text/css" href="style.css" />
<%
    ChuyenBay cb = (ChuyenBay) (request.getAttribute("chitiet"));
%>
</div>
<div id="content">
    <div id="chitietcb">
        <div class="thanhtieude" style="height:40px">
            <p class="tieude" style="padding: 10px 1px">CHI TIẾT CHUYẾN BAY <a style="font-size: 12px;color: #ccccff" href="index.jsp">(Đổi chuyến khác ?)</a></p>
        </div>
        <div id="noidi">
            <span class="tieude">Chuyến đi : <% out.print(cb.getNoiDi());%>  , Việt Nam -> <% out.print(cb.getNoiDen());%> , Việt Nam</span>
            <span style="padding-left: 500px ">Thời gian bay : <% out.print(cb.getGioDen());%></span>
        </div>


        <div style="height: 280px ; background-color: #f2f2f2;border: 1px solid #d6d6c2">
            <table style="height: 70px ; background-color: #fff; margin: 5px 10px ; border-radius: 5px;width: 98%">
                <tr>
                    <td rowspan="2" style="width: 100px ; padding: 0px 10px;font-weight: bold;font-size: 15px"><% out.print(cb.getTenHang()); %></td>
                    <td style="width: 100px ;color: blue; font-weight: bold"><% out.print(cb.getNoiDi()); %></td>
                    <td style="width: 100px"><% out.print(cb.getGioDen()); %></td>
                    <td style="width: 100px ;color: blue; font-weight: bold"><% out.print(cb.getNoiDen()); %></td>
                    <td style="width: 100px"><% out.print(cb.getTenHangVe()); %></td>
                </tr>
                <tr>
                    <td style="width: 100px"><% out.print(cb.getGioDi()); %></td>
                    <td style="width: 100px ">------------></td>
                    <td style="width: 100px"><% out.print(cb.getGioDen()); %></td>
                    <td style="width: 100px"><% out.print(cb.getTenMayBay()); %></td>
                </tr>
            </table>
            <div style="border-top: 1px solid #d6d6c2; height: 120px ;border-bottom: 1px solid #d6d6c2; margin-bottom: 0px">
                <h4 style="margin : 20px 10px 0px 10px;">Giá vé đã gồm thuế phí</h4>

                <table style="height: 70px; margin: 5px 10px ;width: 98%">
                    <tr>
                        <td style="width: 200px ; font-weight: bold ">Mô tả</td>
                        <td style="width: 200px ; font-weight: bold ; padding-left: 10%">Số lượng</td>
                        <td style="width: 200px ; font-weight: bold ; padding-left: 15%">Tổng giá</td>
                    </tr>
                    <tr>
                        <td style="width: 200px">Người lớn</td>
                        <td style="width: 200px ; padding-left: 12%">1</td>
                        <td style="width: 200px ; padding-left: 17%"><% out.print(cb.getTongTien() + " VNĐ");%></td>

                    </tr>
                </table>
            </div>
            <div style="height: 40px;">
                <table style="height: 30px;line-height: 30px;width: 98%;margin: 0px 10px">
                    <tr>
                        <td style="width: 200px">Mã giảm giá</td>
                        <td style="width: 200px ; padding-left: 42%"><input type="text" name="magiamgia" placeholder="Nhập mã giảm giá"></td>
                        <td style="width: 200px ; padding-left: 27%"> <input type="button" name="" value="Áp dụng"> </td>
                    </tr>
                </table>
            </div>  
            <div style="border-top:  1px solid #d6d6c2;">
                <table style="height: 30px; margin: 0px 10px ;width: 98%;line-height: 30px">
                    <tr>
                        <td>Tổng giá (Đã bao gồm thuế,phí)</td>
                        <td style="padding-left: 10%">VNĐ</td>
                    </tr>
                </table>
            </div>

        </div>
             <form action="ghengoi" method="get">  
                <% out.print("<button name=btnTiepTuc value=" + cb.getMaMayBay() + ">Tiếp tục</button> "); %>
             </form>
    </div>
</div>
<%@ include file="footer.html" %>

