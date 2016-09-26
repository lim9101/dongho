package dongho.clothes.dao.mapper;

import java.util.List;

import dongho.clothes.domain.User;

public interface UserMapper {
	List<User> getUsers();
	User getUser(String id);
	int addUser(User user);
	int updateUser(User user);
}
