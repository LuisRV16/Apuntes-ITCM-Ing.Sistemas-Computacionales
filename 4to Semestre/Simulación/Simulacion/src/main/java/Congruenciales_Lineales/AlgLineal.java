package Congruenciales_Lineales;
public class AlgLineal extends AlgLiMul {
    public AlgLineal(int xi, int c, int k, int g) {
        super(xi,c,k,g);
        calMod();
        calA();
    }
    
    @Override
    public void calA() {
        a = 1 + 4 * k;
    }
    @Override
    public int periodoV(){
        return m;
    }
    public boolean relPrimo() {
        boolean val = true;
        int t1, t2, p, x;
        int M[], C[];
        t1 = t2 = p = 0;
        for (int i = 1; i <= m; i++) {
            if (m % i == 0) {
                t1++;
            }
        }
        for (int i = 1; i <= c; i++) {
            if (c % i == 0) {
                t2++;
            }
        }
        M = new int[t1];
        C = new int[t2];
        for (int i = m; i > 0; i--) {
            if (m % i == 0) {
                M[p] = m / i;
                p++;
            }
        }
        p = 0;
        for (int i = c; i > 0; i--) {
            if (c % i == 0) {
                C[p] = c / i;
                p++;
            }
        }
        for (int i = M.length - 1; i >= 0; i--) {
            for (int j = C.length - 1; j >= 0; j--) {
                if (C[j] == M[i]) {
                    x = M[i];
                    if (x != 1) {
                        val = false;
                    }
                }
            }
        }
        return val;
    }    
}
