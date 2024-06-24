
#include <graphics.h>
#include <conio.h>

int main(void)
{
   /* request auto detection */
   int gdriver = DETECT, gmode;
   initgraph(&gdriver, &gmode, "..//BGI");

   /* read result of initialization */
   setcolor(YELLOW);
   /* draw a diagonal line */
   line(0,240, 640, 240);
   line(320, 0, 320, 480);
   line(0,0,640,480);
   line(640,0,0,480);
   circle(320,240,100);
   ellipse(320,240,0,360,200,100);
   ellipse(320,240,0,360,100,200);

   /* clean up */
   getch();
   closegraph();
   return 0;
}
