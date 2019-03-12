package ksm.test;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ksm.common.common.CommandMap;
import ksm.common.utils.FileUtils;

@Controller
public class testController {
	
	@Resource(name="fileUtils")
	FileUtils fileUtils;
	
	@RequestMapping(value="/fileTestForm")
	public String fileuploadTestForm() {
		return "test1";
	}
	
	@RequestMapping(value="/fileTest")
	public String fileuploadTest(CommandMap commandMap) {
		return "test2";
	}
}
