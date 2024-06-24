package Clases;
//@author Luis Ricardo Reyes Villar
public class CTrapecio {
    private int baseMay, baseMen, altura;
    private float area;
    public CTrapecio(){}
    public void setBaseMayor(int baseMay){this.baseMay=baseMay;}
    public void setBaseMenor(int baseMen){this.baseMen=baseMen;}
    public void setAltura(int altura){this.altura=altura;}
    public void Area(){area = (float)((baseMay+baseMen)*altura)/2;}
    public float getArea(){return area;}
}