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
        String titulo = up.getForm().get("titulo").toString();
        Float preco = Float.parseFloat(up.getForm().get("preco").toString());
        String descricao = up.getForm().get("desc").toString();
        String img = up.getFiles().get(0);
        Integer und = Integer.parseInt(up.getForm().get("und").toString());
        
        
        String url = "jdbc:postgresql://localhost:5432/amoservicos";
        String user = "postgres";
        String senhaBD = "admin";
        
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, senhaBD);
            st = con.createStatement();
            String empresa = (String) session.getAttribute("nomeEmpresa");
            String especialidade = (String) session.getAttribute("especialidade");
            st.execute("INSERT INTO public.promocoes(titulo, descricao, preco, cardpromocional, empresa, especialidade, computar) VALUES ('"+titulo+"', '"+descricao+"', '"+preco+"', '"+img+"', '"+empresa+"', '"+especialidade+"', '"+und+"');");
            response.sendRedirect("../../homeEmpresas.jsp?status=6");
        } catch(Exception e){
            out.println(e);
        }
    }
%>