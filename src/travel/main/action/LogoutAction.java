package travel.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import net.sf.json.JSONArray;

import travel.main.model.LoginDao;
import travel.users.model.Users;


public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		ActionForward forward = new ActionForward();
		
//����

	         forward.setRedirect(false);
	         forward.setPath("logoutAction2.main");
	         
	      
	
		 return forward;
	}
}
