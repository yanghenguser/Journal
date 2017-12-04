package com.database.websocket;

import java.util.Map;  

import javax.servlet.http.HttpSession;  
   
import org.springframework.http.server.ServerHttpRequest;  
import org.springframework.http.server.ServerHttpResponse;  
import org.springframework.http.server.ServletServerHttpRequest;  
import org.springframework.web.socket.WebSocketHandler;  
import org.springframework.web.socket.server.HandshakeInterceptor;  
   
public class WebSocketHandshakeInterceptor implements HandshakeInterceptor {  
   
private static final String SESSION_NAME ="username";  
private String userName;

    @Override  
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,Map<String, Object> attributes) throws Exception {  
        if (request instanceof ServletServerHttpRequest) {  
        HttpSession session = ((ServletServerHttpRequest)request).getServletRequest().getSession();  
        userName= (String) session.getAttribute(SESSION_NAME);  
               if(userName == null) {  
                        userName= "访客" + session.getId() ;  
                        session.setAttribute(SESSION_NAME,userName);  
               }  
           attributes.put("username",userName);  
        }  
        return true;  
    }
   
    @Override  
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,WebSocketHandler wsHandler, Exception exception) {  
   
    }
} 