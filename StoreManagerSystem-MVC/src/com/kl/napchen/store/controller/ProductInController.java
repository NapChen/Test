package com.kl.napchen.store.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kl.napchen.store.bean.ProductIn;
import com.kl.napchen.store.bean.User;
import com.kl.napchen.store.global.SessionInfo;
import com.kl.napchen.store.inter.IProductIn;

@Controller
public class ProductInController {
	@Autowired
	private IProductIn productInImpl;

	// 添加商品信息
	// Ajax调用
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST, headers = { "content-type=application/json" })
	@ResponseBody
	public Map<String, String> addProduct(@RequestBody ProductIn productInPara,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = null;
		try {
			map = new HashMap<String, String>();

			System.out.println("add---------------------");

			// 获取保存在session中的用户信息
			SessionInfo sessionInfo = (SessionInfo) request.getSession()
					.getAttribute("sessionInfo");
			User user = sessionInfo.getUser();

			// 初始化商品信息
			productInPara.setSalePrice(productInPara.getPrice());
			productInPara.setDiscount(1.0);
			productInPara.setInTime(new Timestamp(System.currentTimeMillis()));

			System.err.println(productInPara.getRelFlag()+"------11111");
			if (productInPara.getRelFlag().equals("1")) {
				System.out.println("原因-----------");
				productInPara.setRelReason("录入即返修");
				productInPara.setRelTime(new Timestamp(System
						.currentTimeMillis()));
			}
			if (productInPara.getHoldFlag().equals("1")) {
				productInPara.setHoldReason("录入即封锁");
				productInPara.setHoldTime(new Timestamp(System
						.currentTimeMillis()));
			}
			int j = productInPara.getNumber();
			System.out.println(j + "-----------j-------------");
			for (int i = 0; i < j; i++) {
				// 获取唯一标示
				productInPara.setUid(productInImpl.getNxetUid());
				System.out.println(productInPara.getUid());
				// 单个商品数量总是为1
				productInPara.setNumber(1);
				// 保存
				productInImpl.add(productInPara, user);
			}
			map.put("success", "true");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			return map;
		}
	}

}
