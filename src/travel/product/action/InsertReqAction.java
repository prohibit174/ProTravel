package travel.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.product.model.ProductDao;
import travel.product.model.Product_Request;

public class InsertReqAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		ProductDao dao = ProductDao.getInstance();
		Product_Request proReq = new Product_Request();
		
		proReq.setPr_reqnum(request.getParameter("pr_reqnum"));

		proReq.setU_id(request.getParameter("u_id"));
		proReq.setPr_date(request.getParameter("pr_date"));
		proReq.setPr_ox(request.getParameter("pr_ox"));
		proReq.setPr_place(request.getParameter("pr_place"));
		proReq.setP_num(request.getParameter("p_num"));
		
		
		dao.insertProductReq(proReq);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ProductDeal/product_requestOk.jsp");
		// ���ο� ��û�� ���ؼ� jsp�� �̵��ؾ��ϱ� ������ true ��� �ٲپ��ش�.
		
		return forward;
	}

}
