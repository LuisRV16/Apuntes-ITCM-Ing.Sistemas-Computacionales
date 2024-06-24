package Primeros3metodos;
import java.math.BigInteger;
public class CuadradosMedios {
    

    //atributos
    protected BigInteger x;
    protected int xi;
    protected int digitos;
    protected int largo;
    protected double ri;

    public CuadradosMedios() {
    }
    public BigInteger getX() {
        return x;
    }
    public int getXi() {
        return xi;
    }

    public void setXi(int xi) {
        this.xi = xi;
    }

    public int getDigitos() {
        return digitos;
    }

    public void setDigitos(int digitos) {
        this.digitos = digitos;
    }

    public double getRi() {
        return ri;
    }

    public void calcularXD() {
        String s, s2, s3="";
        int digE, desde, hasta,cont=0;
        s = String.valueOf((long) (Math.pow(xi, 2)));
        x = new BigInteger(s);
        largo = s.length();

        s2 = String.valueOf(getX());

        if (s2.length() < largo) {
            while (largo-s2.length()==cont) {
                cont++;
            }
            s2 = String.format("%0"+cont+"d", Integer.valueOf(s2));
        }

        digE = s2.length() - digitos;

        if (digE % 2 == 0) {
            desde = digE / 2;
        } else {
            desde = digE / 2 + 1;
        }

        hasta = desde + digitos;

        s3 = s2.substring(desde, hasta);
        xi = Integer.parseInt(s3);
        ri = xi / Math.pow(10, s3.length());
    }

}
