<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	//String q1="create table users(email varchar(100) primary key, password varchar(100))";
	//st.execute(q1);
	String q2="create table room(id varchar(100) primary key,type varchar(100) not null,capacity varchar(100) not null,price varchar(100) not null,discount varchar(100) not null,netPrice varchar(100) not null,status varchar(100) not null,description varchar(100) not null)";
	st.execute(q2);
	System.out.print("Table created");
	con.close();
}catch(Exception e){
	System.out.print(e);
}

%>