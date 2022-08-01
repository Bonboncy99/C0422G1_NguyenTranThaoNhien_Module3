package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//" select* from users where id = 1;"
public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "select * from users";
    private final String INSERT_INTO = "insert into users (name,email,country) value(?,?,?)";
    private final String SELECT_BY_ID = "select* from users where id = ?";
    private static final String DELETE= "delete from users where id = ?;";
    private final String UPDATE_BY_ID = " update users set name = ?,email = ?,country = ? where id = ?";
    @Override
    public List<User> findAll() {
        List<User>userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id,name,email,country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean add(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int check = preparedStatement.executeUpdate();
            return (check==1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.setInt(4,id);

            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findById(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idRt = resultSet.getInt("id");
                String nameRt = resultSet.getString("name");
                String emailRt = resultSet.getString("email");
                String countryRt = resultSet.getString("country");
                user = new User(idRt,nameRt,emailRt,countryRt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
