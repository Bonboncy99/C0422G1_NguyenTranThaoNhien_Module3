package customer.repository.impl;

import customer.model.Customer;
import customer.model.CustomerType;
import customer.repository.BaseRepository;
import customer.repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private final String FIND_ALL_CUSTOMER_TYPE = "select * from loai_khach";
    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maLoaiKhach = resultSet.getInt("ma_loai_khach");
                String tenLoaiKhach = resultSet.getString("ten_loai_khach");
                CustomerType customerType = new CustomerType(maLoaiKhach,tenLoaiKhach);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public boolean add(CustomerType customerType) {
        return false;
    }

    @Override
    public boolean update(int id, CustomerType customerType) {
        return false;
    }

    @Override
    public void delete(int id) {

    }
}
