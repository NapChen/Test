package com.kl.napchen.store.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kl.napchen.store.bean.User;
import com.kl.napchen.store.global.GlobalConstant;
import com.kl.napchen.store.global.SessionInfo;
import com.kl.napchen.store.inter.IUser;

@Controller
public class UserController {

	@Autowired
	private User user;
	@Autowired
	private IUser userImpl;
	@Autowired
	private SessionInfo sessionInfo;

	@RequestMapping(value = "/login", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView login(@RequestParam(required = true) String username,
			@RequestParam(required = true) String password,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			// 等待2s，用于展示前台动态效果
			Thread.sleep(2000);

			ModelAndView modelAndView = new ModelAndView();

			// 尝试采用昵称加密码登录
			user.setNickName(username);
			user.setPassword(password);
			User userTemp = userImpl.login(user);
			if (userTemp != null) {
				// 保存状态信息
				sessionInfo.setUser(userTemp);
				request.getSession().setAttribute("sessionInfo", sessionInfo);
				modelAndView.setViewName("redirect:main");
				return modelAndView;
			} else {// 尝试采用UID加密码登录
				user.setUid(username);
				user.setNickName(null);
				userTemp = userImpl.login(user);
				if (userTemp != null) {
					sessionInfo.setUser(userTemp);
					request.getSession().setAttribute("sessionInfo",
							sessionInfo);
					modelAndView.setViewName("redirect:/main");
					return modelAndView;
				}
			}
			modelAndView
					.addObject("msg", "Bad User Or Password,Please Retry !");
			modelAndView.addObject("state", -1);
			modelAndView.setViewName("index");
			return modelAndView;
		} catch (InterruptedException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/addUser", method = { RequestMethod.POST })
	public ModelAndView addUser(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			// 暂停2s，用于展示前台动态效果
			Thread.sleep(2000);
			ModelAndView modelAndView = new ModelAndView();

			String username = request.getParameter("nickName");
			String password = request.getParameter("Password");
			String confirmPassword = request.getParameter("ConfirmPassword");

			System.out.println("username:" + username + "password:" + password
					+ "confirmPassword:" + confirmPassword);

			// 判断用户名和密码是否为空，防止误操作
			if (username != null && password != null && confirmPassword != null) {
				
				System.out.println("初始化...");
				
				user.setNickName(username);
				user.setPassword(password);
				// 获取UID
				user.setUid(userImpl.getNxetUid() + "");

				// 初始化用户权限
				user.setPermitAddProduct(GlobalConstant.DISABLE);
				user.setPermitAddType(GlobalConstant.DISABLE);
				user.setPermitAdmin(GlobalConstant.DISABLE);
				user.setPermitIn(GlobalConstant.DISABLE);
				user.setPermitQuery(GlobalConstant.DISABLE);
				user.setPermitOut(GlobalConstant.DISABLE);

				System.out.println("save...");
				// 保存用户信息
				userImpl.add(user);

				System.out.println("return...index");
				
				modelAndView.setViewName("index");
				modelAndView.addObject("state", 0);
				modelAndView
						.addObject("msg", "Register Success,Please Login !");
				return modelAndView;
			} else {
				throw new NullPointerException("空用户信息");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * Title: Ajax校验 检查用户名是否存在 Description: data: 用户名 Company:昆仑信息科技
	 * 
	 * @author 陈国警
	 * @version: 1.0 Date: 2016年5月19日 下午5:32:25
	 */
	@RequestMapping("/addUserCheck")
	@ResponseBody
	public Map<String, String> checkUserName(String nickName) {
		try {
			Map<String, String> map = new HashMap<String, String>(1);
			user.setNickName(nickName);
			// 检测唯一性，用户名是否已经存在
			User userTemp = userImpl.checkUnique(user);
			System.out.println(userTemp);
			if (userTemp == null) {
				map.put("success", "true");
			} else {
				map.put("success", "false");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
