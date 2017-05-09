package travel.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.carpool.model.Carpool;
import travel.carpool.model.CarpoolDao;

public class CarpoolUpdateAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		int person = Integer.parseInt(request.getParameter("c_person"));
		
		String num = request.getParameter("c_num");
		String start_longti = request.getParameter("start_longti");
		String start_lati = request.getParameter("start_lati");
		String dest_longti = request.getParameter("dest_longti");
		String dest_lati = request.getParameter("dest_lati");
		

		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool carpool = dao.detailCarpool(num);
		System.out.println(carpool.getC_num());
		
		carpool.setDest_longti(dest_longti);
		carpool.setStart_lati(start_lati);
		carpool.setStart_longti(start_longti);
		carpool.setDest_lati(dest_lati);
		carpool.setC_person(person);
		
		dao.updateCarpool(carpool);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("carpoolCheck.mypage"); 
		return forward;
	}

}
