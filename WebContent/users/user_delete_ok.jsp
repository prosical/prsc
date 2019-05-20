<%@page import="kr.co.koo.izone.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String)session.getAttribute("user_id");

	MemberDAO dao = MemberDAO.getInstance();
	boolean check = dao.deleteMember(id);
	
	if(check) {		
		session.invalidate();
%>
		<script>
			alert("회원 탈퇴가 정상처리되었습니다.");
			location.href='/izone';
		</script>
<%
	}else {
%>
		<script>
			alert("회원 탈퇴에 실패했습니다.");
			location.href='/izone/users/mypage_delete_check.jsp';
		</script>
<%
	}
%>