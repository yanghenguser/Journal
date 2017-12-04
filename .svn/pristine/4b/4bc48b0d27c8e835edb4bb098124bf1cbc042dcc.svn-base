package com.database.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.mybatis.mapper.UserMapper;
import com.database.mybatis.po.User;
import com.database.mybatis.po.UserExample;

@Controller
public class loginController {
	
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping("/")
	public String main(){
		
		return "websocket1";
	}
	@RequestMapping("/logining")
	public String loginPanel(){
		return "login";
	}
	@RequestMapping(value="/login", produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String login(String user,String psw,HttpServletResponse response){
		UserExample example = new UserExample();
		UserExample.Criteria criteria =example.createCriteria();
		 criteria.andNameEqualTo(user);
		 criteria.andPswEqualTo(psw);
		 
		 List<User> list = userMapper.selectByExample(example);
		 if(list.size()!=1){
			 return "error";
		 }else{
			 String name = list.get(0).getRealname();
			 
			 return name;
		 }
	}
	@RequestMapping("/main")
	public String successlogin(){
		return "index";
	}
}
