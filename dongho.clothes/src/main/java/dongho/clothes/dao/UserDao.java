package dongho.clothes.dao;

import java.util.List;

import dongho.clothes.domain.User;

public interface UserDao {
	List<User> getUsers();
	User getUser(String id);
	int addUser(User user);
	int updateUser(User user);
	
}
