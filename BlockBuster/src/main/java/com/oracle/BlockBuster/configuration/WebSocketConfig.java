package com.oracle.BlockBuster.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.oracle.BlockBuster.handler.ChatHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Autowired
	ChatHandler chatHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler, "/chating");

	}
}		
