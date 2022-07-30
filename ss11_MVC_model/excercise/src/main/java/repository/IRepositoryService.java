package repository;

import model.Product;

import java.util.List;

public interface IRepositoryService {
    List<Product> findAll();
    void update(int id,Product product);
    void delete(int id);
    void add(Product product);
    Product findById(int id);
    Product productDetail(int id);
    List<Product> searchByName(String name);
}
