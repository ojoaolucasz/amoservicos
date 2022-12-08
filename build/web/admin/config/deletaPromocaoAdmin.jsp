<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        
                        String url = "jdbc:postgresql://localhost:5432/amoservicos";
                        String usuario = "postgres";
                        String senhaBD = "admin";
                        
                        if(request.getParameter("funcao")!= null && request.getParameter("funcao").equals("excluir")){
                            String id = request.getParameter("id");
                            try{
                                Class.forName("org.postgresql.Driver");
                                con = DriverManager.getConnection(url,usuario,senhaBD);
                                st = con.createStatement();
                                st.executeUpdate("DELETE from promocoes WHERE id = '"+id+"' ");
                                response.sendRedirect("../promocoesAdmin.jsp?status=8");
                            }catch(Exception e){
                                out.println(e);
                            }
                        }
                    %>     