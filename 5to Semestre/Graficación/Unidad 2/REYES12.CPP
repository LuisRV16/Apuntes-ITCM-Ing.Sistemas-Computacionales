
#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int main(void)
{
   int gdriver = DETECT, gmode;
   int poly[10];

   initgraph(&gdriver, &gmode, "..//BGI");
   setcolor(14);
   poly[0] = 20;        /* 1st vertext */
   poly[1] = 240;

   poly[2] = 620; /* 2nd */
   poly[3] = 20;

   poly[4] = 590; /* 3rd */
   poly[5] = 460;

   poly[6] = 320;  /* 4th */
   poly[7] = 240;
/*
   drawpoly doesn't automatically close
   the polygon, so we close it.
*/
   poly[8] = poly[0];
   poly[9] = poly[1];

   /* draw the polygon */
   drawpoly(5, poly);
   setfillstyle(SOLID_FILL, GREEN);
   floodfill(600, 200, 14);

   /* clean up */
   getch();
   closegraph();
   return 0;
}
