<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container ">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-lg-12 ">

					<%--  
          <p id="notice">공지사항 게시판</p>
        </div>
        
      <!--공지사항 리스트 -->
        <form action="bbslistForm" method="POST" name="bsdlistForm">
          <table class="table bbs-table-bordered">
            <tr>
              <th class="bbs-list-num">num</th>
			  <th >write</th>
              <th class="bbs-list-title">title</th>
              <th class="bbs-list-Date">regdate</th>
            </tr>
            <tr>
			<c:forEach var="vo" items="${list }">
         		<tr>
	             <td>${vo.bno }</td>
	             <td><a href="bbsDetail?bbsno=${vo.bbsNo }">${vo.bbsTitle}</a></td>
	             <td>${vo.writer }</td>
	             <td><fmt:formatDate value="${vo.bbsRegdate }" pattern="yy-MM-dd일  hh시mm분ss초"/></td>
	             <td><fmt:formatDate value="${vo.updatedate }" pattern="yy-MM-dd일  hh시mm분"/></td>
                </tr>
			</c:forEach>
              
            </tr>

            <!-- <tbody>
                   <c:forEach var="vo" items="${list }">
                   <tr>
                       <td>${vo.bno }</td>
                       <td><a href="freeDetail?bno=${vo.bno }">${vo.title }</a></td>
                       <td>${vo.writer }</td>
                       <td><fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일  hh시mm분ss초"/></td>
                       <td><fmt:formatDate value="${vo.updatedate }" pattern="yyyy년MM월dd일  hh시mm분"/></td>
                   </tr>
               </c:forEach>
           </tbody> -->
          </table>

          <input type="hidden" name="pageNum" value="1"> <!-- 검색버튼이 눌리면 무조건 페이지번호를 1번호으로 다시 세팅 -->
          <input type="hidden" name="amount" value="${pageVO.amount }">

          <ul class="pager">
            <c:if test="${pageVO.prev}">
                        <li>
                        		<!-- href="#"은 a태그가 이동이 없고  클릭용으로 사용하기 위한 것 -->
                         		<!-- 데이터 셋 으로 값 주기 = 제이슨 방식 "객체 '키': '값' " -> 히든으로 넘겨줄것 이기에 단일값만 보내주기로 수정  -->
                        	<a href="#" data-page="${pageVO.startPage-1 }">이전</a>
                        </li>                    	
                    	</c:if>
                    	 <!-- 1.페이지네이션 번호 처리 -->
                    	<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                    	<li class="${pageVO.pageNum == num ? 'active' : '' }">
                    		<a href="#" data-page="${num}">${num}</a>
                    	</li>
                    	</c:forEach>
                    	<!-- 2.다음버튼 활성화여부 -->
                        <c:if test="${pageVO.next }">
                        <li>
                        	<a href="#" data-page="${pageVO.endPage+1 }">다음</a>
                        </li>
                        </c:if>
                    </ul>
                    <c:if test="${sessionScope.userVO != null }">
					 <button type="button" class="btn btn-info" onclick="location.href='freeRegist' ">글쓰기</button>
                    </c:if> 
        </form>

--%>


					<!-- 건강정보게시판 -->


					<div class="bbs-list-title-box col-lg-12">
						<p id="health">건강정보</p>
					</div>


					<div class="conteiner bbs-titlebox-inner">
						<div class="row health_List">
							<c:forEach var="vo" items="${list}">
								<div class="gallery col-sm-12 col-md-3 col-lg-3 ">
									<div class="gallery-inner">
										<a href="#"> <img class="img-thumbnail"
											src="display/${vo.fileLoca}/${vo.fileName}">
										</a>
										<div class="desc">${vo.bbsTitle }</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<button type="submit" class="btn qa-bbsList-btn"
						onclick="location.href='bbsRegist'">글쓰기</button>
					<c:if test="${sessionScope.userVO != null   }">
					</c:if>


					<form action="bbsList" name="pageForm">
						<div class="text-center">

							<ul class="pagination pagination-sm">
								<!-- 3.이전버튼 활성화여부 -->
								<c:if test="${pageVO.prev}">
									<li>
										<!-- href="#"은 a태그가 이동이 없고  클릭용으로 사용하기 위한 것 --> <!-- 데이터 셋 으로 값 주기 = 제이슨 방식 "객체 '키': '값' " -> 히든으로 넘겨줄것 이기에 단일값만 보내주기로 수정  -->
										<a href="#" data-page="${pageVO.startPage-1 }">이전</a>
									</li>
								</c:if>
								<!-- 1.페이지네이션 번호 처리 -->
								<c:forEach var="num" begin="${pageVO.startPage}"
									end="${pageVO.endPage}">
									<li class="${pageVO.pageNum == num ? 'active' : '' }"><a
										href="#" data-page="${num}">${num}</a></li>
								</c:forEach>
								<!-- 2.다음버튼 활성화여부 -->
								<c:if test="${pageVO.next }">
									<li><a href="#" data-page="${pageVO.endPage+1 }">다음</a></li>
								</c:if>
							</ul>
						</div>

						<!-- 폼형식으로 보내는데 숨겨서 보낼값 hidden으로 표시 -->
						<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageVO.cri.amount}">



					</form>

				</div>
			</div>
		</div>


	</div>
</section>


<script type="text/javascript">
   window.onload = function() {
    			 if(history.state === '' ) return;
    			 
    			 var msg = "${msg}"; //컨트롤러에서 넘어온 메시지
    			 if(msg !== '') {
    				 alert(msg);
    				 //브라우저의 기록을 새롭게 변경(데이터, 페이지제목, 변경할주소)
    				 //이렇게 변경된 기록정보는 history.state 객체를 통해서 확인이 가능합니다.
    				 history.replaceState('', null, null); 
    			 }	     
    		}

//페이징
/*  
	1. 페이지네이션을  a-> form태그로 변경
	2. criteria클래스에 검색에 대한 키워드를 추가
	3. 검색폼과 페이지폼이 동일한 값을 가지고 hidden 으로 넘어가도록 처리
	4. sql 문을 동적 쿼리로 변경
*/
//이벤트 위임방식으로 페이지네이션에 a태그에 이벤트를 전파
	var pagination = document.querySelector(".pagination");
pagination.onclick = function(){
	// a태그의 고유이벤트를 막는다
	event.preventDefault(); //고유이벤트 중단
	if(event.target.tagName !== "A") return; //A태그가 아니라면 종료
	
	var pageNum = event.target.dataset.page; //클릭한 타겟의 데이터 셋값
	document.pageForm.pageNum.value = pageNum //히든폼에 pageNum타겟값을 저장
	
	document.pageForm.submit(); //폼값 서브밋
}


</script>
























