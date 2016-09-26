package dongho.clothes.service;

import java.util.List;

import dongho.clothes.domain.Product;

public interface HostService {
	List<Product> getProducts();
	
	boolean addProduct(Product product);
}
