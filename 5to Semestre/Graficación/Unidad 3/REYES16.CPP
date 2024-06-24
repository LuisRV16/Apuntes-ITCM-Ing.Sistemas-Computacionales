
#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int main(void)
{
   int gdriver = DETECT, gmode;
   int i;
   initgraph(&gdriver, &gmode, "..//BGI");

   setcolor(YELLOW);

   for (i=EMPTY_FILL; i<USER_FILL; i++)
   {
      setfillstyle(i, i+1);

      bar3d(270, 190, 370, 290, 50, 1);
      setfillstyle(1, GREEN);
      floodfill(300, 180, YELLOW);
      setfillstyle(1, BLUE);
      floodfill(380, 250, YELLOW);
      getch();
   }

   closegraph();
   return 0;
}
