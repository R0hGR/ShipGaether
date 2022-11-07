package com.ship.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ship.util.Path;

import lombok.extern.log4j.Log4j;



@Log4j
@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Override
	public String saveStore(MultipartFile file) {

		String ofName = file.getOriginalFilename();
		log.info("# FileUploadServiceImpl ofName :" + ofName);
		// ofName :uploadFile.jpg

		int idx = ofName.lastIndexOf(".");
		String ofHeader = ofName.substring(0, idx);
		String ofTail = ofName.substring(idx);

		long ms = System.currentTimeMillis();

		StringBuilder sb = new StringBuilder();
		sb.append(ofHeader);
		sb.append("_");
		sb.append(ms);
		sb.append(ofTail);
		String savaFileName = sb.toString();

		long fileSize = file.getSize();
		log.info("#ofName : "+ofName + " savaFileName : "+ savaFileName + " fileSize : " + fileSize);

		boolean flag = writeFile(file, savaFileName);
		if (flag) {
			return savaFileName;

		} else {
			return savaFileName + " ���ε� FAIL";

		}

	}

	private boolean writeFile(MultipartFile file, String savaFileName) {
		File dir = new File(Path.SHIP_STORE);
		if (!dir.exists())
			dir.mkdirs();

		FileOutputStream fos = null;

		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(Path.SHIP_STORE + savaFileName);
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
}
