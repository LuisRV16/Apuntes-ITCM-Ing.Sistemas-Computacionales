package Primeros3metodos;
import java.math.BigInteger;
public class ProductosMedios extends CuadradosMedios {
    protected int xi2,aux; 

    public int getXi2() {
        return xi2;
    }

    public void setXi2(int xi2) {
        this.xi2 = xi2;
    }
    
    @Override
    public void calcularXD() {
        String s, s2;
        int digE, desde, hasta;
        s = String.valueOf(xi);
        largo = s.length()*2;
        s = String.valueOf((long) (xi *xi2));
        digE = largo - digitos;
        if (s.length() < largo) {
            while (s.length() < largo) {
                s = "0" + s;
            }
        }
        x = new BigInteger(s);
        if (digE % 2 == 0) {
            desde = digE / 2;
        } else {
            desde = digE / 2 + 1;
        }
        hasta = desde + digitos;
        s2 = s.substring(desde, hasta);
        aux = Integer.parseInt(s2);
        ri = aux / Math.pow(10, s2.length());
    }
    
    public void reasignar(){
        xi=xi2;
        xi2=aux;
    }
}
