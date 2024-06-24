package APLICACIONES;

import CLASES.CTIsosceles;
//
public class apliIs {

    public static void main(String[] args) {
        CTIsosceles x = new CTIsosceles(20,15);
        // x.setL1(20); 
        //x.setL2(15);
        x.Area();
        System.out.println("Triangulo Isosceles");
        System.out.println("Base: " + x.getL2());
        System.out.println("Area: " + x.getArea());//

    }
}
