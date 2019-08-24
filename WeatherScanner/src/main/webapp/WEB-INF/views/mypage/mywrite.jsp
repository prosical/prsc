<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />

  <!--/.header-top-->
  <!--header-top end -->
<body>

  <!--/subscription-->
  <!--subscription end -->
  <!--explore start -->
  <section id="reviews" class="reviews">
    <div class="container">
      <div class="wrapper">

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content container-fluid">
			<div class="section-header">
        	<h2>내가 쓴 게시글</h2>
      		 	 <p></p>
     	 	</div>
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 30px">No</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 200px">작성시간</th>
										<th style="width: 60px">조회수</th><th style="width: 50px"><img src="<c:url value='/assets/images/likeit.JPG' />" style="width: 30px"></th>
									</tr>

									<%-- 게시물이 들어갈 공간 --%>
									<c:if test="${articles.size()<= 0}">
										<tr>
											<td align="center" colspan="5"><strong>내가 작성한 게시글이 없습니다.</strong></td>
										</tr>
									</c:if>
									<c:if test="${articles.size() > 0}">
										<c:forEach var="article" items="${articles}">
											<tr>
												<td>${article.boardNo}</td>
												<td>
													<a href="<c:url value='/board/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&boardNo=${article.boardNo}'/>"
													 style="text-transform: none;">
														${article.title} [${article.replyCnt}]
													</a> 
													<c:if
														test="${article.newMark}"><span class="label label-success">new</span>
													</c:if>
												</td>
												<td>${article.memberId}</td>
												<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td>${article.viewCnt}</td>
												<td>${article.likeCnt}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>


						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">

									<c:if test="${pageCreator.prev}">
										<li><a
											href="<c:url value='/mypage/mywrite${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}' />">이전</a></li>
									</c:if>

									<c:forEach var="idx" begin="${pageCreator.beginPage}"
										end="${pageCreator.endPage}">
										<li
											<c:out value=
											"${pageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a
											href="<c:url value='/mypage/mywrite${pageCreator.makeSearchURI(idx)}'/>">${idx}</a></li>
									</c:forEach>

									<c:if test="${pageCreator.next}">
										<li><a
											href="<c:url value='/mypage/mywrite${pageCreator.makeSearchURI(pageCreator.endPage + 1)}' />">다음</a></li>
									</c:if>

								</ul>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

    </div>
    <!--/.container-->
</div>
  </section>
  <!--/.explore-->
  <!--explore end -->


<script type="text/javascript">
	
	//JQuery문의 시작
	$(document).ready(function() {		
		//목록 개수 표현하기
		$("#count-per-page input[type=button]").on("click", function() {
						    	
			//console.log($(this).val());
			let count = $(this).val();
			self.location = "mywrite?page=${pageCreator.criteria.page}&countPerPage=" + count; 
		});
		
		
	});
    
	</script>
	
  <!-- /.blog-->
  <!--  blog end -->



<jsp:include page="../include/footer.jsp" />