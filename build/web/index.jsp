<%-- 
    Document   : index
    Created on : 25 de nov. de 2022, 21:13:49
    Author     : JOSUE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amo Serviços</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="includes/barraNavegacao.jsp" />
        <div style="padding-top: 5px;">
        <jsp:include page="includes/statuserros.jsp" />
        </div>       
        <div class="mx-auto text-center">
            <img src="images/Banner.png" class="img-fluid" alt="..." style="padding-top: 5px;" width="100%"> 
        </div>
        
        <hr>
        <div class="d-flex justify-content-center">
            <div class="row">
                <div class="col-sm">
                    <a href="encanadores.jsp"><button class="especialidades"><img id="" src="images/icons/faucetIcon.png"><h6 style="font-size: 10pt;">Encanadores</h6></button></a>
                </div>
                <div class="col-sm">
                    <a href="eletricistas.jsp"><button class="especialidades"><img id="" src="images/icons/lightIcon.png"><h6>Eletricistas</h6></button></a>
                </div>
                <div class="col-sm">
                    <a href="pintores.jsp"><button class="especialidades"><img id="" src="images/icons/paintIcon.png"><h6>Pintores</h6></button></a>
                </div>
                <div class="col-sm">
                    <a href="graficas.jsp"><button class="especialidades"><img id="" src="images/icons/printIcon.png"><h6>Gráficas</h6></button></a>
                </div>
                <div class="col-sm">
                    <a href="montadores.jsp"><button class="especialidades"><img id="" src="images/icons/mobIcon.png"><h6 style="font-size: 10pt; padding-top: 2px;">Montadores</h6></button></a>
                </div>
            </div>
        </div>
        
        <div class="d-flex justify-content-center" style="padding-top: 15px;">
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="width: 18rem;">
                        <a href="promocoes.jsp" style="text-decoration: none; color: black;"><img src="images/icons/cifrao.png" class="card-img-top" alt="cifrao">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Promoções</h5>
                            </div></a>       
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="width: 18rem;">
                        <a href="empresas.jsp" style="text-decoration: none; color: black;"><img src="images/icons/empresas.png" class="card-img-top" alt="cifrao">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Empresas</h5>
                            </div></a>       
                    </div>
                </div>
            </div>
        </div>   
    </body>
</html>
