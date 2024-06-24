
#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int main(void)
{
   int gdriver = DETECT, gmode;
   int i;
   int poly[8];
   initgraph(&gdriver, &gmode, "..//BGI");
   setcolor(YELLOW);

   poly[0] = 20;        /* 1st vertex */
   poly[1] = 240;

   poly[2] = 620; /* 2nd */
   poly[3] = 20;

   poly[4] = 590; /* 3rd */
   poly[5] = 460;

   /*
      4th vertex. fillpoly automatically
      closes the polygon.
   */
   poly[6] = 320;
   poly[7] = 240;

   /* loop through the fill patterns */
   for (i=EMPTY_FILL; i<USER_FILL; i++)
   {
      /* set fill pattern */
      setfillstyle(i, i + 1);

      /* draw a filled polygon */
      fillpoly(4, poly);

      getch();
   }
   closegraph();
   return 0;
}
