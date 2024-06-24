// Programa que dibuja una par bola
#include<conio.h>
#include<graphics.h>
#include<math.h>

int main(void){

    double x, y;
    int gdriver = DETECT, gmode;
    initgraph(&gdriver, &gmode, "..//BGI");
    // Ejes coordenados
    setcolor(14);
    line(0, 240, 640, 240);// Eje horizontal
    line(320, 0, 320, 480);// Eje vertical
    // Lado izquierdo de la parabola abierta hacia arriba
    moveto(320, 240);
    for(x=0; x<=640; x++){
	setcolor(2);
	y = 0.01* (x * x);
	lineto(320-x, 240-y);
    }
    // Lado derecho de la parabola abierta hacia arriba
    moveto(320, 240);
    for(x=0; x<=640; x++){
	y = 0.01* (x * x);
	lineto(320+x, 240-y);
    }
    // Lado superior de la parabola abierta hacia la derecha
    moveto(320, 240);
    for(y=0; y<=480;y++){
	setcolor(9);
	x = 0.01 * (y * y);
	lineto(320+x, 240+y);
    }
    // Lado inferior de la parabola abierta hacia la derecha
    moveto(320, 240);
    for(y=0; y<=480;y++){
	x = 0.01 * (y * y);
	lineto(320+x, 240-y);
    }
    // Lado izquierdo de la parabola abierta hacia abajo
    moveto(320, 240);
    for(x = 0; x <= 640; x++){
	setcolor(7);
	y = 0.01 * (x * x);
	lineto(320-x, 240+y);
    }
    // Lado derecho de la parabola abierta hacia abajo
    moveto(320, 240);
    for(x = 0; x <= 640; x++){
	y = 0.01 * (x * x);
	lineto(320+x, 240+y);
    }
    // Lado superior de la parabola abierta hacia la izquierda
    moveto(320, 240);
    for(y = 0; y <= 480; y++){
       setcolor(5);
       x = 0.01 * (y * y);
       lineto(320-x, 240-y);
    }
    // Lado inferior de la parabola abierta hacia la izquierda
    moveto(320, 240);
    for(y = 0; y <= 480; y++){
       x = 0.01 * (y * y);
       lineto(320-x, 240+y);
    }                     -
    getch();
    closegraph();
    return 0;
}