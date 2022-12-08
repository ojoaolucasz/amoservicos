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
        String cpf = up.getForm().get("cpf").toString();
        String perfil = up.getFiles().get(0);
        String senha = up.getForm().get("senha").toString();
        
        String url = "jdbc:postgresql://localhost:5432/amoservicos";
        String user = "postgres";
        String senhaBD = "admin";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO public.admin(nome, email, cpf, perfil, senha) VALUES ('"+nome+"', '"+email+"', '"+cpf+"', '"+perfil+"', '"+senha+"');");
            response.sendRedirect("../loginAdmin.jsp?status=1");
        } catch(Exception e){
            out.println(e);
    }
    }
%>