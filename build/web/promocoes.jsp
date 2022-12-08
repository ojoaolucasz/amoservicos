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
        <div style="padding-top: 5px;">
        <jsp:include page="includes/statuserros.jsp" />
       </div>
        <h2 style="text-align: center; padding-top: 5px;">Promoções:</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4" style="padding-top: 10px; margin-right: 0px;">
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
                rs = st.executeQuery("SELECT * FROM promocoes ORDER BY id ASC");
                while(rs.next()){
                %>
                                <div class="col-md-3">
                                    <div class="card" style="width: 18rem;">
                                        <img src="images/<%=rs.getString("cardpromocional")%>" class="card-img-top" alt="..." width="286px" height="180px">
                                        <div class="card-body">
                                          <h5 class="card-title"><%=rs.getString("titulo")%></h5>
                                          <p class="card-text"><%=rs.getString("descricao")%></p>
                                          <a href="promocaodetalhes.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary">Comprar</a>
                                        </div>
                                      </div>
                                 </div>
                                 
        <%
            }
            } catch(Exception e){
                out.println(e);
            }
        %>
           </div>
    </body>
</html>
