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
        <!-- start reply -->
        <li class="left clearfix" data-rno ='12'>
        	<div>
        		<div class="header">
        			<strong class="primary-font">user00</strong>
        			<small class="pull-right text-muted">2021-03-16 15:20</small>
        		</div>
        		<p>Good job!</p>
        	</div>
        </li>
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

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
	
    function showList(page){
    
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
      
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

    	});//end function
    
 	}//end showList */	


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
			
			showList(1);
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
	   	   showList(1);      //현재 보고 있는 댓글 페이지의 번호를 호출한다.(새로운 댓글을 수정하고 나서 현재 보고 있던 페이지 호출)
	   	    
	   	 });
	   	  
	});
	
	//댓글 제거(모달)
	modalRemoveBtn.on("click", function (e){
	   	  
	   	var rno = modal.data("rno");
	   	  
	   	  replyService.remove(rno, function(result){
	   	        
	   	     alert(result);
	   	     modal.modal("hide");
	   	     showList(1);    //현재 보고 있는 댓글 페이지의 번호를 호출한다. (새로운 댓글을 수정하고 나서 현재 보고 있던 페이지 호출)
	   	      
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
<%@include file="../includes/footer.jsp"%> <!-- footer.jsp 추가 -->
