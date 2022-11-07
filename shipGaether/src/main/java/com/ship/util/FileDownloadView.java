package com.ship.util;

import java.io.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.ship.domain.BoardFile;
import com.ship.service.BoardFileService;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Component

public class FileDownloadView extends AbstractView {
	
	@Autowired
	private BoardFileService boardFileService;	

	public FileDownloadView() {
		setContentType("application/download;charset=utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		File file = (File) model.get("downloadFile");
		
		BoardFile boardFile = boardFileService.selectFileInfoS(file.getName());
		String originName = boardFile.getBoardFileName();
		
		response.setContentType(getContentType());
		response.setContentLength((int) file.length());
		
		String value = "attachment; filename=" + java.net.URLEncoder.encode(originName, "utf-8") + ";";
		
		response.setHeader("Content-Disposition", value);
		response.setHeader("Content-Transfer-Encoding", "binary");

		FileInputStream fis = null; // 근원지(서버측 파일 스트림)
		OutputStream os = response.getOutputStream(); // 목적지(클라이언트측 파일 스트림)
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
			os.flush();
		} catch (IOException ie) {
			log.info("#FileDownloadView ie: " + ie);
		} finally {
			if (fis != null)
				fis.close();
			if (os != null)
				os.close();
		}
	}
}