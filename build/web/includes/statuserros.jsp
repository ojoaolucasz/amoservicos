<%
    if(request.getParameter("status") != null && request.getParameter("status").equals("1")){
        %>
        <div class="alert alert-info" role="alert">
            Cadastro Realizado Com Sucesso!
        </div>
        <%
    }
    if (request.getParameter("erro") != null && request.getParameter("erro").equals("1")){
    %>
        <div class="alert alert-danger" role="alert">
            Preencha Todos Os Dados Para Continuar!
        </div>
    <%
    }
    if (request.getParameter("status") != null && request.getParameter("status").equals("2")){
    %>
        <div class="alert alert-info" role="alert" data-bs-autohide="true">
            Sessão Encerrada Com Sucesso!
        </div>
    <%
} 
    if(request.getParameter("erro") != null && request.getParameter("erro").equals("2")){
    %>
        <div class="alert alert-danger" role="alert">
            Email e/ou Senha Incorretos!
        </div>
<%
}
    if(request.getParameter("status") != null && request.getParameter("status").equals("3")){
    %>
        <div class="alert alert-info" role="alert" data-bs-autohide="true">
            Empresa Cadastrada Com Sucesso!
        </div>
<%
}
    if(request.getParameter("erro") != null && request.getParameter("erro").equals("3")){
    %>
        <div class="alert alert-danger" role="alert">
            Cnpj e/ou Senha Estão Vazios!
        </div>
    <%
}
    if(request.getParameter("status") != null && request.getParameter("status").equals("4")){
        %>
            <div class="alert alert-info" role="alert" data-bs-autohide="true">
                Logado Com Sucesso!
            </div>
    <%
}
    if(request.getParameter("erro") != null && request.getParameter("erro").equals("4")){
        %>
            <div class="alert alert-danger" role="alert">
                Cnpj e/ou Senha Estão Incorretos!
            </div>
        <%
    }
    if(request.getParameter("status") != null && request.getParameter("status").equals("5")){
            %>
                <div class="alert alert-info" role="alert" data-bs-autohide="true">
                    Logado Com Sucesso!
                </div>
        <%
    }
    if(request.getParameter("erro") != null && request.getParameter("erro").equals("5")){
        %>
            <div class="alert alert-danger" role="alert">
                Você Precisa Estar Logado Para Acessar Essa Página!
            </div>
        <%
    }
    if(request.getParameter("status") != null && request.getParameter("status").equals("6")){
            %>
                <div class="alert alert-info" role="alert" data-bs-autohide="true">
                    Promoção Cadastrada Com Sucesso!
                </div>
        <%
    }
    if(request.getParameter("status") != null && request.getParameter("status").equals("7")){
            %>
                <div class="alert alert-info" role="alert" data-bs-autohide="true">
                    Dados Atualizados Com Sucesso!
                </div>
        <%
    }
    if(request.getParameter("status") != null && request.getParameter("status").equals("8")){
            %>
                <div class="alert alert-warning" role="alert" data-bs-autohide="true">
                    Deletado Com Sucesso!
                </div>
        <%
    }
    if(request.getParameter("status") != null && request.getParameter("status").equals("9")){
            %>
                <div class="alert alert-warning" role="alert" data-bs-autohide="true">
                    Compra Efetuada Com Sucesso!
                </div>
        <%
    }
%>