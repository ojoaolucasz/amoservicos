<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%
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
        String username = (String) session.getAttribute("nomeEmpresa");  
        rs = st.executeQuery("SELECT logo FROM empresas WHERE nome = '"+username+"'");
        
    } catch(Exception e){
        out.println(e);
    }
    String nomeEmpresa = (String) session.getAttribute("nomeEmpresa");  
%>    
<nav class="navbar navbar-expand-lg" style="background-color: #7DE8B0;">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><img src="images/icons/logo.png" alt="" width="60px" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="cadastroPromocoes.jsp">Cadastre Promo��es</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cadastroPromocoes.jsp">Editar Dados Da Empresa</a>
        </li>
        <li class="nav-item dropdown">
        </li>
        <li class="nav-item">
            <a class="nav-link" href="">Excluir Perfil</a>
        </li>
      </ul>
        <%           
            if(nomeEmpresa == null){%>
                <%response.sendRedirect("loginEmpresas.jsp?erro=5");%>
            <%} else {%>
                <div class="nav-item">
                    <a class="nav-link" href="admin/config/logoff.jsp" style="padding-top:6px; padding-right: 5px; float: left" data-bs-toggle="modal" data-bs-target="#exampleModal"><% out.println(nomeEmpresa); %></a>
            
                    <%
                        while(rs.next()){                       
                        String imagem = rs.getString("logo");  
                    %><img src="images/<%=rs.getString("logo")%>" alt="" width="40px" height="40px" style="border-radius: 20px;">
                </div>
                      <%
                          }
            }%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Seja Bem-vindo(a) de volta!</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              O Que Deseja Fazer?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Continuar Navegando</button>
              <a href="admin/config/logoff.jsp"><button type="button" class="btn btn-primary">Encerrar Sess�o</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</nav>