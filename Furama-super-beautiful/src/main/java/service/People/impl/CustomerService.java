package service.People.impl;

import model.people.Customer;
import repository.people.ICustomerRepository;
import repository.people.impl.CustomerRepository;
import service.People.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> FindAll() {
        return customerRepository.FindAll();
    }

    @Override
    public boolean addCustomer(Customer customer) {
        return customerRepository.addCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public List<Customer> searchCustomer(String name, String phone, String email, String customerTypeId) {
        return customerRepository.searchCustomer(name,phone,email,customerTypeId);
    }


}
