<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Dados</title>
         <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="includes/navBarEmpresas.jsp" />
        <div style="padding-top: 5px;">
            <jsp:include page="includes/statuserros.jsp" />
        </div>
        <%
            String empresa = (String) session.getAttribute("nomeEmpresa");
            if(empresa == null){
                response.sendRedirect("loginEmpresas.jsp?error=5");
            } else {
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
                rs = st.executeQuery("SELECT * FROM empresas WHERE nome='"+empresa+"'");
                while(rs.next()){
                String id = rs.getString("id");
                %>
                 <h1 style="text-align: center; box-sizing: border-box; padding-top: 10px;">Editar Dados Da Empresa:</h1>
        <div class="cadastro">
            <form class="row g-3" action="admin/config/atualizaEmpresa.jsp?id=<%out.println(id);%>" method="POST" style="padding: 5px;">
                       <div class="col-md-6">
                            <label class="form-label">Nome:</label>
                            <input type="text" class="form-control" name="nome" value="<%=rs.getString("nome")%>">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Email:</label>
                            <input type="email" class="form-control" name="email" value="<%=rs.getString("email")%>" >
                          </div>
                          <div class="col-12">
                            <label class="form-label">Endereço:</label>
                            <input type="text" class="form-control" name="end" value="<%=rs.getString("endereco")%>" >                          
                          </div>
                          <div class="col-6">
                            <label class="form-label">Telefone:</label>
                            <input type="text" class="form-control" name="telefone" value="<%=rs.getString("telefone")%>" >

                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Cnpj:</label>
                            <input type="text" class="form-control" name="cnpj" value="<%=rs.getString("cnpj")%>" >
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Senha</label>
                            <input type="password" class="form-control" name="senha">
                          </div>
                            <div class="col-md-6">
                            <label class="form-label">Site Oficial Da Empresa:</label>
                            <input type="text" class="form-control" name="site" value="<%=rs.getString("siteempresa")%>" >
                          </div>
                          <div class="col-12" style="text-align: center; padding-bottom: 2px;">
                            <button type="submit" class="btn btn-primary">Atualizar</button>
                          </div>
                   </form>
        </div>
        <%
            }
            } catch(Exception e){
                out.println(e);
            }
}
        %>
       
       
    </body>
</html>
