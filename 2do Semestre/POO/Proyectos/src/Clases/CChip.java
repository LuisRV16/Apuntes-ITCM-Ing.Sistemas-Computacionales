package Clases;
// @author Luis Ricardo Reyes Villar
public class CChip {
    //Atributos
    private String empresa;
    private int numero;
    //Constructor
    public CChip(String empresa,int numero){
        this.empresa=empresa;
        this.numero=numero;
    }
    //Metodos
    public void mostrar(){
        System.out.println("\tEmpresa: "+empresa);
        System.out.println("\tNumero Celular: "+numero);
    }
}
