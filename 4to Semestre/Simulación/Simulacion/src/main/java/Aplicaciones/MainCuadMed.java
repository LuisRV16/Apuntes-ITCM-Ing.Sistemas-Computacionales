package Aplicaciones;

import Primeros3metodos.CuadradosMedios;
import java.util.Scanner;

public class MainCuadMed {
    public static void main(String[] args) {
        CuadradosMedios N = new CuadradosMedios();
        int semilla, nD,cant;
        Scanner sc = new Scanner(System.in);
        System.out.print("Introduzca la semilla: ");
        semilla = sc.nextInt();
        System.out.print("Introduzca el numero de digitos a extraer: ");
        nD = sc.nextInt();
        System.out.print("Cantidad de numeros pseudoaleatorios a generar: ");
        cant = sc.nextInt();
        N.setXi(semilla);
        N.setDigitos(nD);
        for (int i = 0; i < cant; i++) {
            N.calcularXD();
            System.out.println("Y"+(i+1)+" = "+N.getX()+" | X"+(i+1)+" = "+N.getXi()+" | r"+(i+1)+" = "+N.getRi());
        }
        
    }
    
}
