package org.zerock;

import java.io.*;
import java.util.Arrays;

public class StreamEx {

	public static void main(String[] args) throws IOException{

		FileInputStream fis = new FileInputStream(".\\FileViewer.java");
		
		int data = 0;
		
		while((data=fis.read()) != -1) {
			char c = (char)data;
			System.out.println(c);
		}
		
		
	}

	private static void printArrays(byte[] temp, byte[] outSrc) {
		System.out.println("temp : " + Arrays.toString(temp));
		System.out.println("OutPut Source : " + Arrays.toString(outSrc));
	}
}
