package com.kl.napchen.store.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kl.napchen.store.bean.ProductType;
import com.kl.napchen.store.global.JasonUtil;
import com.kl.napchen.store.inter.IProductType;
import com.kl.napchen.store.page.PageGrid;

@Controller
public class ProductTypeController {

	@Autowired
	private ProductType productType;
	@Autowired
	private PageGrid pageGrid;
	@Autowired
	private IProductType productTypeImpl;

	@RequestMapping("/managerType")
	public ModelAndView managerType() {
		// 用于返回的模型
		ModelAndView modelAndView = getAllType();

		modelAndView.setViewName("main_type");
		return modelAndView;
	}

	@RequestMapping("/goAddProduct")
	public ModelAndView addProduct() {
		// 用于返回的模型
		ModelAndView modelAndView = getAllType();

		modelAndView.setViewName("main_sale_add");
		return modelAndView;
	}

	// 进入商品管理页面，展示所有产品大类
	@RequestMapping(value = { "/managerProduct" })
	public ModelAndView managerProduct(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(required = false) String operator) {
		// 用于返回的模型
		ModelAndView modelAndView = getAllType();
		modelAndView.setViewName("main_sale");
		return modelAndView;
	}

	//
	// Ajax 调用
	@RequestMapping("/checkLMSType")
	@ResponseBody
	public Map<String, Object> getMSType(
			@RequestBody Map<String, String> typeMap) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> params = null;
			List<ProductType> list = null;

			// 获取参数
			String type = typeMap.get("type");
			String lType = typeMap.get("lType");
			String mType = typeMap.get("mType");

			if ("L".equals(type)) {
				String hql = " From ProductType pt " + //
						" Where pt.type = 'M' " + //
						" And pt.largeType = :largeType ";
				params = new HashMap<String, Object>();
				params.put("largeType", lType);
				list = productTypeImpl.getProductTypeByCondition(hql, params);
			} else if ("M".equals(type)) {
				String hql = " From ProductType pt " + //
						" Where pt.type = 'S' " + //
						" And pt.mediumType = :mediumType ";
				params = new HashMap<String, Object>();
				params.put("mediumType", mType);
				list = productTypeImpl.getProductTypeByCondition(hql, params);
			}
			if (list != null) {
				// 返回数据
				map.put("list", list);
				// 返回操作标志,存在
				map.put("success", "true");
			} else {
				// 返回操作标志，不存在
				map.put("success", "false");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/addType")
	@ResponseBody
	public Map<String, String> addType(@RequestBody ProductType productType) {
		Map<String, String> map = new HashMap<String, String>();

		System.out.println(productType.getLargeType());
		System.out.println(productType.getMediumType());
		System.out.println(productType.getSmallType());

		try {
			if (productType.getType().equals("L")) {
				// 新增大类,只保留大类名
				productType.setLargeType(productTypeImpl.getNextLargeTypeNo());
				System.out.println(productType.getLargeType());
				productType.setCreateTime(new Timestamp(System
						.currentTimeMillis()));

				// 清空其他信息
				productType.setMediumName(null);
				productType.setMediumType(null);
				productType.setSmallName(null);
				productType.setSmallType(null);

				productTypeImpl.add(productType);
			}
			if (productType.getType().equals("M")) {
				// 新增中类,保留大类名，大类编号，中类名
				productType.setMediumType(productTypeImpl
						.getNextMediumTypeNo(productType.getLargeType()));
				System.out.println(productType.getMediumType());
				productType.setCreateTime(new Timestamp(System
						.currentTimeMillis()));

				// 清空其他信息
				productType.setSmallName(null);
				productType.setSmallType(null);

				productTypeImpl.add(productType);
			}
			if (productType.getType().equals("S")) {
				// 新增大类,只保留大类名
				productType
						.setSmallType(productTypeImpl.getNextSmallTypeNo(
								productType.getLargeType(),
								productType.getMediumType()));

				System.out.println(productType.getSmallType());

				productType.setCreateTime(new Timestamp(System
						.currentTimeMillis()));

				productTypeImpl.add(productType);
			}
			map.put("success", "true");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			return map;
		}
	}

	// 获取商品所有类型
	private ModelAndView getAllType() {
		ModelAndView modelAndView = new ModelAndView();
		// 获取所有分类
		String hql = " From ProductType pt Order by pt.type,pt.largeName,pt.mediumName,pt.smallName ";
		List<ProductType> listOfType = productTypeImpl
				.getProductTypeByCondition(hql, new HashMap<String, Object>());
		// 返回给前台一个Jason字符串
		String jsonOfType = JasonUtil.ObjListToJson((ArrayList<?>) listOfType);
		System.out.println(jsonOfType);

		jsonOfType = jsonOfType.replaceAll("null", "-");
		jsonOfType = jsonOfType.replaceAll("L", "大类");
		jsonOfType = jsonOfType.replaceAll("M", "中类");
		jsonOfType = jsonOfType.replaceAll("S", "小类");

		modelAndView.addObject("jsonOfType", jsonOfType);
		return modelAndView;
	}

	@RequestMapping("/editType")
	@ResponseBody
	public Map<String, String> editType(@RequestBody ProductType productType) {
		Map<String, String> map = new HashMap<String, String>();
		Map<String, Object> params = new HashMap<String, Object>();
		int ret = 0;
		String type = "";

		try {

			System.out.println(productType.getLargeName());
			System.out.println(productType.getMediumName());
			System.out.println(productType.getSmallName());

			String[] largeName = productType.getLargeName().split(":");
			String[] mediumName = productType.getMediumName().split(":");
			String[] smallName = productType.getSmallName().split(":");
			String hql = "";

			// 检查修改状态--大类
			if (!largeName[0].equals(largeName[1])) {
				// 修改大类名
				hql = " UPDATE ProductType pt " + //
						" SET pt.largeName = :largeName " + //
						" WHERE pt.largeType = :largeType ";

				params.clear();
				params.put("largeName", largeName[1]);
				params.put("largeType", productType.getLargeType());
				ret = productTypeImpl.executeHql(hql, params);
				if (ret < 1) {
					type = "L";
				}
			}
			// 检查修改状态--中类
			if (!mediumName[0].equals(mediumName[1])) {
				// 修改中类名
				hql = " UPDATE ProductType pt " + //
						" SET pt.mediumName = :mediumName " + //
						" WHERE pt.mediumType = :mediumType ";

				params.clear();
				params.put("mediumName", mediumName[1]);
				params.put("mediumType", productType.getMediumType());
				ret = productTypeImpl.executeHql(hql, params);

				if (ret < 1) {
					type = "M";
				}
			}
			// 检查修改状态--小类
			if (!smallName[0].equals(smallName[1])) {
				// 修改大类名
				hql = "UPDATE ProductType pt" + //
						" SET pt.smallName = :smallName " + //
						" WHERE pt.smallType = :smallType ";

				params.clear();
				params.put("smallName", smallName[1]);
				params.put("smallType", productType.getSmallType());
				ret = productTypeImpl.executeHql(hql, params);

				if (ret < 1) {
					type = "S";
				}
			}
			if (ret > 0) {
				map.put("success", "true");
				return map;
			} else {
				map.put("success", "false");
				map.put("msg", "要修改的分类不存在！" + type);
				return map;
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "error");
			map.put("error", e.toString());
			return map;
		}
	}

	@RequestMapping("/deleteType")
	@ResponseBody
	public Map<String, String> deleteType(
			@RequestBody List<ProductType> productTypes) {
		// 返回信息
		Map<String, String> map = new HashMap<String, String>();
		// hql参数
		Map<String, Object> params;
		int ret = 0;
		Long count = new Long(0);
		String msg = "";
		try {
			String hql = "";
			params = new HashMap<String, Object>();
			for (int i = 0; i < productTypes.size(); i++) {
				productType = productTypes.get(i);
				if (productType.getType().equals("L")) {
					//检查大类下是否存在中类额小类
					hql = "Count 1 FROM ProductType pt " + //
							" WHERE pt.type <> 'L' " + //
							" AND pt.largeType = :largeType ";
					params.put("largeType", productType.getLargeType());

					count = productTypeImpl.count(hql, params);
					if (count > 0) {

					}
				}

				hql = " DELETE FROM ProductType pt " + //
						" WHERE pt.largeType = :largeType " + //
						" AND pt.mediumType = :mediumType " + //
						" AND pt.smallType = :smallType ";

				params = new HashMap<String, Object>();
				params.put("largeType", productTypes.get(i).getLargeType());
				params.put("mediumType",
						productTypes.get(i).getMediumType() == "-" ? null
								: productTypes.get(i).getMediumType());
				params.put("smallType",
						productTypes.get(i).getSmallType() == "-" ? null
								: productTypes.get(i).getSmallType());

				ret = productTypeImpl.executeHql(hql, params);
			}
			if (ret > 1) {
				map.put("success", "true");
			} else {
				map.put("success", "false");
				map.put("msg", "删除失败!");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return map;
		}
	}
}
