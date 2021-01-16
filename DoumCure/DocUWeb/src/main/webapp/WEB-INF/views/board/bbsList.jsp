<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
  <div class="bbs-area">
    <div class="container bbs-list-container ">
      <div class="row bbs-content-wrap">
        <div class="bbs-list-title-box col-lg-12 ">
          <button type="submit" class="btn bbsList-btn">write</button>
          <p id="notice">공지사항 게시판</p>
        </div>
        
        <!--공지사항 리스트 -->
        <form action="boardlistForm" method="POST" name="boardlistForm">
          <table class="table bbs-table-bordered">
            <tr>
              <th class="bbs-list-num">num</th>
              <th class="bbs-list-title">title</th>
              <th class="bbs-list-Date">regdate</th>

              </th>
            </tr>
            <tr>
              <td class="bbs-list-num">1</td>
              <td class="bbs-list-title">제목입니다</td>
              <td class="bbs-list-Date">20.01.12</td>

              </td>
            </tr>
            <tr>
              <td class="bbs-list-num">2</td>
              <td class="bbs-list-title">제목입니다</td>
              <td class="bbs-list-Date">등록일</td>

            </tr>
            <tr>
              <td class="bbs-list-num">3</td>
              <td class="bbs-list-title">제목입니다</td>
              <td class="bbs-list-Date">등록일</td>

            </tr>
            <tr>
              <td class="bbs-list-num">4</td>
              <td class="bbs-list-title">제목입니다</td>
              <td class="bbs-list-Date">등록일</td>

            </tr>
            <tr>
              <td class="bbs-list-num">5</td>
              <td class="bbs-list-title">제목입니다</td>
              <td class="bbs-list-Date">등록일</td>

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
            <li><a href="#"><<</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">>></a></li>
          </ul>
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