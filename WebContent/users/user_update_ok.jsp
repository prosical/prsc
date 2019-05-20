<%@page import="kr.co.koo.izone.member.model.MemberDAO"%>
<%@page import="kr.co.koo.izone.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 값 처리 후 DB연동을 통해 정보 수정 처리 완료.
	//수정 성공시 알림창으로 "회원정보가 정상적으로 수정되었습니다."
	//출력 후 홈으로 안내 , 실패 시에는 "회원정보 수정에 실패했습니다"
	//출력 후 홈으로 안내.
	//세션 관련 처리를 잘 생각해 볼것. 
	//DAO메서드 이름은 updateMember로 지정.
%>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("user_id");
	String name = request.getParameter("userName");
	String email = request.getParameter("userEmail");
	
	MemberVO member = new MemberVO();
	member.setUserId(id);
	member.setUserName(name);
	member.setUserEmail(email);
	
	MemberDAO dao = MemberDAO.getInstance();
	
	boolean check = dao.updateMember(member);
		
	if(check) {
		session.setAttribute("user_name", member.getUserName());
%>
		<script>
			alert("회원정보가 정상적으로 수정되었습니다.");
			location.href="/izone";
		</script>
<%
	}else {
%>
		<script>
			alert("회원정보 수정에 실패했습니다.");
			location.href="/izone";
		</script>
<%
	}
%>