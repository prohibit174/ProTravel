package travel.product.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		ActionForward forward = new ActionForward();
	
		forward.setRedirect(false);
		forward.setPath("ProductDeal/product_list.jsp");

		return forward;
	}

}
