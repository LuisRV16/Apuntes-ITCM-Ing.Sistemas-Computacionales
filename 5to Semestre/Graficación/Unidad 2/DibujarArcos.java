import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class DibujarArcos extends JPanel {
    // Dibuja rectángulos y arcos
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g); // llama al método paintComponent de la superclase

        // empieza en 0 y se extiende hasta 360 grados
        g.setColor(Color.RED);
        g.drawArc(15, 35, 80, 80, 0, 360);

        // empieza en 0 y se extiende hasta 110
        g.setColor(Color.RED);
        g.drawArc(100, 35, 80, 80, 0, 110);

        // empieza en 0 y se extiende hasta -270 grados
        g.setColor(Color.RED);
        g.drawArc(185, 35, 80, 80, 0, -270);

        // empieza en 0 y se extiende hasta 360 grados
        g.fillArc(15, 120, 80, 40, 0, 360);

        // empieza en 270 y se extiende hasta -90 grados
        g.fillArc(100, 120, 80, 40, 270, -90);

        // empieza en 0 y se extiende hasta -270 grados
        g.fillArc(185, 120, 80, 40, 0, -270);
    }
    
    public static void main( String args[] ){
        JFrame marco = new JFrame( "Dibujo de arcos" );
        marco.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
        DibujarArcos arcos = new DibujarArcos();
        marco.add( arcos );
        marco.setSize( 300, 210 );
        marco.setVisible( true );
    }
}
