package service;

import model.Product;
import repository.IRepositoryService;
import repository.RepositoryService;

import java.util.List;

public class ProductService implements IProductService{
    IRepositoryService repositoryService = new RepositoryService();
    @Override
    public List<Product> findAll() {
        return  repositoryService.findAll();
    }

    @Override
    public void add(Product product) {
            repositoryService.add(product);
    }

    @Override
    public Product findById(int id) {

       return repositoryService.findById(id);
    }

    @Override
    public void update(int id,Product product) {
            repositoryService.update(id,product);
    }

    @Override
    public void delete(int id) {
        repositoryService.delete(id);
    }


    @Override
    public Product productDetail(int id) {
        return null;
    }
}
