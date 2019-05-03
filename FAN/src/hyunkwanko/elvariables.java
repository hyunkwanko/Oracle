package hyunkwanko;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class elvariables
 */
@WebServlet("/elvariables")
public class elvariables extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public elvariables() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // MVC의 Controller를 만드는 과정
//		Message msg = new Message(); // Bean 객체 사용
//		msg.setCode(5);
//		msg.setMessage("Requset Message");
//		request.setAttribute("msg1", msg);
//		Message msg2 = new Message(); // 세
//		msg2.setCode(7);
//		msg2.setMessage("Session Message");
//		request.getSession().setAttribute("msg1", msg2);

		
//		request.setAttribute("attr1", "EL_value1");
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("attr2", "EL_value2");
//		
//		ServletContext application = request.getServletContext();
//		application.setAttribute("attr3", "EL_value3");
//
//		request.setAttribute("dupname", "value_request");
//		session.setAttribute("dupname", "value_session");
//		application.setAttribute("dupname", "value_application");
		
		
		Name n = new Name("KilDong", "Hong");
		Employee e1 = new Employee(n, new Company("Samsung", "Busan, Korea"));
		request.setAttribute("emp", e1);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/show-elvariables.jsp"); // 이 jsp가 화면 디자인을 보여준다.
		dispatcher.forward(request, response); // 화면을 실행하라.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
