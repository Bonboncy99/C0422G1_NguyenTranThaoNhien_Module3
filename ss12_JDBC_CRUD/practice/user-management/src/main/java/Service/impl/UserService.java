package Service.impl;

import Service.IUserService;
import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean update(int id, User user) {
        return userRepository.update(id,user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }
}
