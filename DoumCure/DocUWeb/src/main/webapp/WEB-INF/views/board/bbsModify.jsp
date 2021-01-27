<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container  ">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-xs-3, col-md-12">
					<p>관리자 게시글 수정하기</p>
				</div>

				<form action="detailForm" method="post" name="detailForm"
					enctype="multipart/form-data">
					<div class="t-control">
						<div>
							<input class="form-control Large input " id="board-title-sel"
								name="title" value="건강정보" readonly>
						</div>
						<div>
							<div class="t-title">NAME</div>
							<div>
								<input class="form-control Large input " name="writer"
									value="${vo.bbsWrite}" readonly> <input type="hidden"
									class="form-control Large input " name="bbsNo"
									value="${vo.bbsNo}">
							</div>
						</div>

						<div>
							<div class="t-title">TITLE</div>
							<div>
								<input class="form-control Large input " name="bbsTitle"
									value="${vo.bbsTitle}">
							</div>
						</div>
						<div>
							<div class="t-title col-md-12 col-sm-12">COMMNET</div>
							<div class="inner-control  col-md-12 col-sm-12 ">
								<div class="reply-content">
									<div class="fileDiv" style="text-align: center;">
										<input type="hidden" name="gdsImg1" value="${vo.fileLoca}">
										<input type="hidden" name="gdsImg2" value="${vo.fileRealName}">
										<img id="fileImg" src="">
									</div>
									<div class="reply-group" style="text-align: center;">
										<img class="img-thumbnail"
											src="display/${vo.fileLoca}/${vo.fileName}"><br> 
											<label
											for="file">이미지업로드</label> <input type="file" name="file"
											id="file">
									</div>
									<br>
									<textarea class="form-control" rows="10" name="bbsContent"
										id="content">${vo.bbsContent }</textarea>
									<div class="content-down-l"></div>
									<div class="content-down-r">
										<button type="button" class="btn btn-danger" id="deletBtn"
											onclick="location.href='bbsdelete?bbsNo=${vo.bbsNo}' ">삭제하기</button>
										<button type="button" class="btn btn-info" id="updateBtn">수정완료</button>
										<button type="button" class="btn"
											onclick="location.href='bbsList' ">목록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
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
    document.detailForm.submit(); //서브밋
  }; //등록 end  		

  
});



	
	
	
	
	
	
	
	
	
	
	
</script>