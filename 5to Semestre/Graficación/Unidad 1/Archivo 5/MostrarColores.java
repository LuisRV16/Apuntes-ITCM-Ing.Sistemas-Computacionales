// @author LuisR
// Fig. 12.5: JPanelColor.java
// Demostración de objetos Color.
import java.awt.Graphics;
import java.awt.Color;
import javax.swing.JPanel;
import javax.swing.JFrame;

public class MostrarColores extends JPanel {
    // dibuja rectángulos y objetos String en distintos colores
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g); // llama al método paintComponent de la superclase

        this.setBackground(Color.WHITE);

        Color color = Color.RED;
        g.setColor(color);
        g.fillRect(15, 25, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 40);
      
        color = new Color(191, 128, 0);
        g.setColor(color);
        g.fillRect(15, 50, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 65);

        // establece nuevo color de dibujo, usando objetos Color static
        color = Color.BLUE;
        g.setColor(color);
        g.fillRect(15, 75, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 90);

        // muestra los valores RGB individuales
        color = Color.MAGENTA;
        g.setColor(color);
        g.fillRect(15, 100, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 115);
        
        color = Color.GREEN;
        g.setColor(color);
        g.fillRect(15, 125, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 140);
        
        color = Color.ORANGE;
        g.setColor(color);
        g.fillRect(15, 150, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 165);
        
        color = Color.PINK;
        g.setColor(color);
        g.fillRect(15, 175, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 190);
        
        color = Color.CYAN;
        g.setColor(color);
        g.fillRect(15, 200, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 215);
        
        color = Color.YELLOW;
        g.setColor(color);
        g.fillRect(15, 225, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 240);
        
        color = Color.BLACK;
        g.setColor(color);
        g.fillRect(15, 250, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 265);
        
        color = Color.WHITE;
        g.setColor(color);
        g.fillRect(15, 275, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 290);
        
        color = Color.GRAY;
        g.setColor(color);
        g.fillRect(15, 300, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 315);
        
        color = Color.LIGHT_GRAY;
        g.setColor(color);
        g.fillRect(15, 325, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 340);
        
        color = Color.DARK_GRAY;
        g.setColor(color);
        g.fillRect(15, 350, 100, 20);
        g.drawString("Valores RGB: " + color.getRed() + ", " +
                color.getGreen() + ", " + color.getBlue(), 130, 365);
        
    } // fin del método paintComponent

    public static void main(String args[]) {
        // crea marco para objeto JPanelColor
        JFrame frame = new JFrame("Uso de colores");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        MostrarColores jPanelColor = new MostrarColores(); // crea objeto JPanelColor
        frame.add(jPanelColor); // agrega jPanelColor a marco
        frame.setSize(400, 450);
        frame.setVisible(true); // muestra el marco
    } // fin de main
} // fin de la clase JPanelColor
