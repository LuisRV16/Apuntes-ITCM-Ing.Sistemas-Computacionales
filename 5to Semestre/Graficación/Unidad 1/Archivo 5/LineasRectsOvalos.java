// @author LuisR
// Fig. 12.18: LineasRectsOvalos.java
// Dibujo de líneas, rectángulos y óvalos.
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;
import javax.swing.JFrame;

public class LineasRectsOvalos extends JPanel {
    // muestra varias líneas, rectángulos y óvalos
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g); // llama al método paintComponent de la superclase

        this.setBackground(Color.WHITE);

        g.setColor(Color.RED);
        g.drawLine(5, 30, 380, 30);

        g.setColor(Color.BLUE);
        g.drawRect(5, 40, 90, 55);
        g.fillRect(100, 40, 90, 55);

        g.setColor(Color.CYAN);
        g.fillRoundRect(195, 40, 90, 55, 50, 50);
        g.drawRoundRect(290, 40, 90, 55, 20, 20);

        g.setColor(Color.YELLOW);
        g.draw3DRect(5, 100, 90, 55, true);
        g.fill3DRect(100, 100, 90, 55, false);

        g.setColor(Color.MAGENTA);
        g.drawOval(195, 100, 90, 55);
        g.fillOval(290, 100, 90, 55);
    } // fin del método paintComponent

    public static void main(String args[]) {
        // crea marco para LineasRectsOvalos
        JFrame marco = new JFrame("Dibujo de líneas, rectángulos y óvalos");
        marco.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        LineasRectsOvalos lineasRectsOvalos = new LineasRectsOvalos();
        lineasRectsOvalos.setBackground(Color.WHITE);
        marco.add(lineasRectsOvalos); // agrega el panel al marco

        marco.setSize(400, 200); // establece el tamaño del marco
        marco.setVisible(true); // muestra el marco
    } // fin de main
} // fin de la clase LineasRectsOvalos
