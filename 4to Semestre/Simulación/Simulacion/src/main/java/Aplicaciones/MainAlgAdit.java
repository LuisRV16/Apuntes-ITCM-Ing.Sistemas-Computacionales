package Aplicaciones;
import java.util.Scanner;
public class MainAlgAdit {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int x[];
        int cant, xi, xi2, mod, vA;
        double ri;
        System.out.print("Introduzca la cantidad de numeros enteros a dar: ");
        cant = sc.nextInt();
        System.out.print("Introduzca el valor del modulo: ");
        mod = sc.nextInt();
        System.out.print("Introduzca el numero de variables aleatorias que desea obtener: ");
        vA = sc.nextInt();
        x = new int[cant + vA];
        for (int i = 0; i < cant; i++) {
            System.out.print("Introduzca el valor de x" + (i + 1) + ": ");
            x[i] = sc.nextInt();
        }
        xi = x[cant - 1];
        for (int i = 0, j = cant; i < vA; i++) {
            xi2 = x[i];
            xi = (xi + xi2) % mod;
            x[j] = xi;
            ri = ((double) xi / (mod - 1));
            System.out.println("x" + (cant + i + 1) + ": " + x[j]);
            System.out.println("r" + (i + 1) + ": " + ri);
        }
    }

}
