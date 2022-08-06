package customer.repository;

import customer.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean update(int id, Customer customer);
    void delete(int id);
    Customer findById(int id);
}
