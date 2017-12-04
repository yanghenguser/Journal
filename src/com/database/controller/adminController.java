package com.database.controller;

import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.mybatis.mapper.AdminuserMapper;
import com.database.mybatis.mapper.NewspaperMapper;
import com.database.mybatis.mapper.NewspaperclassMapper;
import com.database.mybatis.mapper.OrderallMapper;
import com.database.mybatis.mapper.UserMapper;
import com.database.mybatis.po.Adminuser;
import com.database.mybatis.po.AdminuserExample;
import com.database.mybatis.po.Newspaper;
import com.database.mybatis.po.NewspaperExample;
import com.database.mybatis.po.Newspaperclass;
import com.database.mybatis.po.NewspaperclassExample;
import com.database.mybatis.po.Orderall;
import com.database.mybatis.po.OrderallExample;
import com.database.mybatis.po.User;
import com.database.mybatis.po.UserExample;

@Controller
public class adminController {
	
	@Autowired
	OrderallMapper orderallMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	NewspaperclassMapper newspaperclassMapper;
	
	@Autowired
	AdminuserMapper adminuserMapper;
	
	@RequestMapping("adminlogin")
	public String adminlogin(){
		
		
		return "adminlogin";
	}
	@RequestMapping("checkadmin")
	@ResponseBody
	public String checkadmin(String adminname,String adminpsw){
		AdminuserExample example =new AdminuserExample();
		AdminuserExample.Criteria criteria =example.createCriteria();
		criteria.andNameEqualTo(adminname);
		criteria.andPswEqualTo(adminpsw);
		List<Adminuser> list =adminuserMapper.selectByExample(example);
		
		if(list.size()==1){
			return "success";
		}else{
			return "error";
		}
	}
	@RequestMapping("/admin")
	public String admin(Model model){
		
		NewspaperExample example = new NewspaperExample();
		
		List<Newspaper> list = newspaperMapper.selectByExampleWithBLOBs(example);
		for(int i=0;i<list.size();++i){
			list.get(i).setPiclocation(list.get(i).getPiclocation().substring(1, list.get(i).getPiclocation().length()));
			if(list.get(i).getContent().length()<=100){
				
			}else{
				list.get(i).setContent(list.get(i).getContent().substring(0, 100));
			}
			
		}
		
		model.addAttribute("list", list);
		
		return "newsmanager";
	}
	
	@RequestMapping("/deletenewspaper")
	@ResponseBody
	public String deletenewspaper(Integer newsnum){
		NewspaperExample example = new NewspaperExample();
		NewspaperExample.Criteria criteria=example.createCriteria();
		criteria.andNewsnumEqualTo(newsnum);
		
		newspaperMapper.deleteByExample(example);
		
		
		
		return "success";
	}
	@RequestMapping("/addnewspaper")
	public String addnewspaper(Model model){
		NewspaperclassExample example =new NewspaperclassExample();
		List<Newspaperclass> list =newspaperclassMapper.selectByExample(example);
		
		model.addAttribute("list", list);
		return "addnewspaper";
	}
	@RequestMapping("/addnews")
	public String addnwes(String newsname,Integer newsnum,String newsclass,String press,String publish,float quarterly,String piclocation,String content){
		
		NewspaperclassExample example =new NewspaperclassExample();
		NewspaperclassExample.Criteria criteria = example.createCriteria();
		criteria.andClassnameEqualTo(newsclass);
		
		List<Newspaperclass> list = newspaperclassMapper.selectByExample(example);
		
		
		
		Newspaper newspaper =new Newspaper();
		newspaper.setContent(content);
		newspaper.setNewsclass(list.get(0).getClassnum());
		newspaper.setNewsname(newsname);
		newspaper.setNewsnum(newsnum);
		newspaper.setPiclocation("/newspic/"+piclocation);
		newspaper.setPress(press);
		newspaper.setPublish(publish);
		newspaper.setQuarterly(quarterly);
		newspaperMapper.insert(newspaper);
		
		return "success";
	}
	@RequestMapping("/userlist")
	public String userlist(Model model){
		
		UserExample example = new UserExample();
		List<User> list = userMapper.selectByExample(example);
		
		model.addAttribute("list", list);
		
		return "userlist";
	}
	@RequestMapping("/orderlist")
	public String Orderlist(Model model){
		OrderallExample example = new OrderallExample();
		List<Orderall> list =orderallMapper.selectByExample(example);
		model.addAttribute("list", list);
		return "orderlist";
	}
}
