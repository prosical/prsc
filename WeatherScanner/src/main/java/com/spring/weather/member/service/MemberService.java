package com.spring.weather.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.weather.board.repository.IBoardDAO;
import com.spring.weather.likeit.repository.ILikeitDAO;
import com.spring.weather.member.model.LoginVO;
import com.spring.weather.member.model.MemberVO;
import com.spring.weather.member.repository.IMemberDAO;

@Service
public class MemberService implements IMemberService{

	@Autowired
	private IMemberDAO dao;
	@Autowired
	IBoardDAO boarddao;
	@Autowired
	ILikeitDAO likedao;
	
	@Override
	public void register(MemberVO member) throws Exception {
		
		//회원 비밀번호를 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전: " + member.getMemberPw());
		
		//비밀번호를 암호화하여 다시 user객체에 저장
		String securePw = encoder.encode(member.getMemberPw());
		member.setMemberPw(securePw);
		System.out.println("암호화 후: " + member.getMemberPw());
		
		dao.register(member);
	}

	@Override
	public int isDuplicateId(String memberId) throws Exception {
		return dao.isDuplicateId(memberId);
	}

	@Override
	public MemberVO login(LoginVO login) throws Exception {
		return dao.login(login);
	}

	@Override
	public MemberVO getMemberInfo(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMemberInfo(memberId);
	}

	@Override
	public void update(MemberVO member) throws Exception {
		dao.update(member);
	}

	@Transactional
	@Override
	public void delete(String memberId) throws Exception { 
		
		likedao.deleteAll(memberId);
		boarddao.deleteAll(memberId);
		dao.delete(memberId);
		
	}

	@Override
	public void keepLogin(String memberId, String sessionId, Date sessionLimit) throws Exception {
		
		Map<String, Object> datas = new HashMap<>();
		datas.put("memberId", memberId);
		datas.put("sessionId", sessionId);
		datas.put("sessionLimit", sessionLimit);
		
		dao.keepLogin(datas);
	}

	@Override
	public MemberVO getUserWithSessionId(String sessionId) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserWithSessionId(sessionId);
	
	}

	public List<MemberVO> getMemberList() throws Exception {
		return dao.getMemberList();
	}

	

}
