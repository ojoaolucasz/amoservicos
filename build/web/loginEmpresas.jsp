<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Empresas</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body>
       <jsp:include page="includes/barraNavegacao.jsp" />
       <div style="padding-top: 5px;">
        <jsp:include page="includes/statuserros.jsp" />
        </div> 
       <div class="container-fluid" style="padding-top: 15px;">           
            <form action="admin/config/trataLoginEmpresas.jsp" method="post">
                <div class="mb-3">
                    <label for="text" class="form-label">CNPJ:</label>
                    <input type="text" class="form-control" name="cnpj">
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha:</label>
                    <input type="password" class="form-control" name="senha">
                </div>
                <div class="mb-3 form-check">
                      <p style="float: left;">Não Possui Conta? </p><a href="cadastroEmpresas.jsp"> Cadastre-se!</a>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
