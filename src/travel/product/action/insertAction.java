package travel.product.action;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.product.model.ImageUtil;
import travel.product.model.Product;
import travel.product.model.ProductDao;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class insertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, Exception  {
		System.out.println("method in");
		
		ProductDao dao = ProductDao.getInstance();
		Product product = new Product();
		
		System.out.println(request.getParameter("p_num"));

		String uploadPath = request.getRealPath("upload");
		int size = 20 * 1024 * 1024; //20MB
	
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, 
									"utf-8", new DefaultFileRenamePolicy());
	
				if(multi.getFilesystemName("p_img") != null){
					String p_img = multi.getFilesystemName("p_img");
					product.setP_img(p_img);

				
					String pattern = p_img.substring(p_img.lastIndexOf(".")+1);
					String headName = p_img.substring(0, p_img.lastIndexOf("."));
					
				
					String imagePath = uploadPath+"\\"+p_img;
					File src = new File(imagePath);
					
					
					String thumImagePath = uploadPath+"\\" +headName+"_small."+pattern;
					File dest = new File(thumImagePath);
					
					if(pattern.equals("jpg") || pattern.equals("gif") || pattern.equals("png")){
						ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
					}
					
				}else{
					product.setP_img("");
					System.out.println("imgnono");
				}
				
				
		
		product.setP_num(multi.getParameter("p_num"));
		product.setU_id(multi.getParameter("u_id"));
		product.setP_detail(multi.getParameter("p_detail"));
		product.setP_price(multi.getParameter("p_price"));	
		product.setp_name(multi.getParameter("p_name"));
		product.setP_term(multi.getParameter("p_term"));
		product.setP_ox(multi.getParameter("p_ox"));

		
		dao.insertProduct(product);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ProductDeal/product_registerOk.jsp");
	
		
		return forward;
	}

}
