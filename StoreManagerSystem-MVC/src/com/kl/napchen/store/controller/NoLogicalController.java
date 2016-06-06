package com.kl.napchen.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kl.napchen.store.global.SessionInfo;

@Controller
public class NoLogicalController {

	@RequestMapping("/main")
	public String goMain(HttpServletRequest request,
			HttpServletResponse response) {
		// 验证用户是否已经登录
		if (((SessionInfo) request.getSession().getAttribute("sessionInfo"))
				.getUser() != null) {
			return "main";
		} else {
			return "index";
		}
	}

	@RequestMapping("/register")
	public String register() {
		//调用日志，开始注册
		return "register";
	}

	@RequestMapping(value={"/","/index"})
	public String goIndexByNone() {
		// 调用日志-开始登录
		System.out.println("go index......");
		return "index";
	}
}
