package travel.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.product.model.ProductDao;
import travel.product.model.Product_Request;

public class ProductRequestListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		HttpSession session = request.getSession();
		String u_id = session.getAttribute("member_id").toString();
		ProductDao dao = ProductDao.getInstance();
		
		List<Product_Request> list = dao.listProductRequest(u_id);
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("MyPage/mypage_productRequestList.jsp");
		
		return forward;
	}

}

