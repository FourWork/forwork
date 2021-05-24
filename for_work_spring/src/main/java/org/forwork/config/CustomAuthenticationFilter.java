package org.forwork.config;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j
public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	public CustomAuthenticationFilter(AuthenticationManager authenticationManager) {
		super.setAuthenticationManager(authenticationManager);
		
	}
	
	public Authentication attempAuthentication (HttpServletRequest request, HttpServletResponse response) throws AuthenticationException{
		UsernamePasswordAuthenticationToken authRuest = new UsernamePasswordAuthenticationToken(request.getParameter("Email"),request.getParameter("Pw"));
		setDetails(request , authRuest);
		return this.getAuthenticationManager().authenticate(authRuest);
	}
	

}
