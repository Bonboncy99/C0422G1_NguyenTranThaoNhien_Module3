package customer.service;

import customer.model.Customer;
import customer.model.CustomerType;

import java.util.List;

public interface ICustomerType {
    List<CustomerType> findAll();
    boolean add(CustomerType customerType);
    boolean update(int id, CustomerType customerType);
    void delete(int id);

}
