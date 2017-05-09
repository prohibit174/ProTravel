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
		
		carpool.setC_num(dao.carpool_num() + 1);
		carpool.setU_id((String)session.getAttribute("member_id"));
		System.out.println(request.getParameter("start_point"));
		carpool.setStart_point(request.getParameter("start_point"));
		carpool.setDest_point(request.getParameter("dest_point"));
		carpool.setWay_point(request.getParameter("way_point"));
		carpool.setC_price(Integer.parseInt(request.getParameter("c_price")));
		carpool.setC_person(Integer.parseInt(request.getParameter("c_person")));
		carpool.setC_year(Integer.parseInt(request.getParameter("c_year")));
		carpool.setC_month(Integer.parseInt(request.getParameter("c_month")));
		carpool.setC_date(Integer.parseInt(request.getParameter("c_date")));
		carpool.setC_hour(Integer.parseInt(request.getParameter("c_hour")));
		carpool.setC_minute(Integer.parseInt(request.getParameter("c_minute")));
		

		
		
		dao.insertCarpool(carpool);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("list.carpool");

		
		return forward;
	}

}
