package ksm.common.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	List<Map<String, Object>> selectBestItemForAll();

	List<Map<String, Object>> selectBestItemForGender(Map<String, Object> map);

}
