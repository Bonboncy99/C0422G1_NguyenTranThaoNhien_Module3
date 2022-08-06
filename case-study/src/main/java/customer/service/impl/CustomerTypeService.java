package customer.service.impl;

import customer.model.Customer;
import customer.model.CustomerType;
import customer.repository.ICustomerTypeRepository;
import customer.repository.impl.CustomerTypeRepository;
import customer.service.ICustomerType;

import java.util.List;

public class CustomerTypeService implements ICustomerType {
    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }

    @Override
    public boolean add(CustomerType customerType) {
        return customerTypeRepository.add(customerType);
    }

    @Override
    public boolean update(int id, CustomerType customerType) {
        return customerTypeRepository.update(id,customerType);
    }

    @Override
    public void delete(int id) {
        customerTypeRepository.delete(id);
    }

}
