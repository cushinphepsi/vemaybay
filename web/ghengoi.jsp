<%@page import="vemaybay.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@include file="vemaybay.html" %>
<link rel="stylesheet" type="text/css" href="style.css" />
<div id="ghe" style=" width : 500px ; height: 700px ; background-color: grey">
        <table>
            <tr>
                <td><h2 style="margin: 5px 20px">A</h2></td>
                <td><h2 style="margin: 5px 20px">B</h2></td>
                <td><h2 style="margin: 5px 20px">C</h2></td>
                <td><h2 style="margin: 5px 20px">D</h2></td>
                <td><h2 style="margin: 5px 20px">E</h2></td>
                <td><h2 style="margin: 5px 20px">F</h2></td>
            </tr>
            
            <%
                Vector<ChuyenBay> vector = (Vector<ChuyenBay>)request.getAttribute("vector");
                for(int i = 0 ; i < vector.size();i++){
                    
                    if(i == 4 || i == 8 || i == 12 || i == 16){
                        out.print("<tr>");
                        out.print("<td >");
                        out.print("<div> <button value='btn' name='btnTiepTuc' style='width: 40px ; height: 40px ; background-color: red;margin: 10px'><a href='ghengoi' >" +  vector.get(i).getTenGhe() + "</a></button>" );
                        out.print("</div>");
                        out.print("</td>");
                    }
                    else{
                        
                        out.print("<td >");
                        out.print("<div> <button value='btn' name='btnTiepTuc' style='width: 40px ; height: 40px ; background-color: red;margin: 10px'><a href='ghengoi' >" +  vector.get(i).getTenGhe() + "</a></button>" );
                        out.print("</div>");
                        out.print("</td>");
                    }
                }   
                
            %>
           
               
        </table>
    </div>
<%@ include file="footer.html" %>
