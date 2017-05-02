<%@page import="travel.users.model.UsersDao"%>
<%@page import="travel.users.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% //System.out.println(session.getAttribute("member_id"));
    
    String u_id = session.getAttribute("member_id").toString();
    //System.out.println(u_id);
    
    UsersDao dao = UsersDao.getInstance();
    Users user = dao.userDetail(u_id);
    
    request.setAttribute("user", user);
    
    
    %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_css/city-main-styles_mypage.css">


<head>
<%@include file="../header.jsp" %>

</head>
<body>

<br>
	<div class="form_body">
		<form action="JoinAction.join" class="join_form">
		        <div class="present">
            <div class="tabs-list">
                
                <ul class="tabs-list">
    
        
            <li><a href="main.mypage" class="first-tag active"><span>마이페이지</span></a></li> 
            <li><a href="main.mypage"  class=""><span>내 정보 수정</span></a></li>
            <li><a href="/city?serviceType=global&amp;tab=hotdeal&amp;curationTag=2d8eef384cefda06" class=""><span>내 동행 조회</span></a></li>
            <li><a href="carpoolCheck.mypage" class=""><span>내 카풀조회</span></a></li>
            <li><a href="/city?serviceType=global&amp;tab=hotdeal&amp;curationTag=f9188662257e085d"  class=""><span>내 상품조회</span></a></li>
            
		</ul>

                <div id="google-ad-sense" style="margin-top:20px;float:left;" data-type="260x260">
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
                </div>
            
            </div><!-- e//tabs-list -->
            </div> <!-- present -->
			<fieldset>
				<legend>회원정보확인</legend>

				<table class="primary_table">
					<tbody>
					
					<tr>
					<th scope = "row">
					아이디
					</th>
					<td>
					${user.u_id }
					
					</td>
					</tr>
				
					
					<tr>
					<th scope="row">닉네임</th>
					<td>
					${user.u_name }
					</td>
					</tr>
					
					<tr>
					<th scope = "row">생년월일</th>
					<td>
					생일정보
					</td>
					</tr>
					
					<tr>
					<th scope="row">성별</th>
					<td>
					남자냐 여자냐
					</td>
					</tr>
					
					
			<tr>
				<th scope = "row">운전면허 유무</th>
				<td>
				<input type = "radio" name = "u_license" value = "licensed" checked  = "checked">
				<label>유</label>
				<input type = "radio" name = "u_license" value = "Nolicensed">
				<label>무</label>
				</td>
				</tr>
					
					<tr>
					<th scope = "row">거주 지역</th>
					<td>
					거주지역 표시
					</td>
					</tr>

					</tbody>

				</table>
			</fieldset>

			<fieldset>
				<legend>선택 입력사항</legend>
				<table>

					<tr>
						<th scope="row">직업</th>
						<td>
						직업
						</td>
					</tr>

					<tr>
						<th scope="row">사용언어</th>
						<td>사용 언어 <span>&nbsp;&nbsp;
								여행 시 사용하는 언어를 알려주세요.</span></td>
					</tr>

					<tr>
						<th scope="row">종교</th>
						<td>종교</td>
					</tr>


					<tr>
						<th scope="row">여행 스타일</th>
						<td><input type="checkbox" name="u_style" value="healing"
							checked="checked"> <label>&nbsp;힐링</label>&nbsp;&nbsp; <input
							type="checkbox" name="u_style" value="tour"> <label>&nbsp;관광</label>&nbsp;&nbsp;
							<input type="checkbox" name="u_style" value="eat"> <label>&nbsp;맛집</label>&nbsp;&nbsp;
							<input type="checkbox" name="u_style" value="activity"> <label>&nbsp;액티비티</label>&nbsp;&nbsp;
							<input type="checkbox" name="u_style" value="rest"> <label>&nbsp;휴양</label>
							<span>하나만 선택해주세요</span></td>
					</tr>

					<tr>
						<th scope="row">프로필 이미지</th>
						<td><input type="file" name="u_img" id="u_img"></td>
					</tr>
					</tbody>
				</table>
			</fieldset>

		<div class="nlogin_join_center">
		<button type = "submit" class = "nlogin_btn">수정하기</button>
		</div>
		
		
		</form>


	</div>
<%@include file="../footer.jsp" %>
</body>
</html>