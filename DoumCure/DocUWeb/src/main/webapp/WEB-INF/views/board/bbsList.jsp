<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section>
  <div class="bbs-area">
    <div class="container bbs-list-container ">
      <div class="row bbs-content-wrap">
        <div class="bbs-list-title-box col-lg-12 ">
          <button type="submit" class="btn bbsList-btn" onclick="location.href='bbsRegist' ">write</button>
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




        <!-- 건강정보게시판 -->

        <div class="bbs-list-title-box col-lg-12">
          <p id="health">건강정보</p>
        </div>

        <div class="bbs-titlebox-inner">
          <div class="row health_List">
            <div class="gallery col-sm-12 col-md-6 col-lg-3 ">
              <div class="">
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery col-sm-12 col-md-6 col-lg-3 ">
              <div class="galleryIn">
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery  col-sm-12 col-md-6 col-lg-3">
              <div>
                <a href="#">
                  <img src="..//img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery  col-sm-12 col-md-6 col-lg-3">
              <div>
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>
          </div>
          <div class="row health_List">
            <div class="gallery col-sm-12 col-md-6 col-lg-3 ">
              <div class="">
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery col-sm-12 col-md-6 col-lg-3 ">
              <div class="galleryIn">
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery  col-sm-12 col-md-6 col-lg-3">
              <div>
                <a href="#">
                  <img src="..//img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>

            <div class="gallery  col-sm-12 col-md-6 col-lg-3">
              <div>
                <a href="#">
                  <img src="../img/title_icon.png" width="600" height="400">
                </a>
                <div class="desc">건강정보_제목</div>
              </div>
            </div>
          </div>

        </div>

        <ul class="pager">
          <li><a href="#"><<</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#">>></a></li>
        </ul>

      </div>
    </div>
  </div>



</section>