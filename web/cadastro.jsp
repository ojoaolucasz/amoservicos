<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
         <jsp:include page="includes/barraNavegacao.jsp" />
         <div><h6 style="text-align: center; padding-top: 10px; font-size: 20pt;">Cadastro De Clientes:</h6></div>
         <div class="cadastro">
                   <form class="row g-3" action="admin/config/cadastraClientes.jsp" method="POST" enctype="multipart/form-data" style="padding: 5px;">
                       <div class="col-md-6">
                            <label class="form-label">Nome:</label>
                            <input type="text" class="form-control" name="nome" placeholder="Fulano Da Silva">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Email:</label>
                            <input type="email" class="form-control" name="email" placeholder="Fulano@email.com">
                          </div>
                          <div class="col-12">
                            <label class="form-label">Endereço:</label>
                            <input type="text" class="form-control" name="end" placeholder="R: Alameda das Travessas, 111 - Bairro dos Barris">
                          </div>
                          <div class="col-6">
                            <label class="form-label">Telefone:</label>
                            <input type="text" class="form-control" name="telefone" placeholder="(01)23456-7890">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Cpf:</label>
                            <input type="text" class="form-control" name="cpf" placeholder="123.456.789-00">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Senha</label>
                            <input type="password" class="form-control" name="senha">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Foto De Perfil:</label>
                            <input type="file" class="form-control" name="files[]" multiple />
                          </div>
                          <div class="col-12" style="text-align: center; padding-bottom: 2px;">
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                          </div>
                   </form>
         </div>
    </body>
</html>
