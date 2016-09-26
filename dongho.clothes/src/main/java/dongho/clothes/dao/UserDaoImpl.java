package dongho.clothes.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongho.clothes.dao.mapper.UserMapper;
import dongho.clothes.domain.User;
@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMapper userMapper;
	
	public List<User> getUsers(){
		return userMapper.getUsers();
	}
	public User getUser(String id){
		return userMapper.getUser(id);
	}
	public int addUser(User user){
		return userMapper.addUser(user);
	}
	
	public int updateUser(User user){
		return userMapper.updateUser(user);
	}
}
