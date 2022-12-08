<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String cpf = request.getParameter("cpf");
    String senha = request.getParameter("senha");
    String usuario = "";
    String nomeAdmin = "";
    String pass = "";
    String id = "";
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/amoservicos";
    String user = "postgres";
    String senhaBD = "admin";
    
    if(cpf == "" && senha == ""){
    response.sendRedirect("../loginAdmin.jsp?erro=1"); 
} else {
    try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM admin WHERE cpf = '"+cpf+"' AND senha = '"+senha+"'");
            
            while(rs.next()){
                usuario = rs.getString("cpf");
                nomeAdmin = rs.getString("nome");
                pass = rs.getString("senha");
                id = rs.getString("id");
            }
        } catch(Exception e){
            out.println(e);
        }
        
    if(cpf.equals(usuario) && senha.equals(pass)){
        session.setAttribute("nomeAdmin", nomeAdmin);
        session.setAttribute("id", id);
        response.sendRedirect("../homeAdmin.jsp?status=4");
    } else {
        response.sendRedirect("../loginAdmin.jsp?erro=2");
    }
    }
    
%>