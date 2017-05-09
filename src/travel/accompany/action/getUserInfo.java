package travel.accompany.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.accompany.model.Accompany;
import travel.accompany.model.AccompanyDao;

public class getUserInfo implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		AccompanyDao dao = AccompanyDao.getInstance();
		
		
		
		
		List<Accompany> list = dao.getUserInfo("0");
		//request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		//forward.setRedirect(false);
		//forward.setPath("ProductDeal/product_list.jsp");
		
		return forward;
	}

}


