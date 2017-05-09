package travel.mypage.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import travel.product.model.ProductDao;
import travel.product.model.Product_Request;

public class UpdateAcceptAction implements Action {
   
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
      
	   
      String pr_reqnum = request.getParameter("pr_reqnum");
 
      System.out.println(pr_reqnum);
      
      ProductDao dao = ProductDao.getInstance();   
      Product_Request proReq = dao.detailProductReq(pr_reqnum);
      System.out.println(proReq.getPr_reqnum());
      System.out.println(proReq.getU_id());
      System.out.println(proReq.getP_num());
      System.out.println(proReq.getPr_ox());
      System.out.println(proReq.getPr_date());
      System.out.println(proReq.getPr_place());
      
      proReq.setPr_ox("o");

      dao.updateAccept(proReq);
     
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(true);
      forward.setPath("productRequestList.mypage");
      return forward;
        
      
   }

}