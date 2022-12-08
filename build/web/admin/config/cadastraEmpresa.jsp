<%@page import= "util.Upload"%>
<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    Upload up = new Upload();
    
    up.setFolderUpload("images");
    
    if(up.formProcess(getServletContext(), request)){
        String nome = up.getForm().get("nome").toString();
        String email = up.getForm().get("email").toString();
        String telefone = up.getForm().get("telefone").toString();
        String endereco = up.getForm().get("end").toString();
        String cnpj = up.getForm().get("cnpj").toString();
        String especialidade = up.getForm().get("area").toString();
        String logo = up.getFiles().get(0);
        String site = up.getForm().get("site").toString();
        String senha = up.getForm().get("senha").toString();
        
        String url = "jdbc:postgresql://localhost:5432/amoservicos";
        String user = "postgres";
        String senhaBD = "admin";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO public.empresas(nome, email, telefone, endereco, cnpj, especialidade, logo, siteempresa, senha) VALUES ('"+nome+"', '"+email+"', '"+telefone+"', '"+endereco+"', '"+cnpj+"', '"+especialidade+"', '"+logo+"', '"+site+"', '"+senha+"');");
            response.sendRedirect("../../loginEmpresas.jsp?status=3");
        } catch(Exception e){
            out.println(e);
    }
    }
%>