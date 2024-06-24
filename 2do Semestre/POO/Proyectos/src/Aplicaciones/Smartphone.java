package Aplicaciones;
//@author Luis Ricardo Reyes Villar
import Clases.CChip;
import Clases.CSmartphone;
public class Smartphone {
    public static void main(String[] args) {
        String modelo, desCarga,panel,relAsp,resolucion,proteccion;
        int mAh;
        modelo="Mi 9T";
        desCarga="Carga rapida de 18w";
        panel="AMOLED de 6,39 pulgadas";
        relAsp="Relación de aspecto 19.5:9";
        resolucion="FullHD+ a 2,340 x 1,080";
        proteccion="Gorilla Glass 5";
        mAh=4000;
        CSmartphone C = new CSmartphone(modelo,mAh, desCarga,panel,relAsp,resolucion,proteccion);
        CChip movistar = new CChip("Movistar",4770834);
        CChip telcel = new CChip("Telcel",1235476);
        C.agregarChip(movistar);
        C.agregarChip(telcel);
        C.mostrar();
    }
}
