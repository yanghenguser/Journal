package com.database.mybatis.mapper;

import com.database.mybatis.po.Orderall;
import com.database.mybatis.po.OrderallExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderallMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    long countByExample(OrderallExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int deleteByExample(OrderallExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int deleteByPrimaryKey(String orderid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int insert(Orderall record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int insertSelective(Orderall record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    List<Orderall> selectByExample(OrderallExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    Orderall selectByPrimaryKey(String orderid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int updateByExampleSelective(@Param("record") Orderall record, @Param("example") OrderallExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int updateByExample(@Param("record") Orderall record, @Param("example") OrderallExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int updateByPrimaryKeySelective(Orderall record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orderall
     *
     * @mbg.generated Tue Jun 20 22:36:47 CST 2017
     */
    int updateByPrimaryKey(Orderall record);
}