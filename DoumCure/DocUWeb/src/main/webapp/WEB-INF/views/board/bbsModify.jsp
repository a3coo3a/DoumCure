<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
  <div class="bbs-area">
    <div class="container bbs-list-container  ">
      <div class="row bbs-content-wrap">
        <div class="bbs-list-title-box col-xs-3, col-md-12">
          <p>관리자 게시글 수정하기</p>
        </div>

        <form action="detailForm" method="post" name="detailForm">
          <div class="t-control">
            <select name="bbs-title-sel" id="bbs-title-sel">
              <option value="notice">공지사항</option>
              <option value="health" selected="selected">건강정보</option>
            </select>
            <div>
              <div class="t-title">NAME</div>
              <!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
              <div><input class="form-control Large input " name="writer" value="작성자" readonly><span id="msgId"></span>
              </div>
            </div>

            <div>
              <div class="t-title">TITLE</div>
              <div><input class="form-control Large input " name="title"><span id="msgTitle"></span>
              </div>
            </div>

            <div>
              <div class="t-title">COMMNET</div>
              <div>
                <div class="reply-content">
                  <!-- accept="image/* 모든 타입의 확장자 파일 허용 -->
                  <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" />
                  <div id="image_container"></div>
                  <textarea class="form-control" rows="10" name="content" id="content"></textarea>
                </div>
              </div>
            </div>
          </div>

          <div class="titlefoot">
            <div class="right-btn">
              <button type="button" class="btn btn-danger" id="uploadBtn">삭제하기</button>
              <button type="button" class="btn btn-info" id="modifyBtn">등록하기</button>
              <button type="button" class="btn" onclick="location.href='freeList' ">목록</button>
            </div>
          </div>
        </form>
        
      </div>
    </div>
  </div>
</section>

<script>
    function setThumbnail(event) {
      var reader = new FileReader();

      reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);
    }

    // <i class="fa fa-unlock-alt"></i>
    // <i class="fa fa-unlock"></i>

    function change(lock) {
      if (document.getElementById(lock).className == "fa fa-unlock") {
        document.getElementById(lock).className = "fa fa-unlock-alt";
        document.getElementById(lock).innerHTML = "잠금하기";
      }
      else {
        document.getElementById(lock).className = "fa fa-unlock";
        document.getElementById(lock).innerHTML = "잠금해제";

      }

    }

  </script>