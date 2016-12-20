/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionBDD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author vengatus
 */
public class Conexionn {

    Connection conexion;

    public Conexionn() {
        //conexion=null;
        try {

            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://127.0.0.1:5444/edb", "enterprisedb",
                    "admin");
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
        }        

    }
    
    public String consultar(String tabla) {
        String n = "";
        try {
            Statement comando = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String sql = "SELECT count(*) FROM " + tabla + ";";
            ResultSet resultado = comando.executeQuery(sql);
            while (resultado.next()) {
                n = resultado.getString("count");
            }
            resultado.close();
            comando.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    public void insertar(String sql) {
        try {
            Statement comando = conexion.createStatement();
            comando.executeUpdate(sql);
            comando.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
     public void ddl(String sql) {
         String n = "";
        try {
            Statement comando = conexion.createStatement();
            ResultSet resultado = comando.executeQuery(sql);
            while (resultado.next()) {
                System.out.println(resultado.getRow());
            }            
            resultado.close();
            comando.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
