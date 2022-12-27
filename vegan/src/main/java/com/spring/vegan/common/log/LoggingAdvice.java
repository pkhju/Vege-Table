package com.spring.vegan.common.log;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect // 필요하면 주석 해제해서 쓰면 됨
public class LoggingAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);

	@Before("execution(* com.spring.vegan.*.controller.*.*(..)) or "
			+ "execution(* com.spring.vegan.*.dao.*.*(..))")
	public void startLog(JoinPoint jp) {
		logger.info("---------------------------------------");
		logger.info("@Before");
		// 전달되는 모든 파라미터들을 Object의 배열로 가져온다.
		logger.info("1. parameter : " + Arrays.toString(jp.getArgs()));
		// 해당 Advice의 타입을 출력
		//logger.info("2 : " + jp.getKind());
		// 실행하는 대상 객체의 메서드에 대한 정보 출력
		logger.info("2. method : " + jp.getSignature().getName());
		// target 객체를 출력
		logger.info("3. target Object : " + jp.getTarget().toString());
		// Advice를 실행하는 객체를 출력
		logger.info("4. advice Object : " + jp.getThis().toString());
	}


	//@After("execution(* com.spring.vegan.member.service.*.*(..)) or execution(* com.spring.vegan.member.dao.*.*(..))")
	public void AfterLog(JoinPoint jp) {
		logger.info("---------------------------------------");
		logger.info("@After");

		// 전달되는 모든 파라미터들을 Object의 배열로 가져온다.
		logger.info("1. parameter : " + Arrays.toString(jp.getArgs()));
		// 해당 Advice의 타입을 출력
		//logger.info("2 : " + jp.getKind());
		// 실행하는 대상 객체의 메서드에 대한 정보 출력
		logger.info("2. method : " + jp.getSignature().getName());
		// target 객체를 출력
		logger.info("3. target Object : " + jp.getTarget().toString());
		// Advice를 실행하는 객체를 출력
		logger.info("4. advice Object : " + jp.getThis().toString());
	}

	//@Around("execution(* com.spring.vegan.*.service.*.*(..)) or execution(* com.spring.vegan.*.dao.*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();

		logger.info(Arrays.toString(pjp.getArgs()));

		Object result = pjp.proceed();

		long endTime = System.currentTimeMillis();

		logger.info(pjp.getSignature().getName() + " _method 처리 속도: " + (endTime - startTime) + "ms"); // ms: millisecond
		logger.info("======================================================");

		return result;
	}
}