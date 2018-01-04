package com.dfyoi.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dfyoi.admin.pojo.SysPower;
import com.dfyoi.platform.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysPowerMapper {
    int removeById(Integer id);
    
    /**
	 * 根据左右值删除子节点
	 * 
	 * @param lft
	 * @param rgt
	 * @return
	 */
	int removeAndChild(@Param("lft") Integer lft, @Param("rgt") Integer rgt);

	/**
	 * 在添加节点之前，先更新其他的节点，将其左右值分别+2
	 * 
	 * @param rgt
	 * @return
	 */
	int beforInsert(Integer rgt);

    int insert(SysPower record);

    int insertSelective(SysPower record);

    SysPower getPowerById(Integer id);

    SysPower getPowerBySym(String sym);
    /**
	 * 获取父节点信息
	 * 
	 * @param id
	 * @return
	 */
    SysPower getParentPower(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level);
    /**
	 * 获取向上移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysPower getPowerMoveUp(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);

	/**
	 * 获取向下移动时需要交换的节点信息
	 * 
	 * @param lft
	 * @param level
	 * @return
	 */
	SysPower getPowerMoveDown(@Param("lft") Integer lft,@Param("rgt") Integer rgt, @Param("level") Integer level,@Param("plft") Integer plft,@Param("prgt") Integer prgt, @Param("plevel") Integer plevel);
    
    int updateByPrimaryKeySelective(SysPower record);

    int updateById(SysPower record);
    
    /**
	 * 获取所有记录
	 * 
	 * @return
	 */
	List<SysPower> listAll();
	
	/**
	 * 根据左右值获取子节点
	 * @param lft
	 * @param rgt
	 * @return
	 */
	List<SysPower> listDescendant(@Param("lft") Integer lft, @Param("rgt") Integer rgt);
	
	List<SysPower> listPowerByRoleSym(@Param("roleSym") String roleSym,@Param("powerType") int powerType);
	
	
	/**
	 * 获取最大的rgt值
	 * 
	 * @return
	 */
	Integer getMaxRgt();
}