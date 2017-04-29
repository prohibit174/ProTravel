package travel.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.main.model.LoginDao;
import travel.users.model.Users;


public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		LoginDao dao = LoginDao.getInstance();
		Users dbusers = null;
		Users users = new Users();
		
		users.setU_id(request.getParameter("u_id"));
		System.out.println(request.getParameter("u_id"));
		users.setU_pwd(request.getParameter("u_pwd"));
		
		dbusers = dao.loginCheck(users);
		
		
		ActionForward forward = new ActionForward();
		
		
		 if(dbusers==null){ // �α��� ����
	         response.setContentType("text/html;charset=utf-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('���̵� �Ǵ� ��й�ȣ�� Ȯ���ϼ���');");
	         out.println("location.href='/login.main';");
	         out.println("</script>");
	         out.close();
	      }else{ //����
	         HttpSession session = request.getSession(false);
	           if(session != null){ 
	               session.invalidate(); 
	              }
	           session = request.getSession(true); 
	           
	           session.setAttribute("member_id", dbusers.getU_id());// ���̵� ���� ����
	         forward.setRedirect(false);
	         forward.setPath("test.jsp");
	      }
	
		 return forward;
	}
}
