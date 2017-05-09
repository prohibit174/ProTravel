package travel.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import travel.carpool.model.CarpoolDao;
import travel.carpool.model.Carpool_Request;

public class CarpoolRequestDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		String cr_num = request.getParameter("cr_num");
		System.out.println(cr_num);

		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool_Request carpool_request = dao.detailCarpool_Request(cr_num);
		
		dao.deleteCarpool_Request(carpool_request);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("carpoolCheck.mypage");
		return forward;
	}

}
