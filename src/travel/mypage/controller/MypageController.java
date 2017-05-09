package travel.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.mypage.action.Action;
import travel.mypage.action.ActionForward;
import travel.mypage.action.CarpoolDeleteAction;
import travel.mypage.action.CarpoolListAction;
import travel.mypage.action.CarpoolUpdateAction;
import travel.mypage.action.CarpoolUpdateAction2;
import travel.mypage.action.MypageMainAction;
import travel.mypage.action.ProductRequestListAction;
import travel.mypage.action.UpdateAcceptAction;
import travel.mypage.action.UpdateUserAction;


@WebServlet("*.mypage")
public class MypageController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
   
    public MypageController() {
        super();
    }

   
    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
       String requestURI = request.getRequestURI();
       String contextPath = request.getContextPath();
       String command = requestURI.substring(contextPath.length()+1);
       System.out.println(command);
       
       ActionForward forward = null;
       Action action = null;
       

       if(command.equals("carpoolCheck.mypage")){
          action = new CarpoolListAction();
          try {
             forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
       } else if (command.equals("carpoolDelete.mypage")) {
			action = new CarpoolDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("carpoolUpdate.mypage")){
			action = new CarpoolUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if (command.equals("carpoolUpdate2.mypage")){
			action = new CarpoolUpdateAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("UpdateUserAction.mypage")){
			action = new UpdateUserAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("main.mypage")){
			action = new MypageMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}    else if (command.equals("productRequestList.mypage")){
			action = new ProductRequestListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("updateAcceptAction.mypage")){
			action = new UpdateAcceptAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
       
    
       
       
       
       if(forward !=null){
          if(forward.isRedirect()){
             response.sendRedirect(forward.getPath());
          } else {
              RequestDispatcher dispatcher = 
                    request.getRequestDispatcher(forward.getPath());
              dispatcher.forward(request, response);
          }
       }
       
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

}