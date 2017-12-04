package com.database.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
   
public class ChatWebSocketHandler extends TextWebSocketHandler{  
     
   private final static List<WebSocketSession> sessions =Collections.synchronizedList(new ArrayList<WebSocketSession>());  
   //接收文本消息，并发送出去  
   @Override  
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {  
        super.handleTextMessage(session,message);
        sendMessageToUsers(session,message);//发送所有人  
   }  
   //连接建立后处理  
   @Override  
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {  
        System.out.println("connect to thewebsocket chat success......");  
        sessions.add(session);  
        //处理离线消息  
   }  
   //抛出异常时处理  
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {  
        if(session.isOpen()){  
            session.close();  
        }  
        System.out.println("websocket chatconnection closed......");  
        sessions.remove(session);  
   }  
   //连接关闭后处理  
   public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {  
        System.out.println("websocket chatconnection closed......");  
        sessions.remove(session);  
   }  
   
   @Override  
   public boolean supportsPartialMessages() {  
        return false;  
   }  
     
         //发送消息方法  
      private void sendMessageToUsers(WebSocketSession session,TextMessage message) throws IOException {  
                //循环在线会话，发送消息  
               for (WebSocketSession itemSession : sessions) {  
                        if(itemSession.isOpen()) {  
                                  itemSession.sendMessage(message);  
                        }  
               }  
                
      }  
}  