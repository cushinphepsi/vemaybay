package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vemaybay.*;
import java.util.Vector;
import vemaybay.*;

public final class chitietchuyenbay_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/vemaybay.html");
    _jspx_dependants.add("/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("    \n");
      out.write("    <title>Phòng vé Nguyễn Huy Đức</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/datepicker.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"page\" style=\"background:url(images/bg_home.jpg)  center top no-repeat; \">\n");
      out.write("\t<div id=\"header\">\n");
      out.write("    \t<div class=\"logo\"><a href=\"#\"><img src=\"images/logo.png\" /></a></div>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("        \t<ul>\n");
      out.write("            \t<li><a href=\"#\">Trang chủ</a></li>\n");
      out.write("                <li><a href=\"#\">Vé nội địa</a></li>\n");
      out.write("                <li><a href=\"#\">Vé quốc tế</a></li>\n");
      out.write("                <li><a href=\"#\">Vé giá rẻ</a></li>\n");
      out.write("                <li><a href=\"#\">Giới thiệu</a></li>\n");
      out.write("                <li><a href=\"#\">Tin tức</a></li>\n");
      out.write("                <li><a href=\"#\">Trợ giúp</a></li>\n");
      out.write("                <li><a href=\"#\">Liên hệ</a></li>\n");
      out.write("                <div style=\"clear:both;\"></div>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("    \n");
      out.write("\t\t\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("</div>\n");
      out.write("<div id=\"content\">\n");
      out.write("    <div id=\"chitietcb\">\n");
      out.write("        <div class=\"thanhtieude\">\n");
      out.write("            <p class=\"tieude\" style=\"padding: 10px 1px\">CHI TIẾT CHUYẾN BAY</p>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"noidi\">\n");
      out.write("            <span class=\"tieude\">Chuyến đi : Hà Nội , Việt Nam -> Hải Phòng , Việt Nam</span>\n");
      out.write("            <span style=\"padding-left: 550px \">Thời gian bay : 2h 5m</span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\r\n");
      out.write("<div id=\"footer\">\r\n");
      out.write("    <div class=\"footer1\">\r\n");
      out.write("        <div class=\"ft\">\r\n");
      out.write("            <div class=\"title\">Vé máy bay quốc tế</div>\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"ft\">\r\n");
      out.write("            <div class=\"title\">Vé máy bay nội địa</div>\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"ft\">\r\n");
      out.write("            <div class=\"title\">Vé máy bay theo hãng</div>\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Trung Quốc</a></li>\r\n");
      out.write("                    <li><a href=\"#\">Vé Máy Bay Đi Anh</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"ft\">\r\n");
      out.write("            <div class=\"title\">Liên hệ với chúng tôi</div>\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("                CÔNG TY NGUYỄN HUY ĐỨC<br />\r\n");
      out.write("                ĐC: La Hòa - Điện Phước - Điện Bàn - Quảng Nam.<br />\r\n");
      out.write("                Email : duclahoa98@gmail.com<br />\r\n");
      out.write("                ĐT : 0764362448.\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mangxahoi\"><a href=\"#\"><img src=\"images/facebook.png\" width=\"32\" border=\"0\" style=\"padding-right:10px;\" /></a> <a href=\"#\"><img src=\"images/google.png\" width=\"32\" border=\"0\" /></a></div>\r\n");
      out.write("            <div class=\"mangxahoi\">Design by CuShinPhepSi</div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div style=\"clear:both\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div style=\"clear:both\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\n");
      out.write("\n");
      out.write(" ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
