<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head><title>Member List</title></head>
<body>

MEMBMER Table Contents
<table width="100%" border="1">
<tr>
	<td>Name</td><td>ID</td><td>E-Mail</td>

<%
	// MySQL JDBC Driver Loading
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/sinsa?" +
							"useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
		String dbUser = "root";
		String dbPass = "sinsa01";
		
		String query = "select * from mem_info";
		
		// Create DB Connection 
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// Create Statement 
		stmt = conn.prepareStatement(query);
		
		// Run Qeury
		rs = stmt.executeQuery();
		
		// Print Result (Run by Query) 
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>"+rs.getString("mem_name") +"</td>");
			out.println("<td>"+rs.getString("mem_tel")+"</td>");
			out.println("<td>"+rs.getString("mem_birth")+"</td>");
			out.println("</tr>");
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// Close Statement 
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// Close Connection
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</tr>
</table>

</body>
</html>
