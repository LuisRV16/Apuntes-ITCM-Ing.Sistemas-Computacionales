import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

//@author LuisR
public class TecMadero extends JFrame {

    private final JPanel panel;
    private final JLabel lblPizarron;

    public TecMadero(String titulo) {

        super(titulo);
        setLayout(null);
        getContentPane().setBackground(Color.black);

        panel = new JPanel();
        panel.setPreferredSize(new Dimension(640, 480));
        panel.setBounds(0, 0, 640, 480);
        panel.setBackground(Color.GREEN);
        panel.setLayout(null);

        lblPizarron = new JLabel("Tec Madero");
        lblPizarron.setBounds(0, 190, 220, 100);
        lblPizarron.setFont(new Font("Goudy Old Style", 1, 40));
        lblPizarron.setForeground(Color.YELLOW);

        panel.add(lblPizarron);

        add(panel);

        addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                System.exit(0);
            }
        });

        setSize(640, 480);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);

    }

    private class Hilo extends Thread {

        @Override
        public void run() {

            int i = -220;

            while (true) {

                i++;

                try {

                    if (i >= 630) {
                        i = -220;
                    }

                    lblPizarron.setLocation(i, lblPizarron.getY());

                    Thread.sleep(5);

                } catch (InterruptedException ex) {
                    Logger.getLogger(TecMadero.class.getName()).log(Level.SEVERE, null, ex);
                    break;
                }

            }
        }
    }

    public void iniciarAnimacion() {
        Hilo animacion = new Hilo();
        animacion.start();
    }

    public static void main(String[] args) {

        SwingUtilities.invokeLater(() -> {

            TecMadero pizarron = new TecMadero("Pizarrón Electrónico");

            pizarron.setVisible(true);

            pizarron.iniciarAnimacion();

        });
        
    }

}