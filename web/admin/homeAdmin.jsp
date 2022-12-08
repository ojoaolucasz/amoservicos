<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Painel Admin</title>
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
                <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            
            String url = "jdbc:postgresql://localhost:5432/amoservicos";
            String usuario = "postgres";
            String senhaBD = "admin";
            
            try{
                String id = (String) session.getAttribute("id");
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, usuario, senhaBD);
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM public.admin WHERE id = '"+id+"';");
                 while(rs.next()){
                 String idEditar = rs.getString("id");
       
                    %>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Seja Bem Vindo(a) de volta, <%=rs.getString("nome")%>!</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Painel Admin</li>
                        </ol>
                    </div>
                        <div class="d-flex justify-content-center">
                            <div class="row">
                                <div class="col-md-6">
                                    <img src="../images/<%=rs.getString("perfil")%>" class="img-fluid" alt="..." style="border: 2px solid black; border-radius: 10px;">
                                </div>
                                <div class="col-md-6">
                                    <div class="card" style="width: 18rem;">
                                        <div class="card-header">
                                           Meus Dados <a href="" class="text-info" data-bs-toggle="modal" data-bs-target="#modalEditar<%out.print(id);%>"><i class="fa fa-pencil-square"></i></a>
                                        </div>
                                        <ul class="list-group list-group-flush">
                                          <li class="list-group-item"><h6>Nome:</h6> <%=rs.getString("nome")%></li>
                                          <li class="list-group-item"><h6>Email:</h6> <%=rs.getString("email")%></li>
                                          <li class="list-group-item"><h6>Cpf:</h6> <%=rs.getString("cpf")%></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>                           
                        </div>                       
                </main>    
                                        <!-- Modal Editar -->
                                                    <div class="modal fade" id="modalEditar<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <h1 class="modal-title fs-5" id="exampleModalLabel">Editar usuário</h1>
                                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <form action="config/editarAdmin.jsp?id=<%out.print(id);%>" method="POST"> 
                                                          <div class="modal-body">
                                                                  <div class="mb-3">
                                                                    <label for="exampleFormControlInput1" class="form-label">Nome:</label>
                                                                    <input type="text" name="nome" value="<%=rs.getString("nome")%>" class="form-control" id="exampleFormControlInput1" placeholder="Nome">
                                                                  </div>
                                                                  <div class="mb-3">
                                                                    <label for="exampleFormControlInput1" class="form-label">Email:</label>
                                                                    <input type="email" name="email" value="<%= rs.getString("email") %>" class="form-control" id="exampleFormControlInput1" placeholder="Email">
                                                                  </div>
                                                                  <div class="mb-3">
                                                                    <label for="exampleFormControlInput1" class="form-label">Cpf:</label>
                                                                    <input type="text" name="cpf" value="<%= rs.getString("cpf") %>" class="form-control" id="exampleFormControlInput1" placeholder="Telefone (00)0000-0000">
                                                                  </div>
                                                                  <div class="mb-3">
                                                                    <label for="exampleFormControlInput1" class="form-label">Senha:</label>
                                                                    <input type="password" name="senha" value="<%= rs.getString("senha") %>" class="form-control" id="exampleFormControlInput1" placeholder="Senha">
                                                                  </div>            
                                                          </div>
                                                          <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                            <button type="submit" class="btn btn-primary">Editar</button>
                                                          </div>
                                                      </form>
                                                      </div>
                                                    </div>
                                                    </div>
                                                <!-- Final Modal Editar -->
                 <%
                     }
            } catch(Exception e){
                out.println(e);
            }  
}
            %>  
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
