<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Configurações</div>
                            <a class="nav-link" href="empresasAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-building-user"></i></div>
                                Empresas
                            </a>
                            <a class="nav-link" href="usuariosAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-people-group"></i></div>
                                Usuários
                            </a>
                            <a class="nav-link" href="promocoesAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-money-bills"></i></div>
                                Promoções
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <%
                            String nomeAdmin = (String) session.getAttribute("nomeAdmin");
                            out.print(nomeAdmin);
                        %>
                    </div>
                </nav>
</div>