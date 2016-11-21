package ujs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujs.Info;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		
		Info infoBean=new Info();
	    request.setAttribute("bean", infoBean);
	    
	    String i= request.getParameter("username");
	    String p= request.getParameter("password");
	    
	    infoBean.setId(i);
	    infoBean.setPassword(p);
	    
	 
  	  
	    
	    PrintWriter writer = response.getWriter();
        writer.println("Hello World!"); 
        
        Connection conn=null;
	    Statement stmt=null;
	    String sql=null;
	    ResultSet rs;
	    
	    String p1=null;
		String p2=null;
		
	    try
	    {		
	       
	       Class.forName("com.mysql.jdbc.Driver").newInstance();
	       String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
	       conn= DriverManager.getConnection(url);
	       stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	      
	       sql="select * from tbUser";
	       rs=stmt.executeQuery(sql);
	       writer.println("before while"); 
	       while(rs.next())
	       {
	    	  p1=rs.getString(1);
	    	  p2=rs.getString(2);
	    	  
	    	  writer.println(p1); 
	          writer.println(p2);
	          
	          if(i.equalsIgnoreCase(p1) && p.equalsIgnoreCase(p2))
	          {
	        	  RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
	          	  dispatcher.forward(request, response);
	        	  return;
	          }
	       }

	      response.sendRedirect("login.jsp");
	    }
			catch (java.sql.SQLException e)// 處理資料庫操作錯誤
	        {
	            System.out.println(e.getMessage());	            
	        } 
	        catch (Exception ex)// 除了SQLException以外之錯誤
	        {
	            System.out.println(ex.getMessage());
	        } 
	        finally {      
	        try {
	            if (conn != null)
	                conn.close();
	        } catch (java.sql.SQLException e) {
	        	System.out.println(e.getMessage());
	        }
	       
	        try {
	            if (stmt != null)
	            	stmt.close();
	        } catch (java.sql.SQLException e) {
	        	System.out.println(e.getMessage());
	        }
	        try {
	            if (conn != null)
	            	conn.close();
	        } catch (java.sql.SQLException e) {
	        	System.out.println(e.getMessage());
	        }
	            
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
