package com.ship.util;

import java.util.Random;

public class RandomCode {
	
	public Random random = new Random();

	public String makeEmailCode(int codeLength) {
		int index = 0;
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}; // 배열안의 문자 숫자는 원하는대로
		
		StringBuffer emailCode = new StringBuffer();		
		for (int i = 0; i < codeLength; i++) {
			double rd = random.nextDouble();
			index = (int) (charSet.length * rd);
			emailCode.append(charSet[index]);
			System.out.println("index::" + index + "	charSet::" + charSet[index]);
		}
		return emailCode.toString();
	}
	
	
	public String makePhoneCode(int codeLength) {
		String phoneCode = "";
		for(int i=0; i<codeLength; i++) {
			String str = Integer.toString(random.nextInt(10)); 
			phoneCode += str;
		}
		return phoneCode;
	}
	
}
