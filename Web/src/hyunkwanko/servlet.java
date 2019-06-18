package hyunkwanko;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servlet
 */
@WebServlet("/greeting")
public class servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		response.setContentType("text/html"); PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>\n" + "<html>\n" +
		"<head><title> Hello </title></head>\n" + "<body bgcolor=\"#fdf5e6\">\n" + "<h1>" + "Hi! "+
		"" +request.getParameter("name") + " from "+ request.getParameter("dept") +
		"</h1>\n" +
		"</body></html>");
	}
}
