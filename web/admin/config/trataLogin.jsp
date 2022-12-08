<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String usuario = "";
    String nomeUsuario = "";
    String pass = "";
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/amoservicos";
    String user = "postgres";
    String senhaBD = "admin";
    
    if(email == "" && senha == ""){
    response.sendRedirect("../../login.jsp?erro=1"); 
} else {
    try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+email+"' AND senha = '"+senha+"'");
            
            while(rs.next()){
                usuario = rs.getString("email");
                nomeUsuario = rs.getString("nome");
                pass = rs.getString("senha");
            }
        } catch(Exception e){
            out.println(e);
        }
        
    if(email.equals(usuario) && senha.equals(pass)){
        session.setAttribute("nomeUsuario", nomeUsuario);
        response.sendRedirect("../../index.jsp?status=4");
    } else {
        response.sendRedirect("../../login.jsp?erro=2");
    }
    }
    
%>