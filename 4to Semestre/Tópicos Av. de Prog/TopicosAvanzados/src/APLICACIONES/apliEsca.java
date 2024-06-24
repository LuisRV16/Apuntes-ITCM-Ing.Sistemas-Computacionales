package APLICACIONES;

import CLASES.CTEscaleno;

public class apliEsca {

    public static void main(String[] args) {
        CTEscaleno x = new CTEscaleno(18,16,9);
        // x.setL1(18); 
        //x.setL2(16);
        //x.setL3(9);
        x.Perimetro();
        x.Area();
        System.out.println("Triangulo Escaleno");
        System.out.println("Base: " + x.getL3());
        System.out.println("Perimetro: " + x.getPerimetro());
        System.out.println("Area:" + x.getArea());//

    }
}