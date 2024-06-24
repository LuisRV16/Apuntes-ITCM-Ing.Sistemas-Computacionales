#include <graphics.h>
#include <conio.h>
#include <stdio.h>

int main(void){

   int gdriver = DETECT, gmode;
   char num[80];

   initgraph(&gdriver, &gmode, "..//BGI");
   setfillstyle(0, WHITE);

   //Cubo grande
   bar3d(100, 150, 400, 450, 150, 1);
   line(250, 38, 250, 338);
   line(250, 338, 550, 338);
   line(250, 338, 100, 450);
   //Cubo interno
   bar3d(270, 230, 370, 330, 50, 1);
   line(320, 193, 320, 293);
   line(320, 293, 420, 293);
   line(320, 293, 270, 330);
   //Uni¢n de las caras frontales de los cubos
   line(270, 330, 100, 450);
   line(400, 450, 370, 330);
   line(370, 230, 400, 150);
   line(270, 230, 100, 150);
   //Uni¢n de las caras posteriores de los cubos
   line(320, 193, 250, 38);
   line(250, 338, 320, 293);
   line(420, 293, 550, 338);
   line(420, 193, 550, 38);
   //"0000"
   sprintf(num, "0000");
   outtextxy(60, 450, num);
   //"0001"
   sprintf(num, "0001");
   outtextxy(210, 338, num);
   //"0010"
   sprintf(num, "0010");
   outtextxy(210, 38, num);
   //"0011"
   sprintf(num, "0011");
   outtextxy(60, 150, num);
   //"0100"
   sprintf(num, "0100");
   outtextxy(410, 150, num);
   //"0101"
   sprintf(num, "0101");
   outtextxy(520, 28, num);
   //"0110"
   sprintf(num, "0110");
   outtextxy(250, 28, num);
   //"0111"
   sprintf(num, "0111");
   outtextxy(70, 140, num);
   //"1000"
   sprintf(num, "1000");
   outtextxy(550, 342, num);
   //"1001"
   sprintf(num, "1001");
   outtextxy(555, 40, num);
   //"1010"
   sprintf(num, "1010");
   outtextxy(370, 140, num);
   //"1011"
   sprintf(num, "1011");
   outtextxy(405, 450, num);
   //"1100"
   sprintf(num, "1100");
   outtextxy(552, 330, num);
   //"1101"
   sprintf(num, "1101");
   outtextxy(215, 325, num);
   //"1110"
   sprintf(num, "1110");
   outtextxy(65, 440, num);
   //"1111"
   sprintf(num, "1111");
   outtextxy(370, 455, num);

   getch();
   closegraph();
   return 0;
}
