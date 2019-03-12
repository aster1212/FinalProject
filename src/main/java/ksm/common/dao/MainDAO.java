package ksm.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBestItemForAll() {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("main.selectBestItemForAll");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBestItemForGender(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("main.selectBestItemForGender", map);
	}
}
