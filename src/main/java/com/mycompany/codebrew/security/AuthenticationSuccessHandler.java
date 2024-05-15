package com.mycompany.codebrew.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler
	//로그인 성공 후에 사용자가 접근하고자 했던 페이지로 이동
	//extends SavedRequestAwareAuthenticationSuccessHandler{
	//로그인 성공 후에 무조건 defaultTargetUrl로 이동
	extends SimpleUrlAuthenticationSuccessHandler{
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws ServletException, IOException {
			log.info("로그인 성공");
			//로그인 성공 후에 이동할 Url
			setDefaultTargetUrl("/");
			//기본 설정을 적용하기 위해 부모 메소드 호출
			super.onAuthenticationSuccess(request, response, authentication);
		}
}
