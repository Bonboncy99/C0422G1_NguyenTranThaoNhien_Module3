package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.util.*;

public class CustomerRepository implements ICustomerRepository {
    private static Map<Integer,Customer> customerMap;
    static {
        customerMap = new HashMap<>();
        customerMap.put(1, new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customerMap.put(2, new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customerMap.put(3, new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customerMap.put(4, new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customerMap.put(5, new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customerMap.put(6, new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public void add(Customer customer) {
        customerMap.put(customer.getId(),customer);
    }

    @Override
    public void update(int id, Customer customer) {
        customerMap.put(id,customer);
    }

    @Override
    public void delete(int id) {
        customerMap.remove(id);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }

    @Override
    public List<Customer> findByName(String name) {
        List<Customer>customerList=new ArrayList<>(customerMap.values());
        List<Customer> result = new ArrayList<>();
        for (int i = 0; i < customerList.size(); i++) {
            if (customerList.get(i).getName().contains(name)){
                result.add(customerList.get(i));
            }
        }
        return result;
    }
}
