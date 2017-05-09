<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.HashMap"%>
<%@page import="travel.accompany.model.Accompany"%>
<%@page import="travel.accompany.model.AccompanyDao"%>
<%@page import="travel.accompany.model.Route"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>



<html>
 <script type="text/javascript" src="/TravelProject/JS/carpool_javascript/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TravelProject/css/carpool_css/carpool_table.css">
<!-- <script type="text/javascript">
$(document).ready(function(){
		$('.apply_button').click(function(){
			if(confirm("신청하시겠습니까?") == true){
				alert('신청합니다');
				location.href="request.carpool?c_num=";
			}
			else{
				alert('X')
			}
		});
	
});
</script> -->

<script type="text/javascript">
function applyLink(URL){
	if(confirm("신청하시겠습니까?") == true){
		location.href=URL;
		alert('신청되었습니다');

	}
	else{
		alert('X');
	}
}
</script>
<head>
<script>
<%
	System.out.println(request.getContextPath());
   AccompanyDao dao = AccompanyDao.getInstance();
	//get user's route whose ID is "0"
   Route route=new Route();
   route.setU_id("0");
   List<Accompany> list = dao.getUserRoute(route);
   request.setAttribute("list", list);
 	//get user's Info whose ID is "0"
 	
  List<Accompany> allAccompanyList=dao.getUserRoute(route);
  allAccompanyList.clear();

    System.out.println("allAccompanyList.size : " +allAccompanyList.size());

  for(int i=0;i< list.size() ;i++)
	{
	  
	  List<Accompany>userRoutesInfo  = dao.getUserInfo(list.get(i).getU_id());//get user's route whose id is "0"
	  //get routes of logined user.
	  //userRoutesInfo[0] contains 5.1 Nice, id, trip_style and so on...
	  //userRoutesInfo[1] contains 5.2 Nice, id, trip_style and so on...
	  //userRoutesInfo[2] contains 5.3 Swiss, id, trip_style and so on...
	  //userRoutesInfo[3] contains 5.4 Swiss, id, trip_style and so on...
	  String name=userRoutesInfo.get(i).getU_name();
	  String region=userRoutesInfo.get(i).getCor_region();
	  String date=userRoutesInfo.get(i).getTp_date();
	  System.out.println(date+"의 "+region);
	    System.out.println();

	  //List<Accompany> temp=dao.findAccompany(userRoutesInfo.get(i));
	  List<Accompany> temp=dao.getAccompanies(userRoutesInfo.get(i));
	  allAccompanyList.addAll(temp);
	  
	}
  System.out.println();
  System.out.println("allAccompanyList.size : " +allAccompanyList.size());
 	 for(int i=0;i< allAccompanyList.size() ;i++)
	{ String name=allAccompanyList.get(i).getU_name();
	  String region=allAccompanyList.get(i).getCor_region();
	  String date=allAccompanyList.get(i).getTp_date();
	  String lati=allAccompanyList.get(i).getCor_lati();
	  String longi=allAccompanyList.get(i).getCor_longi();
	  System.out.println(date+"의 "+region+"에서의 동행은 "+name+"입니다"+"lat/long : "+lati+" / "+longi);
	}
 	   request.setAttribute("allAccompanyList", allAccompanyList);
	%>
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <style>
       #map {
        height: 400px;
        width: 50%;
       }
    </style>
</head>







<br>
<body id="tikle">
	<div id="wrapper">

		<div class="present">
			<div class="tabs-list">

				<ul class="tabs-list">
					<li><a href="main.carpool" class="first-tag active"><span>CARPOOL</span></a></li>
					<li><a href="insertForm.carpool" class=""><span>카풀
								등록</span></a></li>
					<li><a href="list.carpool" class=""><span>대기중인 카풀
								리스트</span></a></li>
					<li><a
						href="/city?serviceType=global&amp;tab=hotdeal&amp;curationTag=f9188662257e085d"
						data-id="f9188662257e085d" class=""><span>내 카풀 등록 조회</span></a></li>

				</ul>

				<div id="google-ad-sense" style="margin-top: 20px; float: left;"
					data-type="260x260">
					<script type="text/javascript">
						google_ad_client = "ca-pub-9419115827273897";
						google_ad_slot = "3548612763";
						google_ad_width = 260;
						google_ad_height = 260;
					</script>
					<!-- search-260x260 -->
					<script type="text/javascript"
						src="//pagead2.googlesyndication.com/pagead/show_ads.js">
						
					</script>
					<script
						src="/TravelProject/JS/loginPopup/loginPopup.js"></script>
				</div>
			<!-- 검색 -->
		<article class="header_bot hideClass1">
				<fieldset>
					<legend class="hidden">티클 검색하기</legend>
					<!-- 티클 타입 1 -->
	<input type="hidden" name="tikle_pattern" value="1" class="hideClass">
					

				</fieldset>
		</article> <!-- header_bot hideClass1 -->

			</div>
			<!-- e//tabs-list -->
			<div class="wrap">
			 <h3>My Google Maps Demo</h3>
    <div id="map"></div>
    
    <script type="text/javascript">
    var index=0;
    var tp_num=[];
    var region=[];
    var longi=[];
    var lati=[];
    var id=[];
    var travelDate=[];
    var map;
    var marker=[];
    var markerIndex=0;
    var latLngList=[];
    
    
    </script>
    <c:forEach var="accompany" items="${list}">
    
                  <c:set var="tp_num" value="${accompany.tp_num}"></c:set>
                  <c:set var="cor_region" value="${accompany.cor_region}"></c:set>
                  <c:set var="cor_longi" value="${accompany.cor_longi}"></c:set>
                  <c:set var="cor_lati" value="${accompany.cor_lati}"></c:set>
                  <c:set var="cor_u_id" value="${accompany.u_id}"></c:set>
                  <c:set var="tp_date" value="${accompany.tp_date}"></c:set>
                  <script type="text/javascript">
 				
                    tp_num[index]="${tp_num}";
 					region[index]="${cor_region}";
 					longi[index]="${cor_longi}";
 					lati[index]="${cor_lati}";
 					id[index]="${cor_u_id}";

 				 	var temp;
 					temp=String("${tp_date}");
 				 	travelDate[index]=temp.substr(2,8);
 				 	
 	index++;
 	</script>
 	
 </c:forEach>
 
<script type="text/javascript">
    var accom_index=0;
    var accom_tp_num=[];
    var accom_region=[];
    var accom_longi=[];
    var accom_lati=[];
    var accom_id=[];
    var accom_tp_date=[];
    
    var accom_name=[];
    var accom_birth=[];
    var accom_address=[];
    var accom_job=[];
    var accom_lang=[];
    var accom_img=[];
    var accom_religion=[];
    var accom_license=[];
    var accom_u_style=[];
    var accom_sex=[];
       
    var infowindow=[];
    
    </script>
    <c:forEach var="accompany" items="${allAccompanyList}">
    
                  <c:set var="tp_num" value="${accompany.tp_num}"></c:set>
                  <c:set var="cor_region" value="${accompany.cor_region}"></c:set>
                  <c:set var="cor_longi" value="${accompany.cor_longi}"></c:set>
                  <c:set var="cor_lati" value="${accompany.cor_lati}"></c:set>
                  <c:set var="cor_u_id" value="${accompany.u_id}"></c:set>
                  <c:set var="tp_date" value="${accompany.tp_date}"></c:set>
                  
                  <c:set var="u_name" value="${accompany.u_name}"></c:set>
                  <c:set var="u_birth" value="${accompany.u_birth}"></c:set>
                  <c:set var="u_address" value="${accompany.u_address}"></c:set>
                  <c:set var="u_job" value="${accompany.u_job}"></c:set>
                  <c:set var="u_lang" value="${accompany.u_lang}"></c:set>
                  <c:set var="u_img" value="${accompany.u_img}"></c:set>
                  <c:set var="u_religion" value="${accompany.u_religion}"></c:set>
                  <c:set var="u_license" value="${accompany.u_license}"></c:set>
                  <c:set var="u_style" value="${accompany.u_style}"></c:set>
                  <c:set var="u_sex" value="${accompany.u_sex}"></c:set>
                  
                  
                  
                  <script type="text/javascript">
 				
                  accom_tp_num[accom_index]="${tp_num}";
                  accom_region[accom_index]="${cor_region}";
                  accom_longi[accom_index]="${cor_longi}";
                  accom_lati[accom_index]="${cor_lati}";
                  accom_id[accom_index]="${cor_u_id}";
                  
                  accom_name[accom_index]="${u_name}";
                  accom_birth[accom_index]="${u_birth}";
                  accom_address[accom_index]="${u_address}";
                  accom_job[accom_index]="${u_job}";
                  accom_lang[accom_index]="${u_lang}";
                  accom_img[accom_index]="${u_img}";
                  accom_religion[accom_index]="${u_religion}";
                  accom_license[accom_index]="${u_license}";
                  accom_u_style[accom_index]="${u_style}";
                  accom_sex[accom_index]="${u_sex}";
                  
 				 	var accom_temp;
 				 	accom_temp=String("${tp_date}");
 				 	accom_tp_date[accom_index]=accom_temp.substr(2,8);
 				 	
 				 	accom_index++;
 		        	
 	</script>
 </c:forEach>
    
    <script>
    function hideAccom(){
    	 for(i=0;i<markerIndex;i++)
    		 infowindow[i].close();
    }

    function showAccom(){
   	 for(i=0;i<markerIndex;i++)
   		 infowindow[i].open(map,marker[i]);
   }
    
    function showRightAccom(rightIndex, markerIndex){
    	console.log('Index : '+ rightIndex);
    	console.log('accom_index : '+ accom_index);
    	
    	var index=rightIndex+1;
    	var lati=accom_lati[rightIndex]; // lati value to find 
    	var longi=accom_longi[rightIndex];// langi value to find
    	var isFind=false;
 
    	for(;index<accom_index;index++)
    		{	
    		console.log('for문'+' index : '+index+ ' /  lati : '+accom_lati[index]);
        	console.log('accom_index : '+ accom_index);
        	
        	var totalCount=0;
        	var currentCount=0;
        	
        	for(i=0;i<accom_index;i++){
        		if(accom_lati[i]==lati && accom_longi[i]==longi)
        			totalCount++;
        	}
        	
        	for(i=0;i<=index;i++){
        		if(accom_lati[i]==lati && accom_longi[i]==longi)
        			currentCount++;		
        	}
        	
        	if(accom_lati[index]==lati && accom_longi[index]==longi && isFind==false)
    				{
    				 var tmpdate=new Date();
    	     		 thisYear=tmpdate.getFullYear();
    	     		 var age=parseInt(thisYear)-parseInt(accom_birth[index].substr(0,4));
    	     		 
    	     		 var gender;
    	     		 if( accom_sex[index]=='man')
    	     			 gender="<img src='/TravelProject/Accompany/man.png' width='10' height='10'>"
    	     			 else
    	     				gender="<img src='/TravelProject/Accompany/woman.png' width='10' height='10'>"
    	     				
    					var newContent=
        	    		     gender
         	    		     +accom_name[index]+'&nbsp'
         	    		  	 +'<br>'
         	    		     +'<img src="/TravelProject/Accompany/cal.png" width="10" height="10">'
             	    		 +accom_tp_date[index]+'<br>'
             	    	     +'<img src="/TravelProject/Accompany/age.png" width="10" height="10">'
             	    		 +age+'살'+'<br>'
             	    		 + "<button onclick='showLeftAccom("+index+","+markerIndex+" )' style='font-size:8px'>&lt</button>"  
             	    		 +'<button style="font-size:8px">'+currentCount+'/'+totalCount+'</button>'
             	    		 + "<button onclick='showRightAccom("+index+","+markerIndex+" )' style='font-size:8px'>&gt</button>"  
             	    		 infowindow[markerIndex].close();
             	    		 infowindow[markerIndex] = new google.maps.InfoWindow({
             	    			 content:newContent/* newContent */
             	    		  });
       	    			
       	    		//alert(infowindow[markerIndex].content);
             	    infowindow[markerIndex].open(map, marker[markerIndex]);
             	   		isFind=true;
    				}
    		}
    	}
    
function showLeftAccom(leftIndex, markerIndex){
    	
    	console.log('Index : '+ leftIndex);
    	console.log('accom_index : '+ accom_index);
    	
    	var index=leftIndex-1;
    	var lati=accom_lati[leftIndex]; // lati value to find 
    	var longi=accom_longi[leftIndex];// langi value to find
    	var isFind=false;
 
    	for(;0<=index;index--)
    		{	
    		console.log('for문'+' index : '+index+ ' /  lati : '+accom_lati[index]);
        	console.log('accom_index : '+ accom_index);
        	
        	var totalCount=0;
        	var currentCount=0;
        	
        	for(i=0;i<accom_index;i++){
        		if(accom_lati[i]==lati && accom_longi[i]==longi)
        			totalCount++;
        	}
        	
        	for(i=0;i<=index;i++){
        		if(accom_lati[i]==lati && accom_longi[i]==longi)
        			currentCount++;		
        	}
        	if(accom_lati[index]==lati && accom_longi[index]==longi && isFind==false)
    				{
    				 var tmpdate=new Date();
    	     		 thisYear=tmpdate.getFullYear();
    	     		 var age=parseInt(thisYear)-parseInt(accom_birth[index].substr(0,4));
    	     		 
    	     		 var gender;
    	     		 if( accom_sex[index]=='man')
    	     			 gender="<img src='/TravelProject/Accompany/man.png' width='10' height='10'>"
    	     			 else
    	     				gender="<img src='/TravelProject/Accompany/woman.png' width='10' height='10'>"
    	     				
    					var newContent=
        	    		     gender
         	    		     +accom_name[index]+'&nbsp'
         	    		  	 +'<br>'
         	    		     +'<img src="/TravelProject/Accompany/cal.png" width="10" height="10">'
             	    		 +accom_tp_date[index]+'<br>'
             	    	     +'<img src="/TravelProject/Accompany/age.png" width="10" height="10">'
             	    		 +age+'살'+'<br>'
             	    		 + "<button onclick='showLeftAccom("+index+","+markerIndex+" )' style='font-size:8px'>&lt</button>"  
             	    		 +'<button style="font-size:8px">'+currentCount+'/'+totalCount+'</button>'
             	    		 + "<button onclick='showRightAccom("+index+","+markerIndex+" )' style='font-size:8px'>&gt</button>"  
             	    		 infowindow[markerIndex].close();
             	    		 infowindow[markerIndex] = new google.maps.InfoWindow({
             	    			 content:newContent/* newContent */
             	    		  });
       	    			
       	    		//alert(infowindow[markerIndex].content);
             	    infowindow[markerIndex].open(map, marker[markerIndex]);
             	   		isFind=true;
    				}
    		}
    	}
    	
      function initMap() {
        var paris = {lat: 48.856667, lng: 2.350833};
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: paris
        });
        
        
        
        function containsLatlng(latlng){
        	if(latLngList==null)
				return false; 
        	
         	for(x=0;x<latLngList.length;x++)
        		{	
         			if(latlng.lat==latLngList[x].lat &&latlng.lng==latLngList[x].lng)
         			{
         				return true; 
         			}
        		}
        	return false; 
        }
        
        for(i=0;i< index  ;i++)
        	{
        		
        		 var latlng={lat: Number(lati[i]), lng: Number(longi[i])};
        		 if(containsLatlng(latlng)==false)//if the lat,lng which want to add marker already exist in latLnglist, dont add a marker
        		 {	
        			 latLngList.push(latlng);
        		 
        		 /* alert('latlng.lat : '+ latlng.lat+ ' / '+ 'longi[i] : '+longi[i]); */ 
        		 marker[markerIndex] = new google.maps.Marker({  
                 position: latlng,
                 map: map,
                 title: region[markerIndex],
                 hasInfoWindow : false// one marker, one InfoWindow. So If a marker has window, it is prohibited to make Infowindow
        		/*  date : travelDate[i] */
               });
        		 marker[markerIndex].setMap(map);
        		 
        		 for(j=0;j<accom_index ;j++)
      	    	{
        			 if(i==0)
        			 console.log(accom_tp_date[j]+'의 '+accom_region[j]+'동행은 ' +accom_name[j]+' / index : '+j);
        			 
        			    var totalCount=0;        	        	
        	        	for(x=0;x<accom_index;x++){
        	        		if(latlng.lat==accom_lati[x] && latlng.lng==accom_longi[x])
        	        			totalCount++;
        	        	}        	        	
        	        	
        			 
        	     	 if(latlng.lat==accom_lati[j] && latlng.lng==accom_longi[j] && marker[markerIndex].hasInfoWindow==false)
        	    	 {
        	     		 
        	     		 var tmpdate=new Date();
        	     		 thisYear=tmpdate.getFullYear();
        	     		 var age=parseInt(thisYear)-parseInt(accom_birth[j].substr(0,4));
        	     		 
        	     		 var gender;
        	     		 if( accom_sex[j]=='man')
        	     			 gender="<img src='/TravelProject/Accompany/man.png' width='10' height='10'>"
        	     			 else
        	     				gender="<img src='/TravelProject/Accompany/woman.png' width='10' height='10'>"
        	     			 
        	    		 infowindow[markerIndex] = new google.maps.InfoWindow({
     	    		    content: 
     	    		     gender
     	    		     +accom_name[j]+'&nbsp'
     	    		   +'<br>'
     	    		    +'<img src="/TravelProject/Accompany/cal.png" width="10" height="10">'
         	    		 +accom_tp_date[j]+'<br>'
         	    	     +'<img src="/TravelProject/Accompany/age.png" width="10" height="10">'
         	    		 +age+'살'+'<br>'
         	    		 + "<button onclick='showLeftAccom("+j+","+markerIndex+" )' style='font-size:8px'>&lt</button>"  
         	    		 +'<button style="font-size:8px">'+'1'+'/'+totalCount+'</button>'
         	    		 + "<button onclick='showRightAccom("+j+","+markerIndex+" )' style='font-size:8px'>&gt</button>"  
/*          	    		+ "<button onclick='showRightAccom(1,0)' style='font-size:8px'>&gt</button>"
 *//*          	    		 +'<button onclick=\"showRightAccom('j','markerIndex')\" style="font-size:8px">&lt</button>'
 */

   	    				  });
           			  	infowindow[markerIndex].open(map, marker[markerIndex]);
           				marker[markerIndex].hasInfoWindow=true;
        	    	 }
      	    	} 
        		
        		 createLine(latLngList, map);
        		 markerIndex++;
	     		 /* alert(parseInt(thisYear)-parseInt(accom_tp_date[j].substr(0,4))); */
        		 }
        	}
        
      
        	
       // alert(parseInt(thisYear));
      // alert(parseInt(accom_birth[0].substr(0,4)));
       // alert(parseInt(thisYear)-parseInt(accom_birth[0].substr(0,4)));
        //alert(accom_tp_date[0].substr(0,4));
      	  function createLine(latLngList, map){ 
            var movingPath = new google.maps.Polyline({
             path: latLngList,
             geodesic: true,
             strokeColor: '#000000',
             strokeOpacity: 10.0,
             strokeWeight: 1
           });
            if(latLngList.length>1){
            movingPath.setMap(map);
            }
         }
        
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnrWQ2SHvedNrvdozheYo32pHwCbuvPgs&callback=initMap">
    </script>
      <input id="aaa" type="button" onclick="showAccom()" value="동행 추천 보이기" />
      <input id="aaa" type="button" onclick="hideAccom()" value="동행 추천 숨기기" style="position: absolute,
        top: 10px,
        left: 25%,
        z-index: 5,
        background-color: #fff,
        padding: 5px,
        border: 1px solid #999,
        text-align: center,
        font-family: 'Roboto','sans-serif',
        line-height: 30px,
        padding-left: 10px,">
				<div class="table">
					<ul>
						
									

					</ul>
	
				</div>
				<!-- table -->

			</div>
			<!-- wrap -->

		</div>
		<!-- present -->
				<div id="paging">
   
   <!-- 이전 -->
   <span id="page_back">
   
   </span>
   <!-- 페이지 목록 -->
   
   
   <!-- 이후 -->
   <span id="page_front">
   
   </span>
   </div><!-- paging end -->
	</div>
	<!-- wrapper -->


	


</body>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="foot-inner">
  		<div class="footer-wrap">
    		<div class="footer-top">
     			 <ul class="footer-list">
        			<li><a href="/companyInfo?active=aboutUs">서비스 소개</a></li>
        			<li><a href="http://blog.naver.com/PostThumbnailList.nhn?blogId=wishbeen&from=postList&categoryNo=97&parentCategoryNo=97" target="_blank">위시빈 사용법</a></li>
        			<li><a href="/companyInfo?active=faq">이용문의</a></li>
        			<li><a href="/companyInfo?active=terms">이용약관</a></li>
        			<li><a href="/companyInfo?active=privacy">개인정보 취급방침</a></li>
        			<li><a href="/citySitemap">사이트맵</a></li>
        			<li><span class="kakao-id"></span></li>
      			</ul><!-- footer-list-->
      				<div class="language">
        <!-- TODO: 언어 바뀌면 언어에 해당하는 도메인으로 이동하도록 수정 -->
        				<div class="language-type01">
          					<select id="language_select" class="state">
            					<option value="ko-KR"  selected  >한국어</option>
            					<option value="en-US"  >English</option>
          					</select>
        				</div>
        			<div class="language-type02">
          				<select class="currency money">
            				<option value="2"  > USD(미국)</option>
            				<option value="1" selected > KRW(한국)</option>
           					<option value="0"  > EUR(유럽연합)</option>
            				<option value="3"  > JPY(일본)</option>
            				<option value="4"  > CNY(중국)</option>
            				<option value="5"  > HKD(홍콩)</option>
            				<option value="6"  > TWD(대만)</option>
            				<option value="7"  > GBP(영국)</option>
            				<option value="8"  > CAD(캐나다)</option>
            				<option value="9"  > CHF(스위스)</option>
            				<option value="10"  > SEK(스웨덴)</option>
            				<option value="11"  > AUD(호주)</option>
            				<option value="12"  > NZD(뉴질랜드)</option>
            				<option value="13"  > CZK(체코)</option>
            				<option value="14"  > TRY(터키)</option>
            				<option value="15"  > MNT(몽골)</option>
            				<option value="16"  > ILS(이스라엘)</option>
            				<option value="17"  > DKK(덴마크)</option>
            				<option value="18"  > NOK(노르웨이)</option>
            				<option value="19"  > SAR(사우디아라비아)</option>
            				<option value="20"  > KWD(쿠웨이트)</option>
            				<option value="21"  > BHD(바레인)</option>
            				<option value="22"  > AED(아랍에미리트)</option>
            				<option value="23"  > JOD(요르단)</option>
            				<option value="24"  > EGP(이집트)</option>
            				<option value="25"  > THB(태국)</option>
            				<option value="26"  > SGD(싱가포르)</option>
            				<option value="27"  > MYR(말레이시아)</option>
            				<option value="28"  > IDR(인도네시아)</option>
            				<option value="29"  > QAR(카타르)</option>
            				<option value="30"  > KZT(카자흐스탄)</option>
            				<option value="31"  > BND(브루나이)</option>
            				<option value="32"  > INR(인도)</option>
            				<option value="33"  > PKR(파키스탄)</option>
            				<option value="34"  > BDT(방글라데시)</option>
            				<option value="35"  > PHP(필리핀)</option> 
            				<option value="36"  > MXN(멕시코)</option>
            				<option value="37"  > BRL(브라질)</option>
            				<option value="38"  > VND(베트남)</option>
            				<option value="39"  > ZAR(남아프리카 공화국)</option>
            				<option value="40"  > RUB(러시아)</option>
            				<option value="41"  > HUF(헝가리)</option>
            				<option value="42"  > PLN(폴란드)</option>
						</select>
        			</div>
      			</div><!-- language-->
    		</div><!-- footer-menu-->
  		</div><!-- footer-wrap-->
  		<div class="footer-bottom">
    		<div class="copyright">
      			<p>상호명 : (주)프로동행러<span>|</span>대표 : 김보람<span>|</span>개인정보책임자 : 김지웅</p>
      			<p>사업자등록번호 : 212-86-00908<span>|</span>통신판매업신고번호 : 제 2014-서울용산-00910 호<span>|</span><a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2128600908" target="_blank">사업자정보확인</a></p>
      			<p>주소: 서울특별시 금천구 가산디지털단지1로 (가산동) 이노플렉스1차 2층 한국소프트웨어기술진흥협회<span>|<!--</span>대표번호 : 070-4045-9771<span>|--></span><a href="mailto:support@wishbeen.com">광고 및 제휴 : support@wishbeen.com</a></p>
      			<p>프로동행러는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 프로동행러는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
    		</div>
  		</div><!-- footer-bottom-->
    </div>
</body>
</html>
