package com.team.erp.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.erp.framework.service.TestService;

/**
 * Description:
 * ����Service��
 * @className TestServiceSSM
 * @author @liuYL
 * @createDate 2020��4��23��
 */

//�������ע���ʾspring����
@RunWith(SpringJUnit4ClassRunner.class)
//ɨ�����xml
@ContextConfiguration({"classpath:spring.xml"})

public class TestServiceSSM {
	
	//�Զ�ע��ӿڶ����Ա��ڲ���
		@Autowired
		private TestService ts;
		
		@Test
		public void DemoTest() {
			ts.DemoTest();
		}

}
