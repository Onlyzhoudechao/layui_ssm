package com.kangjian.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.kangjian.commons.BasicCommons;
import com.kangjian.commons.CallBackMessage;
import com.kangjian.commons.CommonInfo;
import com.kangjian.dao.OnlineUserMapper;
import com.kangjian.dao.UserMapper;
import com.kangjian.domain.ChangePWD;
import com.kangjian.domain.OnlineUser;
import com.kangjian.domain.SessionInfo;
import com.kangjian.domain.User;
@Controller
public class UserController {
	@Resource
	private UserMapper userMapper;
	@Resource
	private OnlineUserMapper onLine;	
	/**查询用户*/
	@RequestMapping(value="menu/listUser")
	@ResponseBody
	public String showUser() {
		int code=2998;
		int count=0;
		String response="";
		List<User> lst=userMapper.selectAllUser();
		if(lst!=null&&lst.size()>0) {
			code=0;
			count=lst.size();
			String data=JSON.toJSONString(lst);
			response="{\"code\":"+code+",\"msg\":\"\",\"count\":"+count+",\"data\":"+data+"}";
		}else {
			String data="";
			response="{\"code\":"+code+",\"msg\":\"\",\"count\":"+count+",\"data\":"+data+"}";
		}
		System.out.println(response);
		return response;
	}
	
	/**修改密码_保存方法*/
	@RequestMapping(value="menu/changepwd_save")
	@ResponseBody
	public CallBackMessage changepwd_save(ChangePWD changepwd, HttpSession session) {
		CallBackMessage cbm = new CallBackMessage();
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute("loginInfo");
		String userid = sessionInfo.getUserID();
		String oldpwd = changepwd.getOldpwd();
		String newpwd = changepwd.getNewpwd();
		String confirpwd = changepwd.getConfirpwd();
		if(oldpwd==null||"".equals(oldpwd)||newpwd==null||"".equals(newpwd)||confirpwd==null||"".equals(confirpwd)) {
			cbm.setStatus(CommonInfo.state_failure);
			cbm.setMessage("密码不能为空！");
		}else if(!(newpwd.equals(confirpwd))){
			cbm.setStatus(CommonInfo.state_failure);
			cbm.setMessage("两次输入的密码不一致！请重新输入");
		}else {
			User user = userMapper.selectByPrimaryKey(userid);
			BasicCommons bc = new BasicCommons();
			if (user != null) {
				User user2 = userMapper.selectByUserCodeAndPWD(user.getUserCode(), bc.encrypt(oldpwd));
				if (user2 != null) {
					user2.setUserPassword(bc.encrypt(newpwd));
					userMapper.updateByPrimaryKey(user2);
					Map<Object, Object> map = new HashMap<Object, Object>();
					map.put("tempcode", sessionInfo.getID());
					cbm.setStatus(CommonInfo.state_success);
					cbm.setMessage(CommonInfo.save_success);
					cbm.setMap(map);
				} else {
					cbm.setStatus(CommonInfo.state_failure);
					cbm.setMessage(CommonInfo.passwd_error);
				}
			} else {
				cbm.setStatus(CommonInfo.state_failure);
				cbm.setMessage(CommonInfo.user_code_none);
			}
		}
		return cbm;
	}
	
	/**跳转至主页*/
	@RequestMapping(value="/menu")
	public String _toMenu() {
		return "main.jsp";
	}
	
	/**跳转至用户查询页面*/
	@RequestMapping(value="menu/toUserList")
	public String _toUserList() {
		return "user/userList.jsp";
	}
	/**跳转至修改密码页面*/
	@RequestMapping(value="menu/changepwd")
	public String _toChangpwd() {
		return "user/changepwd.jsp";
	}
}
