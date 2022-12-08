<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Promoções</title>
        <link rel="icon" href="images/icons/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
         <jsp:include page="includes/navBarEmpresas.jsp" />
         <div><h6 style="text-align: center; padding-top: 10px; font-size: 20pt;">Cadastro De Promoções:</h6></div>
         <div class="cadastro">
                   <form class="row g-3" action="admin/config/cadastraPromocao.jsp" method="POST" enctype="multipart/form-data" style="padding: 5px;">
                       <div class="col-md-6">
                            <label class="form-label">Titulo:</label>
                            <input type="text" class="form-control" name="titulo" placeholder="Promocao 2 por 1!">
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Preço:</label>
                            <input type="text" class="form-control" name="preco" placeholder="9.99 (Apenas Números!)">  
                          </div>
                          <div class="col-12">
                            <label class="form-label">Descricao:</label>
                            <input type="text" class="form-control" name="desc" placeholder="Compre 1 produto/serviço Exemplo e receba o 2º grátis!">                        
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Card Promocional (286x180px):</label>
                            <input type="file" class="form-control" name="files[]" multiple/>
                          </div>
                            <div class="col-md-6">
                            <label class="form-label">Digite o número de unidades disponíveis:</label>
                            <input type="text" class="form-control" name="und" placeholder="10 (Apenas Números Inteiros!)">
                          </div>
                          <div class="col-12" style="text-align: center; padding-bottom: 2px;">
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                          </div>
                   </form>
         </div>
    </body>
</html>
