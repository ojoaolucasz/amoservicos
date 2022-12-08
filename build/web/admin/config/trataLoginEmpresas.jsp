<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String cnpj = request.getParameter("cnpj");
    String senha = request.getParameter("senha");
    String usuario = "";
    String nomeEmpresa = "";
    String pass = "";
    String area = "";
    String id = "";
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/amoservicos";
    String user = "postgres";
    String senhaBD = "admin";
    
    if(cnpj == "" && senha == ""){
    response.sendRedirect("../../loginEmpresas.jsp?erro=3"); 
} else {
    try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM empresas WHERE cnpj = '"+cnpj+"' AND senha = '"+senha+"'");
            
            while(rs.next()){
                usuario = rs.getString("cnpj");
                nomeEmpresa = rs.getString("nome");
                area = rs.getString("especialidade");
                id = rs.getString("id");
                pass = rs.getString("senha");
            }
        } catch(Exception e){
            out.println(e);
        }
        
    if(cnpj.equals(usuario) && senha.equals(pass)){
        session.setAttribute("nomeEmpresa", nomeEmpresa);
        session.setAttribute("especialidade", area);
        session.setAttribute("id", id);
        response.sendRedirect("../../homeEmpresas.jsp?status=5");
    } else {
        response.sendRedirect("../../loginEmpresas.jsp?erro=4");
    }
    }
    
%>