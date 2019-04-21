package vemaybay;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CuShinPhepSi
 */
public class ChuyenBay {
    
    String maMayBay,tenGhe;
    String noiDi,noiDen , tenHang ,tenMayBay ,tenHangVe;
    Date ngayDi ;
    Time gioDi , gioDen;
    int tongTien = 0 , maDSChuyenBay;
    static Connection connect;
    static Statement stmt;
    static ResultSet rs;
    static PreparedStatement pstmt ;
    static CallableStatement cstmt ;

    public String getTenGhe() {
        return tenGhe;
    }

    public void setTenGhe(String tenGhe) {
        this.tenGhe = tenGhe;
    }

    
    public String getMaMayBay() {
        return maMayBay;
    }

    public void setMaMayBay(String maMayBay) {
        this.maMayBay = maMayBay;
    }

    
    public String getNoiDi() {
        return noiDi;
    }

    public void setNoiDi(String noiDi) {
        this.noiDi = noiDi;
    }

    public String getNoiDen() {
        return noiDen;
    }

    public void setNoiDen(String noiDen) {
        this.noiDen = noiDen;
    }

    public Time getGioDi() {
        return gioDi;
    }

    public void setGioDi(Time gioDi) {
        this.gioDi = gioDi;
    }

    public Time getGioDen() {
        return gioDen;
    }

    public void setGioDen(Time gioDen) {
        this.gioDen = gioDen;
    }

    public String getTenMayBay() {
        return tenMayBay;
    }

    public void setTenMayBay(String tenMayBay) {
        this.tenMayBay = tenMayBay;
    }

    public String getTenHangVe() {
        return tenHangVe;
    }

    public void setTenHangVe(String tenHangVe) {
        this.tenHangVe = tenHangVe;
    }

    public int getMaDSChuyenBay() {
        return maDSChuyenBay;
    }

    public void setMaDSChuyenBay(int maDSChuyenBay) {
        this.maDSChuyenBay = maDSChuyenBay;
    }

    public String getTenHang() {
        return tenHang;
    }

    public void setTenHang(String tenHang) {
        this.tenHang = tenHang;
    }

    public Date getNgayDi() {
        return ngayDi;
    }

    public void setNgayDi(Date ngayDi) {
        this.ngayDi = ngayDi;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }
    
    public ChuyenBay(String noiDi, String noiDen, Time gioDi , Time gioDen ,String tenHang, Date ngayDi, int tongTien, int maDSChuyenBay,String tenMayBay,String tenHangVe,String maMayBay) {
        this.noiDi = noiDi;
        this.noiDen = noiDen;
        this.gioDi = gioDi;
        this.gioDen = gioDen ;
        this.tenHang = tenHang;
        this.ngayDi = ngayDi;
        this.tongTien = tongTien;
        this.maDSChuyenBay = maDSChuyenBay;
        this.tenMayBay = tenMayBay;
        this.tenHangVe = tenHangVe;
        this.maMayBay = maMayBay;
    }
    public ChuyenBay(String maMayBay , String tenGhe){
        this.maMayBay = maMayBay ;
        this.tenGhe = tenGhe ;
    }
     public ChuyenBay(String noiDi, String noiDen, Time gioDi , Time gioDen ,String tenHang, Date ngayDi, int tongTien, int maDSChuyenBay) {
        this.noiDi = noiDi;
        this.noiDen = noiDen;
        this.gioDi = gioDi;
        this.gioDen = gioDen ;
        this.tenHang = tenHang;
        this.ngayDi = ngayDi;
        this.tongTien = tongTien;
        this.maDSChuyenBay = maDSChuyenBay;
    }
    public ChuyenBay(){}
    
    @Override
    public String toString() {
        return "ngayDi=" + ngayDi  + ", tongTien=" + tongTien + ", GioDi = " + gioDi + ", GioDen= " + gioDen + ", MaDSCB= " + maDSChuyenBay;
    }
    
    public static Connection ketNoi(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection("jdbc:sqlserver://cushinphepsi:1433;databaseName=QLVeMayBay","sa","huyduc3110");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connect ;
    }
    public static void TimKiemChuyenBay(String noiDi , String noiDen , Date ngayDi){
        ketNoi();
        try {
            String sql = " Select  sb1.TenSanBay as SanBayDen , sb2.TenSanBay as SanBayDi , NgayDi , TenHang , GioDi , GioDen , cb.TongTien \n" +
                         "from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,\n" +
                         "HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv\n" +
                         "where sb1.MaSanBay = tb.MaSanBayDen and sb2.MaSanBay = tb.MaSanBayDi \n" +
                         "and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = mb.MaHang \n" +
                         "and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay\n" +
                         "and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe\n" +
                         "and sb1.TenSanBay = ? and sb2.TenSanBay = ? and NgayDi = ?";
            pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, noiDi);
            pstmt.setString(2, noiDen);
            pstmt.setDate(3, ngayDi);
            rs = pstmt.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString("SanBayDi"));
                System.out.println(rs.getString("SanBayDen"));
                System.out.println(rs.getString("TenHang"));
                System.out.println(rs.getDate("NgayDi"));
                System.out.println(rs.getTime("GioDi"));
                System.out.println(rs.getInt("TongTien"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector<ChuyenBay> timKiemMotChieu(String sanBayDi , String sanBayDen , Date ngayKH) {
        Vector<ChuyenBay> ds = new Vector<ChuyenBay>();
        ketNoi();
        String sql = "Select  sb1.TenSanBay as SanBayDi , sb2.TenSanBay as SanBayDen , dscb.MaDSChuyenBay , NgayDi , TenHang , GioDi , GioDen , dscb.TongTien \n" +
                         "from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,\n" +
                         "HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv\n" +
                         " where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen\n" +
                         "and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = tbh.MaHang \n" +
                         "and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay\n" +
                         "and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe\n" +
                         "and sb1.TenSanBay = ? and sb2.TenSanBay = ? and NgayDi = ? and dscb.SoLuongVeCon >0" ;
        try {
            pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, sanBayDi);
            pstmt.setString(2, sanBayDen);
            pstmt.setDate(3, ngayKH);
            rs = pstmt.executeQuery();
            if(rs.next() == false){
                taoChuyenBay(sanBayDi, sanBayDen, ngayKH);
                ds = timKiemMotChieu(sanBayDi, sanBayDen, ngayKH);
            }
            else{
                while (rs.next()) {
                    noiDi = rs.getString("SanBayDi");
                    noiDen = rs.getString("SanBayDen");
                    tenHang = rs.getString("TenHang");
                    ngayDi = rs.getDate("NgayDi");
                    gioDi = rs.getTime("GioDi");
                    gioDen = rs.getTime("GioDen");
                    tongTien = rs.getInt("TongTien");
                    maDSChuyenBay = rs.getInt("MaDSChuyenBay");
                    ds.add(new ChuyenBay(noiDi,noiDen,gioDi,gioDen,tenHang,ngayDi,tongTien,maDSChuyenBay));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ds;
    }
    public Vector<ChuyenBay> timKiemKhuHoi(String sanBayDi , String sanBayDen , Date ngayKH , Date ngayVe) {
        Vector<ChuyenBay> ds = new Vector<ChuyenBay>();
        ketNoi();
        String sql = "Select  sb1.TenSanBay as SanBayDi , sb2.TenSanBay as SanBayDen , dscb.MaDSChuyenBay ,NgayDi , TenHang , GioDi , GioDen , dscb.TongTien \n" +
                         "from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,\n" +
                         "HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv\n" +
                         " where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen\n" +
                         "and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = tbh.MaHang \n" +
                         "and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay\n" +
                         "and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe\n" +
                         "and sb1.TenSanBay = ? and sb2.TenSanBay = ? and NgayDi = ? and dscb.SoLuongVeCon >0" ;
        try {
            pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, sanBayDi);
            pstmt.setString(2, sanBayDen);
            pstmt.setDate(3, ngayKH);
            rs = pstmt.executeQuery();
            if(rs.next() == false){
                taoChuyenBay(sanBayDi, sanBayDen, ngayKH);
                ds = timKiemMotChieu(sanBayDi, sanBayDen, ngayKH);
            }
            else{
                while (rs.next()) {
                    noiDi = rs.getString("SanBayDi");
                    noiDen = rs.getString("SanBayDen");
                    tenHang = rs.getString("TenHang");
                    ngayDi = rs.getDate("NgayDi");
                    gioDi = rs.getTime("GioDi");
                    gioDen = rs.getTime("GioDen");
                    tongTien = rs.getInt("TongTien");
                    maDSChuyenBay = rs.getInt("MaDSChuyenBay");
                    ds.add(new ChuyenBay(noiDi,noiDen,gioDi,gioDen,tenHang,ngayDi,tongTien,maDSChuyenBay));
                }
            }
        sql = "Select  sb1.TenSanBay as SanBayDi , sb2.TenSanBay as SanBayDen , NgayDi , TenHang , GioDi , GioDen , dscb.TongTien \n" +
                "from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,\n" +
                "HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv\n" +
                "where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen\n" +
                "and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = tbh.MaHang \n" +
                "and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay\n" +
                "and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe\n" +
                "and sb1.TenSanBay = ? and sb2.TenSanBay = ? and NgayDi = ? and dscb.SoLuongVeCon >0" ;
        try {
            pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, sanBayDen);
            pstmt.setString(2, sanBayDi);
            pstmt.setDate(3, ngayVe);
            rs = pstmt.executeQuery();
            if(rs.next() == false){
                taoChuyenBay(sanBayDen, sanBayDi, ngayVe);
               ds = timKiemMotChieu(sanBayDen, sanBayDi, ngayVe);
            }
            else{
                while (rs.next()) {
                    noiDi = rs.getString("SanBayDi");
                    noiDen = rs.getString("SanBayDen");
                    tenHang = rs.getString("TenHang");
                    ngayDi = rs.getDate("NgayDi");
                    gioDi = rs.getTime("GioDi");
                    gioDen = rs.getTime("GioDen");
                    tongTien = rs.getInt("TongTien");

                    ds.add(new ChuyenBay(noiDi,noiDen,gioDi,gioDen,tenHang,ngayDi,tongTien,maDSChuyenBay));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        }catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                pstmt.close();
                rs.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ds;
    }   
    public void taoChuyenBay(String sanBayDi , String sanBayDen , Date ngayKH) {
        ketNoi();
        Vector<ChuyenBay> ds = new Vector<ChuyenBay>();
        try {
            cstmt = connect.prepareCall(" { call TaoChuyenBay (?,?,?,?) }");
            cstmt.setString(1, sanBayDi);
            cstmt.setString(2, sanBayDen);
            cstmt.setDate(3, ngayKH);
            cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
            cstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                cstmt.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public ChuyenBay chiTietChuyenBay(int maDSCB){
       ChuyenBay cb = null ;
       ketNoi();
        String sql = "Select  sb1.TenSanBay as SanBayDi , sb2.TenSanBay as SanBayDen , TenMayBay ,mb.MaMayBay,TenHangVe,NgayDi , TenHang , GioDi , GioDen , dscb.TongTien \n" +
                         "from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,\n" +
                         "HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv\n" +
                         " where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen\n" +
                         "and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = tbh.MaHang \n" +
                         "and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay\n" +
                         "and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe\n" +
                         "and dscb.MaDSChuyenBay = ? " ;
        try {
            pstmt = connect.prepareStatement(sql);
            pstmt.setInt(1, maDSCB);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                noiDi = rs.getString("SanBayDi");
                noiDen = rs.getString("SanBayDen");
                tenHang = rs.getString("TenHang");
                ngayDi = rs.getDate("NgayDi");
                gioDi = rs.getTime("GioDi");
                gioDen = rs.getTime("GioDen");
                tongTien = rs.getInt("TongTien");
                maDSChuyenBay = maDSCB;
                tenMayBay = rs.getString("TenMayBay");
                tenHangVe= rs.getString("TenHangVe");
                maMayBay = rs.getString("MaMayBay");
                cb = new ChuyenBay(noiDi, noiDen, gioDi, gioDen, tenHang, ngayDi, tongTien, maDSChuyenBay,tenMayBay,tenHangVe,maMayBay);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cb;
   }
    public Vector<ChuyenBay> layGheNgoi(String maMB){
        Vector<ChuyenBay> vector = new Vector<ChuyenBay>();
       ketNoi();
        String sql = "Select TenGhe,MaMayBay from MayBay mb inner join SoDoGhe sdg on mb.MaSoDo = sdg.MaSoDo \n" +
"			inner join Ghe g on g.MaSoDo = sdg.MaSoDo where mb.MaMayBay = ? " ;
        try {
            pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, maMB);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                maMayBay = rs.getString("MaMayBay");
                tenGhe = rs.getString("TenGhe");
                vector.add(new ChuyenBay(maMayBay,tenGhe));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBay.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
