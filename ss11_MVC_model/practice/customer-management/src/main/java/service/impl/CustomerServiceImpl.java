package service.impl;

import model.Customer;
import service.CustomerService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer,Customer>customerMap = new HashMap<>();
    static {
        customerMap.put(1,new Customer(1,"Bon","thaonhien9991@gmail.com","Quang Tri"));
        customerMap.put(2,new Customer(2,"Nhien","junghoseokbon@gmail.com","QT"));
        customerMap.put(3,new Customer(3,"CY","wonwoobon@gmail.com","Quang Tri"));
        customerMap.put(4,new Customer(4,"Boncy","yoshibon@gmail.com","QT"));
        customerMap.put(5,new Customer(5,"Ben","wonwoo@gmail.com","QT"));
        customerMap.put(6,new Customer(6,"Yeon","suga@gmail.com","Quang Tri"));
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public void save(Customer customer) {
        customerMap.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }


    @Override
    public void update(int id, Customer customer) {
        customerMap.put(id,customer);
    }

    @Override
    public void remove(int id) {
        customerMap.remove(id);
    }
}
