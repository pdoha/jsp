package com.momo.comtroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.JobDao;
import com.momo.dto.Job;

/**
 * 사용자가 /JobList 경로를 요청하면
 * 요청 url에 매핑된 서블릿이 실행
 * 
 *  요청 전달된 메서드에 의해 실행될 메서드가 결정된다
 * -사용자가 지정하지 않는 경우 get방식 
 * -링크를 클릭했을때, 주소창에서 직접 입력했을때
 * get방식 요청에 대해서는 doGet메서드가 실행되고
 * post방식 요청에 대해서는 doPost메서드가 실행된다.
 * 
 * 해당 요청방식이 구현되어 있는 않는경우, 오류가 발생
 */
@WebServlet("/JobList")
public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListController() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     *1.  DB로부터 직급목록을 조회 
     *2. 화면에 직급목룍(list) 출력 - JobDao 에 getList()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//생성하고 application 넣어줘야하는데
		//application객체는 request에서 꺼내올수있다
		//jsp에서 사용하는 내장객체 request는 서블릿에서 사용할때 request.getServletContext()
		
		JobDao jobDao = new JobDao(request.getServletContext());
		//이 객체를 통해 list조회
		List<Job> list = jobDao.getList();
		//찍어보자 확인겸
		System.out.println("===============jobList");
		System.out.println(list);
		//조회했으면 담자, 반환타입 int
		request.setAttribute("list",list );
//		콘솔에 출력하는 것보다 화면에 출력하는 것이 더 좋다
//
//		**view 페이지 따로
//
//		→ 화면전환 forward
		//"jobList.jsp"경로로 갈거야 요청은 컨트롤러가 받는데 요청을 보여주는건 jsp
		request.getRequestDispatcher("jobList.jsp").forward(request, response);
		//경로는 webapp
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
