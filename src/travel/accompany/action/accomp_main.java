package travel.accompany.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.accompany.model.Accompany;
import travel.accompany.model.AccompanyDao;
import travel.accompany.model.Route;

public class accomp_main implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("Accompany/Accomp_main.jsp");
		
		return forward;
	}

}


