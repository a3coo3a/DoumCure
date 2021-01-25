<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- mypage css -->
  <style>
  .user_container a {
    color : #000
  }
  .pager li>a, .pager li>span{
    border: none;
    padding: 5px 10px;
  }
  .pager li>a:focus, .pager li>a:hover{
    background-color: #66e992;
    color: #fff;
  }
  .userid{
    color: rgb(150, 150, 150);
    margin: 5px;
  }
  .bookmark-product .bookmark-img {
	height : 150px;
	line-height : 150px;
  }
  </style>
  
  <section class="user-area">

	
  <div class="container user_container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 profile-box">
            <div class="user-profile-img">
              <img src="${pageContext.request.contextPath }/resources/img/user/basic_profile.png" alt="profile">
              <div class="user-profile-emoji">😘</div>
            </div>
            <div class="user-profile-info">
              <div class="nickname">${sessionScope.userVO.userNickName }</div>
              <button type="button" onclick="location.href='userUpdate'">정보수정</button>
            </div>
          
      </div>
      <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 medi-right">
      <div class="product-box">
          <h3><span class="glyphicon glyphicon-bookmark"></span>&nbsp;즐겨찾기</h3>
            <div class="bookmark-product vo1">
              <div class="bookmark-img"><a href="#"><img src="" alt="bookmarkicon" id="vo1"></a></div>
              <div class="bookmark-name"><a href="../medi/mediDetail?proNo=${vo1.proNo }">${vo1.proName }</a></div>
            </div>
            <div class="bookmark-product vo2">
              <div class="bookmark-img"><a href="#"><img src="" alt="bookmarkicon" id="vo2"></a></div>
              <div class="bookmark-name"><a href="../medi/mediDetail?proNo=${vo2.proNo }">${vo2.proName }</a></div>
            </div>
            <div class="bookmark-product vo3">
              <div class="bookmark-img"><a href="#"><img src="" alt="bookmarkicon" id="vo3"></a></div>
              <div class="bookmark-name"><a href="../medi/mediDetail?proNo=${vo3.proNo }">${vo3.proName }</a></div>
            </div>
      </div>
      
      </div>
    </div>
    <hr class="user-line">
  <div class="row">
    <div class="col-lg-10 col-md-10 col-sm-12 user-text-bg user-mypage-area">
      <h4 class="user-borad-title"><span class="glyphicon glyphicon-pencil" ></span>&nbsp;내가 쓴 글</h4>
     
      <table class="table table-hover user-table">

        <thead>
          <tr>
            <th class="title-align">title</th>
            <th class="date-align">date</th>
          </tr>
        </thead>

        <tbody>
        	<c:forEach var="myBbs" items="${list }">
	          <tr>
	            <td class="title-align"><a href="bbsDetail?bbsno=${myBbs.bbsNo }">${myBbs.bbsTitle }</a></td>
	            <td class="date-align date-line"><fmt:formatDate value="${myBbs.bbsRegdate}" pattern="yyyy-MM-dd HH:mm"/></td>
	          </tr>
          </c:forEach>
        </tbody>

      </table>
      <!-- 페이지네이션 -->
      
      <form action="mypage#point" name="pagerForm" >
                    
                    <hr>
                    <ul class="pager">
                    <c:if test="${pageVO.prev }">
                        <li><a href="#" data-page="${pageVO.startPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>  <!-- a태그의 #의 의미 : 특정한 동작이 없을때 값,  -->
                    </c:if>
                    <!-- 1. 페이지네이션 번호 처리 -->
                    <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage}">
                        <li  class="${num == pageVO.pageNum?'active':''}"><a href="#" data-page="${num}">${num }</a></li>
                        
                    </c:forEach>
                    <c:if test="${pageVO.next }">    
                        <li><a href="#" data-page="${pageVO.endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                    </c:if>
                    </ul>
                    
                    <!-- 폼형식으로 보내는데 숨겨서 보낼값 hidden으로 표시 -->
                    <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
                    <input type="hidden" name="amount" value="${pageVO.cri.amount }">
                    <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
                    <input type="hidden" name="searchName" value="${pageVO.cri.searchName }">
		    </form>
    </div>
  </div>
</div>




</section>

<!-- 페이지 네이션 -->
<script>

	$(document).ready(function(){
		
		if("${vo1}" == '') {$(".vo1").hide();}
		if("${vo2}" == '') {$(".vo2").hide();}
		if("${vo3}" == '') {$(".vo3").hide();}
		
		
		if("${vo1}" != '' && "${vo1.proImg }" == ''){
			$("#vo1").attr("src","${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png");
		}else {
			$("#vo1").attr("src","${vo1.proImg }");
		}
		
		if("${vo2}" != '' &&"${vo2.proImg }" == ''){
			$("#vo2").attr("src","${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png");
		}else {
			$("#vo2").attr("src","${vo2.proImg }");
		}
		
		if("${vo3}" != '' &&"${vo3.proImg }" == ''){
			console.log("3333여기요?");
			$("#vo3").attr("src","${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png");
		}else {
			$("#vo3").attr("src","${vo3.proImg }");
		}
		
		
		
		if("${errorMsg}")
			alert("${errorMsg}");
		return;
		
		var page_url = window.location.href; 
		var page_id = page_url.substring(page_url.lastIndexOf("#") + 1);
		if(page_id == 'point'){
			$('html, body').animate({ scrollTop: $('#point').offset().top }, 300);
		}
		
	})
	
	$(document).ready(function(){
		
		if('${pageVO.cri.pageNum }'){
			window.scrollBy( 0, 0 );
		}
	
	})
		$(".pager").click(function(){
			// a태그의 고유이벤트를 막는다
			event.preventDefault();
			
			// a태그가 아니라면 이 함수는 종료
			if(event.target.tagName !== "A") return; 
			
			console.dir(event.target);
			var pageNum = event.target.dataset.page;
			//console.log(pageNum);
			
			//히든 폼에 pageNum타겟값을 저장
			document.pagerForm.pageNum.value = pageNum
			
			// form의 값을 보내보자
			document.pagerForm.submit();
		}) 
</script>