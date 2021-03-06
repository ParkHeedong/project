<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%> <!-- header.jsp 추가 -->


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read Page</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <div class="form-group">
        <label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>
        
		<div class="form-group">
        <label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
        <label>Text area</label> <textarea class="form-control" rows='3' name='content' readonly="readonly"><c:out value="${board.content }"/></textarea>
        </div>
        
        <div class="form-group">
        <label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
        </div>
        
        <button data-oper='modify' class="btn btn-default">Modify</button>
        <button data-oper='list' class="btn btn-info">List</button>
        
        <!--cri라는 이름으로 구성된 Criteria 객체를 이용해서 pageNum과 amount 값을 태그로 구성하고 버튼을 클릭하면 정상적으로 목록 페이지로 이동하게 처리한다  -->
        <!-- ex) 3번 페이지에서 게시글을 확인하고 다시 리스트를 눌렀을 때 다시 3번으로 오게 하는 것 -->
        <form id='operForm' action="/board/modify" method="get">
        	 <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
        	 <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
        	 <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
        	 <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
        	 <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
        </form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- 첨부파일 -->
<div class='bigPictureWrapper'> 
  <div class='bigPicture'> <!-- 첨부파일의 원본 이미지를 보여주는 bigpicture -->
  </div>
</div>



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>



<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'>  <!-- 첨부 파일의 목록을 보여주는 uploadResult -->
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<div class='row'>

  <div class="col-lg-12">
	<div class="panel panel-default">
    <!-- /.panel -->
    <div class="panel-heading">
      	<i class="fa fa-comments fa-fw"></i> Reply
      	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      </div>
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">
        
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->
      
      <div class="panel-footer">
      
      </div>

    </div>
  </div>
  <!-- ./ end row -->
</div>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value=''>
              </div>
      
            </div>
			  <div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		      </div>          
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>

$(document).ready(function () {
	
	var bnoValue = '<c:out value="${board.bno}"/>'; 
	var replyUL = $(".chat");
	
	showList(1);
	
	//showList() 함수는 파라미터로 전달되는 page 변수를 이용해서 원하는 댓글 페이지를 가져오게 된다.
	//만약 page 번호가 '-1'로 전달되면 마지막 페이지를 찾아서 다시 호출하게 된다.
	//사용자가 새로운 댓글을 추가하면 showList(-1);을 호출해서 우선 전체 댓글의 숫자를 파악한다.
	//이후에 다시 마지막 페이지를 호출해서 이동시키는 방식.
    function showList(page){
    	
    	console.log("show list " + page);
    
    	replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
      
    	console.log("replyCnt: "+ replyCnt);
		console.log("list: "+ list);
		console.log(list);
			
		if(page == -1){ //새로운 댓글을 추가하면 ex)showList(-1) 호출.  전체 댓글의 숫자를 파악하게 된다.
			pageNum = Math.ceil(replyCnt/10.0);
			showList(pageNum); //이후에 다시 마지막 페이지를 호출해서 이동시킨다.
			return;
		}
		
      	var str="";
     	if(list == null || list.length == 0){
      
      	replyUL.html("");
      
      	return;
    	}
	     for (var i = 0, len = list.length || 0; i < len; i++) {
	         str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	         str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
	         str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replydate)+"</small></div>";
	         str +="    <p>"+list[i].reply+"</p></div></li>";
	       }
	
	  	replyUL.html(str);
	  	
	  	showReplyPage(replyCnt);
	
	    	});//end function
	    
 	}//end showList */	

 	//댓글 페이지 번호를 출력
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }

 	//모달창
    var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");

	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	//New Reply 버튼 처리 이벤트
	$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
	//페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 함
    replyPageFooter.on("click","li a", function(e){
        e.preventDefault(); //<a>태그의 기본 동작 제한
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      });
	
	//모달창에서 댓글 추가
	modalRegisterBtn.on("click", function(e){
		
		var reply = {
				reply:modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				bno:bnoValue
		};
		replyService.add(reply, function(result){
			
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1); //마지막 페이지를 호출
		});
	});
	
	//댓글 조회 클릭 이벤트 처리(모달)
	$(".chat").on("click", "li", function(e){
		
		var rno = $(this).data("rno");
		
		replyService.get(rno, function(reply){
			
			//reply.reply에서 첫번째 reply는 Ajax를 통해서 조회해온 자바스크립트로 된 객체를 reply 라고 변수 처리한 것이다.
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime( reply.replydate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
		
	});
	
	//댓글 수정(모달)
	modalModBtn.on("click", function(e){
    	  
	   	var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	   	  
	   	 replyService.update(reply, function(result){
	   	        
	   	   alert(result);
	   	   modal.modal("hide");
	   	   showList(pageNum);      //현재 보고 있는 댓글 페이지의 번호를 호출한다.(새로운 댓글을 수정하고 나서 현재 보고 있던 페이지 호출)
	   	    
	   	 });
	   	  
	});
	
	//댓글 제거(모달)
	modalRemoveBtn.on("click", function (e){
	   	  
	   	var rno = modal.data("rno");
	   	  
	   	  replyService.remove(rno, function(result){
	   	        
	   	     alert(result);
	   	     modal.modal("hide");
	   	     showList(pageNum);    //현재 보고 있는 댓글 페이지의 번호를 호출한다. (새로운 댓글을 수정하고 나서 현재 보고 있던 페이지 호출)
	   	      
	   	 });
	   	  
	 });
});
	
</script>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit(); //수정 버튼 누르면 bno 값을 같이 전달하고 form태그를 submit시켜서 처리
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){ //list로 이동하는 경우에는 아무런 데이터도 필요하지 않으므로 bno태그 지우고 submit
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});


</script>

<script>

$(document).ready(function(){
	(function(){
		
		//해당 게시물의 댓글을 가져오는 부분이 자동으로 동작하게 처리하는 작업
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
			
			console.log(arr);
			
			var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.fileType){
		           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		             
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<img src='/resources/img/attach.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		});//end getjson
	})();//end function
	
	//다운로드 처리 (이미지인 경우 원본 이미지, 일반 파일의 경우 다운로드 실행)
	  $(".uploadResult").on("click","li", function(e){
	      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		   //이미지 크게 보기
		  function showImage(fileCallPath){
			    
		    alert(fileCallPath);
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }
		  
		   //원본 이미지가 보이는 창을 닫음
		  $(".bigPictureWrapper").on("click", function(e){
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 1000);
			  });
});
</script>
<%@include file="../includes/footer.jsp"%> <!-- footer.jsp 추가 -->
