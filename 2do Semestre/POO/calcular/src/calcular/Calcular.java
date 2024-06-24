package calcular;

/**
 *
 * @author LuisR
 */
public class Calcular {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*double suma=0;
        double resultado=0;
            resultado= 4*Math.pow(1, 1.1)+4*Math.pow(1, 1.2)+3*Math.pow(1, 1.3)+4*Math.pow(2, 1.1)+4*Math.pow(2, 1.2)+3*Math.pow(2, 1.3)+4*Math.pow(3, 1.1)+4*Math.pow(3, 1.2)+3*Math.pow(3, 1.3)+4*Math.pow(4, 1.1)+4*Math.pow(4, 1.2)+3*Math.pow(4, 1.3)+4*Math.pow(5, 1.1)+4*Math.pow(5, 1.2)+3*Math.pow(5, 1.3);
            resultado=+resultado;
        System.out.println("Suma= "+resultado);*/
        double resultado=0;
        for (int i = 1; i <=5; i++) {
            resultado=4*Math.pow(i, 1.1)+4*Math.pow(i, 1.2)+3*Math.pow(i, 1.3);
            System.out.println("Resultado "+(i)+"= "+resultado);
            resultado=resultado+resultado;
        }
        System.out.println("Suma= "+resultado);
    }
    
}
