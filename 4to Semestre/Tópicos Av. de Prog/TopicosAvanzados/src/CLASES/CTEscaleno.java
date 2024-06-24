package CLASES;

public class CTEscaleno extends CTIsosceles{
    
        protected double L3, S;
        public CTEscaleno() {}
            
        public CTEscaleno(double V1, double V2, double V3) {
        super(V1, V2);
        setL3(V3);}
        
        public String toString()
            {return "Triangulo Escaleno\n" +
                    "Base: " + L1 + L2 + L3 + "\nArea:"+
                    area;
                    }
        
        public void setL3(double V) {
        this.L3 = V;
        }

        public void Perimetro(){
        perimetro = L1 + L2 + L3;
        
        }
        public void Area() {
        S = perimetro / 2;
        area = Math.sqrt(S*(S-L1)*(S-L2)*(S-L3));
        }
        
        public double getL3(){return L3;}
        public double getPerimetro(){return perimetro;}
        public double getArea(){return area;}
}
