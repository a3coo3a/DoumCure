<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<section>
	<div class="BLQA-area">
		<div class="container board_list_container ">
			<div class="row content-wrap">
				<div class="qa_blr_title_box col-lg-12 ">
					<p>자율게시판 상세보기</p>
				</div>
			</div>
		</div>

		<form action="freeDetailForm" method="post" name="freeDetailForm">

			<div class="container">
				<div class="container-inner row">

					<div class="innertitle col-md-3 col-sm-12">NAME</div>
					<!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
					<div class="inner-control col-md-7 col-sm-12 ">
						<input class="form-control Large input " name="writer"
							value="${vo.bbsWrite}" readonly>
					</div>

					<div class="innertitle col-md-3 col-sm-12">TITLE</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<input class="form-control Large input " name="title"
							value="${vo.bbsTitle}" readonly>
					</div>

					<div class="innertitle col-md-3 col-sm-12">COMMNET</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<div class="reply-content">
							<div class="fileDiv">
						<!-- 		<img id="fileImg" src="../resources/img/title_icon.png"> -->
							</div>

							<div class="reply-group">
								<img src="freeDetailForm?fileLoca=${vo.fileLoca}&fileName=${vo.fileName}">
								<%-- <img src="${vo.file }">	 --%>						
								<!-- <label for="file">이미지업로드</label> <input type="file" name="file"id="file"> -->
							</div>

							<textarea class="form-control" rows="10" name="content"
								id="content" readonly>${vo.bbsContent }</textarea>
							<div class="content-down-l">
								<input type="checkbox" id="bbsCO" name="bbsOC" value="${vo.bbsOC }" checked="checked" readonly> 비밀글

							</div>

							<div class="content-down-r">
								<button type="button" class="btn btn-warning" id="uploadBtn"
									onclick="location.href='freeboardModify?bbsNo=${vo.bbsNo}&writer=${vo.bbsWrite }' ">수정하기</button>
								<button class="btn" type="button"
									onclick="location.href='freeList' ">목록</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>

	</div>
</section>

<script> 
    window.onload = function() {
		 if(history.state === '' ) return;
		 
		 var msg = "${msg}"; //컨트롤러에서 넘어온 메시지
		 if(msg !== '') {
			 alert(msg);
			 //브라우저의 기록을 새롭게 변경(데이터, 페이지제목, 변경할주소)
			 //이렇게 변경된 기록정보는 history.state 객체를 통해서 확인이 가능합니다.
			 history.replaceState('', null, null); 
		 }
		     

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
 
	    
	}

    </script>