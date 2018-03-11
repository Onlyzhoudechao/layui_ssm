package com.kangjian.commons;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class ActionListener implements HttpSessionListener,
HttpSessionAttributeListener{
	
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		// TODO 自动生成的方法存根
		
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO 自动生成的方法存根
		
	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO 自动生成的方法存根
		
	}

	public void sessionCreated(HttpSessionEvent session) {
		// TODO 自动生成的方法存根
		//session.getSession().setMaxInactiveInterval(15);
		HttpSession tempSession = session.getSession();
		System.out.println("session创建，sessionid:" + tempSession.getId());
		
	}
	

	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO 自动生成的方法存根
	}
}
