package ksm.common.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	@Resource(name="allFilePath")
	AllFilePath path;
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String,Object> map,HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtexsion = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		File file = new File(path.filepath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			try {
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtexsion = originalFileName.substring(multipartFile.getOriginalFilename().lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtexsion;
				file = new File(path.filepath + storedFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("fileName", multipartFile.getName());
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("originalFileName", originalFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}catch(StringIndexOutOfBoundsException e) {
				System.out.println(multipartFile.getName() + "파일 없음");
			}
		}
		return list;
	}
	
}
