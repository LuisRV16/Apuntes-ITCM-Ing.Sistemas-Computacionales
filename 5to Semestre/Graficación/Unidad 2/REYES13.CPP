#include <graphics.h>
#include <conio.h>

int main(void){
    int gdriver = DETECT, gmode;
    int poly[510];

    poly[0] = 160;
    poly[1] = 20;

    poly[2] = 158;
    poly[3] = 25;

    poly[4] = 156;
    poly[5] = 30;

    poly[6] = 154;
    poly[7] = 35;

    poly[8] = 152;
    poly[9] = 40;

    poly[10] = 150;
    poly[11] = 50;

    poly[12] = 149;
    poly[13] = 60;

    poly[14] = 147;
    poly[15] = 70;

    poly[16] = 146;
    poly[17] = 80;

    poly[18] = 145;
    poly[19] = 100;

    poly[20] = 144;
    poly[21] = 110;

    poly[22] = 143;
    poly[23] = 120;

    poly[24] = 142;
    poly[25] = 130;

    poly[26] = 141;
    poly[27] = 145;

    poly[28] = 140;
    poly[27] = 160;

    poly[28] = 240;
    poly[29] = 120;

    poly[30] = 280;
    poly[31] = 160;

    poly[32] = 240;
    poly[33] = 140;

    poly[34] = 120;
    poly[35] = 200;

    poly[36] = 119;
    poly[37] = 190;

    poly[38] = 118;
    poly[39] = 180;

    poly[40] = 117;
    poly[41] = 170;

    poly[42] = 116;
    poly[43] = 160;

    poly[44] = 115;
    poly[45] = 155;

    poly[46] = 115;
    poly[47] = 140;

    poly[48] = 116;
    poly[49] = 100;

    poly[50] = 117;
    poly[51] = 90;

    poly[52] = 118;
    poly[53] = 80;

    poly[54] = 119;
    poly[55] = 70;

    poly[56] = 120;
    poly[57] = 60;

    poly[58] = 115;
    poly[59] = 70;

    poly[60] = 114;
    poly[61] = 80;

    poly[62] = 112;
    poly[63] = 90;

    poly[64] = 110;
    poly[65] = 100;

    poly[66] = 108;
    poly[67] = 110;

    poly[68] = 106;
    poly[69] = 120;

    poly[70] = 104;
    poly[71] = 130;

    poly[72] = 102;
    poly[73] = 150;

    poly[74] = 99;
    poly[75] = 170;

    poly[76] = 96;
    poly[77] = 190;

    poly[78] = 94;
    poly[79] = 200;

    poly[80] = 95;
    poly[81] = 220;

    poly[82] = 96;
    poly[83] = 225;

    poly[84] = 97;
    poly[85] = 230;

    poly[86] = 98;
    poly[87] = 235;

    poly[88] = 240;
    poly[89] = 160;

    poly[90] = 275;
    poly[91] = 170;

    poly[92] = 240;
    poly[93] = 170;

    poly[94] = 90;
    poly[95] = 260;

    poly[96] = 91;
    poly[97] = 270;

    poly[98] = 92;
    poly[99] = 280;

    poly[100] = 93;
    poly[101] = 290;

    poly[102] = 94;
    poly[103] = 300;

    poly[104] = 95;
    poly[105] = 310;

    poly[106] = 97;
    poly[107] = 320;

    poly[108] = 99;
    poly[109] = 330;

    poly[110] = 102;
    poly[111] = 340;

    poly[112] = 105;
    poly[113] = 350;

    poly[114] = 109;
    poly[115] = 360;

    poly[116] = 112;
    poly[117] = 370;

    poly[118] = 115;
    poly[119] = 380;

    poly[120] = 116;
    poly[121] = 368;

    poly[122] = 117;
    poly[123] = 335;

    poly[124] = 118;
    poly[125] = 270;

    poly[126] = 240;
    poly[127] = 180;

    poly[128] = 270;
    poly[129] = 180;

    poly[130] = 240;
    poly[131] = 190;

    poly[132] = 140;
    poly[133] = 280;

    poly[134] = 141;
    poly[135] = 290;

    poly[136] = 143;
    poly[137] = 300;

    poly[138] = 145;
    poly[139] = 320;

    poly[140] = 148;
    poly[141] = 330;

    poly[142] = 150;
    poly[143] = 340;

    poly[144] = 153;
    poly[145] = 360;

    poly[146] = 156;
    poly[147] = 380;

    poly[148] = 159;
    poly[149] = 400;

    poly[150] = 163;
    poly[151] = 410;

    poly[152] = 166;
    poly[153] = 420;

    poly[154] = 169;
    poly[155] = 430;

    poly[156] = 173;
    poly[157] = 440;

    poly[158] = 177;
    poly[159] = 450;

    poly[160] = 180;
    poly[161] = 460;

    poly[162] = 179;
    poly[163] = 440;

    poly[164] = 178;
    poly[165] = 430;

    poly[166] = 177;
    poly[167] = 420;

    poly[168] = 176;
    poly[169] = 410;

    poly[170] = 175;
    poly[171] = 400;

    poly[172] = 173;
    poly[173] = 390;

    poly[174] = 172;
    poly[175] = 370;

    poly[176] = 171;
    poly[177] = 350;

    poly[178] = 170;
    poly[179] = 330;

    poly[180] = 169;
    poly[181] = 310;

    poly[182] = 168;
    poly[183] = 290;

    poly[184] = 250;
    poly[185] = 200;

    poly[186] = 270;
    poly[187] = 190;

    poly[188] = 285;
    poly[189] = 210;

    poly[190] = 275;
    poly[191] = 240;

    poly[192] = 305;
    poly[193] = 360;

    poly[194] = 306;
    poly[195] = 358;

    poly[196] = 307;
    poly[197] = 356;

    poly[198] = 308;
    poly[199] = 354;

    poly[200] = 310;
    poly[201] = 353;

    poly[202] = 311;
    poly[203] = 352;

    poly[204] = 312;
    poly[205] = 351;

    poly[206] = 314;
    poly[207] = 350;

    poly[208] = 316;
    poly[209] = 349;

    poly[210] = 318;
    poly[211] = 348;

    poly[212] = 320;
    poly[213] = 347;

    poly[214] = 322;
    poly[215] = 348;

    poly[216] = 324;
    poly[217] = 349;

    poly[218] = 326;
    poly[219] = 350;

    poly[220] = 328;
    poly[221] = 351;

    poly[222] = 329;
    poly[223] = 352;

    poly[224] = 330;
    poly[225] = 353;

    poly[226] = 332;
    poly[227] = 354;

    poly[228] = 333;
    poly[229] = 356;

    poly[230] = 334;
    poly[231] = 358;

    poly[232] = 335;
    poly[233] = 360;

    poly[234] = 365;
    poly[235] = 240;

    poly[236] = 355;
    poly[237] = 210;

    poly[238] = 370;
    poly[239] = 190;

    poly[240] = 390;
    poly[241] = 200;

    poly[242] = 472;
    poly[243] = 290;

    poly[244] = 471;
    poly[245] = 310;

    poly[246] = 470;
    poly[247] = 330;

    poly[248] = 469;
    poly[249] = 350;

    poly[250] = 468;
    poly[251] = 370;

    poly[252] = 467;
    poly[253] = 390;

    poly[254] = 465;
    poly[255] = 400;

    poly[256] = 464;
    poly[257] = 410;

    poly[258] = 463;
    poly[259] = 420;

    poly[260] = 462;
    poly[261] = 430;

    poly[262] = 461;
    poly[263] = 440;

    poly[264] = 460;
    poly[265] = 460;

    poly[266] = 463;
    poly[267] = 450;

    poly[268] = 467;
    poly[269] = 440;

    poly[270] = 471;
    poly[271] = 430;

    poly[272] = 474;
    poly[273] = 420;

    poly[274] = 477;
    poly[275] = 410;

    poly[276] = 481;
    poly[277] = 400;

    poly[278] = 484;
    poly[279] = 380;

    poly[280] = 487;
    poly[281] = 360;

    poly[282] = 490;
    poly[283] = 340;

    poly[284] = 492;
    poly[285] = 330;

    poly[286] = 495;
    poly[287] = 320;

    poly[288] = 497;
    poly[289] = 300;

    poly[290] = 499;
    poly[291] = 290;

    poly[292] = 500;
    poly[293] = 280;

    poly[294] = 400;
    poly[295] = 190;

    poly[296] = 370;
    poly[297] = 180;

    poly[298] = 400;
    poly[299] = 180;

    poly[300] = 522;
    poly[301] = 270;

    poly[302] = 523;
    poly[303] = 335;

    poly[304] = 524;
    poly[305] = 368;

    poly[306] = 525;
    poly[307] = 380;

    poly[308] = 528;
    poly[309] = 370;

    poly[310] = 531;
    poly[311] = 360;

    poly[312] = 535;
    poly[313] = 350;

    poly[314] = 538;
    poly[315] = 340;

    poly[316] = 541;
    poly[317] = 330;

    poly[318] = 543;
    poly[319] = 320;

    poly[320] = 545;
    poly[321] = 310;

    poly[322] = 546;
    poly[323] = 300;

    poly[324] = 547;
    poly[325] = 290;

    poly[326] = 548;
    poly[327] = 280;

    poly[328] = 549;
    poly[329] = 270;

    poly[330] = 550;
    poly[331] = 260;

    poly[332] = 400;
    poly[333] = 170;

    poly[334] = 365;
    poly[335] = 170;

    poly[336] = 400;
    poly[337] = 160;

    poly[338] = 542;
    poly[339] = 235;

    poly[340] = 543;
    poly[341] = 230;

    poly[342] = 544;
    poly[343] = 225;

    poly[344] = 545;
    poly[345] = 220;

    poly[346] = 546;
    poly[347] = 200;

    poly[348] = 544;
    poly[349] = 190;

    poly[350] = 541;
    poly[351] = 170;

    poly[352] = 538;
    poly[353] = 150;

    poly[354] = 536;
    poly[355] = 130;

    poly[356] = 534;
    poly[357] = 120;

    poly[358] = 532;
    poly[359] = 110;

    poly[360] = 530;
    poly[361] = 100;

    poly[362] = 528;
    poly[363] = 90;

    poly[364] = 526;
    poly[365] = 80;

    poly[366] = 525;
    poly[367] = 70;

    poly[368] = 520;
    poly[369] = 60;

    poly[370] = 521;
    poly[371] = 70;

    poly[372] = 522;
    poly[373] = 80;

    poly[374] = 523;
    poly[375] = 90;

    poly[376] = 524;
    poly[377] = 100;

    poly[378] = 525;
    poly[379] = 140;

    poly[380] = 525;
    poly[381] = 155;

    poly[382] = 524;
    poly[383] = 160;

    poly[384] = 523;
    poly[385] = 170;

    poly[386] = 522;
    poly[387] = 180;

    poly[388] = 521;
    poly[389] = 190;

    poly[390] = 520;
    poly[391] = 200;

    poly[392] = 400;
    poly[393] = 140;

    poly[394] = 360;
    poly[395] = 160;

    poly[396] = 400;
    poly[397] = 120;

    poly[398] = 500;
    poly[399] = 160;

    poly[400] = 499;
    poly[401] = 145;

    poly[402] = 498;
    poly[403] = 130;

    poly[404] = 497;
    poly[405] = 120;

    poly[406] = 496;
    poly[407] = 110;

    poly[408] = 495;
    poly[409] = 100;

    poly[410] = 494;
    poly[411] = 80;

    poly[412] = 493;
    poly[413] = 70;

    poly[414] = 491;
    poly[415] = 60;

    poly[416] = 490;
    poly[417] = 50;

    poly[418] = 488;
    poly[419] = 40;

    poly[420] = 486;
    poly[421] = 35;

    poly[422] = 484;
    poly[423] = 30;

    poly[424] = 482;
    poly[425] = 25;

    poly[426] = 480;
    poly[427] = 20;

    poly[428] = 481;
    poly[429] = 30;

    poly[430] = 482;
    poly[431] = 50;

    poly[432] = 483;
    poly[433] = 80;

    poly[434] = 484;
    poly[435] = 110;

    poly[436] = 483;
    poly[437] = 120;

    poly[438] = 482;
    poly[439] = 130;

    poly[440] = 400;
    poly[441] = 100;

    poly[442] = 355;
    poly[443] = 145;

    poly[444] = 357;
    poly[445] = 135;

    poly[446] = 340;
    poly[447] = 114;

    poly[448] = 341;
    poly[449] = 120;

    poly[450] = 342;
    poly[451] = 125;

    poly[452] = 343;
    poly[453] = 130;

    poly[454] = 342;
    poly[455] = 135;

    poly[456] = 340;
    poly[457] = 140;

    poly[458] = 339;
    poly[459] = 138;

    poly[460] = 338;
    poly[461] = 136;

    poly[462] = 336;
    poly[463] = 135;

    poly[464] = 334;
    poly[465] = 134;

    poly[466] = 332;
    poly[467] = 133;

    poly[468] = 320;
    poly[469] = 132;

    poly[470] = 308;
    poly[471] = 133;

    poly[472] = 306;
    poly[473] = 134;

    poly[474] = 304;
    poly[475] = 135;

    poly[476] = 302;
    poly[477] = 136;

    poly[478] = 301;
    poly[479] = 138;

    poly[480] = 300;
    poly[481] = 140;

    poly[482] = 298;
    poly[483] = 135;

    poly[484] = 297;
    poly[485] = 130;

    poly[486] = 298;
    poly[487] = 125;

    poly[488] = 299;
    poly[489] = 120;

    poly[490] = 300;
    poly[491] = 114;

    poly[492] = 283;
    poly[493] = 135;

    poly[494] = 285;
    poly[495] = 145;

    poly[496] = 240;
    poly[497] = 100;

    poly[498] = 158;
    poly[499] = 130;

    poly[500] = 157;
    poly[501] = 120;

    poly[502] = 156;
    poly[503] = 110;

    poly[504] = 157;
    poly[505] = 80;

    poly[506] = 158;
    poly[507] = 50;

    poly[508] = 159;
    poly[509] = 30;

    initgraph(&gdriver, &gmode, "..//BGI");

    setfillstyle(1, RED);
    floodfill(20, 20, WHITE);
    setfillstyle(1, WHITE);
    fillpoly(255, poly);

    getch();
    closegraph();
    return 0;
}