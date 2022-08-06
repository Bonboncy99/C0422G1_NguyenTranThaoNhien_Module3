package customer.service;

import customer.model.Customer;

import java.awt.*;
import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean update(int id, Customer customer);
    void delete(int id);
    Customer findById(int id);
}
