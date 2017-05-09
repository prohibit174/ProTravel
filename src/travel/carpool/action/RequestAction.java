package travel.carpool.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.carpool.model.Carpool;
import travel.carpool.model.CarpoolDao;
import travel.carpool.model.Carpool_Request;


public class RequestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool_Request carpool_request = new Carpool_Request();

		HttpSession session = request.getSession();
		String u_id = session.getAttribute("member_id").toString();
		String c_num = request.getParameter("c_num");
		
		carpool_request.setC_num(c_num);
		carpool_request.setCr_num(dao.carpool_Request_num()+1);
		carpool_request.setU_id(u_id);
		dao.insertCarpool_Request(carpool_request);
		
		Carpool carpool = dao.detailCarpool(c_num);
		dao.updatePerson(carpool);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("carpoolCheck.mypage");
		
		return forward;
	}

}
