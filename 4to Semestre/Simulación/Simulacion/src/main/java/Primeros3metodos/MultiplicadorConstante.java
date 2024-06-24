
package Primeros3metodos;

import java.math.BigInteger;

public class MultiplicadorConstante extends ProductosMedios{
    
    @Override
    public void calcularXD() {
        
        String s, s2 = "", s3;
        int digE, desde, hasta;
        s = String.valueOf(xi);
        largo = s.length();
        s = String.valueOf((long) (xi *xi2));
        x = new BigInteger(s);
        

//        s2 = String.valueOf(x); wenamechainazuma

        if (s.length() < largo) {
            while (s.length() < largo) {
                s2 = "0" + s;
            }
        }

        digE = s2.length() - digitos;

        if (digE % 2 == 0) {
            desde = digE / 2;
        } else {
            desde = digE / 2 + 1;
        }

        hasta = desde + digitos;

        s3 = s2.substring(desde, hasta);
        xi2 = Integer.parseInt(s3);
        ri = xi2 / Math.pow(10, s3.length());
    }
    
}
