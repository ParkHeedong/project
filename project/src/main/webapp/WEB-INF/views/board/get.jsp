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
