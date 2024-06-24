package Aplicaciones;
import Clases.CTrapecio;
import java.util.*;
//@author Luis Ricardo Reyes Villar
public class Trapecio {
    public static void main(String[] args) {
        Scanner Dato = new Scanner(System.in);
        CTrapecio T = new CTrapecio();
        int baseMay, baseMen, altura;
        System.out.print("Ingrese el valor para la base mayor: ");
        baseMay = Dato.nextInt();
        System.out.print("Ingrese el valor para la base menor: ");
        baseMen = Dato.nextInt();
        System.out.print("Ingrese el valor para la altura: ");
        altura = Dato.nextInt();
        T.setBaseMayor(baseMay);
        T.setBaseMenor(baseMen);
        T.setAltura(altura);
        T.Area();
        System.out.println("El Area del Trapecio es: "+T.getArea());
    } 
}