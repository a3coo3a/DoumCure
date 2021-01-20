<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
     <!-- section 본문시작-->
  <section>
    <div class="BLQA-area">
      <div class="container board_list_container ">
        <div class="row content-wrap">
          <div class="qa_blr_title_box col-lg-12 ">
            <p>자유게시판 글작성</p>
          </div>
        </div>
      </div>

      <form action="freeRegistForm" method="post" name="qaregistForm">

        <div class="container">
          <div class="container-inner row">

            <div class="innertitle col-md-3 col-sm-12">
              NAME
            </div>
            <!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
            <div class="inner-control col-md-7 col-sm-12 ">
              <input class="form-control Large input " name="writer" value="작성자" readonly>
            </div>


            <div class="innertitle col-md-3 col-sm-12">
              TITLE</div>
            <div class="inner-control  col-md-7 col-sm-12 ">
              <input class="form-control Large input " name="title"><span id="msgTitle">
            </div>

            <div class="innertitle col-md-3 col-sm-12">
              COMMNET
            </div>
            <div class="inner-control  col-md-7 col-sm-12 ">
              <div class="reply-content">
                <!-- accept="image/* 모든 타입의 확장자 파일 허용 -->
                <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" />
                <div id="image_container"></div>
                <textarea class="form-control" rows="10" name="content" id="content"></textarea>
              </div>
            </div>
          </div>

          <div class="titlefoot row">
            <div class="blq-right-btn  col-sm-6 ">
              <i id="lock" class="fas fa-lock-open" onclick="change('lock')" aria hidden="true">공개글</i>
              <button type="button" class="btn btn-info" id="uploadBtn" onclick="freeRegist()">등록하기</button>
              <button class="btn" type="button" onclick="location.href='QAboardList' ">목록</button>
            </div>
          </div>
        </div>

      </form>
    </div>
  </section>
  
  
  <!-- section script -->
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



    function change(lock) {
      if (document.getElementById(lock).className == "fa fa-unlock") {
        document.getElementById(lock).className = "fas fa-lock-open";
        document.getElementById(lock).innerHTML = "공개글";
      }
      else {
        document.getElementById(lock).className = "fa fa-unlock";
        document.getElementById(lock).innerHTML = "비공개글";

      }

    }
    
    	function freeRegist() {
    		if(document.registForm.title.value === '') {
    			document.getElementById("msgTitle").innerHTML = "제목은 필수 입니다";
    			document.registForm.writer.focus();
    			return;
    		} else if(document.registForm.content.value === '') {
    			document.getElementById("msgContent").innerHTML = "내용은 필수 입니다";
    			document.registForm.title.focus();
    			return;
    		} else {
    			document.freeRegistForm.submit(); //서브밋
    		}
			 		
		} 

  </script>