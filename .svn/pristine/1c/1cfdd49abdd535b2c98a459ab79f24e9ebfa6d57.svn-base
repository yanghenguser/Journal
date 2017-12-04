package com.database.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.tools.ant.taskdefs.TempFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.my.po.shopdata;
import com.database.mybatis.mapper.NewspaperMapper;
import com.database.mybatis.mapper.OrderallMapper;
import com.database.mybatis.mapper.OrderinfoMapper;
import com.database.mybatis.mapper.UserMapper;
import com.database.mybatis.po.Newspaper;
import com.database.mybatis.po.NewspaperExample;
import com.database.mybatis.po.Orderall;
import com.database.mybatis.po.OrderallExample;
import com.database.mybatis.po.Orderinfo;
import com.database.mybatis.po.OrderinfoExample;
import com.database.mybatis.po.User;
import com.database.mybatis.po.UserExample;

@Controller
public class indexController {
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	OrderinfoMapper orderinfoMapper;
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrderallMapper orderallMapper;
	
	
	
	@RequestMapping(value="/getnews")
	@ResponseBody
	public List<Newspaper> getnews(){
		NewspaperExample example =new NewspaperExample();
		example.setOrderByClause("newsid DESC");
		List<Newspaper> list = newspaperMapper.selectByExampleWithBLOBs(example);
		
		
		List<Newspaper> show =new ArrayList<Newspaper>();
		
		for(int j=0;j<18;++j){
			show.add(j, list.get(0));
		}
		
		int[] temp =new int[9];
		for(int i=0;i<9;++i){
			temp[i]=0;
		}
			
		
		
			for(Newspaper str : list) {
			    if(temp[str.getNewsclass()-1]==0){
			    	show.set((str.getNewsclass()-1)*2, str);
			    	temp[str.getNewsclass()-1]++;
			    }
			    else if(temp[str.getNewsclass()-1]==1){
			    	show.set((str.getNewsclass()-1)*2+1, str);
			    	temp[str.getNewsclass()-1]++;
			    }
			}
		
		
		
		
		return show;
	}
	
	@RequestMapping(value="/shoppage")
	public String shoppage(Model model,String username){
		
		UserExample example =new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andRealnameEqualTo(username);
		
		List<User> list =userMapper.selectByExample(example);
		if(list.size()!=1){
			return "error";
		}
		else{
			
			Integer userid = list.get(0).getUserid();  //鑾峰緱useriid锛屽啀鏍规嵁userid鏉ヨ幏寰楄鍗曠紪鍙�
			
			OrderallExample example2 =new OrderallExample();
			OrderallExample.Criteria criteria2=example2.createCriteria();
			criteria2.andUseridEqualTo(userid);
			criteria2.andStateEqualTo("待支付");
			
			List<Orderall> list2 = orderallMapper.selectByExample(example2);
			
			if(list2.size()<=0){
				return "shop";
			}else{
				String orderid=list2.get(0).getOrderid();
				
				OrderinfoExample example3 =new OrderinfoExample();
				OrderinfoExample.Criteria criteria3 =example3.createCriteria();
				criteria3.andOrderidEqualTo(orderid);
				
				List<Orderinfo> list3 =orderinfoMapper.selectByExample(example3);
				
				if(list3.size()<=0){
					return "shop";
				}else{
					List<shopdata> shopdatas =new ArrayList<shopdata>();
					
					
					for(int i=0;i<list3.size();++i){
						
						Integer newsid=list3.get(i).getNewsid();
						
						Newspaper newspaper=newspaperMapper.selectByPrimaryKey(newsid);
						shopdata data =new shopdata();
						data.setNewsname(newspaper.getNewsname());
						data.setOrdermouth(list3.get(i).getOrdermouth());
						data.setOrdernum(list3.get(i).getOrdernum());
						data.setPiclocationl(newspaper.getPiclocation().substring(1,newspaper.getPiclocation().length()));
						data.setQuarterly(newspaper.getQuarterly());
						data.setPrice(list3.get(i).getPrice());
						
						shopdatas.add(i, data);
					}
	
					model.addAttribute("shopdatas",shopdatas);
					return "shop";
				}
				
				
			}	
		}
		
	}
	@RequestMapping(value="/deletegoods")
	public String deletegoods(String username,String newsname){
		
		NewspaperExample news = new NewspaperExample();
		NewspaperExample.Criteria newscri = news.createCriteria();
		newscri.andNewsnameEqualTo(newsname);
		
		List<Newspaper> newspaper = newspaperMapper.selectByExample(news);
		
		Integer newsid=newspaper.get(0).getNewsid();
		
		UserExample example =new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andRealnameEqualTo(username);
		
		List<User> list =userMapper.selectByExample(example);
		if(list.size()!=1){
			return "error";
		}
		else{
			
			Integer userid = list.get(0).getUserid();  //鑾峰緱useriid锛屽啀鏍规嵁userid鏉ヨ幏寰楄鍗曠紪鍙�
			
			OrderallExample example2 =new OrderallExample();
			OrderallExample.Criteria criteria2=example2.createCriteria();
			criteria2.andUseridEqualTo(userid);
			criteria2.andStateEqualTo("待支付");
			
			List<Orderall> list2 = orderallMapper.selectByExample(example2);
			
			if(list2.size()<=0){
				return "error";
			}else{
				String orderid=list2.get(0).getOrderid();
				
				OrderinfoExample example3 =new OrderinfoExample();
				OrderinfoExample.Criteria criteria3 =example3.createCriteria();
				criteria3.andOrderidEqualTo(orderid);
				criteria3.andNewsidEqualTo(newsid);
				
				List<Orderinfo> list3 =orderinfoMapper.selectByExample(example3);
				if(list3.size()>0){
					list2.get(0).setAllprice(list2.get(0).getAllprice()-list3.get(0).getPrice());
					orderallMapper.updateByPrimaryKey(list2.get(0));
					
					orderinfoMapper.deleteByExample(example3);
					return "success";
				}else{
					return "error";
				}
				
			}
		}
	}
	@RequestMapping(value="/certainbuy")
	@ResponseBody
	public void cretainbuy(String username){
		UserExample example =new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andRealnameEqualTo(username);
		
		List<User> list =userMapper.selectByExample(example);
		if(list.size()!=1){
			return;
		}
		else{
			
			Integer userid = list.get(0).getUserid();  //
			
			OrderallExample example2 =new OrderallExample();
			OrderallExample.Criteria criteria2=example2.createCriteria();
			criteria2.andUseridEqualTo(userid);
			criteria2.andStateEqualTo("待支付");
			
			List<Orderall> list2 = orderallMapper.selectByExample(example2);
			
			if(list2.size()<=0){
				return;
			}else{
				list2.get(0).setState("已支付");
				
				orderallMapper.updateByPrimaryKey(list2.get(0));
			}
		}
	}
	
	@RequestMapping(value="/mynppage")
	public String mynppage(Model model,String username){
		List<shopdata> shopdatas =new ArrayList<shopdata>();
		
		UserExample example =new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andRealnameEqualTo(username);
		
		List<User> list =userMapper.selectByExample(example);
		if(list.size()<1){
			return "mynp";
		}
		else{
			
			Integer userid = list.get(0).getUserid();  //鑾峰緱useriid锛屽啀鏍规嵁userid鏉ヨ幏寰楄鍗曠紪鍙�
			
			OrderallExample example2 =new OrderallExample();
			OrderallExample.Criteria criteria2=example2.createCriteria();
			criteria2.andUseridEqualTo(userid);
			criteria2.andStateEqualTo("已支付");
			
			List<Orderall> list2 = orderallMapper.selectByExample(example2);
			
			if(list2.size()<=0){
				return "mynp";
			}else{
				
				int temp=0;
				
				for(int z=0;z<list2.size();++z){
					
				
				
				String orderid=list2.get(z).getOrderid();
				
				OrderinfoExample example3 =new OrderinfoExample();
				OrderinfoExample.Criteria criteria3 =example3.createCriteria();
				criteria3.andOrderidEqualTo(orderid);
				
				List<Orderinfo> list3 =orderinfoMapper.selectByExample(example3);
				
				if(list3.size()<=0){
					
				}else{
					
					
					
					
					
					for(int i=0;i<list3.size();++i){
						
						Integer newsid=list3.get(i).getNewsid();
						
						Newspaper newspaper=newspaperMapper.selectByPrimaryKey(newsid);
						shopdata data =new shopdata();
						data.setOrderid(list2.get(i).getOrderid());
						data.setState(list2.get(i).getState());
						data.setNewsname(newspaper.getNewsname());
						data.setOrdermouth(list3.get(i).getOrdermouth());
						data.setOrdernum(list3.get(i).getOrdernum());
						data.setPiclocationl(newspaper.getPiclocation().substring(1,newspaper.getPiclocation().length()));
						data.setQuarterly(newspaper.getQuarterly());
						data.setPrice(list3.get(i).getPrice());
						
						shopdatas.add(temp++,data);
					}
	
					
					
				}
				
				//end for
			}	
		}
		}
		model.addAttribute("shopdatas",shopdatas);
		return "mynp";
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public List<Newspaper> search(String newsname){
		NewspaperExample example =new NewspaperExample();
		NewspaperExample.Criteria criteria = example.createCriteria();
		criteria.andNewsnameLike("%"+newsname+"%");
		
		List<Newspaper> list = newspaperMapper.selectByExampleWithBLOBs(example);
		
		return list;
	}
	
}
