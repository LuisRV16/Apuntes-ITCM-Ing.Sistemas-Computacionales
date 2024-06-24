package Clases;
//@Author Luis Ricardo Reyes Villar
public class CLibro {
    private String nombre, autor, fecha; 
    private int paginas;
    public void setNombre(String nombre) {this.nombre = nombre;}
    public void setAutor(String autor) {this.autor = autor;}
    public void setFecha(String fecha) {this.fecha = fecha;}
    public void setNumPag(int paginas) {this.paginas = paginas;}
    @Override
    public String toString(){return "Nombre: "+nombre+"\nAutor: "+autor+
            "\nFecha de publicacion: "+fecha+"\nNumero de páginas: "+paginas;}
}
