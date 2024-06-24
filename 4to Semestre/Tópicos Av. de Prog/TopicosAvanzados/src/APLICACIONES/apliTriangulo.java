package APLICACIONES;

import CLASES.CTriangulo;

public class apliTriangulo {

    public static void main(String[] args) {
        CTriangulo T=new CTriangulo();
        T.setVertices(0,0,30,0,0,40);
        T.cAB();
        T.cBC();
        T.cAC();
        T.Perimetro();
        T.Area();
        System.out.println(T);
    }
    
}
