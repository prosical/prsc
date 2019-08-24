package com.spring.weather.likeItTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.weather.member.model.LoginVO;
import com.spring.weather.member.model.MemberVO;
import com.spring.weather.member.repository.IMemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class MemberDAOTest {
	@Autowired
	private IMemberDAO dao;


	@Test
	public void insertTest() throws Exception{

		MemberVO member = new MemberVO();
		member.setMemberId("banana111");
		member.setMemberPw("banana111!");
		member.setNickname("반아아");
		member.setEmail("abc122324@abc.com");

		
		
		dao.register(member);
		System.out.println("가입성공");



	}

	/*@Test
	public void duplicateTest() throws Exception {


		int n = dao.isDuplicateId("banana");
		if(n == 1) 
			System.out.println("아이디가 중복됨!!");
		else 
			System.out.println("아이디 사용 가능!");
	}*/



	@Test	
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


		//로그인 테스트
		@Test
		public void loginTest() throws Exception {


			//로그인 처리를 위해 암호화된 DB패스워드를 디코딩하여 비교
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			LoginVO login = new LoginVO();
			login.setMemberId("banana111");
			login.setMemberPw("banana111!");

			MemberVO member = dao.login(login);
			System.out.println("로그인 시도 회원정보: " + member);

			if(member != null) {
				String dbPw = member.getMemberPw();
				System.out.println("DB password: " +dbPw);
				String inputPw = login.getMemberPw();
				System.out.println("Input password: " +inputPw);

				if(encoder.matches(inputPw, dbPw)) {
					System.out.println("로그인 성공!");
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
				}

			} else {
				System.out.println("존재하지 않는 회원입니다.");
			}

		}

	}
