
#include <graphics.h>
#include <conio.h>

int main(void)
{
  int gdriver = DETECT, gmode,i;

  initgraph(&gdriver, &gmode, "..//BGI");
  setcolor(WHITE);
 // for (i = EMPTY_FILL; i < USER_FILL; i++) {
    setfillstyle(SOLID_FILL, YELLOW);
    fillellipse(320, 240, 100, 50);
    setcolor(CYAN);
    settextstyle(8, HORIZ_DIR, 3);
    outtextxy(245, 223, "TEC MADERO");
    getch();
 // }

  closegraph();
  return 0;
}
