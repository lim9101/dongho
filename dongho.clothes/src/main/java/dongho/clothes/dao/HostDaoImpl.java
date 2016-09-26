package dongho.clothes.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongho.clothes.dao.mapper.HostMapper;
import dongho.clothes.domain.Product;

@Repository
public class HostDaoImpl implements HostDao{
	@Autowired private HostMapper hostMapper;
	
	public List<Product> getProducts(){
		return hostMapper.getProducts();
	}
	
	public int addProduct(Product product){
		return hostMapper.addProduct(product);
	}
}
