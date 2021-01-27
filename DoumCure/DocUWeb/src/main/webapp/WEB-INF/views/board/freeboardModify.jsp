<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section>
	<div class="BLQA-area">
		<div class="container board_list_container ">
			<div class="row content-wrap">
				<div class="qa_blr_title_box col-lg-12 ">
					<p>자유게시판 수정하기</p>
				</div>
			</div>
		</div>

		<form action="freeModiForm" method="post" name="freeModiForm"
			enctype="multipart/form-data">

			<div class="container">
				<div class="container-inner row">

					<div class="innertitle col-md-3 col-sm-12">NUM</div>
					<div class="inner-control col-md-7 col-sm-12 ">
						<input class="form-control  " name="bbsNo" id="num"
							value="${vo.bbsNo}" readonly>
					</div>

					<div class="innertitle col-md-3 col-sm-12">NAME</div>
					<!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
					<div class="inner-control col-md-7 col-sm-12 ">
						<input class="form-control " name="writer" id="writer"
							value="${vo.bbsWrite}" readonly>
					</div>
					<div class="innertitle col-md-3 col-sm-12">TITLE</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<input class="form-control Large input " name="bbsTitle"
							value="${vo.bbsTitle}">
					</div>



					<div class="innertitle col-md-3 col-sm-12">COMMNET</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<div class="reply-content">
							<div class="fileDiv">
							
							<input type="hidden" name="gdsImg1" value="${vo.fileLoca}"> 
						<input type="hidden" name="gdsImg2" value="${vo.fileRealName}"> 
							
								<img id="fileImg" src="">
							</div>
							<div class="reply-group">
								<img class="img-thumbnail" src="display/${vo.fileLoca}/${vo.fileName}"><br>
								<label for="file">이미지업로드</label> <input type="file" name="file" id="file">
							</div>

							<textarea class="form-control" rows="10" name="bbsContent"
								id="content">${vo.bbsContent }</textarea>
							<div class="content-down-l">
								<input type="checkbox" id="bbsCO" name="bbsOC"
									value="${vo.bbsOC }" checked="checked"> 비밀글
							</div>


							<div class="content-down-r">
								<button type="button" class="btn btn-danger" id="deleteBtn"
									onclick="location.href='freeboardelete?bbsNo=${vo.bbsNo}' ">삭제하기</button>
								<button type="button" class="btn btn-danger" id="updateBtn">수정완료</button>
								<button type="button" class="btn"
									onclick="location.href='freeboardList' ">목록</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>

	</div>
</section>

<script> 






//자바 스크립트 파일 미리보기 기능
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
    //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    reader.readAsDataURL(input.files[0]);
    //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
    $(".fileDiv").css("display", "block");
    reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
      $('#fileImg').attr("src", event.target.result);
      console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
      $(".img-thumbnail").hide(); 
    }
  }
}
$("#file").change(function () {
  readURL(this); //this는 #file자신 태그를 의미
  
  if(input.files[0] !== "" ){
  $("#img-thumbnail").hide();
	  
  }
  
  
});



$(document).ready(function () {

    $("#updateBtn").click(regist);

    function regist() {

      //회원만 등록 가능하도록 처리
      var writer = "${sessionScope.userVO.userId}";
      var file = $("#file").val();

      //파일 확장자체크
      file = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
      console.log(file);

     /*  if (file != "jpg" && file != "png" && file != "jpeg") {
        alert("이미지(jpg,png,jpeg)만 등록이 가능합니다")
        return;
      }
      else */
    	  if (writer == '') { //세션이 없다면
        alert("로그인 필요한 서비스입니다")
        return;
      }
      document.freeModiForm.submit(); //서브밋
    }; //등록 end  		

    
  });





/* 
 //자바 스크립트 파일 미리보기 기능
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
      //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
      reader.readAsDataURL(input.files[0]);
      //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
      $(".fileDiv").css("display", "block");
      reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
     	  $('#fileImg').attr("src", event.target.result);
        console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
      }
    }
  }
  $("#file").change(function () {
    readURL(this); //this는 #file자신 태그를 의미
  }); 
  
 
  
  var updateBtn = document.getElementById("updateBtn");
  updateBtn.onclick = function() {
      if(document.freeModiForm.writer.value === '') {
          alert("작성자는 필수 입니다");
          document.freeModiForm.writer.focus();
          return;
      } else if(document.freeModiForm.title.value === '') {
          alert("제목은 필수 입니다");
          document.freeModiForm.title.focus();
          return;
      } else {
    	  
          document.freeModiForm.action = "freeModiForm"; //폼값의 action을 지정
          console.log(document.freeModiForm.content.value);         
          document.freeModiForm.submit(); //서브밋
      }
  }
   
 */ 


    </script>