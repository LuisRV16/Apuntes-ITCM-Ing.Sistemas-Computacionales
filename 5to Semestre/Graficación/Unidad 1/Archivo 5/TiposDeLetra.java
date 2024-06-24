// @author LuisR
// Fig. 12.11: TiposDeLetra.java
// Muestra cadenas en distintos tipos de letra y colores.
import java.awt.Font;
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;
import javax.swing.JFrame;

public class TiposDeLetra extends JPanel {
    // muestra objetos String en distintos tipos de letra y colores
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g); // llama al método paintComponent de la superclase

        // establece el tipo de letra a Serif (Times), negrita, 12 puntos y dibuja una cadena
        g.setFont(new Font("Serif", Font.BOLD, 12));
        g.drawString("Serif 12 puntos, negrita.", 20, 50);

        // establece el tipo de letra a Monospaced (Courier), cursiva, 24 puntos y dibuja una cadena
        g.setFont(new Font("Monospaced", Font.ITALIC, 24));
        g.drawString("Monospaced 24 puntos, cursiva.", 20, 70);

        // establece el tipo de letra a SansSerif (Helvetica), simple, 14 puntos y dibuja una cadena
        g.setFont(new Font("SansSerif", Font.PLAIN, 14));
        g.drawString("SansSerif 14 puntos, simple.", 20, 90);

        // establece el tipo de letra a Serif (Times), negrita/cursiva, 18 puntos y dibuja una cadena
        g.setColor(Color.RED);
        g.setFont(new Font("Serif", Font.BOLD + Font.ITALIC, 18));
        g.drawString(g.getFont().getName() + " " + g.getFont().getSize() +
                " puntos, negrita cursiva.", 20, 110);
    } // fin del método paintComponent

    public static void main(String args[]) {
        // crea marco para TiposDeLetra
        JFrame marco = new JFrame("Uso de tipos de letra");
        marco.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        TiposDeLetra tiposDeLetra = new TiposDeLetra(); // crea objeto TiposDeLetra
        marco.add(tiposDeLetra); // agrega objeto TiposDeLetra al marco
        marco.setSize(475, 170); // establece el tamaño del marco
        marco.setVisible(true); // muestra el marco
    } // fin de main
} // fin de la clase TiposDeLetra
