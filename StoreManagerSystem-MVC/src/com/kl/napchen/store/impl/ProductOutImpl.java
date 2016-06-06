package com.kl.napchen.store.impl;


import org.springframework.beans.factory.annotation.Autowired;

import com.kl.napchen.store.dao.ProductOutDao;
import com.kl.napchen.store.inter.IProductOut;

public class ProductOutImpl implements IProductOut {
	@Autowired
	private ProductOutDao productOutDao;
}
