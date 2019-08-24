package com.spring.weather.member.repository;

import java.util.List;
import java.util.Map;

import com.spring.weather.member.model.LoginVO;
import com.spring.weather.member.model.MemberVO;

public interface IMemberDAO {

	//회원가입 처리
	void register(MemberVO member) throws Exception;

	//마이페이지용 본인 회원정보
	MemberVO getMemberInfo(String memberId) throws Exception;


	void update(MemberVO member) throws Exception;

	void delete(String memberId) throws Exception;

	List<MemberVO> getMemberList() throws Exception;
	//아이디 중복확인 처리
	int isDuplicateId(String memberId) throws Exception;

	//로그인 시도 회원정보 조회처리
	MemberVO login(LoginVO login) throws Exception;



	//자동 로그인 유지 처리
	void keepLogin(Map<String, Object> datas) throws Exception;

	//세션아이디 검증 후 회원정보 불러오는 처리
	MemberVO getUserWithSessionId(String sessionId) throws Exception;


}
