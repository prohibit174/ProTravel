<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
  body, pre {
    font-family: "���� ���","Malgun Gothic","Helvetica Neue","Apple SD Gothic Neo",Helvetica,Arial,"Apple Gothic","����",Dotum,sans-serif!important;
  }

  .if-me{
    display: none !important;
  }

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carpool_css/city-main-styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carpool_css/carpoolJoin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carpool_css/carpoolJoin2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carpool_css/carpoolJoin3.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carpool_css/carpoolJoin4.css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <!-- {header -->
  <div class="header">
    <div class="main-nav-con">
      <p class="wishbeen-logo"><span>������ ��� ����, ���ú�</span></p>

		<div id="frames">
			<span>${member_id}</span>
		</div>
		
      <div class="nav-login-search">
        <a class="btn-new-plan">�α���</a>
        <div class="login-and-profile">
          
          <div>
            <a href="JoinForm.users" id="nav-btn-about"  >ȸ������</a>
            <a href = "main.mypage" id="nav-login-btn" class="nav-btn-login">����������</a>
            <a id="nav-fb-login" class="fb"></a>
            <a id="nav-ggl-login" class="ggl"></a>
          </div>
          
          
        </div><!-- login-and-profile -->
      </div>
    </div>
  </div><!-- header } -->
</div><!-- page-container -->

<!-- ���ԵǾ�� �� �Ķ���� ��� -->
<!-- language, curCity, tab (���� ���õ� ��) -->
<script>
  g_data['searchTabData'] = {
    language : "ko-KR",
    curServiceType: "global",
    curCityName: "������",
    tab: ""
  };
  g_localizedString['_SearchRegion_'] = "�����˻�";
</script>

<div id="search_tab_dim" class="bg hide"></div>

<div class="main-tabs">
    <div class="tabs-list">
        <ul id="menu_tab_list">
            <li><a href="home.main" >HOME</a></li>
            <li><a data-tab="hotdeal" >����</a></li>
            <li><a href="main.carpool" >īǮ</a></li>
            <li><a data-tab="" >��ǰ��ȯ</a></li>
            <li><a data-tab="plan" >Ŀ�´�Ƽ</a></li>
            <li><a data-tab="attraction" >��α�</a></li>

        </ul><!-- e// tabs -->
    </div><!-- e//tabs-list -->

   <!-- e//search-box -->
</div><!-- e//main-tabs -->
</body>
</html>