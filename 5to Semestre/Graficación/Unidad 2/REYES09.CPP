 #include <graphics.h>
 #include <conio.h>

 int main(void){
    int gdriver = DETECT, gmode;
    initgraph(&gdriver, &gmode, "..//BGI");
    setcolor(YELLOW);
    rectangle(0, 0, 639, 479);
    setfillstyle(SOLID_FILL, YELLOW);
    circle(213, 240, 50);
    circle(320, 100, 100);
    circle(562, 402, 75);
    circle(25, 451, 25);
    getch();
    floodfill(213, 240, YELLOW);
    floodfill(320, 100, YELLOW);
    floodfill(564, 402, YELLOW);
    floodfill(25, 452, YELLOW);
    setfillstyle(SOLID_FILL, GREEN);
    floodfill(2, 2, YELLOW);
    getch();
    closegraph();
    return 0;
 }
