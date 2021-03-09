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
                                	<td><a href='/board/get?bno=<c:out value="${board.bno }" />'>
									<c:out value="${board.title}" /></a></td>
                                    <td><c:out value="${board.writer}" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" /></td>
                                </tr>
                                </c:forEach>
                            </table>
                            <!-- /.table-responsive -->
                            
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
            });
            
            </script>
            
        <%@include file="../includes/footer.jsp"%>