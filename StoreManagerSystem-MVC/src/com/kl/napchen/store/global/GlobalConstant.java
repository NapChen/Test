package com.kl.napchen.store.global;

public class GlobalConstant {

	public static final String SESSION_INFO = "sessionInfo";

	public static final Integer ENABLE = 1; // 启用
	public static final Integer DISABLE = 0; // 禁用

	public static final String FLAG_ENABLE = "1"; // 封锁
	public static final String FLAG_DISABLE = "0"; // 未封锁

	public static final Integer DEFAULT = 0; // 默认
	public static final Integer NOT_DEFAULT = 1; // 非默认

	public static final Integer SUCCESS = 0;// 成功
	public static final Integer FAIL = -1;// 失败

	public static final Integer FAIL_REASON_NULL = -2;// 失败-2:为空
	public static final Integer FAIL_REASON_NOT_EXIST = -3;// 失败-3:不存在
	public static final Integer FAIL_REASON_EXIST = -4;// 失败-4：已存在
	public static final Integer FAIL_REASON_INCONSISTENT = -5;// 失败-5:不一致
	public static final Integer FAIL_REASON_LACK_OR_OVER_LENGTH = -6;// 失败-6:长度不在范围内

}
