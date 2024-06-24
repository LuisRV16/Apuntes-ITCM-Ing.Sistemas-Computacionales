#include <graphics.h>
#include <conio.h>
#include <dos.h>

int main(void){

    int gdriver = DETECT, gmode, i;
    initgraph(&gdriver, &gmode, "..//BGI");

    ///////////////////////////
    // Gradas lado izquierdo //
    ///////////////////////////
    line(10, 0, 140, 45);
    line(0, 10, 138, 55);

    line(140, 45, 150, 55);

    line(140, 50, 20, 326);
    line(150, 55, 25, 343);

    setcolor(DARKGRAY);

    line(0, 40, 20, 40);
    line(20, 40, 20, 45);
    line(20, 40, 0, 65);

    line(20, 45, 50, 45);
    line(50, 45, 50, 50);
    line(50, 45, 0, 125);

    line(50, 50, 80, 50);
    line(80, 50, 80, 55);
    line(80, 50, 0, 200);

    line(80, 55, 110, 55);
    line(110, 55, 110, 60);
    line(110, 55, 0, 290);

    line(110, 60, 130, 60);
    line(130, 60, 130, 65);
    line(130, 60, 0, 350);

    ///////////////////////////
    // Gradas lado izquierdo //
    ///////////////////////////

    setcolor(WHITE);

    line(630, 0, 500, 45);
    line(640, 10, 503, 55);

    line(500, 45, 490, 55);

    line(500, 53, 620, 326);
    line(490, 55, 615, 343);

    setcolor(DARKGRAY);

    line(640, 40, 620, 40);
    line(620, 40, 620, 45);
    line(620, 40, 640, 65);

    line(620, 45, 590, 45);
    line(590, 45, 590, 50);
    line(590, 45, 640, 125);

    line(590, 50, 560, 50);
    line(560, 50, 560, 55);
    line(560, 55, 540, 55);
    line(560, 55, 640, 200);

    line(540, 55, 530, 55);
    line(530, 55, 530, 60);
    line(530, 55, 640, 290);

    line(530, 60, 510, 60);
    line(510, 60, 510, 65);
    line(510, 60, 640, 350);

    /////////////////////////

    setcolor(WHITE);

    ellipse(320, 343, 180, 360, 295, 100);
    ellipse(320, 326, 180, 360, 300, 135);

    setcolor(DARKGRAY);

    ellipse(320, 350, 180, 360, 320, 130);
    ellipse(320, 350, 180, 360, 340, 160);
    ellipse(320, 350, 180, 360, 360, 200);

    setfillstyle(1, 4);
    floodfill(320, 240, WHITE);

    //Llenado de las gradas
    setfillstyle(5, DARKGRAY);
    floodfill(50, 20, WHITE);//Lado izquierdo
    setfillstyle(4, DARKGRAY);
    floodfill(590, 20, WHITE);//Lado derecho
    floodfill(320, 450, WHITE);//Parte inferior

    ////////////////////////
    //Pista lado izquierdo//
    ////////////////////////
    setcolor(WHITE);
    line(60, 325, 165, 75);
    line(80, 325, 175, 75);
    line(100, 325, 185, 75);
    line(120, 325, 195, 75);
    line(140, 325, 205, 75);
    line(66, 310, 144, 310);//linea de meta
    line(96, 240, 111, 240);//linea "4"
    line(120, 220, 135, 220);//linea "3"
    line(142, 200, 157, 200);//linea "2"
    line(164, 180, 177, 180);//linea "1"
    //Letras de la pista ("META")
    setcolor(YELLOW);
    outtextxy(70, 315, "M");
    outtextxy(90, 315, "E");
    outtextxy(110, 315, "T");
    outtextxy(130, 315, "A");
    //Numeros de puntos iniciales de recorrido
    outtextxy(102, 230, "4");
    outtextxy(127, 210, "3");
    outtextxy(149, 190, "2");
    outtextxy(169, 170, "1");

    //////////////////////
    //Pista lado derecho//
    //////////////////////
    setcolor(WHITE);
    line(580, 325, 475, 75);
    line(560, 325, 465, 75);
    line(540, 325, 455, 75);
    line(520, 325, 445, 75);
    line(500, 325, 435, 75);

    ///////////////////////
    //Pista lado inferior//
    ///////////////////////
    ellipse(320, 325, 180, 360, 260, 100);
    ellipse(320, 325, 180, 360, 240, 85);
    ellipse(320, 325, 180, 360, 220, 70);
    ellipse(320, 325, 180, 360, 200, 55);
    ellipse(320, 325, 180, 360, 180, 40);

    ///////////////////////
    //Pista lado superior//
    ///////////////////////
    ellipse(320, 75, 0, 180, 115, 20);
    ellipse(320, 75, 0, 180, 125, 22);
    ellipse(320, 75, 0, 180, 134, 24);
    ellipse(320, 75, 0, 180, 144, 26);
    ellipse(320, 75, 0, 180, 154, 28);

    //Cancha
    line(220, 75, 420, 75);
    line(220, 75, 160, 325);
    line(420, 75, 480, 325);
    line(160, 325, 480, 325);

    arc(220, 75, 268, 360, 8);
    arc(420, 75, 180, 278, 8);
    arc(160, 325, 0, 78, 14);
    arc(480, 325, 102, 180, 14);

    setfillstyle(1, GREEN);
    floodfill(325, 240, WHITE);

    setfillstyle(SOLID_FILL, BLACK);
    floodfill(222, 77, WHITE);
    floodfill(418, 77, WHITE);
    floodfill(162, 323, WHITE);
    floodfill(478, 323, WHITE);

    //circulo a media cancha
    line(190, 200, 450, 200);
    ellipse(320, 200, 0, 360, 60, 20);

    //porteria lado inferior
    rectangle(290, 315, 350, 335);
    setfillstyle(9, WHITE);
    floodfill(300, 318, WHITE);
    floodfill(347, 330, WHITE);

    //segunda area de la porteria
    line(235, 270, 405, 270);
    line(235, 270, 225, 325);
    line(405, 270, 415, 325);
    //primer area de la porteria
    line(260, 290, 380, 290);
    line(260, 290, 255, 325);
    line(380, 290, 385, 325);

    ellipse(320, 270, 0, 180, 40, 15);

    //porteria lado superior
    int poly[12];

    poly[0] = 300;
    poly[1] = 75;

    poly[2] = 300;
    poly[3] = 65;

    poly[4] = 303;
    poly[5] = 62;

    poly[6] = 337;
    poly[7] = 62;

    poly[8] = 340;
    poly[9] = 65;

    poly[10] = 340;
    poly[11] = 75;

    fillpoly(6, poly);

    //primer area de porteria
    line(355, 75, 357, 95);
    line(285, 75, 283, 95);
    line(283, 95, 357, 95);
    //segunda area de porteria
    line(380, 75, 385, 110);
    line(260, 75, 255, 110);
    line(255, 110, 385, 110);
    ellipse(320, 110, 180, 360, 25, 10);

    setcolor(YELLOW);
    settextstyle(0, HORIZ_DIR, 1);
    circle(240, 150, 10);
    outtextxy(233, 147, "21");
    outtextxy(220, 163, "Roberto");
    circle(320, 150, 10);
    outtextxy(318, 147, "8");
    outtextxy(295, 163, "Arandez");
    circle(400, 150, 10);
    outtextxy(393, 147, "18");
    outtextxy(380, 163, "Ivan A.");
    circle(210, 210, 10);
    outtextxy(203, 207, "13");
    outtextxy(190, 223, "Pulido");
    circle(280, 210, 10);
    outtextxy(273, 207, "78");
    outtextxy(245, 223, "G.Artezan");
    circle(350, 210, 10);
    outtextxy(343, 207, "19");
    outtextxy(325, 223, "Victor A.");
    circle(420, 210, 10);
    outtextxy(413, 207, "31");
    outtextxy(405, 223, "Miguel");
    circle(220, 260, 10);
    outtextxy(213, 257, "69");
    outtextxy(195, 273, "ElPollo");
    circle(320, 260, 10);
    outtextxy(313, 257, "12");
    outtextxy(295, 273, "Bonilla");
    circle(420, 260, 10);
    outtextxy(413, 257, "23");
    outtextxy(390, 273, "H. Aguilar");
    rectangle(0, 0, 639, 479);
    circle(320, 300, 10);
    outtextxy(313, 297, "11");
    outtextxy(335, 297, "Dieguinho");

    outtextxy(305, 35, "2023");

    i = 200;

    while(!kbhit()){
	i++;
	if(i >= 353){
	    i = 200;
	}
	outtextxy(i, 15, "PYTHON'S FC");
	delay(20);
	setfillstyle(1, BLACK);
	bar(200, 10, 440, 30);
    }

    getch();
    closegraph();
    return 0;
}