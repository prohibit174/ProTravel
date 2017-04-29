package travel.carpool.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.carpool.action.Action;
import travel.carpool.action.ActionForward;
import travel.carpool.action.InsertAction;
import travel.carpool.action.InsertFormAction;
import travel.product.action.insertAction;

@WebServlet("*.carpool")
public class CarpoolController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
   
    public CarpoolController() {
        super();
    }

    //요청과 관련된 것들은 request가 가지고 있다.
    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //요청되는 URL이 무엇인지 확인해본다. getRequestURI메서드를 통해서
       String requestURI = request.getRequestURI();
       //System.out.println(requestURI);
       String contextPath = request.getContextPath();
       String command = requestURI.substring(contextPath.length()+1);
       System.out.println(command);
       
       ActionForward forward = null;
       Action action = null;
       
       //insertForm.carpool로 요청되어지면
       if(command.equals("insertForm.carpool")){
          //insertFormAction()을 만든다 : 역할 jsp로가는메소드
          action = new InsertFormAction();
          //insert.form.jsp로 가겠다.
          try {
             forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
         //커맨드 값이 마으면 거기에 맞는 액션을 호출하면 된다.
       }else if(command.equals("insertAction.carpool")){
           action = new InsertAction();
           try {
             forward = action.execute(request, response);   
          } catch (Exception e) {
             e.printStackTrace();
          }
       }
       
       if(forward !=null){
          if(forward.isRedirect()){
             //getPath로 setPath했던 경로를 얻어 올 수 있다.
             response.sendRedirect(forward.getPath());
          } else {
             //Dispathcer : 기존요청의 연장선 그 요청으로 jsp로 가겠다.
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