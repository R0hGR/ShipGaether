package com.ship.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;



@Log4j
@Component
public class FileUploadManager {
	
	public String makeFileName (MultipartFile file, String category, int pk) {
		String ofName = file.getOriginalFilename(); // ofName : uploadFile.jpg
		
		//���� ���̹�
		int idx = ofName.lastIndexOf(".");
		String ofHeader = ofName.substring(0, idx);
		String ofTail = ofName.substring(idx);

		long ms = System.currentTimeMillis();

		StringBuilder sb = new StringBuilder();
		sb.append(ofHeader);
		sb.append("_");
		sb.append(ms);
		sb.append(ofTail);
		String fileName = sb.toString();
		
		String filePath = "";
		if(category == "SHIP_PHOTO") {
			filePath = Path.SHIP_STORE+pk+"/";			
		}else if( category == "writeBoardPhoto") {
			filePath = Path.WRITE_BOARD_PHOTO_STORE ;
		}
		
		
		boolean flag = writeFile(file,filePath, fileName);
		if (flag) {
			return fileName;
		} else {
			return fileName + " 라는 파일 업로드 FAIL";
		}		
	}
	
	private boolean writeFile(MultipartFile file,String filePath, String fileName) {

		
		File dir = new File(filePath);
		
		if (!dir.exists())
			dir.mkdirs();

		FileOutputStream fos = null;

		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream( filePath + fileName );
			fos.write(data);
			fos.flush();
			return true;
		} catch (IOException ie) {
			return false;
		} finally {
			try {
				fos.close();
			} catch (IOException io) {
				return false;
			}
		}
	}
	
//	public String saveStore(MultipartFile file) {
//
//		String ofName = file.getOriginalFilename();
//		log.info("# FileUploadServiceImpl ofName :" + ofName);
//		// ofName :uploadFile.jpg
//
//		int idx = ofName.lastIndexOf(".");
//		String ofHeader = ofName.substring(0, idx);
//		String ofTail = ofName.substring(idx);
//
//		long ms = System.currentTimeMillis();
//
//		StringBuilder sb = new StringBuilder();
//		sb.append(ofHeader);
//		sb.append("_");
//		sb.append(ms);
//		sb.append(ofTail);
//		String savaFileName = sb.toString();
//
//		long fileSize = file.getSize();
//		log.info("#ofName : "+ofName + " savaFileName : "+ savaFileName + " fileSize : " + fileSize);
//
//		boolean flag = writeFile(file, savaFileName);
//		if (flag) {
//			return savaFileName;
//
//		} else {
//			return savaFileName + " ���ε� FAIL";
//
//		}
//
//	}
//
//	private boolean writeFile(MultipartFile file, String savaFileName) {
//		File dir = new File(Path.FILE_STORE);
//		if (!dir.exists())
//			dir.mkdirs();
//
//		FileOutputStream fos = null;
//
//		try {
//			byte data[] = file.getBytes();
//			fos = new FileOutputStream(Path.FILE_STORE + savaFileName);
//			fos.write(data);
//			fos.flush();
//			return true;
//		} catch (IOException ie) {
//			return false;
//		} finally {
//			try {
//				fos.close();
//			} catch (IOException io) {
//				return false;
//			}
//		}
//	}
}
