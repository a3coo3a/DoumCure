<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container  ">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-xs-3, col-md-12">
					<p>관리자 게시글 상세보기</p>
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
									value="${vo.bbsWrite }" readonly>
							</div>
						</div>

						<div>
							<div class="t-title">TITLE</div>
							<div>
								<input class="form-control Large input " name="bbsTitle" value="${vo.bbsTitle}"
									readonly>
							</div>
						</div>

						<div>
							<div class="t-title col-md-12 col-sm-12">COMMNET</div>
							<div class="inner-control  col-md-12 col-sm-12 ">
								<div class="reply-content">
									<div class="fileDiv"></div>

									<div class="reply-group" style="text-align: center;">
										<img class="img-thumbnail"
											src="display/${vo.fileLoca}/${vo.fileName}">
									</div>
									<br>
									<textarea class="form-control" rows="10" name="content"
										id="content" readonly>${vo.bbsContent }</textarea>
									<div class="content-down-l"></div>

									<div class="content-down-r">
										<button type="button" class="btn btn-info" id="modifyBtn"
											onclick="location.href='bbsModify?bbsNo=${vo.bbsNo}&writer=${vo.bbsWrite }'">수정하기</button>
										<button class="btn" type="button"
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
    
    

    $(document).ready(function () {
    var bbsOC = "${vo.bbsOC}"
    var write = "${vo.bbsWrite}";
    var id = "${sessionScope.userVO.userId}";

   if(bbsOC == 'on'){
   	if(id !==  write){
   		window.location = history.go(-1);
   	}
   }

    if(id !== write ){
   	 $("#modifyBtn").css("display", "none" );
   	 
    	}
   	    
    });

  </script>