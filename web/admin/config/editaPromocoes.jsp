<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String id = request.getParameter("id");
    String titulo = request.getParameter("titulo");
    Float preco = Float.parseFloat(request.getParameter("preco").toString());
    Float unidade = Float.parseFloat(request.getParameter("und").toString());
    String desc = request.getParameter("desc");
    
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
        st.executeUpdate("UPDATE public.promocoes SET titulo='"+titulo+"', descricao='"+desc+"', preco='"+preco+"', computar='"+unidade+"' WHERE id = '"+id+"'");
        response.sendRedirect("../../promocoesEmpresas.jsp?status=7");
    } catch(Exception e){
        out.println(e);
    }
%>