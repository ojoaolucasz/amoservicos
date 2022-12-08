<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/amoservicos";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url, usuario, senhaBD);
        st = con.createStatement();
        st.executeUpdate("UPDATE public.admin SET nome = '"+nome+"', email = '"+email+"', cpf = '"+cpf+"', senha = '"+senha+"' WHERE id = '"+id+"'");
        response.sendRedirect("../homeAdmin.jsp?status=7");
    } catch(Exception e){
        out.println(e);
    }
%>