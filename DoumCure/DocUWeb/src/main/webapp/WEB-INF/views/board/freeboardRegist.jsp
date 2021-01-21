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
         
            <div class="inner-control col-md-7 col-sm-12 ">
              <input class="form-control Large input " name="writer" value="${sessionScope.userVO.userId }" readonly>
            </div>


            <div class="innertitle col-md-3 col-sm-12">
              TITLE</div>
            <div class="inner-control  col-md-7 col-sm-12 ">
              <input class="form-control Large input " name="title"><span id="msgTitle"></span>
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
                <textarea class="form-control" rows="10" name="content" id="content"></textarea><span id="msgContent"></span>
                	<!--  <i id="lock" class="fas fa-lock-open" onclick="change(lock)">공개글</i>  -->
                	<!--  <i id="lock" class="fa fa-unlock" value="ON" aria hidden="true" onclick="change(lock)">비공개글</i>  -->
                	 
               <!--  <input type="checkbox" id="lock" name="bbsOC" class="fa fa-unlock"
                  onclick="change( )" hidden="true"><p>잠금<p>  -->
                <button type="button" class="btn btn-info" id="uploadBtn">등록하기</button>
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
  	
 /*     function setThumbnail(event) {
      var reader = new FileReader();

      reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);
    } */
    

	
 
 			
    $(document).ready(function () {
		$("#uploadBtn").click(regist);
		
		function regist() {
		
			//회원만 등록 가능하도록 처리
			var writer = "${sessionScope.userVO.userId}";
			var file = $("#file").val();
			
			//파일 확장자체크
			file = file.substring(file.lastIndexOf('.')+1,file.length).toLowerCase();
			console.log(file);
			
			if(file != "jpg" && file != "png" && file != "jpeg"){
				alert("이미지(jpg,png,jpeg)만 등록이 가능합니다")
				return;
			} 
			 else if(writer == ''){ //세션이 없다면
				alert("로그인 필요한 서비스입니다")
				return;
			} 
			document.freeRegistForm.submit(); //서브밋
			}; //등록 end  		

		 
 
			//자바 스크립트 파일 미리보기 기능
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
		
			
			 
/* 		$('.reply-content').click(function() {
				 console.log(this);
			    $("i", this).toggleClass("fa fa-unlock").attr('value','OFF').html('공개글');
			    $("i", this).toggleClass("fas fa-lock-open").attr('value','ON').html("비공개글");
			
			}); 
			 */
			
		/*   function change(lock) {
			      if (document.getElementById(lock).className == "fa fa-unlock") {
			        document.getElementById(lock).className = "fas fa-lock-open";
			        document.getElementById(lock).innerHTML = "공개글";
			        document.getElementById(lock).value="OFF"
			      }
			      else {
			        document.getElementById(lock).className = "fa fa-unlock";
			        document.getElementById(lock).innerHTML = "비공개글";
			        document.getElementById(lock).value="ON"

			      }
			
			   } */

			    

		
    	/* function freeRegist() {
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
    					 		
		}   */
    	
    	
    	
    	
    });

  </script>