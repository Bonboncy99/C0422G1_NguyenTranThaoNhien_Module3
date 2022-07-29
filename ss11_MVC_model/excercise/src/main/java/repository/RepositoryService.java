package repository;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RepositoryService implements IRepositoryService{

    private static Map<Integer,Product> productMap = new HashMap<>();
    static {
        productMap.put(1,new Product(1,"Banh", 10, "aaaaa","VN"));
        productMap.put(2,new Product(2,"Keo", 30, "bbbbb","TQ"));
        productMap.put(3,new Product(3,"Sua", 20, "ccccc","NB"));
        productMap.put(4,new Product(4,"Thit", 50, "dddddd","HQ"));
        productMap.put(5,new Product(5,"Ca", 40, "eeeee","VN"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values()) ;
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public Product productDetail(int id) {
        return null;
    }
}
