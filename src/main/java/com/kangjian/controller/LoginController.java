package com.kangjian.controller;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kangjian.commons.ActionListener;
import com.kangjian.commons.BasicCommons;
import com.kangjian.commons.CallBackMessage;
import com.kangjian.commons.CommonInfo;
import com.kangjian.dao.OnlineUserMapper;
import com.kangjian.dao.UserMapper;
import com.kangjian.domain.OnlineUser;
import com.kangjian.domain.SessionInfo;
import com.kangjian.domain.User;

@Controller
public class LoginController {
	@Resource
	private UserMapper userMapper;
	@Resource
	private OnlineUserMapper onLine;
	/**跳转至用户注册页面*/
	@RequestMapping(value="/register")
	public String _toRegister() {
		return "login/register.jsp";
	}
	/**跳转至登录页面*/
	@RequestMapping(value="/login")
	public String _toLogin() {
		return "login/login.jsp";
	}
	
	/**用户注册*/
	@RequestMapping(value="/user_register",method=RequestMethod.POST)
	@ResponseBody
	public CallBackMessage userRegister(User user,HttpSession session) {
		CallBackMessage cbm=new CallBackMessage();
		String email=user.getEMail();
		User User=new User();
		User=userMapper.selectByEmail(email);
		if(User!=null) {
			cbm.setStatus(CommonInfo.state_failure);
			cbm.setMessage(CommonInfo.email_exist);
		}else {
			BasicCommons bc=new BasicCommons();
			user.setId(bc.generalPrimaryKey());
			String usercode=userMapper.selectMaxUserCode();
			String password=user.getUserPassword();
			user.setUserPassword(bc.encrypt(password));
			user.setUserCode(usercode);
			userMapper.insert(user);
			session.setAttribute("usercode", usercode);
			cbm.setStatus(CommonInfo.state_success);
		}
		return cbm;
	}
	/**用户登录*/
	@RequestMapping(value="/user_login")
	@ResponseBody
	public CallBackMessage userLogin(User user,HttpSession session) {
		CallBackMessage cbm=new CallBackMessage();
		String usercode=user.getUserCode();
		String password=user.getUserPassword();
		if(usercode!=null&&!("".equals(usercode))&&password!=null&&!("".equals(password))) {
			User User=new User();
			User=userMapper.selectByUserCode(usercode.toString());
			if(User!=null) {
				//校验用户名密码是否正确
				BasicCommons bc=new BasicCommons();
				User uservo2=new User();
				uservo2=userMapper.selectByUserCodeAndPWD(usercode, bc.encrypt(password));
				if(uservo2!=null) {
					String id=bc.generalPrimaryKey();
					String loginTime=bc.getCurrentTime();
					SessionInfo sessionInfo=new SessionInfo();
					sessionInfo.setID(id);
					sessionInfo.setUserID(uservo2.getId());
					sessionInfo.setUserCode(uservo2.getUserCode());
					sessionInfo.setUserName(uservo2.getUserName());
					sessionInfo.setLoginTime(loginTime);
					session.setAttribute("loginInfo", sessionInfo);
					try {
						addOnlineUser(session);
					} catch (Exception e) {
						System.out.println("增加在线用户列表失败-->:"+e.getMessage());
					}
					Map<Object,Object> map=new HashMap<Object,Object>();
					map.put("tempcode", id);
					cbm.setStatus(CommonInfo.state_success);
					cbm.setMap(map);
				}else {
					cbm.setStatus(CommonInfo.state_failure);
					cbm.setMessage(CommonInfo.passwd_error);
				}
			}else {
				cbm.setStatus(CommonInfo.state_failure);
				cbm.setMessage(CommonInfo.user_code_none);
			}
		}else {
			cbm.setStatus(CommonInfo.state_failure);
			cbm.setMessage(CommonInfo.unknow_error);
		}
		return cbm;
	}

	
	
	
	/**用户注销*/
	@RequestMapping(value="menu/logOut",method=RequestMethod.POST)
	@ResponseBody
	public void userLogOut(String tempcode, HttpSession session) {
		OnlineUser onuser = onLine.selectByPrimaryKey(tempcode);
		if (onuser != null) {
			onLine.deleteByPrimaryKey(tempcode);
			session.invalidate();
			System.out.println("移除在线用户成功，sessionid=" + session.getId());
		}
	}
	/**增加在线用户*/
	public  void addOnlineUser(HttpSession session) throws Exception {
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute("loginInfo");
		try {
			OnlineUser online = new OnlineUser();
			online.setId(sessionInfo.getID());
			online.setLoginTime(sessionInfo.getLoginTime());
			online.setUserId(sessionInfo.getUserID());
			onLine.insert(online);
			System.out.println("增加用户成功-->:" + session.getId());
		} catch (Exception e) {
			System.out.println("登录成功，写入在线用户列表失败-->:" + e.getMessage());
			throw e;
		}
	}

}
