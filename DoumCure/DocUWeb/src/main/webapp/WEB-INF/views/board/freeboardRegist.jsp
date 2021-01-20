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
                <div class="reply-group">
                  <label for="file">이미지업로드</label>
                  <input type="file" name="file" id="file">
                </div>
                <textarea class="form-control" rows="10" name="content" id="content"></textarea>
                <input type="checkbox" value="OFF" checked="checked" id="lock" class="fa fa-unlock"
                  onclick="change('lock')" aria hidden="true">
                <button type="button" class="btn btn-info" id="uploadBtn" onclick="freeRegist()">등록하기</button>
                <button class="btn" type="button" onclick="location.href='freeboardList' ">목록</button>
              </div>
            </div>
          </div>
        </div>
      </form>

    </div>
  </section>
  
  
  <!-- section script -->
  <script>
  
	//자바 스크립트 파일 미리보기 기능
	var input = document.getElementById("file");
	function readURL(input) {
  	if (input.files && input.files[0]) {
  		
      	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
      	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
      	reader.readAsDataURL(input.files[0]); 
      	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
          $(".fileDiv").css("display", "block");
      	
      	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
          	$('#fileImg').attr("src", event.target.result); 
          	console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
      		}
  		}
	}
	$("#file").change(function() {
      readURL(this); //this는 #file자신 태그를 의미
  });
	
 /*     function setThumbnail(event) {
      var reader = new FileReader();

      reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);
    } */

 			

 


    function change(lock) {
      if (document.getElementById(lock).className == "fa fa-unlock") {
        document.getElementById(lock).className = "fas fa-lock-open";
        document.getElementById(lock).innerHTML = "공개글";
        document.getElementById(lock).value = "OFF";

      }
      else {
        document.getElementById(lock).className = "fa fa-unlock";
        document.getElementById(lock).innerHTML = "비공개글";
        document.getElementById(lock).value = "ON";

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