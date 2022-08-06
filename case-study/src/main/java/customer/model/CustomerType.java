package customer.model;

public class CustomerType {
    int maLoaiKhach;
    String tenLoaiKhach;

    public CustomerType() {
    }

    public CustomerType(int ma_khach_hang, String ten_ma_khach) {
        this.maLoaiKhach = ma_khach_hang;
        this.tenLoaiKhach = ten_ma_khach;
    }


    public int getMa_loai_khach() {
        return maLoaiKhach;
    }

    public void setMa_loai_khach(int ma_loai_khach) {
        this.maLoaiKhach = ma_loai_khach;
    }

    public String getTenLoaiKhach() {
        return tenLoaiKhach;
    }

    public void setTenLoaiKhach(String tenLoaiKhach) {
        this.tenLoaiKhach = tenLoaiKhach;
    }
}
