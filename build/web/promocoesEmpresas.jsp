<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promoções Cadastradas</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="includes/navBarEmpresas.jsp" />
        <div style="padding-top: 5px;">
        <jsp:include page="includes/statuserros.jsp" />
        </div>
        <div style="text-align: center; padding-top: 5px;"><h3>Promoções Cadastradas:</h3></div>
        <div class="row row-cols-1 row-cols-md-4 g-4" style="padding-top: 10px; margin-right: 0px;">
        <%
            String empresa = (String) session.getAttribute("nomeEmpresa");
            if(empresa == null){
                response.sendRedirect("loginEmpresas.jsp?erro=5");
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
                    rs = st.executeQuery("SELECT * FROM promocoes WHERE empresa = '"+empresa+"'");
                    while(rs.next()){
                    String id = rs.getString("id");
                        %>
                                <div class="col-md-3">
                                    <div class="card" style="width: 18rem;">
                                        <img src="images/<%=rs.getString("cardpromocional")%>" class="card-img-top" alt="..." width="286px" height="180px">
                                        <div class="card-body">
                                          <h5 class="card-title"><%=rs.getString("titulo")%></h5>
                                          <p class="card-text"><%=rs.getString("descricao")%></p>
                                          <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#detalhes">Mais Detalhes</button>
                                          <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deletar">Deletar</button>
                                        </div>
                                      </div>
                                </div>                      
                        <!-- Modal -->
                        <div class="modal fade" id="detalhes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel"><%=rs.getString("titulo")%></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <form class="row g-3" action="admin/config/editaPromocoes.jsp?id=<%out.println(id);%>" method="POST">
                                    <div class="col-md-12">
                                         <label class="form-label">Titulo:</label>
                                         <input type="text" class="form-control" name="titulo" value="<%=rs.getString("titulo")%>" placeholder="Promocao 2 por 1!">
                                       </div>
                                       <div class="col-md-6">
                                         <label class="form-label">Preço:</label>
                                         <input type="text" class="form-control" name="preco" value="<%=rs.getString("preco")%>" placeholder="9.99 (Apenas Números!)">  
                                       </div>
                                     <div class="col-md-6">
                                       <label class="form-label">unidades disponíveis:</label>
                                         <input type="text" class="form-control" name="und" value="<%=rs.getString("computar")%>" placeholder="10 (Apenas Números Inteiros!)">
                                       </div>
                                    <div class="col-12">
                                         <label class="form-label">Descricao:</label>
                                         <input type="text" class="form-control" name="desc" value="<%=rs.getString("descricao")%>" placeholder="Compre 1 produto/serviço Exemplo e receba o 2º grátis!">                        
                                       </div>
                                       <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Salvar Mudanças</button>
                              </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                                       
                        <!-- Modal Excluir-->              
                        <div class="modal fade" id="deletar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir Promoção></h1>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Tem Certeza Que Deseja excluir a promção "<%=rs.getString("titulo")%>", (de id <%=rs.getString("id")%>) permanentemente?</p>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                  <a href="promocoesEmpresas.jsp?funcao=excluir&id=<%=rs.getString("id")%>" class="btn btn-danger">Excluir</a>
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
        </div>
        <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:postgresql://localhost:5432/amoservicos";
                String usuario = "postgres";
                String senhaBD = "admin";
                
           if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")){
            String id = request.getParameter("id");
            try{
               Class.forName("org.postgresql.Driver");
               con = DriverManager.getConnection(url, usuario, senhaBD);
               st = con.createStatement();
               st.executeUpdate("DELETE FROM promocoes WHERE id = '"+id+"'");
               response.sendRedirect("promocoesEmpresas.jsp?status=8");
            } catch(Exception e){
                out.println(e);
            }
               
            } 
        %>
    </body>
</html>
