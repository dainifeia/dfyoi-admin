package com.dfyoi.utils;

import java.security.MessageDigest;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5Util {
	private static final char HEX_DIGITS[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
			'E', 'F' };
	// pwd为明文密码，salt为盐（可自定义），i加密次数
	public static String toMd5(String pwd, String salt, int i) {
		Md5Hash toMd5 = new Md5Hash(pwd, salt, i);
		return toMd5.toString();
	}

	private static String toHexString(byte[] b) {
		StringBuilder sb = new StringBuilder(b.length * 2);
		for (int i = 0; i < b.length; i++) {
			sb.append(HEX_DIGITS[(b[i] & 0xf0) >>> 4]);
			sb.append(HEX_DIGITS[b[i] & 0x0f]);
		}
		return sb.toString();
	}

	public static String Bit32(String SourceString) throws Exception {
		MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
		digest.update(SourceString.getBytes());
		byte messageDigest[] = digest.digest();
		return toHexString(messageDigest);
	}

	public static String Bit16(String SourceString) throws Exception {
		return Bit32(SourceString).substring(8, 24);
	}
}
