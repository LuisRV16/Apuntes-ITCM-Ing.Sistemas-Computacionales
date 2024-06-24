package Congruenciales_Lineales;

public abstract class AlgLiMul {

    protected int xi, a, c, m, g, k;
    protected double r;

    public AlgLiMul() {
    }
    
    public AlgLiMul(int xi, int c, int k, int g) {
        setXi(xi);
        setC(c);
        setK(k);
        setG(g);
    }
    public AlgLiMul(int xi, int k, int g){
        setXi(xi);
        setK(k);
        setG(g);
    }

    public void setXi(int xi) {
        this.xi = xi;
    }

    public void setC(int c) {
        this.c = c;
    }

    public void setK(int k) {
        this.k = k;
    }

    public void setG(int g) {
        this.g = g;
    }

    public int getXi() {
        return xi;
    }

    public int getC() {
        return c;
    }

    public int getA() {
        return a;
    }

    public int getK() {
        return k;
    }

    public int getG() {
        return g;
    }

    public int getM() {
        return m;
    }

    public void calXi() {
        xi = (a * xi + c) % m;
    }

    public double getRi() {
        return xi / (m - 1);
    }
    
    public void calMod() {
        m = (int) Math.pow(2, g);
    }

    public abstract void calA();
    public abstract int periodoV();
}
