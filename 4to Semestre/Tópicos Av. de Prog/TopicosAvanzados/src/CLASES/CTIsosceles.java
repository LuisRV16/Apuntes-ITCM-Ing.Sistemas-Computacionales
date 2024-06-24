package CLASES;

public class CTIsosceles extends CTEquilatero {

    protected double L2;

    public CTIsosceles() {}
            
        public CTIsosceles(double V1, double V2) {
        super(V1);
        setL2(V2);
    }

    
    public String toString() {
        return "Triangulo Isosceles\n"
                + "Base: " + L1 + L2 + "\nArea:"
                + area;
    }

    public void setL2(double V) {
        this.L2 = V;
    }

    public void Perimetro(){
        perimetro = L2 + L1 + L1;
    }
    
    public void Area() {
        double altura = Math.sqrt(L1 * L1 - Math.pow(L2 / 2, 2));
        area = L1 * altura;
    }
    
    public double getL2() {return L2;
    }

}
