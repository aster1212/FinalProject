package ksm.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("adminShoppingDAO")
public class AdminShoppingDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminItemList(){
		return (List<Map<String, Object>>) selectList("adminItem.adminItemList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminItemSearchList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("adminItem.adminItemSearchList", map);
	}
	
	public void adminItemInsert(Map<String, Object> map) {
		insert("adminItem.adminItemInsert", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> adminSeqSelect(){
		return (Map<String,Object>)selectOne("adminItem.adminSeqVal");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectItemOne(Map<String, Object> map){
		return (Map<String, Object>)selectOne("adminItem.adminItemOne",map);
	}
	
	public void modifyItem(Map<String, Object> map) {
		update("adminItem.adminItemModify", map);
	}
	
	public void deleteItem(Map<String, Object> map) {
		delete("adminItem.adminItemDelete", map);
	}
	
	public void adminSeqUpdate() {
		update("adminSeqUpdate","asd");
	}
	
	public void itemShortPathUpdate(Map<String, Object> map) {
		update("adminItem.itemShortPathUpdate",map);
	}
	
	public void itemImagePathUpdate(Map<String, Object> map) {
		update("adminItem.itemImagePathUpdate",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) {
		return selectList("adminItem.adminCommentList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCommentOne(Map<String, Object> map){
		return (Map<String, Object>) selectOne("adminItem.adminCommentGetOne", map);
	}
	
	public void insertCommentReply(Map<String, Object> map) {
		insert("adminItem.adminCommentWrite",map);
	}
	
	public void increaseCommentStep(Map<String, Object> map) {
		update("adminItem.adminCommentIncreaseStep", map);
	}
	
	public void modifyItemComment(Map<String, Object> map) {
		update("adminItem.adminCommentModify", map);
	}
	
	public void deleteItemComment(Map<String, Object> map) {
		delete("adminItem.adminCommentDelete", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentSearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("adminItem.adminCommentSearchList", map);
	}
	
}
