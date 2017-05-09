package travel.product.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import travel.product.model.Product;
import travel.product.model.Product_Request;
import travel.product.model.Product_Search;

public interface TravelMapper {

	int insertProduct(Product product);
	List<Product> listProduct(Product_Search proSearch);
	Product detailProduct(String p_num);
	int updateProduct(Product product);
	int deleteProduct(Product product);
	Product_Request detailProductReq(String p_num);
	int insertProductReq(Product_Request proReq);
	List<Product> listProduct(RowBounds rowBounds, Product_Search proSearch);
	List<Product_Request> listProductRequest(String u_id);
	int countProduct(Product_Search product_search);
	int updateAccept(Product_Request proReq);
	List<Product_Request> listProductAccept(String u_id);


}
