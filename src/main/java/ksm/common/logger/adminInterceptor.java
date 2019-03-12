package ksm.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//이 HandlerInterceptorAdapter는, 실행결과에 대한 로그를 콘솔창에 띄워주기 위해 import함

import ksm.common.logger.LoggerInterceptor;

public class adminInterceptor extends HandlerInterceptorAdapter{

	protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		
		if(log.isDebugEnabled()) {
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
			
			String admin = "admin";
			
			if(admin.equals(String.valueOf(session.getAttribute("idSession")))) {
				System.out.println("관리자(admin) 로그인 성공");
			
			}else {
				response.sendRedirect("/kingsman/");
				return false;
			}

			
		}
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
	
}

