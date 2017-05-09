package travel.product.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.product.model.ListModel;
import travel.product.model.Product;
import travel.product.model.ProductDao;
import travel.product.model.Product_Search;

public class ListAction implements Action {
	private static final int PAGE_SIZE = 8;
	
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException, Exception {
     
	   String pageNum = request.getParameter("pageNum");
	   if(pageNum == null){
	      pageNum = "1";
	   }
	   
	   int requestPage = Integer.parseInt(pageNum);
	   System.out.println(requestPage);
	   
		ActionForward forward = new ActionForward();
		ListModel listModel = productListPaging(request, requestPage);
		request.setAttribute("listModel", listModel);
		forward.setRedirect(false);
		forward.setPath("ProductDeal/product_list.jsp");
		return forward;
      

   }
   
   public ListModel productListPaging(HttpServletRequest request, int requestPage) throws Exception{
	    
	   ProductDao dao = ProductDao.getInstance();
	      
	      Product_Search proSearch =new Product_Search();
	      HttpSession session_list = request.getSession();

	      if(request.getParameter("temp") != null){
	         session_list.removeAttribute("search");
	      }
	      
	      if(request.getParameterValues("product_search") != null){
	    	  proSearch.setProduct_search(request.getParameterValues("product_search"));
		      proSearch.setSearchKey("%"+request.getParameter("searchKey")+"%");
	         session_list.setAttribute("search", proSearch);
	      }else if((Product_Search)session_list.getAttribute("search") != null){
	    	  proSearch = (Product_Search)session_list.getAttribute("search");
	      }
	      
	      int totalCount = dao.countProduct(proSearch);
	      int totalPageCount = totalCount/PAGE_SIZE;
	      
	      if(totalCount % PAGE_SIZE > 0){
	         totalPageCount++;
	      }
	      
	      int startPage = requestPage - (requestPage - 1) % 5;
	      int endPage = startPage + 4;
	      if(endPage > totalPageCount){
	         endPage = totalPageCount;
	      }
	      
	      int startRow = (requestPage - 1) * PAGE_SIZE;
	      List<Product> list = dao.listProduct(startRow, proSearch);
	      
	      return new ListModel(list, requestPage, totalCount, startPage, endPage);
	      
	   }


}

