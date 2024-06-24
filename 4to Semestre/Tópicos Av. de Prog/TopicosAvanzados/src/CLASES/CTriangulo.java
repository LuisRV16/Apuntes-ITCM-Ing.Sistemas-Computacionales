package CLASES;

import CLASES.CPunto;

public class CTriangulo {

    private double dAB, dBC, dAC, area, perimetro;
    private CPunto A, B, C;

    //Constructores
    public CTriangulo() {
        A = new CPunto();
        B = new CPunto();
        C = new CPunto();
    }

    public CTriangulo(int x1, int y1, int x2, int y2, int x3, int y3) {
        setVertices(x1, y1, x2, y2, x3, y3);
    }

    //Comportamiento de asignacion
    public void setVertices(int x1, int y1, int x2, int y2, int x3, int y3) {
        A = new CPunto(x1, y1);
        B = new CPunto(x2, y2);
        C = new CPunto(x3, y3);
    }

    //Comportamientos de Proceso o calculo
    public void cAB() {
        int a = B.getX() - A.getX();
        int b = B.getY() - A.getY();
        dAB = Math.sqrt(a * a + b * b);
    }

    public void cBC() {
        int a = B.getX() - C.getX();
        int b = B.getY() - C.getY();
        dBC = Math.sqrt(a * a + b * b);
    }

    public void cAC() {
        int a = A.getX() - C.getX();
        int b = A.getY() - C.getY();
        dAC = Math.sqrt(a * a + b * b);
    }

    public void Perimetro() {
        perimetro = dAB + dBC + dAC;
    }

    public void Area() {
        double S = perimetro / 2;
        area = Math.sqrt(S * (S - dAB) * (S - dBC) * (S - dAC));
    }

    //Comportamientos que devuelven valor
    public double getAB() {
        return dAB;
    }

    public double getBC() {
        return dBC;
    }

    public double getAC() {
        return dAC;
    }

    public double getArea() {
        return area;
    }

    public double getPerimetro() {
        return perimetro;
    }

    @Override
    public String toString() {
        return "dAB= " + dAB + "\ndBC= " + dBC + "\ndAC= " + dAC
                + "\nArea= " + area + "\nPerimetro= " + perimetro;
    }
}
