<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Painel Admin- Usuários</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%
         String nomeAdmin = (String) session.getAttribute("nomeAdmin");
            if(nomeAdmin == null ){
                response.sendRedirect("loginAdmin.jsp?erro=5");
            } else {
        %>
        <jsp:include page="include/nav.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="include/sidenav.jsp" />
            <div id="layoutSidenav_content">
                <jsp:include page="include/status.jsp" />
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Usuários</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Gerenciar Usuários</li>
                        </ol>
                    </div>
                    <div class="container-fluid px-4">
                    <table class="table table-bordered border-primary">
                        <thead>
                          <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Email</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">Cpf</th>
                            <th scope="col">Foto De Perfil</th>
                            <th scope="col">Ações</th>
                          </tr>
                        </thead>
                        
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
                rs = st.executeQuery("SELECT * FROM public.usuarios");
                 while(rs.next()){
                 String id = rs.getString("id");
       
                    %>            
                          <tr>
                            <th scope="row"><%=rs.getString("id")%></th>
                            <td><%=rs.getString("nome")%></td>
                            <td><%=rs.getString("email")%></td>
                            <td><%=rs.getString("telefone")%></td>
                            <td><%=rs.getString("cpf")%></td>
                            <td class="d-flex justify-content-center"><img src="../images/<%=rs.getString("fotoperfil")%>" alt="alt" width="50px" height="50px"/></td>
                            <td>
                                <a href="" class="text-info" data-bs-toggle="modal" data-bs-target="#modalEditar<% out.print(id) ; %>" ><i class="fa fa-pencil-square"></i></a>
                                <a href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<% out.print(id); %>" ><i class="fa fa-trash"></i></a>
                            </td>
                          </tr>
                          <!-- Modal Editar -->
                                            <div class="modal fade" id="modalEditar<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                              <div class="modal-dialog">
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar usuário</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                  </div>
                                                  <div class="modal-body">
                                                      <form class="row g-3" action="config/editarUserAdmin.jsp?id=<%out.println(id);%>" method="POST">
                                                            <div class="col-12">
                                                                <label class="form-label">Nome:</label>
                                                                <input type="text" class="form-control" name="nome" value="<%=rs.getString("nome")%>">
                                                            </div>
                                                            <div class="col-12">
                                                                <label class="form-label">Email:</label>
                                                                <input type="email" class="form-control" name="email" value="<%=rs.getString("email")%>" >
                                                            </div>
                                                            <div class="col-12">
                                                                <label class="form-label">Telefone:</label>
                                                                <input type="text" class="form-control" name="telefone" value="<%=rs.getString("telefone")%>" >
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label class="form-label">Cpf:</label>
                                                                <input type="text" class="form-control" name="cpf" value="<%=rs.getString("cpf")%>" >
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-primary">Salvar</button>
                                                            </div>
                                                      </form>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                        
                          <!-- Modal Excluir -->
                                            <div class="modal fade" id="exampleModal<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                              <div class="modal-dialog">
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir usuário</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                  </div>
                                                  <div class="modal-body">
                                                    Tem certeza que deseja excluir <%=rs.getString("nome")%> ??
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <a href="config/deletaUsuarioAdmin.jsp?funcao=excluir&id=<%=rs.getString("id")%>" class="btn btn-danger">Excluir</a>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                   <%
                     }
            } catch(Exception e){
                out.println(e);
            }  
}
            %>  
            
                    </table>
            </div>
                </main>    
                <jsp:include page="include/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
