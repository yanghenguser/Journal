package com.database.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.mybatis.mapper.NewspaperMapper;
import com.database.mybatis.mapper.OrderMapper;
import com.database.mybatis.mapper.OrderallMapper;
import com.database.mybatis.mapper.OrderinfoMapper;
import com.database.mybatis.mapper.UserMapper;
import com.database.mybatis.po.Newspaper;
import com.database.mybatis.po.Order;
import com.database.mybatis.po.Orderall;
import com.database.mybatis.po.OrderallExample;
import com.database.mybatis.po.Orderinfo;
import com.database.mybatis.po.OrderinfoExample;
import com.database.mybatis.po.User;
import com.database.mybatis.po.UserExample;

@Controller
public class registerController {
	@Autowired
	UserMapper userMapper;
	
	@Autowired 
	NewspaperMapper newspaperMapper;
	
	@Autowired
	OrderallMapper orderMapper;
	
	@Autowired
	OrderinfoMapper orderinfoMapper;
	
	@RequestMapping(value="/registering",produces="text/html;charset=UTF-8;")
	public String registerpage(){
		
		return "register";
	}
	
	@RequestMapping(value="/register",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String register(String name,String psw,String realname,String idcard,String phone,String address){
		User user =new User();
		user.setName(name);
		user.setPsw(psw);
		user.setRealname(realname);
		user.setIdcard(idcard);
		user.setPhone(phone);
		user.setAddress(address);
		
		userMapper.insert(user);
		return realname;
	}
	
	@RequestMapping(value="/buygoods",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String buygoods(Integer newsid,String username,Integer number,Integer stime){
		Newspaper newspaper =new Newspaper();
		newspaper = newspaperMapper.selectByPrimaryKey(newsid);
		float price=newspaper.getQuarterly()*stime*number;
		
		
		UserExample example =new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andRealnameEqualTo(username);
		
		List<User> list =userMapper.selectByExample(example);
		if(list.size()!=1){
			return "error";
		}
		else{
			Integer userid=list.get(0).getUserid();
			
			OrderallExample example2 = new OrderallExample();
			OrderallExample.Criteria criteria2=example2.createCriteria();
			criteria2.andUseridEqualTo(userid);
			criteria2.andStateEqualTo("待支付");
			
			List<Orderall> list2 = orderMapper.selectByExample(example2);
			
			if(list2.size()<1){
				//先建order的数据
				Orderall order1 =new Orderall();
			    UUID uuid = UUID.randomUUID();
				order1.setOrderid(uuid.toString());
				order1.setUserid(userid);
				order1.setAllprice(price);
				order1.setState("待支付");
				
				orderMapper.insert(order1);
				
				//再写orderinfo表
				
				Orderinfo orderinfo =new Orderinfo();
				orderinfo.setOrderid(uuid.toString());
				orderinfo.setNewsid(newsid);
				orderinfo.setOrdermouth(stime);
				orderinfo.setOrdernum(number);
				orderinfo.setPrice(price);
				
				orderinfoMapper.insert(orderinfo);
			}else{
				
				list2.get(0).setAllprice(list2.get(0).getAllprice()+price);
				
				orderMapper.updateByPrimaryKey(list2.get(0));
				
				Orderinfo orderinfo =new Orderinfo();
				orderinfo.setOrderid(list2.get(0).getOrderid());
				orderinfo.setNewsid(newsid);
				orderinfo.setOrdermouth(stime);
				orderinfo.setOrdernum(number);
				orderinfo.setPrice(price);
				
				orderinfoMapper.insert(orderinfo);
			}
			
			
			
			
			
			return "success";
		}	
	}
}
