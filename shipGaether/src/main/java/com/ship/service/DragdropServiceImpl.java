package com.ship.service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.Data;
import lombok.extern.log4j.Log4j;
import com.ship.util.Path;


@Log4j
@Service
@Data
public class DragdropServiceImpl implements DragdropService {	
	private MultipartHttpServletRequest multipartRequest;
	
	private String shipPath;
	
	@Override
	public MultipartHttpServletRequest getMultipartRequest() {
		return multipartRequest;
	}
	@Override
	public void setMultipartRequest(MultipartHttpServletRequest multipartRequest) {
		this.multipartRequest = multipartRequest;
	}
	
	@Override
	public void setShipPath(String shipPath) {
		this.shipPath = shipPath;
	}
	
	private Map<String, List<Object>> map;
	@Override
	public Map<String, List<Object>> getUpdateFileName() {
		upload();
		return map;
	}
	private void upload() {
		map = new Hashtable<String, List<Object>>();
		
		Iterator<String> itr = multipartRequest.getFileNames();
		
		List<Object> ofnames = new ArrayList<Object>();
		List<Object> savefnames = new ArrayList<Object>();
		List<Object> fsizes = new ArrayList<Object>();
		
		while(itr.hasNext()) {
			StringBuilder sb = new StringBuilder();
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			String ofname = mpf.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String ctm = sdf.format(System.currentTimeMillis());
			sb.append(ctm)
			.append(UUID.randomUUID().toString())
			.append(ofname.substring(ofname.lastIndexOf(".")));
			
			String savefname = sb.toString();
			
			long fsize = mpf.getSize();
			
			String fileFullPath =shipPath+savefname;
			log.info("#fileFullPath :"+fileFullPath);
			
			try {
				mpf.transferTo(new File(fileFullPath)); //���ε�
				ofnames.add(ofname);
				savefnames.add(savefname);
				fsizes.add(fsize);
			}catch(IOException ie) {
				log.info("#DragdropServiceImpl upload() ie: " + ie);
			}
		}
		
		map.put("ofnames", ofnames);
		map.put("savefnames", savefnames);
		map.put("fsizes", fsizes);
	}
}
