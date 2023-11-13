package com.momo.utils;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {
		// TODO Auto-generated constructor stub
	}
	
	//쿠키를 만드는 메서드
	//객체를 생성하지 않고 사용하는 방법 -> static
	//CookieManager(클래스). 바로사용
	
	//쿠키를 생성 후 응답 객체에 저장
	/**
	 * 쿠키를 생성 후 응답 객체에 저장
	 */
	// 쿠키만들때 응답객체에 저장
	//2. 쿠키를 생성하기위해 쿠키 이름과 값이 필요, 유지시간 -> 이런 값을 매개변수로 받아온다
	//-> 받아오기 위해 객체의 타입을 알아야한다 타입 : HttpServlet
	//사용자에게 응답하기 위해 응답객체가 필요하다
	//-> 사용자의 요청으로부터 생성된 응답객체를 매개 변수로 전달 받는다.
	public static void makeCookie(//static :서버가실행하면서 미리만들어놔서 생성하지않아도 쓸 수있음
			HttpServletResponse response
			, String name
			, String value
			, int time) {
		
		//쿠키 생성
		Cookie cookie = new Cookie(name, value); //파라미터로 넘어온값 그대로 사용
		
		
		//유지 기간설정
		cookie.setMaxAge(3600);
		
		//응답 객체에 추가
		response.addCookie(cookie);
		
		
		
	}
	/**
	 * 요청 객체로부터 쿠키배열을 가지고온뒤
	 * 원하는 쿠키이름을 찾아서 쿠키값을 반환
	 * @return
	 */
	
	public static String readCookie(
			HttpServletRequest request
			, String name) {
		String value = ""; //value값 담은 변수선언
		//request객체로부터 쿠키의 배열 가져오기
		//보통 get을 이용해서 꺼냈으면 그게 null인지 아닌지 체크
		Cookie[] cookies= request.getCookies();
		
		
		//브라우저를 통해 처음 접근했을 때
		// jsessionid값이 생성되지 않았을때 (쿠키가 하나도 저장되어있지 않은 경우)
		//getCookies 메서드를 호출하면 null을 반환
		if(cookies != null) {
		
		//쿠키 배열을 돌면서 쿠키이름이 일치하는 객체가 있는지 확인
		for(Cookie cookie : cookies ) {//cookies배열에서 하나씩 꺼내서 cookie에 넣어준다
			//있으면 쿠키값 가지고 나오기
			if(cookie.getName().equals(name)) {
				value = cookie.getValue();
				break;
			}
		}
			
		}
		
		//없으면 빈 문자열 반환
		return value;
		
	}
	/**
	 * 쿠키를 삭제합니다.
	 * @param response
	 * @param name
	 */
	//다시 등록하는데 시간만 0 으로만든다
	public static void deleteCookie(//등록은 response
			HttpServletResponse response
			//어떤걸 지울지 이름을알아야지
			, String name
			) {
		//만들어 놓은 쿠키 활용하자
		makeCookie(response, name, "", 0);
		
	}

}
