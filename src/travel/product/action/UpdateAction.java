package travel.product.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import travel.product.model.ImageUtil;
import travel.product.model.Product;
import travel.product.model.ProductDao;

public class UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {

		String uploadPath = request.getRealPath("upload");
		int size = 20 * 1024 * 1024; //20MB
	
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, 
									"utf-8", new DefaultFileRenamePolicy());
		
		String p_num = multi.getParameter("p_num");
		String p_img = "";
		
		ProductDao dao = ProductDao.getInstance();
		Product product = dao.detailProduct(p_num);
		//파일 업로드
				if(multi.getFilesystemName("p_img") != null){
					System.out.println("method in");
					p_img = multi.getFilesystemName("p_img");
					System.out.println(p_img);
					product.setP_img(p_img);

					//썸네일 이미지(jpg, gif) aaa.gif -> aaa_small.gif
					String pattern = p_img.substring(p_img.lastIndexOf(".")+1);
					String headName = p_img.substring(0, p_img.lastIndexOf("."));
					
					//원본 File객체
					String imagePath = uploadPath+"\\"+p_img;
					File src = new File(imagePath);
					
					//썸네일이미지 -> file객체
					String thumImagePath = uploadPath+"\\" +headName+"_small."+pattern;
					File dest = new File(thumImagePath);
					
					if(pattern.equals("jpg") || pattern.equals("gif") || pattern.equals("png")){
						ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
					}
					
				}else{
					product.setP_img("");
					System.out.println("img안들어감");
				}
				
				product.setP_num(p_num);
				System.out.println(p_num);
				dao.updateProduct(product);	
				
				//request.setAttribute("product", product);
				
				
				ActionForward forward = new ActionForward();

				forward.setRedirect(false);
				forward.setPath("ProductDeal/product_updateOk.jsp");
				return forward;
				
	}

}
