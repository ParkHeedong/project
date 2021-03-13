<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<!-- POST 방식으로 처리하는 부분을 위해 form 태그로 내용들을 감싼다. -->
				<form role="form" action="/board/modify" method="post">
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
        	 		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>	
        	 		<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
        	 		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>

					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label>
						<!-- 제목이나 내용은 수정할 수 있게 read only 속성이 없도록 작성한다. -->
						<input class="form-control" name='title'
							value='<c:out value="${board.title }"/>'>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<!-- 제목이나 내용은 수정할 수 있게 read only 속성이 없도록 작성한다. -->
						<textarea class="form-control" rows="3" name='content'><c:out
								value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name='regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>Update Date</label> <input class="form-control" name='updatedate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate}" />'
							readonly="readonly">
					</div>

					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
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

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();  //<form>태그로 감싸면 그 안에 있는 모든 버튼의 base는 submit이다. 이러한 기본 동작을 막아버린다.

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/board/list").attr("method", "get"); //list버튼을 누르면 action 속성과 method 속성을 변경함
				var pageNumTag = $("input[name='pageNum']").clone();//list버튼을 클릭하면 <form>태그에서 필요한 부분만 복사해서 잠시 보관한다.
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty(); //리스트로 넘어갈 때는 아무런 파라미터가 없기 때문에 form태그의 모든 내용 지우고 submit 진행
				formObj.append(pageNumTag); //다시 필요한 태그들만 추가해서 /board/list를 호출하는 형태를 이용한다.
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			formObj.submit();
		});

	});
</script>





<%@include file="../includes/footer.jsp"%>
