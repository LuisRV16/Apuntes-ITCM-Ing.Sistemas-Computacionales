package CLASES;
    
    public class CTEquilatero {
        
        protected double L1, area, perimetro;
            public CTEquilatero(){}
            public CTEquilatero(double L1){setL1 (L1);}
        
            public String toString()
            {return "Triangulo Equilatero\n" +
                    "Base: " + L1 + "\nArea:" +
                    area;
                    }

        
    public void setL1(double L1) {this.L1 = L1;
    }
    
    public void Perimetro(){
        perimetro = L1 + L1 + L1;
        
        
    }
    public void Area() {
        double altura = Math.sqrt(L1*L1 - Math.pow(L1 / 2, 2));
        area = L1 * altura;
    }
    
    

    public double getL1(){return L1;}
    public double getArea(){return area;}
    
}        
