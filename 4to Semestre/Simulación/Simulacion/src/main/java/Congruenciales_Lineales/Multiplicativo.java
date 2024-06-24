package Congruenciales_Lineales;
public class Multiplicativo extends AlgLiMul {
    public Multiplicativo(){
        c=0;
    }
    public Multiplicativo(int xi, int k, int g){
        super(xi,k,g);
        calMod();
        c=0;
    }
    @Override
    public void calA() {
        a = 3 + 8 * k;
    }
    
    @Override
    public int periodoV(){
        return (int) Math.pow(2, g-2);
    }
}
