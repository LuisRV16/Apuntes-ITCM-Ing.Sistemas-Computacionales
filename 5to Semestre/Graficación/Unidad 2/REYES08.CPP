#include <graphics.h>
#include <conio.h>
#include <dos.h>

int main(void) {

    int gdriver = DETECT, gmode, i;
    initgraph(&gdriver, &gmode, "..\\BGI");

    while(!kbhit()){

	i++;

	if(i >= 630){
	    i = 0;
	}

	settextstyle(10, HORIZ_DIR, 4);
	setcolor(GREEN);
	outtextxy(i, 220,"TEC MADERO");
	delay(5);
	setfillstyle(SOLID_FILL, YELLOW);
	//bar(0, 0, 640, 480);
	bar(0, 230, 640, 300);
    }

    getch();
    closegraph();
    return 0;

}