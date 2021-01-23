<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <style>
    .pager li>a{
    	border: none;
    	font-size: 13px;
    	color: rgba(0, 0, 0, 0.8);
    }
    .pager li {
    	padding: 10px 5px;
    }
    .pager .active{
    	background-color: #41bf6d;
    	border-radius: 100%;
    }
    </style>
<!-- section -->
<section class="medi-area">
  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-12 col-xs-12">
        
        <div class="medi-borad-title">#${mediSearchData }</div>
        <form action="" method="post" id="comSend">
        <input type="hidden" id="proNos" name="proNos">
        	<button type="button" class="medi-right medi-com-btn" onclick="proCompare()">비교하기</button>
        </form>
        <table class="table table-hover medi-table">
  
          <thead>
            <tr>
              <th class="sm-area">비교</th>
              <th class="sm-area"></th>
              <th class="sm-area">code</th>
              <th class="lg-area">제품명</th>
              <th class="lg-area">효과 / 효능</th>
            </tr>
          </thead>
  
          <tbody>
            <c:forEach var="mediList" items="${list }" varStatus="status">
            
            
            <tr>
              <td class="sm-area">
                <input type="checkbox" class="medi-checkbox" name="compareCh" value="${mediList.proNo }">
              </td>
              <td class="sm-area"></td>
              <td class="sm-area">${mediList.proNo }</td>
              <td class="lg-area"><a href="mediDetail?proNo=${mediList.proNo}">${mediList.proName }</a></td>
              <td class="lg-area">${mediList.proEffi }</td>
              
            </tr>
            
            
            </c:forEach>
          </tbody>
  
        </table>

<!-- 페이지네이션 -->
      
      <form action="mediList" name="pagerMediList" >
                    
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
                    <input type="hidden" name="mediSearchData" value="${mediSearchData }">
		    </form>
      
      </div>
    </div>
  </div>
</section>

<!-- 비교하기  -->
<script>
/* 선택 갯수 제한하기 2,3 */
 $("input[name='compareCh']").on("click" , function(){

		var cnt = $("input:checked[name='compareCh']").size();

		if(cnt > 3){
			$(this).attr("checked" , false);
			alert("선택은 3개까지 가능합니다.");
		}		

	});

/* 비교 페이지 보내기 */
function proCompare(){
	var totCh_count = $("input:checkbox[name='compareCh']").length;
	var ch_count = $("input:checkbox[name='compareCh']:checked").length;
	var proNos = '';
	
	if(ch_count < 2){
		alert("2개 이상 선택하셔야 비교 가능합니다.");
	}
	
	if(ch_count == 2){
		for(var i = 0; i <totCh_count;i++){
			if(document.getElementsByName("compareCh")[i].checked == true){
				proNos += document.getElementsByName("compareCh")[i].value + "-";
			} // if end		
		} // for end
		$("#proNos").val(proNos);
		$("#comSend").attr("action","mediCompare2");
		$("#comSend").submit();
	} // 2if end
	
	if(ch_count == 3){
		for(var i = 0; i <totCh_count;i++){
			if(document.getElementsByName("compareCh")[i].checked == true){
				proNos += document.getElementsByName("compareCh")[i].value + "-";
			} // if end		
		} // for end
		$("#proNos").val(proNos);
		$("#comSend").attr("action","mediCompare3");
		$("#comSend").submit();
	} // 3if end
}// method end
</script>

<script>
/* 왕관이미지 */
  $(document).ready(function(){
	  if("${pageVO.pageNum}" == 1){
	    $("tbody").children('tr:eq(0)').children('td:eq(1)').html("<img src='${pageContext.request.contextPath }/resources/img/medi/no1.png' alt='no1'>")
	    $("tbody").children('tr:eq(1)').children('td:eq(1)').html("<img src='${pageContext.request.contextPath }/resources/img/medi/no2.png' alt='no2'>")
	    $("tbody").children('tr:eq(2)').children('td:eq(1)').html("<img src='${pageContext.request.contextPath }/resources/img/medi/no3.png' alt='no3'>")
	  }
  })
</script>

<!-- 페이지 네이션 -->
<script>
		$(".pager").click(function(){
			// a태그의 고유이벤트를 막는다
			event.preventDefault();
			
			// a태그가 아니라면 이 함수는 종료
			if(event.target.tagName !== "A") return; 
			
			console.log(event.target);
			var pageNum = event.target.dataset.page;
			//console.log(pageNum);
			console.log(pageNum);
			//히든 폼에 pageNum타겟값을 저장
			document.pagerMediList.pageNum.value = pageNum
			
			// form의 값을 보내보자
			document.pagerMediList.submit();
		}) 
</script>