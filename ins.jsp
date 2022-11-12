<%@ page import = "java.sql.*" contentType = "text/html; charset=utf-8" %>

<%
Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/edu?" +
							"useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
		String dbUser = "root";
		String dbPass = "12345678";
		
		String query = "insert into mem_info(mem_name, mem_tel, mem_birth) values(?, ?, ?)";
		
		// Create DB Connection 
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// Create Statement 
        for (int i = 0; i < 100; i++) {
            stmt = conn.prepareStatement(query);
            stmt.setString(1, "name" + Integer.toString(i));
            stmt.setString(2, "010-1234-5678");
            stmt.setString(3, "1999-09-09");
            stmt.executeUpdate();
        }
        
		// Run Qeury
		
		
		// Print Result (Run by Query) 
		//while(rs.next()) {
//			out.println("<tr>");
//			out.println("<td>"+rs.getString("mem_name") +"</td>");
//			out.println("<td>"+rs.getString("mem_tel")+"</td>");
//			out.println("<td>"+rs.getString("mem_birth")+"</td>");
//			out.println("</tr>");
//		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// Close Statement 
		//if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// Close Connection
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>