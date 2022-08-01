package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    boolean add(User user);
    boolean update(int id, User user);
    boolean delete(int id);
    User findById(int id);
}