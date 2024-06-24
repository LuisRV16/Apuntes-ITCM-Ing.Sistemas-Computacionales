 #include <graphics.h>
 #include <conio.h>

 int main(void){
    int gdriver = DETECT, gmode;
    initgraph(&gdriver, &gmode, "..//BGI");
    setcolor(YELLOW);
    setfillstyle(SOLID_FILL, GREEN);
    rectangle(0, 0, 639, 479);
    circle(213, 240, 50);
    circle(320, 100, 100);
    circle(562, 402, 75);
    circle(25, 451, 25);
    getch();
    floodfill(2, 2, YELLOW);
    setfillstyle(SOLID_FILL, RED);
    floodfill(213, 240, YELLOW);
    setfillstyle(SOLID_FILL, BLUE);
    floodfill(320, 100, YELLOW);
    setfillstyle(SOLID_FILL, MAGENTA);
    floodfill(562, 402, YELLOW);
    setfillstyle(SOLID_FILL, WHITE);
    floodfill(25, 451, YELLOW);
    getch();
    closegraph();
    return 0;
 }
