<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%
    Float und = Float.parseFloat(request.getParameter("und").toString());
    String id = request.getParameter("id");
    String nome = (String) session.getAttribute("nomeUsuario");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/amoservicos";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    if(nome == null){
        response.sendRedirect("../../login.jsp?erro=5");
    } else {
        if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("comprar")){
         Float undAtualizada = und - 1;
            if(undAtualizada == 0){
            try{
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, usuario, senhaBD);
                st = con.createStatement();
                st.executeUpdate("DELETE FROM public.promocoes WHERE id = '"+id+"'");
                response.sendRedirect("../../promocoes.jsp?status=9");
            }catch(Exception e){
                out.println(e);
            }
        } else {
            try{
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, usuario, senhaBD);
                st = con.createStatement();
                st.executeUpdate("UPDATE public.promocoes SET computar = '"+undAtualizada+"' WHERE id = '"+id+"'");
                response.sendRedirect("../../promocoes.jsp?status=9");
            }catch(Exception e){
                out.println(e);
            }
        }
        }
    }
%>