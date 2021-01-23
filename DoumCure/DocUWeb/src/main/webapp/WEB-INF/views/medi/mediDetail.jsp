<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.medi-info-box .content{
	font-size : 15px;
}
.medi-info-box .line{
	color : #C2E8CA;
}
</style>
<section class="medi-area">

  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        
        <div>
          <h4 class="medi-gray">${mediVO.proCom }</h4>
           <h5 class="medi-gray">${mediVO.proNo }</h5>
          <h2>${mediVO.proName }</h2>
        </div>
        
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star1"></div>
        </div>
        
        <div class="medi-info-detail">
        
          <div class="medi-info-box">
            <div></div>
            <div class="title-name">보관 방법</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proSave }</div>
          </div>
          
          <div class="medi-info-box">
            <div class="title-name">사용 기한</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proDate }</div>
          </div>

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proEffi }</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proMain }</div>
          </div>

		  <div class="medi-info-box">
            <div class="title-name">부성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proSub }</div>
          </div>
 
        </div>
        
        <!-- 목록으로 -->
        <div>
			<button type="button" class="btn medi-com-btn" onclick="history.go(-1)"><span class="glyphicon glyphicon-list"></span>&nbsp;목록으로</button>        
        </div>
        
        
      </div>
     </div>
   </div>
      
</section>

<!-- 이미 즐겨찾기 되어 있으면 별 색칠하기 -->
<script>
$(document).ready(function(){
	
	var bookmark01 = "${userVO.userBookMark01}";
	var bookmark02 = "${userVO.userBookMark02}";
	var bookmark03 = "${userVO.userBookMark03}";
	var proNo = "${mediVO.proNo }";
	
	console.log("bo01:"+bookmark01);
	console.log("bo02:"+bookmark02);
	console.log("bo03:"+bookmark03);
	console.log(proNo);
	
	if(bookmark01 == proNo | bookmark02 == proNo | bookmark03 == proNo){
		 if($(".medi-com-img").children().hasClass("empty-stars")){
			$(".medi-com-img").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	    	$(".medi-com-img").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}
})
</script>

<!-- mediDetail script -->
<script>
  
function starChange(){
   var userVO = "${sessionScope.userVO}"
	if(userVO == ''){
			alert("회원만 이용가능합니다.");   
			return;
	}
   
    if($(this).children().hasClass("empty-stars")){
    	
      		// 북마크 추가
      		console.log("${mediVO.proNo }");
      		
      		$.ajax({
      			url : "addBookmark",
      			type : "POST",
      			data : {"proNo":"${mediVO.proNo }"},
      			success : function(data){
      				console.log(data);
      				
      				// 3 : 즐겨찾기가 가득차 있음
      				// 2 : 이미 존재하는 즐겨찾기 
      				// 1 : 추가 성공
      				// 0 : 실패
      				if (data == 3){
      					alert("즐겨찾기가 이미 가득찼습니다.");  
      				}else if (data == 2 || data == 1) {
      					console.log("왓나?");
      					if($(".medi-com-img").children().hasClass("empty-stars")){
      						$(".medi-com-img").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
      				    	$(".medi-com-img").children().addClass("full-stars").removeClass("empty-stars");
      					 }
      				}else if(data == 0){
      					alert("즐겨찾기 추가에 실패 했습니다. 관리자에게 문의하세요");
      				}
      			},
      	    	 error : function(error){
      	    		console.log("error"+error);
      	    		alert("error:즐겨찾기 추가에 실패 했습니다. 관리자에게 문의하세요");
      	    	 }
      		});
    }else if($(this).children().hasClass("full-stars")){
	      // 북마크 삭제
	      $.ajax({
	    	 url : "rmBookmark",
	    	 type : "POST",
	    	 data : {"proNo":"${mediVO.proNo }"},
	    	 success : function(data){
	    		 console.log(data);
	    			// 3 : 즐겨찾기에 없음.
	    			// 1 : 삭제 성공
	    			// 0 : 실패
	    		if(data == 3 || data == 1){
	    			console.log("이곳은 왓나?");
					$(this).children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
				    $(this).children().addClass("empty-stars").removeClass("full-stars");
				}else if(data == 0){
					alert("즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
				}
	    	 },
	    	 error : function(error){
	    		 console.log("error"+error);
	    		 alert("error:즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
	    	 }
	      });
      
      
    	}
	}

  $(".medi-com-img").click(starChange)
  
</script>