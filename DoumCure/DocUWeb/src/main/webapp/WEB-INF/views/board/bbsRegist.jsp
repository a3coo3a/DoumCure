<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-xs-3, col-md-12">
					<p>관리자 게시글 등록</p>
				</div>

				<form action="registForm" method="post" name="registForm"	enctype="multipart/form-data">
					<div class="t-control">
					<!-- 	<select size="1" name="BBSCATE">
							<option value="notice">공지사항</option>
							<option value="health" selected="selected">건강정보</option>
						</select> -->
						<input type="hidden" class="form-control " name="Category" value="health" readonly>          
						<div>
							<div class="t-title">NAME</div>
							<div>
								<input class="form-control Large input " name="writer"
									value="${sessionScope.userVO.userId }" readonly>
							</div>
						</div>

						<div>
							<div class="t-title">TITLE</div>
							<div>
								<input class="form-control Large input " name="bbsTitle">
							</div>
						</div>

						<div>
							<div class="t-title">COMMNET</div>
							
								<div class="inner-control">
									<div class="reply-content">
										<div class="fileDiv">
											<img id="fileImg" src="">
										</div>

										<div class="reply-group">
											<label for="file">이미지업로드</label> <input type="file"
												name="file" id="file" class="form-controll">
										</div>
										<textarea class="form-control" rows="10" name="bbsContent"	id="content"></textarea>
									</div>
								</div>
							
							<div class="titlefoot">
								<div class="right-btn">
									<button type="button" class="btn btn-info" id="uploadBtn">등록하기</button>
									<button type="button" class="btn"
										onclick="location.href='freeList'">목록</button>
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
     }
   }
 }
 $("#file").change(function () {
   readURL(this); //this는 #file자신 태그를 의미
 });


 
 $(document).ready(function () {

     $("#uploadBtn").click(regist);

     function regist() {

       //회원만 등록 가능하도록 처리
       var writer = "${sessionScope.userVO.userId}";
       var file = $("#file").val();

       //파일 확장자체크
       file = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
       console.log(file);

        if (file != "jpg" && file != "png" && file != "jpeg") {
         alert("이미지(jpg,png,jpeg)만 등록이 가능합니다")
         return;
       }
       else 
       	
       	if (writer == '') { //세션이 없다면
         alert("로그인 필요한 서비스입니다")
         return;
       }
       document.registForm.submit(); //서브밋
     }; //등록 end  		

     
   });
 
    
    
    
    
    
    

    </script>
