package com.develovation.client_dashboard.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {
	
	// setup logger
	private Logger myLogger = Logger.getLogger(getClass().getName());
	
	// setup Pointcut declarations
	@Pointcut("execution(* com.develovation.client_dashboard.controller.*.*(..))") // modifier return-type package class method parameter
	private void forControllerPackage() {}
	
	@Pointcut("execution(* com.develovation.client_dashboard.service.*.*(..))") // modifier return-type package class method parameter
	private void forServicePackage() {}
	
	@Pointcut("execution(* com.develovation.client_dashboard.dao.*.*(..))") // modifier return-type package class method parameter
	private void forDAOPackage() {}
	
	@Pointcut("forControllerPackage() || forServicePackage() || forDAOPackage()")
	private void forAppFlow() {}
	
	// add @Before advice
	@Before("forAppFlow()")
	public void before(JoinPoint theJoinPoint) {
		
		// display method we are calling
		String theMethod = theJoinPoint.getSignature().toShortString();
		System.out.println("===========>>>" + theMethod);
		myLogger.info("============>> in @Before: calling method: " + theMethod);
		
		// display the arguments to the method
		
		// get the arguments
		Object[] args = theJoinPoint.getArgs();
		
		// loop through and display arguments
		for (Object tempArg : args) {
			myLogger.info("============>> argument: " + tempArg);
		}
	}
	
	// add @AfterReturning advice
	@AfterReturning(
			pointcut="forAppFlow()",
			returning="theResult")
	public void afterReturning(JoinPoint theJoinPoint, Object theResult) {
		
		// display method we are returning from
		String theMethod = theJoinPoint.getSignature().toString();
		myLogger.info("=============>> in @AfterReturning: from method: " + theMethod);
		
		// display data returned
		myLogger.info("=============>> result: " + theResult);
	}
}
