package ksm.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksm.common.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> selectBestItemForAll() {
		// TODO Auto-generated method stub
		return mainDAO.selectBestItemForAll();
	}

	@Override
	public List<Map<String, Object>> selectBestItemForGender(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mainDAO.selectBestItemForGender(map);
	}
}
