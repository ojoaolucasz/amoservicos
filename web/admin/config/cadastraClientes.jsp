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
        String endereco = (String) up.getForm().get("endereco");
        String telefone = up.getForm().get("telefone").toString();
        String cpf = up.getForm().get("cpf").toString();
        String imagem = up.getFiles().get(0);
        String senha = up.getForm().get("senha").toString();
        
        String url = "jdbc:postgresql://localhost:5432/amoservicos";
        String user = "admin";
        String senhaBD = "j0434430";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO public.usuarios(nome, email, endereco, telefone, cpf, fotoperfil, senha) VALUES ('"+nome+"', '"+email+"', '"+endereco+"', '"+telefone+"', '"+cpf+"', '"+imagem+"', '"+senha+"');");
            response.sendRedirect("../../login.jsp?status=1");
        } catch(Exception e){
            out.println(e);
        }
    }
%>