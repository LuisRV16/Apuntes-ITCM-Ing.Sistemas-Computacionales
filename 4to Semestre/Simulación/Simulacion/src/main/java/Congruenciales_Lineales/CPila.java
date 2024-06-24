package Congruenciales_Lineales;
public class CPila {
    //Propiedades
    int MAX;
    private Object stack[];
    private int tope;
    //Constructor
    public CPila(int n){
        tope=-1;
        MAX = n;
        stack = new Object[MAX];
    }
    
    //Checar Pila llena
    public boolean llena(){
        return(tope==MAX-1);
    }
    //Checar Pila vacia
    public boolean vacia(){
        return (tope==-1);
    }
    //Comportamiento insertar
    public void insertar(Object x){
        if (!llena()) {
            tope++;
            stack[tope]=x;
        }
    }
    //Comportamiento eliminar
    public Object eliminiar(){
        Object x=null;
        if (!vacia()) {
            x=stack[tope];
            tope--;
        }
        return x;
    }
}
