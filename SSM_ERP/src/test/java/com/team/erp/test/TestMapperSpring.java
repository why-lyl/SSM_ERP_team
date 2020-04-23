package com.team.erp.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.erp.framework.mapper.TestMapper;

/**
 * Description:
 * ����mybatis��spring�Ƿ����óɹ�
 * @className TestMapper
 * @author @liuYL
 * @createDate 2020��4��23��
 */

//�������ע���ʾspring����
@RunWith(SpringJUnit4ClassRunner.class)
//ɨ�����xml

@ContextConfiguration({"classpath:spring.xml"})
public class TestMapperSpring {
	
	//�Զ�ע��ӿڶ����Ա��ڲ���
	@Autowired
	private TestMapper tm;
	
	@Test
	public void m() {
		//ibatis��û��mybatis��ǰ��
		//System.out.println(tm);//org.apache.ibatis.binding.MapperProxy@78641d23 ˵����TestMapper�Ĵ������
		System.out.println(tm.getUserNameByUserId(2));
		System.out.println(tm.getUserNameByUserId(1));
	}

}
