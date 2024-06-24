package CLASES;
        
    import javax.swing.JFrame; //haceque el public class vaya bien
    import javax.swing.JLabel; //da permiso de elaborar los textos
    import javax.swing.JButton; // LOS BOTONESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    import java.awt.FlowLayout; //supongo que para que arriba donde sale la tacita tenga un nombre al ejecutarse :0
    import java.awt.event.ActionEvent;
    import java.awt.event.ActionListener;
    import javax.swing.JTextField; //genera donde se llenan los textos creo, esos cuadritos jeje
    import javax.swing.JSeparator;
    import javax.swing.JPanel;


public class apliFrameT extends JFrame{
        private JLabel lblN0, lblN1, lblN2, lblN3, lblN4,lblN5, lblN6, lblN7,lblN8,lblN9; //letrero de texto
        private JTextField txtN1,txtN2, txtN3, txtN4, txtN5, txtN6, txtR; //donde se metera el texto o escribira
        private JButton btnAB, btnBC, btnAC, btnArea, btnPeri, btnVertices, btnR; //los botones
        private JSeparator snsN1, snsN2, snsN3, snsN4, snsN5, snsN6, snsN7, snsN8;
        private JPanel pnp1;
        CTriangulo T =  new CTriangulo();
        
        
    public apliFrameT() {
        super("Interfaz gráfica");
        setLayout(new FlowLayout());
        //
        lblN0 = new JLabel("Asigna los vertices"); //texto en grande
        lblN0.setBounds(30, 10, 50, 15);
        add(lblN0);
        
        pnp1 = new JPanel();
        pnp1.setBounds(2000,200,2000,200);
        add(pnp1);
        
        // empiezan las 3 señales
        lblN1 = new JLabel("Vertice A");
        lblN1.setBounds(30, 10, 50, 15);
        add(lblN1);
        //
        lblN2 = new JLabel("Vertice B");
        lblN2.setBounds(30, 10, 50, 15);
        add(lblN2);
        //
        lblN3 = new JLabel("Vertice C");
        lblN3.setBounds(30, 10, 50, 15);
        add(lblN3);
        //terminan las señales
        //comienzan donde se llenaran las casillas de los vertices
        lblN4 = new JLabel("x");
        lblN4.setBounds(30, 10, 50, 15);
        add(lblN4);
        //
        txtN1 = new JTextField(10);
        txtN1.setBounds(100, 10, 50, 20);
        add(txtN1);
        //
        lblN5 = new JLabel("y");
        lblN5.setBounds(30, 10, 50, 15);
        add(lblN5);
        //
        txtN2 = new JTextField(10);
        txtN2.setBounds(100, 10, 50, 20);
        add(txtN2);
        //
        lblN6 = new JLabel("x");
        lblN6.setBounds(30, 10, 50, 15);
        add(lblN6);
        //
        txtN3 = new JTextField(10);
        txtN3.setBounds(100, 10, 50, 20);
        add(txtN3);
        //
        lblN7 = new JLabel("y");
        lblN7.setBounds(30, 10, 50, 15);
        add(lblN7);
        //
        txtN4 = new JTextField(10);
        txtN4.setBounds(100, 10, 50, 20);
        add(txtN4);
        //
        lblN8 = new JLabel("x");
        lblN8.setBounds(30, 10, 50, 15);
        add(lblN8);
        //
        txtN5 = new JTextField(10);
        txtN5.setBounds(100, 10, 50, 20);
        add(txtN5);
        //
        lblN9 = new JLabel("y");
        lblN9.setBounds(30, 10, 50, 15);
        add(lblN9);
        //
        txtN6 = new JTextField(10);
        txtN6.setBounds(100, 10, 50, 20);
        add(txtN6);
        // aqui terminan los llenados de casillas
        // botones primordiales
        btnAB = new JButton("Calcular AB");
        btnAB.setBounds(30, 120, 100, 50);
        add(btnAB);
        //
        btnBC = new JButton("Calcular BC");
        btnBC.setBounds(30, 120, 100, 50);
        add(btnBC);
        //
        btnAC = new JButton("Calcular AC");
        btnAC.setBounds(30, 120, 100, 50);
        add(btnAC);
        // terminan botones primordiales
        // empiezan los dos botones restantes importantes tambien
        btnArea = new JButton("Calcular Area");
        btnAC.setBounds(40, 40, 100, 100);
        add(btnAC);
        // 
        btnPeri = new JButton("Calcular Perimetro");
        btnAC.setBounds(40, 20, 100, 100);
        add(btnAC);
        // botones restantes importantes terminan
        // boton de resultado jeje
        txtR = new JTextField(10);
        txtR.setBounds(30, 80, 150, 40);
        add(txtR);
        //inicio de separadores
        snsN1 = new JSeparator();
        snsN1.setBounds(1000, 1000, 1000, 1000);
        add(snsN1);//
        snsN2 = new JSeparator();
        snsN2.setBounds(10, 10, 10, 10);
        add(snsN2);//
        snsN3 = new JSeparator();
        snsN3.setBounds(10, 10, 10, 10);
        add(snsN3);//
        snsN4 = new JSeparator();
        snsN4.setBounds(10, 10, 10, 10);
        add(snsN4);//
        snsN5 = new JSeparator();
        snsN5.setBounds(10, 10, 10, 10);
        add(snsN5);
        
        
        //aqui agregamos para que aparezcan en la interfaz, creo?
        
        add(lblN0);//
        add(snsN1);
        add(lblN1);
        add(lblN4);
        add(txtN1);
        add(lblN5);
        add(txtN2); //
        add(lblN2);
        add(lblN6);
        add(txtN3);
        add(lblN7);
        add(txtN4); //
        add(lblN3);       
        add(lblN8);
        add(txtN5);
        add(lblN9);
        add(txtN6); //
        add(btnAB);
        add(btnBC);
        add(btnAC);
        add(btnArea);
        add(btnPeri);
        add(txtR);
        // termino de agregación para la interfaz, no?


        //inicio de manejadores
        ME manejador = new ME();
        btnAB.addActionListener(manejador);
        btnBC.addActionListener(manejador);
        btnAC.addActionListener(manejador);
        btnArea.addActionListener(manejador); 
        btnPeri.addActionListener(manejador);
        //termino de manejadores
    }
           
    private class ME implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == btnVertices) {
                txtR.setText("");
                int x1=Integer.parseInt(txtN1.getText());
                int y1=Integer.parseInt(txtN2.getText());
                int x2=Integer.parseInt(txtN3.getText());
                int y2=Integer.parseInt(txtN4.getText());
                int x3=Integer.parseInt(txtN5.getText());
                int y3=Integer.parseInt(txtN6.getText());
                T = new CTriangulo(x1,y1,x2,y2,x3,y3);
                T.cAB();
                T.cAC();
                T.cBC();
                T.Perimetro();
                T.Area();
         
            //Fin del constructor
            }
        }
    }
}
