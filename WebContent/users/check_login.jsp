<%@page import="kr.co.koo.izone.member.model.MemberVO"%>
<%@page import="kr.co.koo.izone.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 요청 파라미터 처리(입력된 id, pw)
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	//2. 모델을 찾아 DB연동 처리.
	MemberDAO dao = MemberDAO.getInstance();
	int rn = dao.userCheck(id, pw);
	String str = "";

	//3. DB처리 결과에 따른 알림창 설정.
	// a - 로그인 성공시 세션에 user_id, user_name이란 이름으로
	//    로그인한 회원의 아이디와 이름을 저장 후 홈으로 안내.
	// b - 존재하지 않는 회원일 경우 알림창으로 "존재하지 않는 ID입니다"
	//    출력 후 뒤로가기 실행 (history.back())
	// c - 비밀번호가 틀렸을 경우 알림창으로 "비밀번호가 틀렸습니다" 출력 후
	//    뒤로가기 실행.
	if(rn == MemberDAO.LOGIN_SUCCESS) {
		MemberVO user = dao.getMemberInfo(id);
		session.setAttribute("user_id", id);		
		session.setAttribute("user_name", user.getUserName());
		//response.sendRedirect("/izone");
		str = "LOGIN_OK";
	} else if(rn == MemberDAO.LOGIN_FAIL_PW) {
		str = "NOT_PW";
	} else {
		str = "NOT_ID";
	}
	out.print(str);
%>




