<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String endereco = request.getParameter("end");
    String telefone = request.getParameter("telefone");
    String cnpj = request.getParameter("cnpj");
    String senha = request.getParameter("senha");
    String site = request.getParameter("site");
    
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
        st.executeUpdate("UPDATE public.empresas SET nome = '"+nome+"', email = '"+email+"', telefone = '"+telefone+"', endereco = '"+endereco+"', cnpj = '"+cnpj+"', siteempresa = '"+site+"', senha = '"+senha+"' WHERE id = '"+id+"'");
        response.sendRedirect("../../editarDados.jsp?status=7");
    } catch(Exception e){
        out.println(e);
    }
%>