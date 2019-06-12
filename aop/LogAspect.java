package com.spring.myapp.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	//표현식 execution(접근제한자  패키지  클래스  메서드명(파라미터값)) 순으로 작성
	//표현식은 AOP 적용을 받을 메서드들을 지목하기 위해 사용
	
	//AOP적용(Weaving)의 절차 
	//1. 빈 깡통메서드를 만들고, @Pointcut(value=표현식)을 이용해 메서드를 지정
	@Pointcut(value="execution(* com.spring..*.sayHello(..))")
	private void helloPointcut() {}
	
	//2. Advice(적용 시점)을 어노테이션으로 설정하고 포인트컷 집어넣기
	@Before("helloPointcut()")
	public void BeforeLog(JoinPoint joinpoint) {
		Signature signature = joinpoint.getSignature();
		System.out.println("{Log: Before] 메서드 이름 : "+ signature.getName());
	}

	//3. Advice는 반드시 깡통메서드를 이용한 포인트컷을 넣지 않아도 된다
	//   표현식을 이용해도 상관없음
	@After("execution(* com.spring..*.*(..))")
	public void AfterLog(JoinPoint joinpoint) {
		Signature signature = joinpoint.getSignature();
		System.out.println("{Log: After] 메서드 이름 : "+ signature.getName());
	}
}
