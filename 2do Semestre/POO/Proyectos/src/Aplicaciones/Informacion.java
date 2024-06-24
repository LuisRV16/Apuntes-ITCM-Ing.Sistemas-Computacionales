package Aplicaciones;
//@Author Luis Ricardo Reyes Villar
import Clases.CLibro;
public class Informacion {
    public static void main(String[] args) {
        CLibro libro1=new CLibro();
        libro1.setNombre("Bajo la misma estrella");
        libro1.setAutor("John Green");
        libro1.setFecha("10 de Enero de 2012");
        libro1.setNumPag(253);
        System.out.println("Datos del Primer Libro: ");
        System.out.println(libro1);
        CLibro libro2=new CLibro();
        libro2.setNombre("Alicia en el país de las maravillas");
        libro2.setAutor("Lewis Carroll");
        libro2.setFecha("26 de Noviembre de 1865");
        libro2.setNumPag(124);
        System.out.println("\nDatos del Segundo Libro: ");
        System.out.println(libro2);
    }
    
}
