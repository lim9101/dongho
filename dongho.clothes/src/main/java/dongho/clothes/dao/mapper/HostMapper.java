package dongho.clothes.dao.mapper;

import java.util.List;

import dongho.clothes.domain.Product;

public interface HostMapper {
	List<Product> getProducts();
	
	int addProduct(Product product);
}
