package travel.product.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertReqFormAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
			System.out.println("method in");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ProductDeal/product_request.jsp");
		
		return forward;
	}


}


