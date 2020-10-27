package com.delay.college.utils;

import java.io.Serializable;

public final class ExecuteResult<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4467073382353735654L;

	/**
	 * 执行成功
	 */
	private boolean success;

	private T data;

	/**
	 * 错误码
	 */
	private int code;

	/**
	 * 错误信息
	 */
	private String msg;

	public boolean isSuccess() {
		return success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	private ExecuteResult() {

	}

	public static <T> ExecuteResult<T> ok() {
		ExecuteResult<T> result = new ExecuteResult<>();
		result.code = 0;
		result.success = true;
		return result;
	}

	public static <T> ExecuteResult<T> ok(T data) {
		ExecuteResult<T> result = new ExecuteResult<T>();
		result.code = 0;
		result.success = true;
		result.data = data;
		return result;
	}

	public static <T> ExecuteResult<T> fail() {
		ExecuteResult<T> result = new ExecuteResult<>();
		result.code = -1;
		result.success = false;
		return result;
	}

	public static <T> ExecuteResult<T> fail(String msg) {
		ExecuteResult<T> result = new ExecuteResult<>();
		result.code = -1;
		result.success = false;
		result.msg = msg;
		return result;
	}

	public static <T> ExecuteResult<T> fail(int code) {
		ExecuteResult<T> result = new ExecuteResult<>();
		result.code = code;
		result.success = false;
		return result;
	}

	public static <T> ExecuteResult<T> fail(int code, String msg) {
		ExecuteResult<T> result = new ExecuteResult<>();
		result.code = code;
		result.success = false;
		result.msg = msg;
		return result;
	}
}
