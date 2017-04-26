package travel.carpool.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.carpool.action.Action;
import travel.carpool.action.ActionForward;
import travel.carpool.action.AddFormAction;



@WebServlet( "*.carpool" )
public class CarpoolController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CarpoolController() {
        super();
    }
    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //��û�Ǵ� URL�� �������� Ȯ���غ���. getRequestURI�޼��带 ���ؼ�
        String requestURI = request.getRequestURI();
        //System.out.println(requestURI);
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length()+1);
        System.out.println(command);
        
        ActionForward forward = null;
        Action action = null;
        
        if(command.equals("capool_add.carpool")){
            //insertFormAction()�� ����� : ���� jsp�ΰ��¸޼ҵ�
            action = new AddFormAction();
            //insert.form.jsp�� ���ڴ�.
            try {
               forward = action.execute(request, response);
           } catch (Exception e) {
              e.printStackTrace();
           }
           //Ŀ�ǵ� ���� ������ �ű⿡ �´� �׼��� ȣ���ϸ� �ȴ�.
         }
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
