package dongho.clothes.service;

import java.util.List;

import dongho.clothes.domain.User;

public interface UserService {
	List<User> getUsers();
	User getUser(String id);
	boolean check(String userId, String pw);
	
	boolean addUser(User user);
	boolean updateUser(User user);
}
