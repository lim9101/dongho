package dongho.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongho.clothes.dao.UserDao;
import dongho.clothes.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	public List<User> getUsers(){
		return userDao.getUsers();
	}
	public User getUser(String id){
		return userDao.getUser(id);
	}
	
	public boolean check(String userId, String pw){
		boolean result = false;
		User user = userDao.getUser(userId);
		if(user !=null){
			result = pw.equals(user.getPw());
		}
		return result;
	}
	
	public boolean addUser(User user){
		return userDao.addUser(user)>0;
	}
	
	public boolean updateUser(User user){
		return userDao.updateUser(user)>0;
	}
	
}
