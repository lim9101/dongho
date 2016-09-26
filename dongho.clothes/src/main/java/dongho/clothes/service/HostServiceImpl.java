package dongho.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongho.clothes.dao.HostDao;
import dongho.clothes.domain.Product;

@Service
public class HostServiceImpl implements HostService{
	@Autowired private HostDao hostDao;
	
	public List<Product> getProducts(){
		return hostDao.getProducts();
	}
	
	public boolean addProduct(Product product){
		return hostDao.addProduct(product)>0;
	}
}
