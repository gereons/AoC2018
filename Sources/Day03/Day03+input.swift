//
// Advent of Code 2018 - input for day 03
//

extension Day03 {
static let rawInput = #"""
#1 @ 82,901: 26x12
#2 @ 8,540: 18x12
#3 @ 835,180: 23x13
#4 @ 690,544: 29x23
#5 @ 140,218: 18x12
#6 @ 366,229: 28x28
#7 @ 41,677: 18x17
#8 @ 569,685: 10x10
#9 @ 432,953: 13x20
#10 @ 411,225: 13x28
#11 @ 155,396: 28x26
#12 @ 590,968: 25x14
#13 @ 928,664: 18x15
#14 @ 733,903: 18x24
#15 @ 722,641: 17x20
#16 @ 930,579: 24x29
#17 @ 496,596: 23x13
#18 @ 724,650: 14x15
#19 @ 735,418: 27x10
#20 @ 265,936: 14x13
#21 @ 369,495: 14x14
#22 @ 12,203: 18x27
#23 @ 550,409: 21x19
#24 @ 756,58: 19x20
#25 @ 676,294: 29x22
#26 @ 983,152: 8x7
#27 @ 706,431: 18x23
#28 @ 249,118: 27x29
#29 @ 239,531: 11x22
#30 @ 339,916: 20x26
#31 @ 89,280: 27x20
#32 @ 264,844: 23x18
#33 @ 233,729: 29x27
#34 @ 885,845: 20x22
#35 @ 721,450: 11x22
#36 @ 113,661: 16x24
#37 @ 753,478: 29x22
#38 @ 530,92: 20x18
#39 @ 215,72: 28x14
#40 @ 694,750: 27x11
#41 @ 671,810: 22x11
#42 @ 141,515: 17x24
#43 @ 247,258: 14x24
#44 @ 13,6: 11x12
#45 @ 478,983: 25x11
#46 @ 568,522: 14x28
#47 @ 428,720: 25x21
#48 @ 872,518: 18x14
#49 @ 439,942: 26x28
#50 @ 14,68: 21x26
#51 @ 19,977: 11x23
#52 @ 139,203: 22x21
#53 @ 821,665: 29x20
#54 @ 957,936: 23x16
#55 @ 594,134: 13x27
#56 @ 21,617: 28x14
#57 @ 213,324: 20x27
#58 @ 266,456: 16x25
#59 @ 206,369: 14x13
#60 @ 77,374: 20x23
#61 @ 624,476: 16x29
#62 @ 301,425: 27x25
#63 @ 404,275: 29x12
#64 @ 170,14: 22x26
#65 @ 292,546: 29x27
#66 @ 897,27: 25x13
#67 @ 198,227: 21x13
#68 @ 910,355: 15x28
#69 @ 69,897: 27x29
#70 @ 507,916: 23x20
#71 @ 712,413: 12x17
#72 @ 895,851: 12x20
#73 @ 820,946: 19x20
#74 @ 33,317: 16x19
#75 @ 800,810: 27x19
#76 @ 103,18: 18x16
#77 @ 383,884: 23x14
#78 @ 222,262: 12x10
#79 @ 277,562: 16x13
#80 @ 606,631: 27x13
#81 @ 141,532: 24x21
#82 @ 862,495: 4x7
#83 @ 456,216: 15x17
#84 @ 165,53: 12x21
#85 @ 273,74: 10x20
#86 @ 471,831: 17x17
#87 @ 662,452: 13x10
#88 @ 567,255: 14x22
#89 @ 473,836: 8x4
#90 @ 813,854: 14x18
#91 @ 24,966: 15x20
#92 @ 120,537: 15x24
#93 @ 122,957: 28x15
#94 @ 46,800: 10x10
#95 @ 132,650: 15x13
#96 @ 400,543: 17x29
#97 @ 739,868: 13x26
#98 @ 805,576: 27x19
#99 @ 393,673: 25x27
#100 @ 499,695: 24x28
#101 @ 534,393: 28x27
#102 @ 294,720: 16x25
#103 @ 436,878: 25x25
#104 @ 273,522: 21x23
#105 @ 194,364: 22x15
#106 @ 183,754: 17x14
#107 @ 423,42: 26x10
#108 @ 197,420: 20x24
#109 @ 32,317: 20x14
#110 @ 440,876: 23x23
#111 @ 803,971: 28x10
#112 @ 458,558: 28x28
#113 @ 462,896: 10x29
#114 @ 143,725: 15x16
#115 @ 611,629: 15x18
#116 @ 0,239: 25x15
#117 @ 160,485: 11x17
#118 @ 383,457: 24x22
#119 @ 96,823: 28x26
#120 @ 557,936: 19x10
#121 @ 178,3: 14x27
#122 @ 353,296: 24x23
#123 @ 424,829: 13x29
#124 @ 714,415: 5x11
#125 @ 501,66: 14x5
#126 @ 302,637: 27x20
#127 @ 266,64: 11x26
#128 @ 725,348: 13x25
#129 @ 710,543: 24x18
#130 @ 204,907: 29x22
#131 @ 900,528: 22x19
#132 @ 177,469: 16x27
#133 @ 483,932: 12x26
#134 @ 950,16: 24x29
#135 @ 431,936: 22x25
#136 @ 508,879: 11x26
#137 @ 468,819: 16x25
#138 @ 262,104: 25x14
#139 @ 309,933: 21x12
#140 @ 801,805: 23x18
#141 @ 671,967: 21x15
#142 @ 794,251: 23x19
#143 @ 957,482: 17x29
#144 @ 61,684: 23x28
#145 @ 191,824: 24x29
#146 @ 772,315: 14x20
#147 @ 883,493: 12x22
#148 @ 4,238: 22x18
#149 @ 962,488: 29x23
#150 @ 159,896: 12x26
#151 @ 315,903: 13x16
#152 @ 979,857: 12x20
#153 @ 339,935: 22x11
#154 @ 543,92: 12x27
#155 @ 697,500: 22x25
#156 @ 431,682: 15x26
#157 @ 134,754: 25x27
#158 @ 723,216: 18x14
#159 @ 682,387: 16x23
#160 @ 460,909: 15x19
#161 @ 926,661: 21x16
#162 @ 194,274: 14x12
#163 @ 113,158: 27x24
#164 @ 496,672: 29x13
#165 @ 490,44: 16x13
#166 @ 44,184: 13x21
#167 @ 812,722: 21x28
#168 @ 691,132: 21x29
#169 @ 242,732: 11x11
#170 @ 965,231: 18x28
#171 @ 201,315: 27x24
#172 @ 454,833: 20x15
#173 @ 50,509: 29x28
#174 @ 526,590: 16x17
#175 @ 885,743: 14x19
#176 @ 38,933: 23x24
#177 @ 691,166: 27x13
#178 @ 261,108: 23x12
#179 @ 532,332: 16x13
#180 @ 18,86: 29x12
#181 @ 385,425: 15x13
#182 @ 695,490: 25x16
#183 @ 127,959: 15x18
#184 @ 86,789: 23x24
#185 @ 242,613: 23x19
#186 @ 445,334: 23x24
#187 @ 474,350: 25x25
#188 @ 921,905: 26x19
#189 @ 558,277: 20x23
#190 @ 320,323: 29x29
#191 @ 449,68: 12x28
#192 @ 375,934: 11x13
#193 @ 107,323: 29x11
#194 @ 563,587: 29x24
#195 @ 957,590: 13x27
#196 @ 442,241: 16x10
#197 @ 518,602: 18x10
#198 @ 569,526: 25x27
#199 @ 556,400: 12x28
#200 @ 659,301: 26x16
#201 @ 833,350: 29x13
#202 @ 96,835: 10x14
#203 @ 231,902: 27x26
#204 @ 78,168: 23x11
#205 @ 57,937: 19x13
#206 @ 167,762: 21x22
#207 @ 251,506: 17x23
#208 @ 864,536: 21x14
#209 @ 605,488: 15x26
#210 @ 345,368: 27x18
#211 @ 974,247: 25x24
#212 @ 253,493: 12x27
#213 @ 141,86: 10x17
#214 @ 257,115: 16x12
#215 @ 110,949: 28x11
#216 @ 323,910: 18x26
#217 @ 908,433: 27x17
#218 @ 688,866: 25x12
#219 @ 598,308: 14x23
#220 @ 72,203: 12x12
#221 @ 114,187: 15x27
#222 @ 191,808: 28x11
#223 @ 297,332: 18x12
#224 @ 664,894: 12x25
#225 @ 691,839: 17x12
#226 @ 182,538: 26x24
#227 @ 435,670: 10x23
#228 @ 535,365: 22x19
#229 @ 785,642: 21x10
#230 @ 666,452: 10x20
#231 @ 239,577: 20x25
#232 @ 591,493: 23x14
#233 @ 823,513: 12x27
#234 @ 932,470: 22x15
#235 @ 639,207: 22x13
#236 @ 690,546: 10x16
#237 @ 192,110: 16x16
#238 @ 828,193: 26x26
#239 @ 749,423: 20x23
#240 @ 892,415: 16x28
#241 @ 423,955: 25x20
#242 @ 864,302: 21x18
#243 @ 538,344: 17x28
#244 @ 324,259: 25x17
#245 @ 659,851: 23x18
#246 @ 905,868: 27x27
#247 @ 566,519: 12x19
#248 @ 30,552: 28x10
#249 @ 419,314: 13x26
#250 @ 938,294: 25x12
#251 @ 70,361: 10x16
#252 @ 679,143: 26x14
#253 @ 911,499: 18x23
#254 @ 385,914: 18x14
#255 @ 562,134: 13x16
#256 @ 117,368: 19x17
#257 @ 32,315: 11x17
#258 @ 741,550: 11x24
#259 @ 729,317: 14x17
#260 @ 7,944: 28x28
#261 @ 479,603: 29x17
#262 @ 341,958: 23x10
#263 @ 599,451: 16x19
#264 @ 605,136: 13x18
#265 @ 569,276: 23x13
#266 @ 787,857: 13x16
#267 @ 939,324: 19x17
#268 @ 781,866: 12x13
#269 @ 289,740: 22x11
#270 @ 347,238: 11x19
#271 @ 843,569: 25x13
#272 @ 81,371: 11x14
#273 @ 411,58: 21x27
#274 @ 607,517: 16x22
#275 @ 301,927: 28x23
#276 @ 410,191: 17x17
#277 @ 262,67: 29x12
#278 @ 246,184: 12x11
#279 @ 213,16: 29x25
#280 @ 941,292: 16x13
#281 @ 91,756: 27x14
#282 @ 936,975: 13x14
#283 @ 262,820: 13x27
#284 @ 480,127: 24x27
#285 @ 935,973: 14x17
#286 @ 320,607: 25x25
#287 @ 967,117: 20x22
#288 @ 517,724: 10x25
#289 @ 438,751: 10x19
#290 @ 672,465: 15x27
#291 @ 813,834: 23x11
#292 @ 699,174: 20x25
#293 @ 436,775: 17x16
#294 @ 601,209: 16x19
#295 @ 732,372: 15x29
#296 @ 931,378: 22x27
#297 @ 312,778: 24x22
#298 @ 47,100: 24x19
#299 @ 340,115: 15x14
#300 @ 581,375: 29x20
#301 @ 122,679: 3x4
#302 @ 422,780: 27x14
#303 @ 818,464: 11x17
#304 @ 518,142: 18x24
#305 @ 49,523: 19x17
#306 @ 87,157: 15x28
#307 @ 801,509: 18x21
#308 @ 525,189: 18x12
#309 @ 670,832: 11x12
#310 @ 276,752: 24x20
#311 @ 695,834: 12x10
#312 @ 709,479: 11x20
#313 @ 751,72: 24x10
#314 @ 841,794: 24x19
#315 @ 503,134: 15x24
#316 @ 591,959: 22x12
#317 @ 184,598: 19x10
#318 @ 768,496: 28x25
#319 @ 243,676: 22x26
#320 @ 225,530: 17x29
#321 @ 90,675: 24x17
#322 @ 898,801: 20x10
#323 @ 287,756: 17x28
#324 @ 629,199: 11x14
#325 @ 631,532: 25x15
#326 @ 448,317: 18x15
#327 @ 789,865: 11x20
#328 @ 520,548: 18x27
#329 @ 336,49: 29x17
#330 @ 657,506: 17x22
#331 @ 298,426: 17x23
#332 @ 615,965: 23x28
#333 @ 780,52: 25x29
#334 @ 556,961: 23x19
#335 @ 196,191: 11x13
#336 @ 230,262: 12x11
#337 @ 683,161: 19x25
#338 @ 31,615: 19x15
#339 @ 762,856: 15x22
#340 @ 323,370: 28x26
#341 @ 466,328: 23x12
#342 @ 757,863: 29x23
#343 @ 837,672: 12x14
#344 @ 650,41: 14x13
#345 @ 175,297: 11x29
#346 @ 300,414: 10x25
#347 @ 827,107: 15x22
#348 @ 348,89: 17x10
#349 @ 940,726: 18x14
#350 @ 446,300: 23x23
#351 @ 32,331: 28x12
#352 @ 615,491: 26x27
#353 @ 343,223: 26x18
#354 @ 598,371: 25x12
#355 @ 682,687: 20x24
#356 @ 27,93: 22x16
#357 @ 239,10: 14x27
#358 @ 151,886: 18x23
#359 @ 940,849: 20x29
#360 @ 282,65: 19x21
#361 @ 933,65: 27x23
#362 @ 26,264: 21x19
#363 @ 683,418: 23x25
#364 @ 882,313: 14x19
#365 @ 200,686: 19x24
#366 @ 36,809: 15x11
#367 @ 764,312: 21x24
#368 @ 448,757: 18x27
#369 @ 513,644: 20x18
#370 @ 482,740: 14x27
#371 @ 709,6: 25x17
#372 @ 259,234: 12x28
#373 @ 659,145: 23x16
#374 @ 514,954: 11x26
#375 @ 575,937: 17x28
#376 @ 484,892: 25x12
#377 @ 897,857: 7x7
#378 @ 36,103: 18x19
#379 @ 458,212: 17x21
#380 @ 499,62: 19x13
#381 @ 200,51: 24x21
#382 @ 675,243: 14x23
#383 @ 73,182: 28x23
#384 @ 442,326: 23x14
#385 @ 375,675: 23x22
#386 @ 266,350: 10x25
#387 @ 545,31: 16x28
#388 @ 439,672: 12x23
#389 @ 328,221: 29x24
#390 @ 844,643: 20x12
#391 @ 474,896: 14x27
#392 @ 666,35: 23x12
#393 @ 228,29: 15x12
#394 @ 844,241: 21x11
#395 @ 785,632: 16x20
#396 @ 885,458: 28x29
#397 @ 648,554: 19x21
#398 @ 809,169: 25x13
#399 @ 797,380: 16x11
#400 @ 512,621: 16x28
#401 @ 892,19: 19x14
#402 @ 376,194: 23x10
#403 @ 436,667: 13x11
#404 @ 25,550: 11x27
#405 @ 546,863: 28x26
#406 @ 129,530: 17x10
#407 @ 304,965: 26x16
#408 @ 877,630: 29x11
#409 @ 226,47: 23x10
#410 @ 28,293: 21x26
#411 @ 199,185: 25x20
#412 @ 249,50: 12x28
#413 @ 702,643: 29x18
#414 @ 326,485: 16x24
#415 @ 662,142: 25x10
#416 @ 463,382: 26x12
#417 @ 786,731: 15x18
#418 @ 440,797: 21x15
#419 @ 674,673: 14x11
#420 @ 191,722: 11x26
#421 @ 903,117: 15x14
#422 @ 330,14: 21x15
#423 @ 240,160: 19x29
#424 @ 636,380: 16x24
#425 @ 802,821: 10x19
#426 @ 496,587: 22x28
#427 @ 586,314: 16x29
#428 @ 936,107: 12x13
#429 @ 276,794: 10x21
#430 @ 495,148: 15x27
#431 @ 500,318: 29x12
#432 @ 49,545: 27x14
#433 @ 83,841: 11x19
#434 @ 139,425: 10x20
#435 @ 332,730: 26x25
#436 @ 108,919: 15x27
#437 @ 191,598: 10x16
#438 @ 683,707: 21x26
#439 @ 835,356: 22x10
#440 @ 807,809: 10x29
#441 @ 55,65: 12x10
#442 @ 422,40: 12x10
#443 @ 922,618: 12x26
#444 @ 478,69: 29x16
#445 @ 883,171: 26x12
#446 @ 377,58: 20x23
#447 @ 155,628: 23x26
#448 @ 264,334: 19x19
#449 @ 158,748: 14x10
#450 @ 625,490: 28x23
#451 @ 239,459: 23x21
#452 @ 636,19: 29x27
#453 @ 205,811: 11x23
#454 @ 170,212: 16x25
#455 @ 90,922: 27x14
#456 @ 956,39: 15x10
#457 @ 238,586: 19x25
#458 @ 463,150: 18x22
#459 @ 88,366: 16x11
#460 @ 170,177: 11x19
#461 @ 647,261: 17x26
#462 @ 502,693: 20x25
#463 @ 631,435: 28x19
#464 @ 409,53: 26x19
#465 @ 875,106: 27x26
#466 @ 632,722: 11x27
#467 @ 618,231: 28x13
#468 @ 845,370: 18x29
#469 @ 641,137: 10x14
#470 @ 587,379: 14x5
#471 @ 15,415: 28x11
#472 @ 337,409: 10x18
#473 @ 749,673: 26x20
#474 @ 27,736: 25x19
#475 @ 943,462: 17x16
#476 @ 580,432: 20x20
#477 @ 244,592: 16x13
#478 @ 903,733: 20x25
#479 @ 755,736: 16x19
#480 @ 786,864: 12x15
#481 @ 659,329: 22x11
#482 @ 474,122: 16x14
#483 @ 871,849: 22x16
#484 @ 524,849: 19x23
#485 @ 714,890: 13x15
#486 @ 836,782: 19x24
#487 @ 562,528: 12x15
#488 @ 301,71: 23x13
#489 @ 309,715: 25x17
#490 @ 253,802: 25x22
#491 @ 264,53: 17x29
#492 @ 112,952: 17x19
#493 @ 585,377: 20x16
#494 @ 679,396: 29x27
#495 @ 104,31: 21x11
#496 @ 367,892: 17x26
#497 @ 89,193: 28x10
#498 @ 734,541: 11x10
#499 @ 938,416: 18x25
#500 @ 90,845: 13x16
#501 @ 267,491: 19x27
#502 @ 519,145: 20x22
#503 @ 144,468: 20x15
#504 @ 104,244: 12x12
#505 @ 592,914: 23x18
#506 @ 852,562: 11x18
#507 @ 611,205: 29x27
#508 @ 429,7: 12x26
#509 @ 223,325: 11x24
#510 @ 845,201: 16x12
#511 @ 680,691: 15x20
#512 @ 365,494: 28x24
#513 @ 5,0: 25x12
#514 @ 319,848: 12x24
#515 @ 7,834: 27x10
#516 @ 731,346: 26x11
#517 @ 772,340: 13x20
#518 @ 168,466: 26x28
#519 @ 757,420: 14x10
#520 @ 665,908: 23x29
#521 @ 807,961: 10x14
#522 @ 942,456: 11x21
#523 @ 719,811: 29x25
#524 @ 476,211: 21x28
#525 @ 766,90: 15x20
#526 @ 747,410: 16x20
#527 @ 443,756: 25x14
#528 @ 741,847: 29x28
#529 @ 970,782: 22x16
#530 @ 167,710: 25x16
#531 @ 209,468: 11x22
#532 @ 267,279: 25x11
#533 @ 458,60: 23x18
#534 @ 196,579: 14x14
#535 @ 537,408: 20x23
#536 @ 750,862: 29x19
#537 @ 301,780: 25x12
#538 @ 298,669: 10x11
#539 @ 389,801: 25x17
#540 @ 677,468: 10x15
#541 @ 751,325: 27x25
#542 @ 757,466: 12x27
#543 @ 700,146: 18x14
#544 @ 800,45: 24x25
#545 @ 297,545: 15x10
#546 @ 948,383: 29x24
#547 @ 939,77: 26x15
#548 @ 218,948: 11x24
#549 @ 704,814: 12x13
#550 @ 801,373: 23x13
#551 @ 268,254: 20x12
#552 @ 494,923: 17x22
#553 @ 730,169: 19x18
#554 @ 39,255: 12x26
#555 @ 169,191: 18x15
#556 @ 359,553: 21x26
#557 @ 228,212: 23x10
#558 @ 485,754: 7x6
#559 @ 965,910: 28x24
#560 @ 400,790: 23x22
#561 @ 653,33: 22x13
#562 @ 161,647: 12x16
#563 @ 654,697: 3x12
#564 @ 183,66: 27x10
#565 @ 758,708: 29x24
#566 @ 298,622: 26x27
#567 @ 799,301: 26x20
#568 @ 12,528: 16x22
#569 @ 701,473: 10x13
#570 @ 238,324: 16x27
#571 @ 652,691: 10x23
#572 @ 169,618: 25x11
#573 @ 915,792: 10x28
#574 @ 450,848: 24x18
#575 @ 23,311: 26x13
#576 @ 346,302: 25x23
#577 @ 652,275: 14x15
#578 @ 791,311: 20x21
#579 @ 907,148: 28x16
#580 @ 559,395: 15x14
#581 @ 422,723: 24x14
#582 @ 859,99: 16x21
#583 @ 217,69: 12x10
#584 @ 206,313: 24x15
#585 @ 716,317: 19x15
#586 @ 172,893: 15x16
#587 @ 734,377: 12x12
#588 @ 565,260: 16x13
#589 @ 762,574: 13x11
#590 @ 21,303: 26x28
#591 @ 814,708: 24x17
#592 @ 267,797: 25x18
#593 @ 211,464: 10x12
#594 @ 799,583: 18x22
#595 @ 213,351: 10x14
#596 @ 901,794: 20x23
#597 @ 589,749: 29x21
#598 @ 217,335: 28x28
#599 @ 574,287: 10x29
#600 @ 125,14: 23x25
#601 @ 40,690: 26x29
#602 @ 973,247: 13x23
#603 @ 734,422: 24x19
#604 @ 880,539: 17x13
#605 @ 501,974: 19x21
#606 @ 613,746: 22x29
#607 @ 569,752: 5x10
#608 @ 50,785: 12x27
#609 @ 222,7: 19x10
#610 @ 510,857: 23x29
#611 @ 873,342: 14x29
#612 @ 368,65: 10x23
#613 @ 705,490: 26x11
#614 @ 193,454: 15x16
#615 @ 942,669: 21x26
#616 @ 795,960: 29x29
#617 @ 681,555: 26x29
#618 @ 877,685: 19x28
#619 @ 158,482: 17x27
#620 @ 123,166: 18x20
#621 @ 409,733: 29x28
#622 @ 701,843: 12x13
#623 @ 808,459: 11x20
#624 @ 105,699: 27x13
#625 @ 191,421: 19x26
#626 @ 465,120: 28x11
#627 @ 91,793: 17x11
#628 @ 755,345: 27x27
#629 @ 778,268: 20x22
#630 @ 141,487: 27x11
#631 @ 399,938: 17x25
#632 @ 201,771: 17x18
#633 @ 582,373: 17x29
#634 @ 3,944: 10x12
#635 @ 488,320: 19x15
#636 @ 358,642: 24x26
#637 @ 881,90: 18x20
#638 @ 930,857: 21x16
#639 @ 753,535: 15x25
#640 @ 527,135: 22x18
#641 @ 514,742: 12x21
#642 @ 617,21: 18x10
#643 @ 821,348: 25x22
#644 @ 721,764: 19x13
#645 @ 865,158: 23x11
#646 @ 275,62: 19x27
#647 @ 378,413: 23x28
#648 @ 498,667: 13x16
#649 @ 308,97: 28x10
#650 @ 111,377: 16x22
#651 @ 242,461: 26x18
#652 @ 890,178: 26x24
#653 @ 489,320: 26x16
#654 @ 667,368: 19x17
#655 @ 730,859: 16x25
#656 @ 356,215: 16x25
#657 @ 634,29: 24x12
#658 @ 805,663: 12x25
#659 @ 293,541: 21x10
#660 @ 642,287: 28x23
#661 @ 785,105: 27x15
#662 @ 370,198: 25x15
#663 @ 205,462: 18x24
#664 @ 205,936: 28x26
#665 @ 241,12: 8x22
#666 @ 204,237: 25x12
#667 @ 40,412: 17x25
#668 @ 643,313: 23x28
#669 @ 527,144: 10x28
#670 @ 677,936: 10x20
#671 @ 774,575: 16x23
#672 @ 387,676: 15x20
#673 @ 768,335: 18x12
#674 @ 878,746: 29x16
#675 @ 203,826: 12x24
#676 @ 82,762: 27x15
#677 @ 500,536: 21x28
#678 @ 982,378: 13x21
#679 @ 724,803: 19x18
#680 @ 856,232: 11x25
#681 @ 728,114: 29x29
#682 @ 704,175: 14x10
#683 @ 755,824: 28x23
#684 @ 651,523: 12x29
#685 @ 331,25: 20x21
#686 @ 881,335: 20x17
#687 @ 563,498: 21x15
#688 @ 370,414: 29x19
#689 @ 70,946: 22x13
#690 @ 450,319: 12x9
#691 @ 905,812: 29x12
#692 @ 383,954: 17x22
#693 @ 149,726: 14x18
#694 @ 793,315: 14x13
#695 @ 426,624: 15x17
#696 @ 264,390: 22x19
#697 @ 708,747: 27x14
#698 @ 837,319: 14x29
#699 @ 266,260: 27x17
#700 @ 765,14: 11x14
#701 @ 188,260: 23x20
#702 @ 420,264: 22x13
#703 @ 150,536: 21x23
#704 @ 356,535: 19x25
#705 @ 203,545: 29x15
#706 @ 374,270: 27x20
#707 @ 906,380: 11x26
#708 @ 901,418: 27x23
#709 @ 323,764: 15x23
#710 @ 635,488: 12x21
#711 @ 236,550: 21x24
#712 @ 693,826: 22x22
#713 @ 720,9: 10x10
#714 @ 315,105: 29x13
#715 @ 374,286: 25x12
#716 @ 609,904: 15x29
#717 @ 661,363: 26x19
#718 @ 776,347: 18x26
#719 @ 91,246: 26x23
#720 @ 664,786: 11x21
#721 @ 868,518: 12x20
#722 @ 577,203: 26x26
#723 @ 793,723: 23x26
#724 @ 803,137: 12x25
#725 @ 576,728: 14x23
#726 @ 719,109: 15x14
#727 @ 671,423: 22x12
#728 @ 970,677: 17x26
#729 @ 647,467: 20x10
#730 @ 350,705: 29x29
#731 @ 791,958: 21x26
#732 @ 952,566: 8x8
#733 @ 829,110: 18x27
#734 @ 383,177: 21x20
#735 @ 480,352: 7x16
#736 @ 873,745: 10x14
#737 @ 43,701: 26x10
#738 @ 564,482: 16x10
#739 @ 421,247: 23x19
#740 @ 674,932: 18x11
#741 @ 102,75: 24x28
#742 @ 810,287: 11x22
#743 @ 803,499: 19x25
#744 @ 941,358: 14x25
#745 @ 336,495: 27x21
#746 @ 445,393: 21x19
#747 @ 745,411: 29x23
#748 @ 236,797: 27x21
#749 @ 890,702: 15x27
#750 @ 714,214: 15x26
#751 @ 191,915: 25x24
#752 @ 492,722: 14x28
#753 @ 916,441: 12x23
#754 @ 254,231: 29x14
#755 @ 746,172: 22x11
#756 @ 693,444: 29x11
#757 @ 398,644: 15x17
#758 @ 781,180: 11x28
#759 @ 918,285: 20x18
#760 @ 407,919: 13x28
#761 @ 269,402: 19x11
#762 @ 496,46: 5x6
#763 @ 591,911: 16x20
#764 @ 248,586: 18x18
#765 @ 343,960: 21x16
#766 @ 832,313: 10x17
#767 @ 906,441: 24x10
#768 @ 121,953: 21x28
#769 @ 204,343: 12x29
#770 @ 664,228: 14x24
#771 @ 819,559: 15x14
#772 @ 111,3: 26x18
#773 @ 898,46: 13x10
#774 @ 320,780: 12x13
#775 @ 664,230: 18x27
#776 @ 22,736: 15x16
#777 @ 189,927: 29x16
#778 @ 392,416: 19x20
#779 @ 920,793: 17x20
#780 @ 138,99: 11x10
#781 @ 385,946: 17x12
#782 @ 317,420: 29x17
#783 @ 291,967: 28x11
#784 @ 365,493: 10x16
#785 @ 502,978: 18x15
#786 @ 566,464: 29x17
#787 @ 925,873: 20x13
#788 @ 364,250: 17x28
#789 @ 514,324: 26x15
#790 @ 513,901: 14x19
#791 @ 839,217: 26x19
#792 @ 791,171: 11x19
#793 @ 904,635: 18x19
#794 @ 262,789: 10x15
#795 @ 323,107: 19x10
#796 @ 28,528: 29x26
#797 @ 129,409: 12x12
#798 @ 638,405: 11x22
#799 @ 288,42: 20x25
#800 @ 579,280: 18x25
#801 @ 446,908: 13x26
#802 @ 465,334: 28x20
#803 @ 874,154: 24x23
#804 @ 799,44: 23x18
#805 @ 510,185: 18x11
#806 @ 10,856: 16x16
#807 @ 552,924: 11x25
#808 @ 567,746: 10x23
#809 @ 862,633: 18x21
#810 @ 125,407: 17x19
#811 @ 336,769: 22x13
#812 @ 383,463: 10x17
#813 @ 843,622: 22x23
#814 @ 363,793: 12x29
#815 @ 762,472: 5x4
#816 @ 672,549: 21x17
#817 @ 255,468: 17x19
#818 @ 24,930: 27x29
#819 @ 451,666: 16x11
#820 @ 567,688: 14x13
#821 @ 526,42: 14x11
#822 @ 262,213: 10x28
#823 @ 874,352: 16x26
#824 @ 839,783: 11x11
#825 @ 143,434: 25x16
#826 @ 936,834: 25x18
#827 @ 350,88: 11x26
#828 @ 199,648: 27x20
#829 @ 922,379: 14x21
#830 @ 958,477: 12x17
#831 @ 103,63: 23x14
#832 @ 125,746: 29x13
#833 @ 951,933: 17x10
#834 @ 235,809: 22x26
#835 @ 55,710: 16x15
#836 @ 701,807: 14x24
#837 @ 345,422: 15x16
#838 @ 837,786: 12x14
#839 @ 26,290: 18x28
#840 @ 554,870: 18x24
#841 @ 233,14: 14x27
#842 @ 345,267: 19x11
#843 @ 830,526: 13x22
#844 @ 951,354: 15x21
#845 @ 367,192: 26x15
#846 @ 368,695: 18x12
#847 @ 352,758: 27x18
#848 @ 629,694: 13x12
#849 @ 218,666: 23x23
#850 @ 970,688: 12x10
#851 @ 764,100: 13x10
#852 @ 52,590: 19x3
#853 @ 884,466: 28x21
#854 @ 829,73: 24x26
#855 @ 32,71: 24x16
#856 @ 411,289: 17x25
#857 @ 174,635: 11x26
#858 @ 150,875: 26x12
#859 @ 468,847: 10x21
#860 @ 23,929: 10x12
#861 @ 279,75: 28x27
#862 @ 220,966: 23x13
#863 @ 236,17: 13x21
#864 @ 53,801: 10x13
#865 @ 903,362: 26x28
#866 @ 146,515: 15x26
#867 @ 236,379: 10x19
#868 @ 705,227: 17x20
#869 @ 146,398: 20x14
#870 @ 200,585: 26x21
#871 @ 905,46: 18x19
#872 @ 323,24: 29x26
#873 @ 976,846: 16x14
#874 @ 437,808: 14x29
#875 @ 641,417: 28x19
#876 @ 508,390: 23x29
#877 @ 548,354: 15x18
#878 @ 152,975: 26x20
#879 @ 880,750: 16x24
#880 @ 452,785: 29x25
#881 @ 482,338: 26x18
#882 @ 516,899: 10x13
#883 @ 628,481: 16x27
#884 @ 76,200: 15x22
#885 @ 544,97: 26x21
#886 @ 491,19: 16x23
#887 @ 86,770: 23x20
#888 @ 369,794: 10x26
#889 @ 78,950: 11x26
#890 @ 874,425: 14x10
#891 @ 482,945: 29x10
#892 @ 768,5: 29x24
#893 @ 562,400: 17x7
#894 @ 587,928: 15x13
#895 @ 134,526: 28x18
#896 @ 148,67: 27x26
#897 @ 188,861: 16x15
#898 @ 725,374: 22x22
#899 @ 916,792: 14x13
#900 @ 704,497: 10x23
#901 @ 392,935: 16x15
#902 @ 358,407: 12x14
#903 @ 429,322: 20x10
#904 @ 929,780: 23x28
#905 @ 683,974: 26x15
#906 @ 728,547: 17x22
#907 @ 803,130: 15x18
#908 @ 330,933: 14x21
#909 @ 964,788: 25x19
#910 @ 731,800: 12x23
#911 @ 301,833: 12x23
#912 @ 507,382: 13x11
#913 @ 766,6: 15x16
#914 @ 293,510: 19x14
#915 @ 534,93: 19x16
#916 @ 984,912: 10x14
#917 @ 915,133: 15x18
#918 @ 336,521: 22x17
#919 @ 325,430: 18x28
#920 @ 907,98: 29x28
#921 @ 651,555: 10x19
#922 @ 314,321: 26x22
#923 @ 550,111: 12x16
#924 @ 543,464: 20x11
#925 @ 932,621: 16x21
#926 @ 169,201: 24x17
#927 @ 670,439: 13x17
#928 @ 172,316: 19x27
#929 @ 84,839: 24x28
#930 @ 732,391: 13x20
#931 @ 166,367: 29x29
#932 @ 673,808: 24x22
#933 @ 26,246: 14x28
#934 @ 49,585: 28x19
#935 @ 741,801: 28x16
#936 @ 303,817: 27x27
#937 @ 795,864: 22x20
#938 @ 981,147: 18x25
#939 @ 116,746: 19x27
#940 @ 735,930: 28x16
#941 @ 118,462: 21x12
#942 @ 560,398: 26x13
#943 @ 562,115: 11x25
#944 @ 740,863: 12x24
#945 @ 661,461: 14x20
#946 @ 71,700: 15x16
#947 @ 485,540: 15x21
#948 @ 369,689: 22x25
#949 @ 639,707: 10x15
#950 @ 929,920: 18x23
#951 @ 943,232: 23x19
#952 @ 336,760: 6x13
#953 @ 705,430: 27x19
#954 @ 443,90: 15x16
#955 @ 61,350: 27x29
#956 @ 752,571: 15x28
#957 @ 17,511: 26x25
#958 @ 298,316: 15x19
#959 @ 632,367: 20x24
#960 @ 688,233: 13x26
#961 @ 649,747: 19x24
#962 @ 415,331: 14x29
#963 @ 17,200: 23x14
#964 @ 209,835: 15x15
#965 @ 816,644: 12x11
#966 @ 31,102: 18x19
#967 @ 559,376: 24x29
#968 @ 662,467: 27x20
#969 @ 261,615: 24x29
#970 @ 744,908: 11x24
#971 @ 832,229: 27x13
#972 @ 266,219: 14x25
#973 @ 306,724: 10x18
#974 @ 120,668: 12x29
#975 @ 775,836: 20x14
#976 @ 941,805: 20x18
#977 @ 461,370: 10x18
#978 @ 821,538: 12x26
#979 @ 799,500: 14x10
#980 @ 883,472: 18x25
#981 @ 132,677: 29x28
#982 @ 26,54: 18x18
#983 @ 659,394: 26x17
#984 @ 501,13: 17x14
#985 @ 633,470: 18x16
#986 @ 518,861: 21x27
#987 @ 658,53: 17x19
#988 @ 898,487: 19x13
#989 @ 141,209: 21x20
#990 @ 23,245: 26x25
#991 @ 882,630: 19x26
#992 @ 339,39: 11x18
#993 @ 505,167: 17x14
#994 @ 348,312: 17x15
#995 @ 442,801: 22x27
#996 @ 963,496: 10x14
#997 @ 658,50: 25x20
#998 @ 138,573: 25x21
#999 @ 819,101: 29x16
#1000 @ 470,160: 25x12
#1001 @ 973,681: 19x25
#1002 @ 756,596: 24x20
#1003 @ 87,295: 29x16
#1004 @ 745,538: 21x28
#1005 @ 390,199: 28x18
#1006 @ 829,339: 12x10
#1007 @ 687,814: 17x19
#1008 @ 277,661: 26x18
#1009 @ 145,538: 24x12
#1010 @ 534,31: 13x24
#1011 @ 459,349: 21x26
#1012 @ 447,98: 6x3
#1013 @ 643,769: 22x23
#1014 @ 813,85: 25x16
#1015 @ 364,922: 18x21
#1016 @ 419,628: 18x18
#1017 @ 43,683: 22x26
#1018 @ 749,752: 28x27
#1019 @ 774,69: 28x22
#1020 @ 940,438: 11x24
#1021 @ 218,941: 25x27
#1022 @ 609,213: 12x28
#1023 @ 333,753: 19x24
#1024 @ 115,255: 27x18
#1025 @ 153,459: 21x20
#1026 @ 809,650: 11x12
#1027 @ 883,745: 24x11
#1028 @ 473,915: 18x28
#1029 @ 362,179: 22x20
#1030 @ 440,909: 23x13
#1031 @ 943,198: 10x17
#1032 @ 194,834: 24x20
#1033 @ 727,774: 28x16
#1034 @ 882,639: 14x17
#1035 @ 385,416: 11x17
#1036 @ 895,312: 26x12
#1037 @ 597,569: 28x22
#1038 @ 482,924: 10x28
#1039 @ 858,384: 22x11
#1040 @ 900,417: 27x22
#1041 @ 884,432: 29x10
#1042 @ 576,424: 28x27
#1043 @ 833,176: 29x13
#1044 @ 508,703: 14x20
#1045 @ 759,343: 12x16
#1046 @ 803,510: 17x19
#1047 @ 36,34: 17x29
#1048 @ 280,569: 29x23
#1049 @ 162,858: 24x20
#1050 @ 647,492: 25x13
#1051 @ 595,535: 14x20
#1052 @ 749,692: 11x21
#1053 @ 876,13: 15x18
#1054 @ 696,644: 28x21
#1055 @ 958,237: 27x27
#1056 @ 588,230: 25x20
#1057 @ 97,782: 13x14
#1058 @ 410,816: 27x24
#1059 @ 959,498: 27x18
#1060 @ 915,274: 20x17
#1061 @ 226,267: 8x20
#1062 @ 888,307: 20x27
#1063 @ 609,983: 10x12
#1064 @ 959,676: 17x13
#1065 @ 249,603: 18x21
#1066 @ 507,159: 29x29
#1067 @ 846,490: 25x17
#1068 @ 131,672: 28x18
#1069 @ 153,487: 22x13
#1070 @ 713,426: 10x14
#1071 @ 334,584: 23x28
#1072 @ 721,228: 25x14
#1073 @ 591,142: 16x18
#1074 @ 236,359: 17x21
#1075 @ 490,939: 12x27
#1076 @ 643,139: 4x4
#1077 @ 915,599: 19x15
#1078 @ 237,278: 10x23
#1079 @ 124,444: 21x29
#1080 @ 663,415: 17x10
#1081 @ 954,599: 20x16
#1082 @ 584,450: 24x16
#1083 @ 974,918: 18x24
#1084 @ 202,931: 12x27
#1085 @ 502,921: 16x17
#1086 @ 231,720: 13x14
#1087 @ 665,135: 17x24
#1088 @ 962,217: 10x18
#1089 @ 164,886: 22x16
#1090 @ 128,239: 14x24
#1091 @ 361,439: 28x23
#1092 @ 363,413: 13x11
#1093 @ 448,701: 18x25
#1094 @ 413,235: 24x19
#1095 @ 47,180: 11x25
#1096 @ 615,515: 13x18
#1097 @ 188,690: 18x13
#1098 @ 399,66: 25x25
#1099 @ 96,698: 18x23
#1100 @ 940,174: 13x27
#1101 @ 319,508: 18x21
#1102 @ 122,539: 5x17
#1103 @ 620,222: 11x21
#1104 @ 245,214: 22x15
#1105 @ 432,28: 27x17
#1106 @ 844,284: 26x12
#1107 @ 268,490: 29x23
#1108 @ 186,463: 27x16
#1109 @ 338,26: 12x13
#1110 @ 191,467: 10x24
#1111 @ 1,840: 16x20
#1112 @ 635,503: 12x12
#1113 @ 463,344: 10x18
#1114 @ 830,188: 18x17
#1115 @ 268,57: 21x16
#1116 @ 681,464: 27x13
#1117 @ 133,657: 17x23
#1118 @ 200,859: 23x27
#1119 @ 740,421: 12x19
#1120 @ 33,104: 13x14
#1121 @ 167,642: 22x11
#1122 @ 711,303: 19x20
#1123 @ 704,860: 10x19
#1124 @ 377,635: 24x17
#1125 @ 425,858: 18x25
#1126 @ 352,417: 18x18
#1127 @ 200,365: 13x13
#1128 @ 785,831: 14x25
#1129 @ 330,960: 21x25
#1130 @ 232,214: 14x29
#1131 @ 914,984: 16x13
#1132 @ 485,705: 21x11
#1133 @ 907,987: 20x13
#1134 @ 171,369: 19x22
#1135 @ 916,518: 26x15
#1136 @ 279,275: 22x11
#1137 @ 361,172: 17x23
#1138 @ 955,668: 28x19
#1139 @ 855,282: 29x19
#1140 @ 442,666: 17x18
#1141 @ 41,59: 18x24
#1142 @ 260,792: 23x27
#1143 @ 652,383: 12x20
#1144 @ 571,454: 26x28
#1145 @ 295,434: 16x10
#1146 @ 744,906: 25x11
#1147 @ 894,499: 27x15
#1148 @ 678,694: 19x19
#1149 @ 215,855: 22x25
#1150 @ 224,265: 27x25
#1151 @ 812,657: 11x29
#1152 @ 251,519: 15x28
#1153 @ 300,627: 28x28
#1154 @ 832,651: 15x21
#1155 @ 682,675: 28x21
#1156 @ 248,929: 21x10
#1157 @ 151,529: 15x27
#1158 @ 243,844: 25x13
#1159 @ 415,538: 12x16
#1160 @ 590,151: 29x23
#1161 @ 132,214: 17x14
#1162 @ 240,675: 16x23
#1163 @ 962,24: 28x26
#1164 @ 598,571: 25x22
#1165 @ 544,478: 21x22
#1166 @ 701,529: 15x25
#1167 @ 245,49: 26x29
#1168 @ 641,415: 29x26
#1169 @ 134,394: 26x21
#1170 @ 671,363: 20x29
#1171 @ 715,434: 15x28
#1172 @ 628,721: 21x27
#1173 @ 175,767: 27x29
#1174 @ 790,515: 21x14
#1175 @ 320,714: 17x27
#1176 @ 807,143: 14x26
#1177 @ 487,238: 16x19
#1178 @ 397,913: 15x19
#1179 @ 3,574: 26x28
#1180 @ 961,106: 23x17
#1181 @ 497,921: 16x27
#1182 @ 471,331: 28x16
#1183 @ 115,319: 23x25
#1184 @ 316,291: 14x26
#1185 @ 321,861: 14x12
#1186 @ 64,362: 29x12
#1187 @ 412,639: 22x16
#1188 @ 549,105: 25x21
#1189 @ 756,727: 15x11
#1190 @ 929,702: 29x25
#1191 @ 946,507: 17x11
#1192 @ 446,73: 20x27
#1193 @ 937,334: 24x10
#1194 @ 121,121: 20x12
#1195 @ 258,241: 26x23
#1196 @ 555,474: 12x10
#1197 @ 886,26: 22x12
#1198 @ 356,501: 23x18
#1199 @ 343,304: 17x11
#1200 @ 776,19: 11x14
#1201 @ 475,318: 10x14
#1202 @ 923,108: 25x11
#1203 @ 240,641: 25x26
#1204 @ 793,839: 18x11
#1205 @ 737,874: 17x22
#1206 @ 728,323: 24x13
#1207 @ 128,560: 11x23
#1208 @ 129,112: 22x24
#1209 @ 592,544: 18x12
#1210 @ 971,491: 10x25
#1211 @ 352,13: 26x20
#1212 @ 237,547: 12x14
#1213 @ 670,312: 10x24
#1214 @ 488,194: 14x29
#1215 @ 792,687: 26x26
#1216 @ 240,727: 17x17
#1217 @ 419,71: 10x22
#1218 @ 398,161: 23x20
#1219 @ 218,352: 22x13
#1220 @ 312,272: 15x29
#1221 @ 759,458: 21x23
#1222 @ 588,579: 17x14
#1223 @ 809,131: 14x11
#1224 @ 618,702: 27x16
#1225 @ 495,724: 6x18
#1226 @ 130,955: 12x10
#1227 @ 830,85: 13x22
#1228 @ 864,108: 19x20
#1229 @ 650,836: 23x17
#1230 @ 634,770: 23x10
#1231 @ 815,821: 17x24
#1232 @ 974,396: 11x13
#1233 @ 277,792: 23x22
#1234 @ 355,935: 26x10
#1235 @ 971,18: 19x17
#1236 @ 174,955: 15x23
#1237 @ 76,697: 24x25
#1238 @ 336,421: 19x20
#1239 @ 108,402: 23x12
#1240 @ 724,407: 28x19
#1241 @ 222,274: 24x15
#1242 @ 900,330: 20x15
#1243 @ 650,853: 13x10
#1244 @ 987,903: 12x14
#1245 @ 225,826: 15x17
#1246 @ 399,926: 26x20
#1247 @ 318,625: 10x21
#1248 @ 503,167: 21x11
#1249 @ 176,120: 19x13
#1250 @ 679,440: 15x29
#1251 @ 70,187: 12x23
#1252 @ 348,957: 21x16
#1253 @ 253,265: 13x18
#1254 @ 691,893: 24x17
#1255 @ 485,605: 16x11
#1256 @ 173,857: 22x17
#1257 @ 933,855: 13x23
#1258 @ 523,25: 24x24
#1259 @ 567,491: 21x12
#1260 @ 787,972: 21x10
#1261 @ 85,823: 28x25
#1262 @ 431,810: 23x24
#1263 @ 258,71: 15x14
#1264 @ 330,26: 24x20
#1265 @ 385,180: 29x15
#1266 @ 149,624: 26x15
#1267 @ 949,564: 25x16
#1268 @ 257,900: 25x14
#1269 @ 638,46: 14x19
#1270 @ 711,537: 12x14
#1271 @ 418,285: 12x19
#1272 @ 477,191: 18x22
#1273 @ 0,826: 20x16
#1274 @ 681,790: 22x25
#1275 @ 214,28: 27x29
#1276 @ 646,539: 15x22
#1277 @ 651,49: 14x14
#1278 @ 641,209: 15x5
#1279 @ 792,710: 27x25
#1280 @ 515,859: 24x17
#1281 @ 888,541: 19x29
#1282 @ 977,504: 17x16
#1283 @ 553,394: 27x21
#1284 @ 951,507: 20x26
#1285 @ 429,871: 21x24
"""#
}
