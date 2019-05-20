<%@page import="kr.co.koo.izone.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 요청 파라미터 처리
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	String id = (String)session.getAttribute("user_id");
	//2. 알맞은 모델을 찾아 로직 처리.
	// a - 기존 비밀번호가 맞는지 확인. (userCheck메서드 재활용)
	// b - 기존 비밀번호가 틀렸다면 "현재 비밀번호를 다시 확인하세요."
	//   라는 알림창을 띄우고 뒤로가기 실행.
	// c - 기존 비밀번호가 맞다면 새로운 비밀번호로 정상 변경 수행 후
	//    "비밀번호가 정상적으로 변경되었습니다." 알림창 출력 후,
	//   홈 화면으로 안내.
	MemberDAO dao = MemberDAO.getInstance();
	if(dao.userCheck(id, oldPw) == MemberDAO.LOGIN_SUCCESS) {
		
		boolean flag = dao.changePassword(id, newPw);
		if(flag) {
%>
<script>
			alert("비밀번호가 정상적으로 변경되었습니다.");
			document.location.href="/izone";
		</script>
<%
		}else {
%>
		<script>
			alert("비밀번호 변경에 실패했습니다.");
			history.back();
		</script>
<%		
		}
	}else {
%>
	<script>
		alert("기존 비밀번호를 다시 확인해주세요.");
		history.back();
	</script>
<%		
	}
%>





