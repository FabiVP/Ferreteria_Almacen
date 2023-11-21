package Proyecto;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionSQL {

    private static Connection conexion; // Variable para almacenar la conexión

    public static Connection obtenerConexion() {
        if (conexion == null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String connectionURL = "jdbc:sqlserver://DESKTOP-38U017Q\\SQLEXPRESS:1433;databaseName=dbJhaveJire;user=usuarioSQL;password=321";
                conexion = DriverManager.getConnection(connectionURL);
                System.out.println("Se conectó correctamente a la Base de Datos");
            } catch (ClassNotFoundException | SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }
        }
        return conexion;
    }

    public static void cerrarConexion() {
        if (conexion != null) {
            try {
                conexion.close();
                System.out.println("Se cerró la conexión a la Base de Datos");
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }
        }
    }

    public static void main(String[] args) {
        // Ejemplo de cómo obtener y utilizar la conexión en el método main
        Connection con = obtenerConexion();
        
        // Aquí puedes realizar operaciones con la conexión
        
        // Luego, cierra la conexión cuando hayas terminado
        cerrarConexion();
    }

    // Puedes tener otros métodos que utilicen la conexión, por ejemplo:
    public static void ejecutarConsulta(String consulta) throws SQLException {
        Statement st = obtenerConexion().createStatement();
        // Realiza operaciones con el statement, como ejecutar la consulta
        st.execute(consulta);
        // Cierra el statement después de usarlo
        st.close();
    }
}




/*package Proyecto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class ConexionSQL {

   
    public static void main(String[] args)throws ClassNotFoundException, SQLException {
        
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionURL = "jdbc:sqlserver://DESKTOP-38U017Q\\SQLEXPRESS:1433;databaseName=dbJhaveJire;user=usuarioSQL;password=321";
        Connection con = DriverManager.getConnection(connectionURL);
        System.out.println("Se conectó corectamente a la Base de Datos");
        }
        catch (SQLException i)
        {
            JOptionPane.showMessageDialog(null,i);
        }
       
    
    }

 
}*/
