package com.team.erp.framework.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 * ����controller��
 * @className TestController
 * @author @liuYL
 * @createDate 2020��4��23��
 */

//����ע���ʾ���ǿ��Ʋ�
@Controller
//ָ�����ʸÿ��Ʋ��·�ɣ�������·������˼����������⣩
@RequestMapping("/testController")
public class TestController {
	
	/**
	 * @ResponseBody���:���ظ��ӿ�ʱ����Ҫ��Ӵ�ע�⣬���ظ�ҳ��ʱ������Ҫ
	 * ˭����������Ͱѽ�����ظ�˭-->���������������Ͱѽ�����ظ��������ajax����������Ͱѽ�����ظ�ajax
	 * (�д������)
	 */
	//��ÿ������ָ����Ӧ��·�ɾͿɷ��ʸ÷���
	@RequestMapping("/test.do")
	@ResponseBody 
	public String Test() {
		return "Come on,little boy";
		
	}

}
