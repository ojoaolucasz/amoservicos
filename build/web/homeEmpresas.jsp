<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Empresas</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="includes/navBarEmpresas.jsp" />
        <%
            String empresa = (String) session.getAttribute("nomeEmpresa");
            String id = (String) session.getAttribute("id");    
            if(empresa == null){
                response.sendRedirect("loginEmpresas.jsp?erro=5");
            } else {
        %>
        <div style="padding-top: 5px;">
        <jsp:include page="includes/statuserros.jsp" />
        </div> 
        <div class="d-flex justify-content-center" style="padding-top: 15px;">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <a href="promocoesEmpresas.jsp" style="text-decoration: none; color: black;"><img src="images/icons/cadastrePromocoes.png" class="card-img-top" alt="cifrao">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Checar Suas Promoções</h5>
                            </div></a>       
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <a href="editarDados.jsp" style="text-decoration: none; color: black;"><img src="images/icons/editarDados.png" class="card-img-top" alt="cifrao">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Editar Dados</h5>
                            </div></a>       
                    </div>
                </div>
                

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <a href="#" data-bs-toggle="modal" data-bs-target="#excluirEmpresa" style="text-decoration: none; color: black;"><img src="images/icons/excluir.png" class="card-img-top" alt="cifrao">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Excluir Conta</h5>
                            </div></a>       
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="excluirEmpresa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tem Certeza Que Deseja Excluir Sua Conta?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <p>A conta da empresa <%out.println(empresa);%> será excluida permanentemente, tem certeza que deseja prosseguir?</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                    <a href="homeEmpresas.jsp?funcao=excluir&id=<%out.println(id);%>" class="btn btn-danger">Excluir</a>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:postgresql://localhost:5432/amoservicos";
                String usuario = "postgres";
                String senhaBD = "admin";
           if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")){
                String idexcluir = request.getParameter("id");
            try{
               Class.forName("org.postgresql.Driver");
               con = DriverManager.getConnection(url, usuario, senhaBD);
               st = con.createStatement();
               st.executeUpdate("DELETE FROM empresas WHERE id = '"+idexcluir+"'");
               response.sendRedirect("loginEmpresas.jsp?status=8");
            } catch(Exception e){
                out.println(e);
            }
               
            } 
            }
        %>
    </body>
</html>
