<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<style>
header.masthead {
	
	display: none;
}	
</style>
<br/><br/>
<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #ff52a0;"> 게시글 등록</div>
      <div class="card-body">

        <form role="form" action="/izone/board/BWrite.izone" method="post">
        
          <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name='#' value="${user_name}(${user_id})" readonly>
          	<input type="hidden" name="bName" value="${user_name}" />
          </div>
          
          <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name='bTitle'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='bContent'></textarea>
          </div>

         <input type="submit" value="등록" class="btn form-control"
			style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a class="btn form-control" href="/izone/board/BList.izone"
		style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">취소</a>
        </form>

      </div>
    </div>
  </div>
</div>
</div>
<%@ include file="../include/footer.jspf" %>
