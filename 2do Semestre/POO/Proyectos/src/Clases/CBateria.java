package Clases;
// @author Luis Ricardo Reyes Villar
public class CBateria {
    //Atributos
    private int mAh;
    private String carga;
    //Constructor
    public CBateria(int mAh,String carga){
        this.mAh=mAh;
        this.carga=carga;
    }
    //Metodos
    public void mostrar(){
        System.out.println("Bateria: ");
        System.out.println("\tCantidad de mAh: "+mAh);
        System.out.println("\t"+carga);
    }
}
