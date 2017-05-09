package travel.carpool.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.carpool.model.Carpool;
import travel.carpool.model.CarpoolDao;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool carpool = new Carpool();
		HttpSession session = request.getSession();
		
		int person = Integer.parseInt(request.getParameter("c_person"));
		
		carpool.setC_num(dao.carpool_num() + 1);
		carpool.setU_id((String)session.getAttribute("member_id"));
		System.out.println((String)session.getAttribute("member_id"));
		carpool.setStart_lati(request.getParameter("start_lati"));
		carpool.setStart_longti(request.getParameter("start_longti"));
		carpool.setDest_lati(request.getParameter("dest_lati"));
		carpool.setDest_longti(request.getParameter("dest_longti"));
		carpool.setC_person(person);
		
		dao.insertCarpool(carpool);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("list.carpool");

		
		return forward;
	}

}
