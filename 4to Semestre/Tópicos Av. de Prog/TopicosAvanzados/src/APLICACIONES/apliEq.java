package APLICACIONES;

import CLASES.CTEquilatero;

public class apliEq{

    public static void main(String[] args) {

        CTEquilatero x = new CTEquilatero(20);
        // x.setL1(20);
        x.Area();
        System.out.println("Triangulo Equilatero");
        System.out.println("Base: " + x.getL1());
        System.out.println("Area: " + x.getArea());// 
    }
}
