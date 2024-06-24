package APLICACIONES;
import CLASES.apliFrameT;
import javax.swing.JFrame;
public class FrameApli {

    public static void main(String[] args) {
        apliFrameT X = new apliFrameT();
        X.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        X.setSize(300, 300);
        X.setVisible(true);
    }
}
