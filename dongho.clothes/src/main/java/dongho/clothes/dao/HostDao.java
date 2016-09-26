package dongho.clothes.dao;

import java.util.List;

import dongho.clothes.domain.Product;

public interface HostDao {
	List<Product> getProducts();
	
	int addProduct(Product product);
}
