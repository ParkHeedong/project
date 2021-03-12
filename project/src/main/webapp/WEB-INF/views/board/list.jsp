<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Board List Page
                             <button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                	<tr>
                                		<th>#번호</th>
                                		<th>제목</th>
                                		<th>작성자</th>
                                		<th>작성일</th>
                                		<th>수정일</th>
                                	</tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="board"> 
                                <!-- /board/list를 실행했을 때 이미 BoardController는 Model을 이용해서 게시물의 목록을 list라는 이름으로 담아서 전달했으므로 list.jsp에서는 이를 출력 -->
                                <tr>
                                	<td><c:out value="${board.bno}" /></td>
                                	<td><a class='move' href='<c:out value="${board.bno }" />'>
									<c:out value="${board.title}" /></a></td>
                                    <td><c:out value="${board.writer}" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" /></td>
                                </tr>
                                </c:forEach>
                            </table>
                            <!-- /.table-responsive -->
                            
                            <!-- 화면 밑에 페이지 번호가 나오게 함 -->
							<div class='pull-right'>
								<ul class="pagination">
		
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a	href="${pageMaker.startPage-1}">Previous</a></li>
									</c:if>
		
									<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
										<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
		
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next">
										<a href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!--  end Pagination -->
						</div>
						
						
						<!-- <form>태그를 추ㅏ해서 url의 이동을 처리 -->
						<form id='actionForm' action="/board/list" method='get'>
							<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum}'> 
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						</form>
						
							
				            <!-- Modal  추가 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										</div>
										<div class="modal-body">처리가 완료되었습니다.</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save changes</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal 종료 -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <script type="text/javascript">
            
            $(document).ready(function() {
            	
            	var result = '<c:out value="${result}"/>'; //새로운 게시물이 등록되면 result 값이 생성된다(게시물의 번호)
            	
            	checkModal(result);
            	
            	history.replaceState({},null,null);
            	
            	function checkModal(result){
            		
            		if(result == '' || history.state){ //history.state 체크 -> history 객체를 이용해서 현재 페이지는 모달창을 띄울 필요가 없다고 표시
            			return;
            		}
            		
            		if(parseInt(result) > 0){
            			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            		}
            		$("#myModal").modal("show"); //모달창 보여주기
            	}
            	
            	//등록 버튼 누르면 /board/register로 이동
            	$("#regBtn").on("click", function(){
            		self.location ="/board/register";
            	});
            	
            	//게시물의 제목을 클릭했을 때 이동하도록 이벤트 처리
            	//<input>태그를 만들어서 <form>태그에 추가로 bno 값을 전송하고 <form>태그의 action은 '/board/get'으로 변경한다.
            	$(".move").on("click",function(e) {

							e.preventDefault();
							actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>");
							actionForm.attr("action", "/board/get");
							actionForm.submit();

						});
            	
            	var actionForm = $("#actionForm"); //<a>태그가 원래의 동작을 못하도록 처리

				$(".paginate_button a").on("click", function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					});
            });
            
            </script>
            
        <%@include file="../includes/footer.jsp"%>