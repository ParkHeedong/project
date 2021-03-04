package com.park.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //Servlet의 ServletContext를 이용하기 위함. 스프링에서는 WebApplicationContext라는 존재를 이용하기 위해 사용.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTest {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //가짜 mvc. 가짜로 url과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행해 볼 수 있다.

	@Before //모든 테스트 전에 매번 실행되는 메소드
	public void setup() {
		
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
	}
	
	@Test
	public void testList() throws Exception { //MockMvcRequestBuilders라는 존재를 이용해서 get 방식의 호출을 한다. 
											  //이후 BoardController의 getList()에서 반환된 결과를 이용해서 Model에 어떤 데이터들이 담겨 있는지 확인함.
		log.info("testList............");
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
		
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "새로운 테스트 제목")
				.param("content", "새로운 테스트 내용")
				.param("writer", "new user")
				).andReturn().getModelAndView().getViewName();
				
				log.info(resultPage);
						
	}
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/board/get")
				.param("bno", "3"))
				.andReturn()
				.getModelAndView().getModelMap());
						
	}
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "1")
				.param("title", "수정된 테스트 제목")
				.param("content", "수정된 테스트 내용")
				.param("writer", "updated user")
				).andReturn().getModelAndView().getViewName();
				
				log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "4"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}
