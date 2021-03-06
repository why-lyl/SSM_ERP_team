package com.team.erp.framework.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.erp.framework.model.Authority;
import com.team.erp.framework.model.vo.DepartmentAndAuthority;
import com.team.erp.framework.model.vo.UserAndAuthority;



/**
 * Description:
 * DAA全称DepartmentAndAuthority，是一张中间表
 * UAA全称UserAndAuthority,是user和authority的中间表，用于权限的分配
 * @className AuthorityMapper
 * @author @liuYL
 * @createDate 2020年4月28日
 */
public interface AuthorityMapper {
	
	/**
	 * 查询方法
	 */
	
	Authority selectAuthorityByAuthoritById(Integer AuthorityId);//根据AuthorityId查询数据
	Authority selectAuthorityByAuthoritByName(Integer AuthorityName);//根据AuthorityName查询数据
	List<Authority> selectAuthorityAll();//用一个集合将装Authority的信息装下
	List<Authority> selectAuthoritysByUserName(String userName);
	
	/*
	 * DepartmentAndAuthority中间表的查询方法
	 */
	//根据departmentAuthorityId查得DAA中间表的信息
	DepartmentAndAuthority  selectDAABydepartmentAuthorityId(Integer departmentAuthorityId);
	//根据departmentId查得DAA中间表的信息
	DepartmentAndAuthority  selectDAABydepartmentId(Integer departmentId);
	//根据authorityId查得DAA中间表的信息
	DepartmentAndAuthority  selectDAAByauthorityId(Integer authorityId);
	List<DepartmentAndAuthority> selectDAAAll();//查得DAA中间表的所有信息
	List<DepartmentAndAuthority> selectDAABydepartmentId(int departmentId);//通过departmentId查得DAA中间表的相关信息
	
	/*
	 *UserAndAuthority中间表的查询方法
	 */
	UserAndAuthority selectUAAByuserAuthorityId(Integer userAuthorityId);
	List<UserAndAuthority> selectUAAByuserId(Integer userId);
	List<UserAndAuthority> selectUAAAll();
	UserAndAuthority selectUAAByauthorityId(Integer authorityId);
	
	/**
	 * 更新方法
	 */
	
	int updateByPrimaryKeySelective(Authority record);//根据选择的权限主键更新权限信息
	int updateByPrimaryKey(Authority record);//根据权限主键更新权限信息
	
	/**
	 * 添加方法
	 */
	
	int addAuthority(Authority authority);//根据传入的权限信息插入权限信息
	int addDepartmentAndAuthority(DepartmentAndAuthority departmentAndAuthority);
	int addDepartmentAndAuthorityByProperty(@Param("departmentAuthorityId")int departmentAuthorityId,@Param("departmentId")int departmentId, @Param("authorityId")int authorityId);
	/*
	 *UserAndAuthority中间表的添加方法
	 */
	
	int addUserAndAuthorityByProperty(@Param("userAuthorityId")int userAuthorityId,@Param("userId")int userId, @Param("authorityId")int authorityId);
	
	
	/**
	 * 删除方法
	 */
	
	int deleteAuthorityByAuthorityId(Integer authorityId);//根据权限id删除权限
	int deleteAuthorityByAuthorityName(String authorityName);//根据权限name删除权限
	
	/*
	 * DepartmentAndAuthority中间表的删除方法
	 */
	int deleteDAABydepartmentId(int departmentId);//根据departmentId删除中间表的相关信息
	
	/*
	 *UserAndAuthority中间表的删除方法
	 */
	int deleteUAAByUserId(int userId);//根据userId删除UAA中间表的相关信息
	

}
