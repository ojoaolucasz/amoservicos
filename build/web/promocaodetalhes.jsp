<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promoções</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="includes/barraNavegacao.jsp" />
        <h2 style="text-align: center; padding-top: 5px;">Promoções:</h2>
        <%
            String id = request.getParameter("id");
            
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
                rs = st.executeQuery("SELECT * FROM public.promocoes WHERE id = '"+id+"'");
                
                while(rs.next()){
                %>
                <div class="d-flex justify-content-center">
                    <div class="row">
                        <div class="col">
                            <img src="images/<%=rs.getString("cardpromocional")%>" class="img-fluid" width="336px" height="230px" style="border: 2px solid black; border-radius: 5px;"/>
                        </div>
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                             <div class="card-body">
                              <h5 class="card-title"><%=rs.getString("titulo")%></h5>
                              <h6 class="card-subtitle mb-2 text-muted">Unidades Disponíveis: <%=rs.getString("computar")%></h6>
                              <p class="card-text"><%=rs.getString("descricao")%></p>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#comprar">Comprar</button>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
                
                <!-- Modal -->
                <div class="modal fade" id="comprar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Comprar Promoção</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                          <p>Deseja Realizar a Compra do Produto "<%=rs.getString("titulo")%>"?</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="admin/config/computarCompra.jsp?funcao=comprar&und=<%=rs.getString("computar")%>&id=<%=rs.getString("id")%>"><button type="button" class="btn btn-primary">Comprar</button></a>
                      </div>
                    </div>
                  </div>
                </div>
            <%
            }
            } catch(Exception e){
                out.println(e);
            }
            
        %>
    </body>
</html>
