package customer.repository.impl;

import customer.model.Customer;
import customer.repository.BaseRepository;
import customer.repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String FIND_ALL_CUSTOMER= "select * from khach_hang";
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
                LocalDate ngaySinh = LocalDate.parse(resultSet.getString("ngay_sinh"));
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
        return false;
    }

    @Override
    public boolean update(int id, Customer customer) {
        return false;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Customer findById(int id) {
        return null;
    }
}
