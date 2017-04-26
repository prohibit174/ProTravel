package travel.carpool.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.carpool.model.Carpool;
import travel.carpool.model.CarpoolDao;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		CarpoolDao dao = CarpoolDao.getInstance();
		Carpool carpool = new Carpool();

		carpool.setStart_lati(request.getParameter("start_lati"));
		System.out.println(request.getParameter("start_lati"));
		
		dao.insertCarpool(carpool);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("test.jsp");
		// ���ο� ��û�� ���ؼ� jsp�� �̵��ؾ��ϱ� ������ true ��� �ٲپ��ش�.
		
		return forward;
	}

}
