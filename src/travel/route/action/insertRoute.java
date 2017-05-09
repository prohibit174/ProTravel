package travel.route.action;

import java.io.File;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import travel.route.model.Route;
import travel.route.model.RouteDao;


public class insertRoute implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		RouteDao dao = RouteDao.getInstance();
		
		String id =(String)request.getSession().getAttribute("member_id");
		String json=request.getParameter("json");
		/*System.out.println(json);*/
		//for(int i=0;i<jsonArray.size())
		//jsonArray.add(index, value);
		  
	  	  Object obj = JSONValue.parseWithException(json);
	      JSONArray jsonArray = (JSONArray)obj;
	      
	      for(int i=0;i<jsonArray.size();i++) {
	    	  Route route = new Route();
	    	  JSONObject rstJson = (JSONObject)jsonArray.get(i);
	  		  Random r=new Random();
	  		  int random=r.nextInt(100000000);
	  		  route.setTp_num(random+"");
	    	  route.setU_id(id);
	    	  route.setCor_region(rstJson.get("title").toString());
	    	  //route.setTp_date(rstJson.get("date").toString());
	    	  route.setTp_date(rstJson.get("eventdate").toString());
	    	  dao.insertRoute(route);
	      }
		//System.out.println("title : "+request.getParameter("title"));

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.accompany");
		return forward;
	}

}
