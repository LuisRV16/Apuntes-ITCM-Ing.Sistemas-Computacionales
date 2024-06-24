
#include <graphics.h>
#include <stdio.h>
#include <conio.h>

int main(void)
{
   int gdriver = DETECT, gmode;
   char msg[80];

   initgraph(&gdriver, &gmode, "..//BGI");

   setcolor(YELLOW);
   moveto(20, 30);

   sprintf(msg, " (%d, %d)", getx(), gety());
   outtextxy(20, 30, msg);

   setcolor(GREEN);
   lineto(100, 100);

   setcolor(RED);
   sprintf(msg, " (%d, %d)", getx(), gety());
   outtext(msg);

   getch();
   closegraph();
   return 0;
}
