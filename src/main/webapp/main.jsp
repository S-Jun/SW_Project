<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Crawling.crawlingWeb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Crawling.crawlingWeb" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>실시간 검색어</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<style>
    
    .accordion, .news-box, #login-btn,.accordion-item, .dropdown-toggle {
      box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.3);

    }

    /* 아코디언 버튼을 왼쪽으로 이동 */
    .accordion-button {
      text-align: left;
    }

    /* 아코디언 전체에 상단 여백 추가 
    #accordionPanelsStayOpenExample {
      margin-top: 200px;
    }*/

    /* 아코디언 아이템을 포함하는 div를 왼쪽으로 이동 */
    .accordion-item {
      margin-left: 80px;
      margin-right: 80px;
    }

    /* 아코디언 아이템 제목 정렬 */
    .accordion-header {
      text-align: left;
    }
    
    .container {
      display: flex;
      max-width: 100%;
    }
    
    /* 아코디언의 크기를 고정 (상하좌우 100px) */
    .accordion, .news-box{
    	background-color: gray;
        width: 1100px; /* 원하는 크기로 지정 */
        /*height: 1000px; /* 아코디언 얼마나 길어질 수 있나요? */
        margin: 0px 50px 0px 50px;
        border-radius: 16px;
        margin-top: 110px;
        background-color: rgb(159, 184, 212);
    }
    .accordion{
        z-index : 2;
    	height: auto;
    }
    
    .news-box{
    	height: 1100px;
    }

    .accordion-name, .news-name{
      background-color: gray;
      padding: 40px;
      text-align: center;
      font-size: 30px;
      font-weight: bold;
      color: aliceblue;
      vertical-align: top;
      margin-top: 10px;
      background-color: rgb(159, 184, 212);
    }

    header {
      z-index : 3;
      position: fixed; 
      text-align: center;
      height: 80px;
      width: 100%;
      background-color: rgb(159, 184, 212);
      display: flex; /* 추가된 부분 */
      justify-content: space-between;
      align-items: center;
    }

     #login-btn {
      font-weight: bold;
      margin: 20px; 
      margin-left: auto;
      text-decoration: none; 
      color: rgb(159, 184, 212);
      padding: 10px;
      border-radius: 16px;
      background-color: white;
      width: 300px;
      display: flex;
      justify-content: center;
    }

    .dropdown {
      z-index : 3;
      font-weight: bold;
      margin: 20px; 
      margin-left: auto;
      display: flex;
      justify-content: center;
    }
    .dropdown:hover, .dropdown:active  {
      font-weight: bold;
      color: rgb(159, 184, 212);
      background-color: rgb(255, 255, 255);
      border: 0;
      border-radius: 16px;
    }

    .dropdown-toggle {
      font-weight: bold;
      color: rgb(159, 184, 212);
      background-color: rgb(255, 255, 255);
      border: 0;
    }


    .dropdown-item {
      font-weight: bold;
      color: rgb(123, 142, 163);

    }
    .dropdown-item:hover { /* 드롭다운 메뉴들에 마우스 갖다댐 */
      
      font-weight: bold;
      color: rgb(75, 94, 116);

    }

    #logo {
      z-index : 3;
      color: rgb(255, 255, 255);
      font-weight: bold;
      font-size: 30px;
      margin-left: 50px;
      margin-top: 10px;
      justify-content: center;
    }

	.newsTitle {
    	cursor: pointer; /* 마우스 포인터를 손가락으로 변경 */
    	text-decoration: underline; /* 밑줄 추가 */
  	}

    </style>


<header>
  <p id="logo"> S/W Project </p>
  <% if(session.getAttribute("userID") == null){%>
  <a href="login.jsp" id="login-btn">Login</a>
  <%}else{%>
  <div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    MENU
  </a>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">정보 수정</a></li>
    <li><a class="dropdown-item" href="#">로그아웃</a></li>
  </ul>
  </div>
  <%} %>
</header>
<%
	Crawling.crawlingWeb d = new Crawling.crawlingWeb();

	Map<Integer, String> Data = d.DataReturn();

	for(int i = 1; i < 11; i++){
		request.setAttribute("Data"+i, Data.get(i));
	}
	
	String userID = null;

	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	List<ArrayList<String>> list = d.crawlingWeb(userID);

	int k = 1;
	
	
	for(int i = 0; i < list.size(); i += 3){
		
		ArrayList<String> company = new ArrayList<>(list.get(i));
		ArrayList<String> title = new ArrayList<>(list.get(i+1));
		ArrayList<String> link = new ArrayList<>(list.get(i+2));
		
		request.setAttribute("company"+k, company);
		request.setAttribute("title"+k, title);
		request.setAttribute("link"+k, link);
		
		k++;
	}
%>
<div class="container">

  <div class="accordion" id="accordionPanels">
    <div class="accordion-name">
      <p>Hot Topic</p>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
        #1   ${Data1}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" style="">
        <div class="accordion-body">
        <!--뉴스기사 시작-->
        <li class = "newsTitle" data-link="${link1[0]}">${company1[0] }  ${title1[0] }</li><br>
      	<li class = "newsTitle" data-link="${link1[1]}">${company1[1] }  ${title1[1] }</li><br>
      	<li class = "newsTitle" data-link="${link1[2]}">${company1[2] }  ${title1[2] }</li><br>
      	<li class = "newsTitle" data-link="${link1[3]}">${company1[3] }  ${title1[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        #2   ${Data2}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link2[0]}">${company2[0] }  ${title2[0] }</li><br>
      	<li class = "newsTitle" data-link="${link2[1]}">${company2[1] }  ${title2[1] }</li><br>
      	<li class = "newsTitle" data-link="${link2[2]}">${company2[2] }  ${title2[2] }</li><br>
      	<li class = "newsTitle" data-link="${link2[3]}">${company2[3] }  ${title2[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree" >
        #3   ${Data3}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link3[0]}">${company3[0] }  ${title3[0] }</li><br>
      	<li class = "newsTitle" data-link="${link3[1]}">${company3[1] }  ${title3[1] }</li><br>
      	<li class = "newsTitle" data-link="${link3[2]}">${company3[2] }  ${title3[2] }</li><br>
      	<li class = "newsTitle" data-link="${link3[3]}">${company3[3] }  ${title3[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour" >
        #4   ${Data4}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" style="">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link4[0]}">${company4[0] }  ${title4[0] }</li><br>
      	<li class = "newsTitle" data-link="${link4[1]}">${company4[1] }  ${title4[1] }</li><br>
      	<li class = "newsTitle" data-link="${link4[2]}">${company4[2] }  ${title4[2] }</li><br>
      	<li class = "newsTitle" data-link="${link4[3]}">${company4[3] }  ${title4[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
		#5   ${Data5}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link5[0]}">${company5[0] }  ${title5[0] }</li><br>
      	<li class = "newsTitle" data-link="${link5[1]}">${company5[1] }  ${title5[1] }</li><br>
      	<li class = "newsTitle" data-link="${link5[2]}">${company5[2] }  ${title5[2] }</li><br>
      	<li class = "newsTitle" data-link="${link5[3]}">${company5[3] }  ${title5[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button Six collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix" >
        #6   ${Data6}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link6[0]}">${company6[0] }  ${title6[0] }</li><br>
      	<li class = "newsTitle" data-link="${link6[1]}">${company6[1] }  ${title6[1] }</li><br>
      	<li class = "newsTitle" data-link="${link6[2]}">${company6[2] }  ${title6[2] }</li><br>
      	<li class = "newsTitle" data-link="${link6[3]}">${company6[3] }  ${title6[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSeven" aria-expanded="false" aria-controls="panelsStayOpen-collapseSeven" >
        #7   ${Data7}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseSeven" class="accordion-collapse collapse" style="">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link7[0]}">${company7[0] }  ${title7[0] }</li><br>
      	<li class = "newsTitle" data-link="${link7[1]}">${company7[1] }  ${title7[1] }</li><br>
      	<li class = "newsTitle" data-link="${link7[2]}">${company7[2] }  ${title7[2] }</li><br>
      	<li class = "newsTitle" data-link="${link7[3]}">${company7[3] }  ${title7[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseEight" aria-expanded="false" aria-controls="panelsStayOpen-collapseEight">
        #8   ${Data8}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseEight" class="accordion-collapse collapse">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link8[0]}">${company8[0] }  ${title8[0] }</li><br>
      	<li class = "newsTitle" data-link="${link8[1]}">${company8[1] }  ${title8[1] }</li><br>
      	<li class = "newsTitle" data-link="${link8[2]}">${company8[2] }  ${title8[2] }</li><br>
      	<li class = "newsTitle" data-link="${link8[3]}">${company8[3] }  ${title8[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseNine" aria-expanded="false" aria-controls="panelsStayOpen-collapseNine">
        #9   ${Data9}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseNine" class="accordion-collapse collapse" style="">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link9[0]}">${company9[0] }  ${title9[0] }</li><br>
      	<li class = "newsTitle" data-link="${link9[1]}">${company9[1] }  ${title9[1] }</li><br>
      	<li class = "newsTitle" data-link="${link9[2]}">${company9[2] }  ${title9[2] }</li><br>
      	<li class = "newsTitle" data-link="${link9[3]}">${company9[3] }  ${title9[3] }</li><br>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTen" aria-expanded="false" aria-controls="panelsStayOpen-collapseTen">
        #10   ${Data10}
        </button>
      </h2>
      <div id="panelsStayOpen-collapseTen" class="accordion-collapse collapse" style="">
        <div class="accordion-body">
        <li class = "newsTitle" data-link="${link10[0]}">${company10[0] }  ${title10[0] }</li><br>
      	<li class = "newsTitle" data-link="${link10[1]}">${company10[1] }  ${title10[1] }</li><br>
      	<li class = "newsTitle" data-link="${link10[2]}">${company10[2] }  ${title10[2] }</li><br>
      	<li class = "newsTitle" data-link="${link10[3]}">${company10[3] }  ${title10[3] }</li><br>
        </div>
      </div>
    </div>
  </div>
  <div class="news-box" id="accordionPanels">
    <div class="news-name">
      <p>뉴스</p>
        <div id="content">
		
		</div>
    </div>
  </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-T3c6CoIi6uLrA9TneNeoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"></script>
	
<script>
    // 각 뉴스 항목에 이벤트 리스너 추가
    const newsTitles = document.querySelectorAll('.newsTitle');

    newsTitles.forEach(title => {
        title.addEventListener('click', showNewsContent);
    });

    function showNewsContent(event) {
        const link = event.target.getAttribute('data-link');

        // fetch를 사용하여 서버로 뉴스 내용 요청
        fetch('getNewsCrawling?url=' + encodeURIComponent(link))
            .then(response => response.text())
            .then(newsHTML => {
                
                document.getElementById("content").innerHTML = newsHTML;
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>

</body>
</html>