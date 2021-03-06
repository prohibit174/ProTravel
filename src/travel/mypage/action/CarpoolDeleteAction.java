package travel.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.carpool.model.Carpool;
import travel.carpool.model.CarpoolDao;
import travel.carpool.model.Carpool_Request;
import travel.carpool.model.Search;

public class CarpoolDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		String c_num = request.getParameter("c_num");

		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool carpool = dao.detailCarpool(c_num);
		
		dao.deleteCarpool(carpool);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("carpoolCheck.mypage");
		return forward;
	}

}
