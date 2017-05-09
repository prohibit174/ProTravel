package travel.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.users.model.Users;
import travel.users.model.UsersDao;

public class ModifyUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		HttpSession session = request.getSession();
		String u_id = session.getAttribute("member_id").toString();
		
		UsersDao dao = UsersDao.getInstance();
		
		Users users = dao.userDetail(u_id);
		
		users.setU_pwd(request.getParameter("u_pwd"));
		users.setU_license(request.getParameter("u_license"));
		users.setU_address(request.getParameter("u_address"));
		users.setU_job(request.getParameter("u_job"));
		users.setU_lang(request.getParameter("u_lang"));
		users.setU_religion(request.getParameter("u_religion"));
		users.setU_style(request.getParameter("u_style"));
		
		dao.userUpdate(users);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("home.main");
		System.out.println("modifyAction");
		
		
		return forward;
	}

}
