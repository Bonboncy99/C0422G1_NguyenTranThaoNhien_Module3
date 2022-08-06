package customer.repository.impl;

import customer.model.Customer;
import customer.repository.BaseRepository;
import customer.repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String FIND_ALL_CUSTOMER= "select * from khach_hang";
    private String ADD_CUSTOMER= "insert into khach_hang(ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) " +
            "value (?,?,?,?,?,?,?,?)";
    private String DELETE_CUSTOMER= "delete from khach_hang where ma_khach_hang = ?";
    private String FIND_BY_ID= "select * from khach_hang where ma_khach_hang  =?";
    private String UPDATE_CUSTOMER= "update khach_hang set ma_loai_khach =?,ho_ten=?,ngay_sinh = ?,gioi_tinh = ?,so_cmnd = ?,so_dien_thoai = ?,email=?,dia_chi=? where ma_khach_hang =?";

    @Override
    public List<Customer> findAll() {
        List<Customer>customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maKhachHang = resultSet.getInt("ma_khach_hang");
                int maLoaiKhach = resultSet.getInt("ma_loai_khach");
                String hoTen =resultSet.getString("ho_ten");
                String ngaySinh = resultSet.getString("ngay_sinh");
                boolean gioiTinh = resultSet.getBoolean("gioi_tinh");
                String soCmnd = resultSet.getString("so_cmnd");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String email =resultSet.getString("email");
                String diaChi = resultSet.getString("dia_chi");
                Customer customer = new Customer(maKhachHang,maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCmnd,soDienThoai,email,diaChi);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CUSTOMER);
            preparedStatement.setInt(1,customer.getMaLoaiKhach());
            preparedStatement.setString(2,customer.getHoTen());
            preparedStatement.setDate(3, Date.valueOf(customer.getNgaySinh()));
            preparedStatement.setBoolean(4,customer.isGioiTinh());
            preparedStatement.setString(5,customer.getSoCmnd());
            preparedStatement.setString(6,customer.getSoDienThoai());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getDiaChi());
            int check = preparedStatement.executeUpdate();
            return (check==1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1,customer.getMaLoaiKhach());
            preparedStatement.setString(2,customer.getHoTen());
            preparedStatement.setDate(3, Date.valueOf(customer.getNgaySinh()));
            preparedStatement.setBoolean(4,customer.isGioiTinh());
            preparedStatement.setString(5,customer.getSoCmnd());
            preparedStatement.setString(6,customer.getSoDienThoai());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getDiaChi());
            preparedStatement.setInt(9,id);

            int check = preparedStatement.executeUpdate();
            return (check==1);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maKhachHang = resultSet.getInt("ma_khach_hang");
                int maLoaiKhach = resultSet.getInt("ma_loai_khach");
                String hoTen =resultSet.getString("ho_ten");
                String ngaySinh = resultSet.getString("ngay_sinh");
                boolean gioiTinh = resultSet.getBoolean("gioi_tinh");
                String soCmnd = resultSet.getString("so_cmnd");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String email =resultSet.getString("email");
                String diaChi = resultSet.getString("dia_chi");
                 customer = new Customer(maKhachHang,maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCmnd,soDienThoai,email,diaChi);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}
