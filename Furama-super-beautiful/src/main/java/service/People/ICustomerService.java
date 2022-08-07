package service.People;

import model.people.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> FindAll();
    boolean addCustomer(Customer customer);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer findById(int id);
}
