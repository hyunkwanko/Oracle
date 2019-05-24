package hyunkwanko;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray; // 패키지 -> 빌드 패스 -> 라이브러리스 -> jar 파일 추가
import org.json.JSONObject;

/**
 * Servlet implementation class ContactQuery
 */
@WebServlet("/contact-query/*")
public class QueryContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** * @see HttpServlet#HttpServlet() */
	public QueryContact() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Extract ID from the request URL
	 * 
	 * @param request
	 *            Servlet request parameter
	 * @return integer representation of ID in URL
	 */
	private int getId(HttpServletRequest request) {
		String uri = request.getRequestURI();
		System.out.println("PATH:"+uri);
		Pattern reId = Pattern.compile("/contact-query/([0-9]*)");
		Matcher matcher = reId.matcher(uri);
		matcher.find();
		return Integer.parseInt(matcher.group(1));
	}

	/**
	 * Read the content of the HTTP request and convert it into a string
	 * 
	 * @param is
	 * @return String representation of the HTTP request content
	 * @throws IOException
	 *             thrown when any error occurs while I/O operations
	 */
	private String convertInputStreamToString(InputStream is) throws IOException {
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is));
		String line;
		StringBuffer result = new StringBuffer();
		while ((line = bufferedReader.readLine()) != null)
			result.append(line);

		return result.toString();
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doPut");
		int id = getId(request);
		
		this.log("ID: "+id);

		JSONObject obj=null;
		try {
			obj = new JSONObject(convertInputStreamToString(request.getInputStream()));
			System.out.println("Request Body: "+obj.toString());

			System.out.format("(%d, %s, %s, %s, %s)\n", id, obj.getString("NAME"), obj.getString("PHONE"),
					obj.getString("EMAIL"), obj.getString("ADDR"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String sql;
		if (id == 0) {
			sql = "insert into CONTACT values (contact_id.nextval, ?, ?, ?, ?)";
		} else {
			sql = "update CONTACT set NAME=?, PHONE=?, EMAIL=?, ADDR=? where ID=?";
		}		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312097", "201312097");
			PreparedStatement st = conn.prepareStatement(sql);
			

			st.setString(1, obj.getString("NAME"));
			st.setString(2, obj.getString("PHONE"));
			st.setString(3, obj.getString("EMAIL"));
			st.setString(4, obj.getString("ADDR"));
			
			if (id > 0) {
				st.setInt(5,  id);
			}
			
			st.executeUpdate();
			
			conn.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = getId(request);
		
		log("DELETE: ID = "+id);
		
		if (id <= 0) {
			// Illegal parameter
		}
		
		// Delete tuple from CONTACT table

	}

	/**
	 * * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 * * response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doPost");
		
		String content = convertInputStreamToString(request.getInputStream());
		log("CONTENT: "+ content);
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312097", "201312097");
			PreparedStatement st = conn.prepareStatement("select * from contact");
			ResultSet rs = st.executeQuery();
			JSONObject resp = new JSONObject();
			JSONArray arr = new JSONArray();
			while (rs.next()) {
				JSONObject o = new JSONObject();
				o.put("ID", rs.getString("ID"));
				o.put("NAME", rs.getString("NAME"));
				o.put("PHONE", rs.getString("PHONE"));
				o.put("EMAIL", rs.getString("EMAIL"));
				o.put("ADDR", rs.getString("ADDR"));

				arr.put(o);
			}
			rs.close();
			st.close();
			conn.close();
			resp.put("REQ", "SCAN");
			resp.put("CONTACTS", arr);
			PrintWriter out = response.getWriter();
			out.print(resp);
			out.flush();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
