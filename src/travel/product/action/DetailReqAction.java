package travel.product.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.product.model.ProductDao;
import travel.product.model.Product_Request;

public class DetailReqAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
		String pr_reqnum = request.getParameter("pr_reqnum");
		System.out.println("action in");
		System.out.println(pr_reqnum);
		  
		   
		   ProductDao dao = ProductDao.getInstance();
		   Product_Request productReq = dao.detailProductReq(pr_reqnum);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("ProductDeal/product_detailReq.jsp");
		return forward;
	}


}


