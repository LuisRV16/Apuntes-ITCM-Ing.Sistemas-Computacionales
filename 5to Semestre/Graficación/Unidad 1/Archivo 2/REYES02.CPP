
#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int main(void)
{
   int gdriver = DETECT, gmode;
   char msg[80];
   initgraph(&gdriver, &gmode, "..//BGI");
   moveto(20, 30);
   putpixel(getx(), gety(), getmaxcolor());
   sprintf(msg, " (%d, %d)", getx(), gety());
   outtextxy(20, 30, msg);
   moveto(100, 100);
   putpixel(getx(), gety(), getmaxcolor());
   sprintf(msg, " (%d, %d)", getx(), gety());
   outtext(msg);
   getch();
   closegraph();
   return 0;
}
