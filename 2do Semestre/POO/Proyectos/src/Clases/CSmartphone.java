package Clases;
// @author Luis Ricardo Reyes Villar
public class CSmartphone {
 //Atributos
    private String modelo;
    private CBateria bateria;
    private int nroChips;
    private CChip[] chips;
    private CPantalla pantalla;
 //Constructor
    public CSmartphone(String modelo, int cantMAh, String desCarga, String panel,String relAsp, 
            String resolucion, String proteccion){
        this.modelo = modelo;
        this.bateria = new CBateria(cantMAh, desCarga);
        this.pantalla = new CPantalla(panel, relAsp, resolucion, proteccion);
        this.nroChips = 0;
        this.chips = new CChip[2];
    }
    //Metodos
    public void mostrar(){
        System.out.println("Modelo: \n\t"+modelo);
        bateria.mostrar();
        pantalla.mostrar();
        System.out.println("Numero de chips: "+nroChips);
        for (int i = 0; i < nroChips; i++) {
            System.out.println("Chip "+(i+1));
            chips[i].mostrar();
        }
    }
    public void agregarChip(CChip nuevoChip){
        if (nroChips < 2) {
            chips[nroChips] = nuevoChip;
            nroChips++;
        }
    }
    
}
