package Clases;
// @author Luis Ricardo Reyes Villar
public class CPantalla {
    //Atributos
    private String panel;
    private String relAsp;
    private String resolucion;
    private String proteccion;
    public CPantalla(String panel, String relAsp, String resolucion, String proteccion){
        this.panel = panel;
        this.relAsp = relAsp;
        this.resolucion = resolucion;
        this.proteccion = proteccion;
    }
    public void mostrar(){
        System.out.println("Pantalla: \n\t"+panel+"\n\t"+relAsp+"\n\t"+resolucion+"\n\t"+proteccion);
    }
}
