module ChiselTop(
  input        clock,
  input        reset,
  input  [7:0] io_ui_in,
  output [7:0] io_uo_out,
  input  [7:0] io_uio_in,
  output [7:0] io_uio_out,
  output [7:0] io_uio_oe
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 26:24]
  reg [3:0] medium_; // @[ChiselTop.scala 27:24]
  reg [3:0] slow; // @[ChiselTop.scala 28:24]
  reg [2:0] tick2hz; // @[ChiselTop.scala 29:24]
  reg [3:0] tick1hz; // @[ChiselTop.scala 30:24]
  reg [31:0] cntReg; // @[ChiselTop.scala 31:24]
  reg [2:0] diceReg; // @[ChiselTop.scala 33:24]
  reg  switch5EdgeDetector_REG; // @[ChiselTop.scala 34:52]
  wire  switch5EdgeDetector = io_ui_in[4] & ~switch5EdgeDetector_REG; // @[ChiselTop.scala 34:41]
  reg [2:0] capturedDice; // @[ChiselTop.scala 35:29]
  reg [5:0] seconds; // @[ChiselTop.scala 41:26]
  reg [5:0] minutes; // @[ChiselTop.scala 42:26]
  reg [4:0] hours; // @[ChiselTop.scala 43:26]
  reg [8:0] days; // @[ChiselTop.scala 44:26]
  reg [6:0] years; // @[ChiselTop.scala 45:26]
  reg [3:0] pwmCount; // @[ChiselTop.scala 48:32]
  reg [3:0] brightness; // @[ChiselTop.scala 49:32]
  reg  changeDirection; // @[ChiselTop.scala 50:32]
  wire  ledStatus = pwmCount < brightness; // @[ChiselTop.scala 51:28]
  wire [3:0] btnRaw = io_uio_in[3:0]; // @[ChiselTop.scala 62:27]
  reg [3:0] btnS0; // @[ChiselTop.scala 63:25]
  reg [3:0] btnS1; // @[ChiselTop.scala 64:25]
  reg [3:0] btnPrev; // @[ChiselTop.scala 65:25]
  wire [3:0] _btnRise_T = ~btnPrev; // @[ChiselTop.scala 68:25]
  wire [3:0] btnRise = btnS1 & _btnRise_T; // @[ChiselTop.scala 68:23]
  wire  anyPress = |btnRise; // @[ChiselTop.scala 71:27]
  wire [1:0] _pressedBtn_T_4 = btnRise[3] ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _pressedBtn_T_5 = btnRise[2] ? 2'h2 : _pressedBtn_T_4; // @[Mux.scala 101:16]
  wire [1:0] _pressedBtn_T_6 = btnRise[1] ? 2'h1 : _pressedBtn_T_5; // @[Mux.scala 101:16]
  wire [1:0] pressedBtn = btnRise[0] ? 2'h0 : _pressedBtn_T_6; // @[Mux.scala 101:16]
  reg [1:0] state; // @[ChiselTop.scala 81:25]
  reg [1:0] sequence_0; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_1; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_2; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_3; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_4; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_5; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_6; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_7; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_8; // @[ChiselTop.scala 83:22]
  reg [1:0] sequence_9; // @[ChiselTop.scala 83:22]
  reg [3:0] count; // @[ChiselTop.scala 84:25]
  reg [3:0] playIdx; // @[ChiselTop.scala 85:25]
  reg [31:0] playTimer; // @[ChiselTop.scala 88:27]
  reg [31:0] blinkTimer; // @[ChiselTop.scala 89:27]
  reg  blinkState; // @[ChiselTop.scala 90:27]
  wire [31:0] _blinkTimer_T_1 = blinkTimer + 32'h1; // @[ChiselTop.scala 92:28]
  wire [2:0] _GEN_4 = io_ui_in[1] ? 3'h1 : 3'h0; // @[ChiselTop.scala 113:28 114:10]
  wire [2:0] _GEN_5 = io_ui_in[2] ? 3'h2 : _GEN_4; // @[ChiselTop.scala 111:28 112:10]
  wire [2:0] _GEN_6 = io_ui_in[3] ? 3'h3 : _GEN_5; // @[ChiselTop.scala 109:28 110:10]
  wire [2:0] _GEN_7 = io_ui_in[4] ? 3'h4 : _GEN_6; // @[ChiselTop.scala 107:28 108:10]
  wire [2:0] _GEN_8 = io_ui_in[5] ? 3'h5 : _GEN_7; // @[ChiselTop.scala 105:28 106:10]
  wire [2:0] _GEN_9 = io_ui_in[6] ? 3'h6 : _GEN_8; // @[ChiselTop.scala 103:28 104:10]
  wire [2:0] mode = io_ui_in[7] ? 3'h7 : _GEN_9; // @[ChiselTop.scala 101:21 102:10]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[ChiselTop.scala 122:20]
  wire [2:0] _diceReg_T_1 = diceReg + 3'h1; // @[ChiselTop.scala 123:22]
  wire [3:0] _pwmCount_T_1 = pwmCount + 4'h1; // @[ChiselTop.scala 127:24]
  wire  _T_10 = cntReg == 32'h2625a0; // @[ChiselTop.scala 129:16]
  wire [2:0] _fast_T_1 = fast + 3'h1; // @[ChiselTop.scala 131:18]
  wire [2:0] _tick2hz_T_1 = tick2hz + 3'h1; // @[ChiselTop.scala 135:24]
  wire [3:0] _medium_T_1 = medium_ + 4'h1; // @[ChiselTop.scala 138:24]
  wire [3:0] _tick1hz_T_1 = tick1hz + 4'h1; // @[ChiselTop.scala 143:26]
  wire [3:0] _slow_T_1 = slow + 4'h1; // @[ChiselTop.scala 146:22]
  wire [3:0] _GEN_14 = slow == 4'h9 ? 4'h0 : _slow_T_1; // @[ChiselTop.scala 146:14 147:29 148:16]
  wire [5:0] _seconds_T_1 = seconds + 6'h1; // @[ChiselTop.scala 150:28]
  wire [5:0] _minutes_T_1 = minutes + 6'h1; // @[ChiselTop.scala 153:30]
  wire [4:0] _hours_T_1 = hours + 5'h1; // @[ChiselTop.scala 156:28]
  wire [8:0] _days_T_1 = days + 9'h1; // @[ChiselTop.scala 159:28]
  wire [6:0] _years_T_1 = years + 7'h1; // @[ChiselTop.scala 162:32]
  wire [8:0] _GEN_15 = days == 9'h16c ? 9'h0 : _days_T_1; // @[ChiselTop.scala 159:20 160:37 161:22]
  wire [6:0] _GEN_16 = days == 9'h16c ? _years_T_1 : years; // @[ChiselTop.scala 160:37 162:23 45:26]
  wire [4:0] _GEN_17 = hours == 5'h17 ? 5'h0 : _hours_T_1; // @[ChiselTop.scala 156:19 157:35 158:21]
  wire [8:0] _GEN_18 = hours == 5'h17 ? _GEN_15 : days; // @[ChiselTop.scala 157:35 44:26]
  wire [6:0] _GEN_19 = hours == 5'h17 ? _GEN_16 : years; // @[ChiselTop.scala 157:35 45:26]
  wire [5:0] _GEN_20 = minutes == 6'h3b ? 6'h0 : _minutes_T_1; // @[ChiselTop.scala 153:19 154:35 155:21]
  wire [4:0] _GEN_21 = minutes == 6'h3b ? _GEN_17 : hours; // @[ChiselTop.scala 154:35 43:26]
  wire [8:0] _GEN_22 = minutes == 6'h3b ? _GEN_18 : days; // @[ChiselTop.scala 154:35 44:26]
  wire [6:0] _GEN_23 = minutes == 6'h3b ? _GEN_19 : years; // @[ChiselTop.scala 154:35 45:26]
  wire [5:0] _GEN_24 = seconds == 6'h3b ? 6'h0 : _seconds_T_1; // @[ChiselTop.scala 150:17 151:33 152:19]
  wire [5:0] _GEN_25 = seconds == 6'h3b ? _GEN_20 : minutes; // @[ChiselTop.scala 151:33 42:26]
  wire [4:0] _GEN_26 = seconds == 6'h3b ? _GEN_21 : hours; // @[ChiselTop.scala 151:33 43:26]
  wire [8:0] _GEN_27 = seconds == 6'h3b ? _GEN_22 : days; // @[ChiselTop.scala 151:33 44:26]
  wire [6:0] _GEN_28 = seconds == 6'h3b ? _GEN_23 : years; // @[ChiselTop.scala 151:33 45:26]
  wire  _T_22 = 3'h1 == fast; // @[ChiselTop.scala 180:20]
  wire  _T_23 = 3'h2 == fast; // @[ChiselTop.scala 180:20]
  wire  _T_24 = 3'h3 == fast; // @[ChiselTop.scala 180:20]
  wire  _T_25 = 3'h4 == fast; // @[ChiselTop.scala 180:20]
  wire  _T_26 = 3'h5 == fast; // @[ChiselTop.scala 180:20]
  wire [7:0] _GEN_56 = 3'h5 == fast ? 8'h20 : 8'h0; // @[ChiselTop.scala 180:20 186:25 32:28]
  wire [7:0] _GEN_57 = 3'h4 == fast ? 8'h10 : _GEN_56; // @[ChiselTop.scala 180:20 185:25]
  wire [7:0] _GEN_58 = 3'h3 == fast ? 8'h8 : _GEN_57; // @[ChiselTop.scala 180:20 184:25]
  wire [7:0] _GEN_59 = 3'h2 == fast ? 8'h4 : _GEN_58; // @[ChiselTop.scala 180:20 183:25]
  wire [7:0] _GEN_60 = 3'h1 == fast ? 8'h2 : _GEN_59; // @[ChiselTop.scala 180:20 182:25]
  wire [7:0] _GEN_61 = 3'h0 == fast ? 8'h1 : _GEN_60; // @[ChiselTop.scala 180:20 181:25]
  wire [7:0] _GEN_62 = _T_22 ? 8'h20 : 8'h0; // @[ChiselTop.scala 194:20 200:25 32:28]
  wire [7:0] _GEN_63 = _T_23 ? 8'h10 : _GEN_62; // @[ChiselTop.scala 194:20 199:25]
  wire [7:0] _GEN_64 = _T_24 ? 8'h8 : _GEN_63; // @[ChiselTop.scala 194:20 198:25]
  wire [7:0] _GEN_65 = _T_25 ? 8'h4 : _GEN_64; // @[ChiselTop.scala 194:20 197:25]
  wire [7:0] _GEN_66 = _T_26 ? 8'h2 : _GEN_65; // @[ChiselTop.scala 194:20 196:25]
  wire [7:0] _GEN_67 = 3'h6 == fast ? 8'h1 : _GEN_66; // @[ChiselTop.scala 194:20 195:25]
  wire [7:0] _GEN_68 = 4'h9 == slow ? 8'h6f : 8'h0; // @[ChiselTop.scala 208:20 218:26 32:28]
  wire [7:0] _GEN_69 = 4'h8 == slow ? 8'h7f : _GEN_68; // @[ChiselTop.scala 208:20 217:26]
  wire [7:0] _GEN_70 = 4'h7 == slow ? 8'h7 : _GEN_69; // @[ChiselTop.scala 208:20 216:26]
  wire [7:0] _GEN_71 = 4'h6 == slow ? 8'h7d : _GEN_70; // @[ChiselTop.scala 208:20 215:26]
  wire [7:0] _GEN_72 = 4'h5 == slow ? 8'h6d : _GEN_71; // @[ChiselTop.scala 208:20 214:26]
  wire [7:0] _GEN_73 = 4'h4 == slow ? 8'h66 : _GEN_72; // @[ChiselTop.scala 208:20 213:26]
  wire [7:0] _GEN_74 = 4'h3 == slow ? 8'h4f : _GEN_73; // @[ChiselTop.scala 208:20 212:26]
  wire [7:0] _GEN_75 = 4'h2 == slow ? 8'h5b : _GEN_74; // @[ChiselTop.scala 208:20 211:26]
  wire [7:0] _GEN_76 = 4'h1 == slow ? 8'h6 : _GEN_75; // @[ChiselTop.scala 208:20 210:26]
  wire [7:0] _GEN_77 = 4'h0 == slow ? 8'h3f : _GEN_76; // @[ChiselTop.scala 208:20 209:26]
  wire [7:0] _GEN_79 = 4'he == medium_ ? 8'h80 : 8'h0; // @[ChiselTop.scala 226:22 241:26]
  wire [7:0] _GEN_80 = 4'hd == medium_ ? 8'h0 : _GEN_79; // @[ChiselTop.scala 226:22 240:26]
  wire [7:0] _GEN_81 = 4'hc == medium_ ? 8'h80 : _GEN_80; // @[ChiselTop.scala 226:22 239:26]
  wire [7:0] _GEN_82 = 4'hb == medium_ ? 8'h0 : _GEN_81; // @[ChiselTop.scala 226:22 238:26]
  wire [7:0] _GEN_83 = 4'ha == medium_ ? 8'h5e : _GEN_82; // @[ChiselTop.scala 226:22 237:26]
  wire [7:0] _GEN_84 = 4'h9 == medium_ ? 8'h38 : _GEN_83; // @[ChiselTop.scala 226:22 236:25]
  wire [7:0] _GEN_85 = 4'h8 == medium_ ? 8'h50 : _GEN_84; // @[ChiselTop.scala 226:22 235:25]
  wire [7:0] _GEN_86 = 4'h7 == medium_ ? 8'h3f : _GEN_85; // @[ChiselTop.scala 226:22 234:25]
  wire [7:0] _GEN_87 = 4'h6 == medium_ ? 8'h6a : _GEN_86; // @[ChiselTop.scala 226:22 233:25]
  wire [7:0] _GEN_88 = 4'h5 == medium_ ? 8'h0 : _GEN_87; // @[ChiselTop.scala 226:22 232:25]
  wire [7:0] _GEN_89 = 4'h4 == medium_ ? 8'h3f : _GEN_88; // @[ChiselTop.scala 226:22 231:25]
  wire [7:0] _GEN_90 = 4'h3 == medium_ ? 8'h38 : _GEN_89; // @[ChiselTop.scala 226:22 230:25]
  wire [7:0] _GEN_91 = 4'h2 == medium_ ? 8'h38 : _GEN_90; // @[ChiselTop.scala 226:22 229:25]
  wire [7:0] _GEN_92 = 4'h1 == medium_ ? 8'h79 : _GEN_91; // @[ChiselTop.scala 226:22 228:25]
  wire [7:0] _GEN_93 = 4'h0 == medium_ ? 8'h76 : _GEN_92; // @[ChiselTop.scala 226:22 227:25]
  wire [7:0] _GEN_94 = 3'h6 == capturedDice ? 8'h7d : 8'h0; // @[ChiselTop.scala 250:28 256:26 32:28]
  wire [7:0] _GEN_95 = 3'h5 == capturedDice ? 8'h6d : _GEN_94; // @[ChiselTop.scala 250:28 255:26]
  wire [7:0] _GEN_96 = 3'h4 == capturedDice ? 8'h66 : _GEN_95; // @[ChiselTop.scala 250:28 254:26]
  wire [7:0] _GEN_97 = 3'h3 == capturedDice ? 8'h4f : _GEN_96; // @[ChiselTop.scala 250:28 253:26]
  wire [7:0] _GEN_98 = 3'h2 == capturedDice ? 8'h5b : _GEN_97; // @[ChiselTop.scala 250:28 252:26]
  wire [7:0] _GEN_99 = 3'h1 == capturedDice ? 8'h6 : _GEN_98; // @[ChiselTop.scala 250:28 251:26]
  wire [6:0] _sevSeg_T = blinkState ? 7'h40 : 7'h0; // @[ChiselTop.scala 269:24]
  wire [1:0] _GEN_100 = 4'h0 == count ? pressedBtn : sequence_0; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_101 = 4'h1 == count ? pressedBtn : sequence_1; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_102 = 4'h2 == count ? pressedBtn : sequence_2; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_103 = 4'h3 == count ? pressedBtn : sequence_3; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_104 = 4'h4 == count ? pressedBtn : sequence_4; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_105 = 4'h5 == count ? pressedBtn : sequence_5; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_106 = 4'h6 == count ? pressedBtn : sequence_6; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_107 = 4'h7 == count ? pressedBtn : sequence_7; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_108 = 4'h8 == count ? pressedBtn : sequence_8; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [1:0] _GEN_109 = 4'h9 == count ? pressedBtn : sequence_9; // @[ChiselTop.scala 272:{29,29} 83:22]
  wire [3:0] _count_T_1 = count + 4'h1; // @[ChiselTop.scala 273:38]
  wire [3:0] _GEN_110 = count == 4'h9 ? 4'h0 : playIdx; // @[ChiselTop.scala 275:40 277:25 85:25]
  wire [31:0] _GEN_111 = count == 4'h9 ? 32'h0 : playTimer; // @[ChiselTop.scala 275:40 278:25 88:27]
  wire [1:0] _GEN_112 = count == 4'h9 ? 2'h1 : state; // @[ChiselTop.scala 275:40 279:25 81:25]
  wire [1:0] _GEN_113 = anyPress ? _GEN_100 : sequence_0; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_114 = anyPress ? _GEN_101 : sequence_1; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_115 = anyPress ? _GEN_102 : sequence_2; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_116 = anyPress ? _GEN_103 : sequence_3; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_117 = anyPress ? _GEN_104 : sequence_4; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_118 = anyPress ? _GEN_105 : sequence_5; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_119 = anyPress ? _GEN_106 : sequence_6; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_120 = anyPress ? _GEN_107 : sequence_7; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_121 = anyPress ? _GEN_108 : sequence_8; // @[ChiselTop.scala 271:26 83:22]
  wire [1:0] _GEN_122 = anyPress ? _GEN_109 : sequence_9; // @[ChiselTop.scala 271:26 83:22]
  wire [3:0] _GEN_123 = anyPress ? _count_T_1 : count; // @[ChiselTop.scala 271:26 273:29 84:25]
  wire [3:0] _GEN_124 = anyPress ? _GEN_110 : playIdx; // @[ChiselTop.scala 271:26 85:25]
  wire [31:0] _GEN_125 = anyPress ? _GEN_111 : playTimer; // @[ChiselTop.scala 271:26 88:27]
  wire [1:0] _GEN_126 = anyPress ? _GEN_112 : state; // @[ChiselTop.scala 271:26 81:25]
  wire [1:0] _GEN_128 = 4'h1 == playIdx ? sequence_1 : sequence_0; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_129 = 4'h2 == playIdx ? sequence_2 : _GEN_128; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_130 = 4'h3 == playIdx ? sequence_3 : _GEN_129; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_131 = 4'h4 == playIdx ? sequence_4 : _GEN_130; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_132 = 4'h5 == playIdx ? sequence_5 : _GEN_131; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_133 = 4'h6 == playIdx ? sequence_6 : _GEN_132; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_134 = 4'h7 == playIdx ? sequence_7 : _GEN_133; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_135 = 4'h8 == playIdx ? sequence_8 : _GEN_134; // @[ChiselTop.scala 55:{8,8}]
  wire [1:0] _GEN_136 = 4'h9 == playIdx ? sequence_9 : _GEN_135; // @[ChiselTop.scala 55:{8,8}]
  wire  _sevSeg_T_1 = _GEN_136 == 2'h0; // @[ChiselTop.scala 55:8]
  wire  _sevSeg_T_2 = _GEN_136 == 2'h1; // @[ChiselTop.scala 56:8]
  wire  _sevSeg_T_3 = _GEN_136 == 2'h2; // @[ChiselTop.scala 57:8]
  wire  _sevSeg_T_4 = _GEN_136 == 2'h3; // @[ChiselTop.scala 58:8]
  wire [6:0] _sevSeg_T_5 = _sevSeg_T_4 ? 7'h66 : 7'h0; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_6 = _sevSeg_T_3 ? 7'h4f : _sevSeg_T_5; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_7 = _sevSeg_T_2 ? 7'h5b : _sevSeg_T_6; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_8 = _sevSeg_T_1 ? 7'h6 : _sevSeg_T_7; // @[Mux.scala 101:16]
  wire [31:0] _playTimer_T_1 = playTimer + 32'h1; // @[ChiselTop.scala 287:35]
  wire [3:0] _playIdx_T_1 = playIdx + 4'h1; // @[ChiselTop.scala 296:34]
  wire [3:0] _GEN_137 = playIdx == 4'h9 ? 4'h0 : count; // @[ChiselTop.scala 291:42 293:22 84:25]
  wire [1:0] _GEN_138 = playIdx == 4'h9 ? 2'h0 : state; // @[ChiselTop.scala 291:42 294:22 81:25]
  wire [3:0] _GEN_139 = playIdx == 4'h9 ? playIdx : _playIdx_T_1; // @[ChiselTop.scala 291:42 296:23 85:25]
  wire [31:0] _GEN_140 = playTimer >= 32'h17d7840 ? 32'h0 : _playTimer_T_1; // @[ChiselTop.scala 287:22 289:41 290:23]
  wire [3:0] _GEN_141 = playTimer >= 32'h17d7840 ? _GEN_137 : count; // @[ChiselTop.scala 289:41 84:25]
  wire [1:0] _GEN_142 = playTimer >= 32'h17d7840 ? _GEN_138 : state; // @[ChiselTop.scala 289:41 81:25]
  wire [3:0] _GEN_143 = playTimer >= 32'h17d7840 ? _GEN_139 : playIdx; // @[ChiselTop.scala 289:41 85:25]
  wire [7:0] _GEN_144 = 2'h1 == state ? {{1'd0}, _sevSeg_T_8} : 8'h0; // @[ChiselTop.scala 265:21 286:21 32:28]
  wire [31:0] _GEN_145 = 2'h1 == state ? _GEN_140 : playTimer; // @[ChiselTop.scala 265:21 88:27]
  wire [3:0] _GEN_146 = 2'h1 == state ? _GEN_141 : count; // @[ChiselTop.scala 265:21 84:25]
  wire [1:0] _GEN_147 = 2'h1 == state ? _GEN_142 : state; // @[ChiselTop.scala 265:21 81:25]
  wire [3:0] _GEN_148 = 2'h1 == state ? _GEN_143 : playIdx; // @[ChiselTop.scala 265:21 85:25]
  wire [7:0] _GEN_149 = 2'h0 == state ? {{1'd0}, _sevSeg_T} : _GEN_144; // @[ChiselTop.scala 265:21 269:18]
  wire [1:0] _GEN_150 = 2'h0 == state ? _GEN_113 : sequence_0; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_151 = 2'h0 == state ? _GEN_114 : sequence_1; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_152 = 2'h0 == state ? _GEN_115 : sequence_2; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_153 = 2'h0 == state ? _GEN_116 : sequence_3; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_154 = 2'h0 == state ? _GEN_117 : sequence_4; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_155 = 2'h0 == state ? _GEN_118 : sequence_5; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_156 = 2'h0 == state ? _GEN_119 : sequence_6; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_157 = 2'h0 == state ? _GEN_120 : sequence_7; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_158 = 2'h0 == state ? _GEN_121 : sequence_8; // @[ChiselTop.scala 265:21 83:22]
  wire [1:0] _GEN_159 = 2'h0 == state ? _GEN_122 : sequence_9; // @[ChiselTop.scala 265:21 83:22]
  wire [3:0] _GEN_160 = 2'h0 == state ? _GEN_123 : _GEN_146; // @[ChiselTop.scala 265:21]
  wire [3:0] _GEN_161 = 2'h0 == state ? _GEN_124 : _GEN_148; // @[ChiselTop.scala 265:21]
  wire [31:0] _GEN_162 = 2'h0 == state ? _GEN_125 : _GEN_145; // @[ChiselTop.scala 265:21]
  wire [1:0] _GEN_163 = 2'h0 == state ? _GEN_126 : _GEN_147; // @[ChiselTop.scala 265:21]
  wire [3:0] _brightness_T_1 = brightness + 4'h1; // @[ChiselTop.scala 310:36]
  wire  _GEN_164 = brightness == 4'he ? 1'h0 : changeDirection; // @[ChiselTop.scala 312:{38,56} 50:32]
  wire [3:0] _brightness_T_3 = brightness - 4'h1; // @[ChiselTop.scala 318:36]
  wire  _GEN_165 = brightness == 4'h1 | changeDirection; // @[ChiselTop.scala 320:{37,55} 50:32]
  wire [3:0] _GEN_166 = changeDirection ? _brightness_T_1 : _brightness_T_3; // @[ChiselTop.scala 308:32 310:22 318:22]
  wire  _GEN_167 = changeDirection ? _GEN_164 : _GEN_165; // @[ChiselTop.scala 308:32]
  wire [3:0] _GEN_168 = _T_10 ? _GEN_166 : brightness; // @[ChiselTop.scala 306:35 49:32]
  wire  _GEN_169 = _T_10 ? _GEN_167 : changeDirection; // @[ChiselTop.scala 306:35 50:32]
  wire [7:0] _sevSeg_T_9 = ledStatus ? 8'hff : 8'h0; // @[ChiselTop.scala 326:20]
  wire [1:0] _T_88 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_90 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_92 = _T_88 + _T_90; // @[Bitwise.scala 51:90]
  wire [1:0] _T_94 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_96 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_98 = _T_94 + _T_96; // @[Bitwise.scala 51:90]
  wire [3:0] _T_100 = _T_92 + _T_98; // @[Bitwise.scala 51:90]
  wire [3:0] _T_103 = _T_100 - 4'h1; // @[ChiselTop.scala 332:33]
  wire [7:0] _GEN_170 = 4'h7 == _T_103 ? 8'h7 : 8'h0; // @[ChiselTop.scala 332:40 340:26 32:28]
  wire [7:0] _GEN_171 = 4'h6 == _T_103 ? 8'h7d : _GEN_170; // @[ChiselTop.scala 332:40 339:26]
  wire [7:0] _GEN_172 = 4'h5 == _T_103 ? 8'h6d : _GEN_171; // @[ChiselTop.scala 332:40 338:26]
  wire [7:0] _GEN_173 = 4'h4 == _T_103 ? 8'h66 : _GEN_172; // @[ChiselTop.scala 332:40 337:26]
  wire [7:0] _GEN_174 = 4'h3 == _T_103 ? 8'h4f : _GEN_173; // @[ChiselTop.scala 332:40 336:26]
  wire [7:0] _GEN_175 = 4'h2 == _T_103 ? 8'h5b : _GEN_174; // @[ChiselTop.scala 332:40 335:26]
  wire [7:0] _GEN_176 = 4'h1 == _T_103 ? 8'h6 : _GEN_175; // @[ChiselTop.scala 332:40 334:26]
  wire [7:0] _GEN_177 = 4'h0 == _T_103 ? 8'h3f : _GEN_176; // @[ChiselTop.scala 332:40 333:26]
  wire [7:0] _GEN_178 = 3'h7 == mode ? _GEN_177 : 8'h0; // @[ChiselTop.scala 174:16 32:28]
  wire [3:0] _GEN_179 = 3'h6 == mode ? _GEN_168 : brightness; // @[ChiselTop.scala 174:16 49:32]
  wire  _GEN_180 = 3'h6 == mode ? _GEN_169 : changeDirection; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] _GEN_181 = 3'h6 == mode ? _sevSeg_T_9 : _GEN_178; // @[ChiselTop.scala 174:16 326:14]
  wire [7:0] _GEN_182 = 3'h5 == mode ? _GEN_149 : _GEN_181; // @[ChiselTop.scala 174:16]
  wire [1:0] _GEN_183 = 3'h5 == mode ? _GEN_150 : sequence_0; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_184 = 3'h5 == mode ? _GEN_151 : sequence_1; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_185 = 3'h5 == mode ? _GEN_152 : sequence_2; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_186 = 3'h5 == mode ? _GEN_153 : sequence_3; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_187 = 3'h5 == mode ? _GEN_154 : sequence_4; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_188 = 3'h5 == mode ? _GEN_155 : sequence_5; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_189 = 3'h5 == mode ? _GEN_156 : sequence_6; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_190 = 3'h5 == mode ? _GEN_157 : sequence_7; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_191 = 3'h5 == mode ? _GEN_158 : sequence_8; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_192 = 3'h5 == mode ? _GEN_159 : sequence_9; // @[ChiselTop.scala 174:16 83:22]
  wire [3:0] _GEN_193 = 3'h5 == mode ? _GEN_160 : count; // @[ChiselTop.scala 174:16 84:25]
  wire [3:0] _GEN_194 = 3'h5 == mode ? _GEN_161 : playIdx; // @[ChiselTop.scala 174:16 85:25]
  wire [31:0] _GEN_195 = 3'h5 == mode ? _GEN_162 : playTimer; // @[ChiselTop.scala 174:16 88:27]
  wire [1:0] _GEN_196 = 3'h5 == mode ? _GEN_163 : state; // @[ChiselTop.scala 174:16 81:25]
  wire [3:0] _GEN_197 = 3'h5 == mode ? brightness : _GEN_179; // @[ChiselTop.scala 174:16 49:32]
  wire  _GEN_198 = 3'h5 == mode ? changeDirection : _GEN_180; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] _GEN_199 = 3'h4 == mode ? _GEN_99 : _GEN_182; // @[ChiselTop.scala 174:16]
  wire [1:0] _GEN_200 = 3'h4 == mode ? sequence_0 : _GEN_183; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_201 = 3'h4 == mode ? sequence_1 : _GEN_184; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_202 = 3'h4 == mode ? sequence_2 : _GEN_185; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_203 = 3'h4 == mode ? sequence_3 : _GEN_186; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_204 = 3'h4 == mode ? sequence_4 : _GEN_187; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_205 = 3'h4 == mode ? sequence_5 : _GEN_188; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_206 = 3'h4 == mode ? sequence_6 : _GEN_189; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_207 = 3'h4 == mode ? sequence_7 : _GEN_190; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_208 = 3'h4 == mode ? sequence_8 : _GEN_191; // @[ChiselTop.scala 174:16 83:22]
  wire [1:0] _GEN_209 = 3'h4 == mode ? sequence_9 : _GEN_192; // @[ChiselTop.scala 174:16 83:22]
  wire [3:0] _GEN_210 = 3'h4 == mode ? count : _GEN_193; // @[ChiselTop.scala 174:16 84:25]
  wire [3:0] _GEN_211 = 3'h4 == mode ? playIdx : _GEN_194; // @[ChiselTop.scala 174:16 85:25]
  wire [31:0] _GEN_212 = 3'h4 == mode ? playTimer : _GEN_195; // @[ChiselTop.scala 174:16 88:27]
  wire [1:0] _GEN_213 = 3'h4 == mode ? state : _GEN_196; // @[ChiselTop.scala 174:16 81:25]
  wire [3:0] _GEN_214 = 3'h4 == mode ? brightness : _GEN_197; // @[ChiselTop.scala 174:16 49:32]
  wire  _GEN_215 = 3'h4 == mode ? changeDirection : _GEN_198; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] _GEN_216 = 3'h3 == mode ? _GEN_93 : _GEN_199; // @[ChiselTop.scala 174:16]
  wire [3:0] _GEN_227 = 3'h3 == mode ? count : _GEN_210; // @[ChiselTop.scala 174:16 84:25]
  wire [3:0] _GEN_228 = 3'h3 == mode ? playIdx : _GEN_211; // @[ChiselTop.scala 174:16 85:25]
  wire [31:0] _GEN_229 = 3'h3 == mode ? playTimer : _GEN_212; // @[ChiselTop.scala 174:16 88:27]
  wire [1:0] _GEN_230 = 3'h3 == mode ? state : _GEN_213; // @[ChiselTop.scala 174:16 81:25]
  wire [3:0] _GEN_231 = 3'h3 == mode ? brightness : _GEN_214; // @[ChiselTop.scala 174:16 49:32]
  wire  _GEN_232 = 3'h3 == mode ? changeDirection : _GEN_215; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] _GEN_233 = 3'h2 == mode ? _GEN_77 : _GEN_216; // @[ChiselTop.scala 174:16]
  wire  _GEN_249 = 3'h2 == mode ? changeDirection : _GEN_232; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] _GEN_250 = 3'h1 == mode ? _GEN_67 : _GEN_233; // @[ChiselTop.scala 174:16]
  wire  _GEN_266 = 3'h1 == mode ? changeDirection : _GEN_249; // @[ChiselTop.scala 174:16 50:32]
  wire [7:0] sevSeg = 3'h0 == mode ? _GEN_61 : _GEN_250; // @[ChiselTop.scala 174:16]
  wire  _GEN_283 = 3'h0 == mode ? changeDirection : _GEN_266; // @[ChiselTop.scala 174:16 50:32]
  wire  centuryLED = years >= 7'h64; // @[ChiselTop.scala 347:27]
  wire  anySwitchOn = |io_ui_in; // @[ChiselTop.scala 349:30]
  wire [7:0] _io_uo_out_T = ~sevSeg; // @[ChiselTop.scala 352:33]
  assign io_uo_out = anySwitchOn ? _io_uo_out_T : 8'h7f; // @[ChiselTop.scala 352:19]
  assign io_uio_out = centuryLED ? 8'h80 : 8'h0; // @[ChiselTop.scala 353:20]
  assign io_uio_oe = 8'hf0; // @[ChiselTop.scala 18:13]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 26:24]
      fast <= 3'h0; // @[ChiselTop.scala 26:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (fast == 3'h6) begin // @[ChiselTop.scala 132:25]
        fast <= 3'h0; // @[ChiselTop.scala 133:12]
      end else begin
        fast <= _fast_T_1; // @[ChiselTop.scala 131:10]
      end
    end
    if (reset) begin // @[ChiselTop.scala 27:24]
      medium_ <= 4'h0; // @[ChiselTop.scala 27:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (medium_ == 4'hf) begin // @[ChiselTop.scala 139:30]
          medium_ <= 4'h0; // @[ChiselTop.scala 140:16]
        end else begin
          medium_ <= _medium_T_1; // @[ChiselTop.scala 138:14]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 28:24]
      slow <= 4'h0; // @[ChiselTop.scala 28:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          slow <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 29:24]
      tick2hz <= 3'h0; // @[ChiselTop.scala 29:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        tick2hz <= 3'h0; // @[ChiselTop.scala 137:15]
      end else begin
        tick2hz <= _tick2hz_T_1; // @[ChiselTop.scala 135:13]
      end
    end
    if (reset) begin // @[ChiselTop.scala 30:24]
      tick1hz <= 4'h0; // @[ChiselTop.scala 30:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          tick1hz <= 4'h0; // @[ChiselTop.scala 145:17]
        end else begin
          tick1hz <= _tick1hz_T_1; // @[ChiselTop.scala 143:15]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 31:24]
      cntReg <= 32'h0; // @[ChiselTop.scala 31:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      cntReg <= 32'h0; // @[ChiselTop.scala 130:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 122:10]
    end
    if (reset) begin // @[ChiselTop.scala 33:24]
      diceReg <= 3'h1; // @[ChiselTop.scala 33:24]
    end else if (diceReg == 3'h7) begin // @[ChiselTop.scala 124:26]
      diceReg <= 3'h1; // @[ChiselTop.scala 125:13]
    end else begin
      diceReg <= _diceReg_T_1; // @[ChiselTop.scala 123:11]
    end
    switch5EdgeDetector_REG <= io_ui_in[4]; // @[ChiselTop.scala 34:61]
    if (reset) begin // @[ChiselTop.scala 35:29]
      capturedDice <= 3'h0; // @[ChiselTop.scala 35:29]
    end else if (switch5EdgeDetector) begin // @[ChiselTop.scala 36:29]
      capturedDice <= diceReg; // @[ChiselTop.scala 37:18]
    end
    if (reset) begin // @[ChiselTop.scala 41:26]
      seconds <= 6'h0; // @[ChiselTop.scala 41:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          seconds <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 42:26]
      minutes <= 6'h0; // @[ChiselTop.scala 42:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          minutes <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 43:26]
      hours <= 5'h0; // @[ChiselTop.scala 43:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          hours <= _GEN_26;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 44:26]
      days <= 9'h0; // @[ChiselTop.scala 44:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          days <= _GEN_27;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 45:26]
      years <= 7'h0; // @[ChiselTop.scala 45:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 129:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 136:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 144:30]
          years <= _GEN_28;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 48:32]
      pwmCount <= 4'h0; // @[ChiselTop.scala 48:32]
    end else begin
      pwmCount <= _pwmCount_T_1; // @[ChiselTop.scala 127:12]
    end
    if (reset) begin // @[ChiselTop.scala 49:32]
      brightness <= 4'h0; // @[ChiselTop.scala 49:32]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          brightness <= _GEN_231;
        end
      end
    end
    changeDirection <= reset | _GEN_283; // @[ChiselTop.scala 50:{32,32}]
    if (reset) begin // @[ChiselTop.scala 63:25]
      btnS0 <= 4'h0; // @[ChiselTop.scala 63:25]
    end else begin
      btnS0 <= btnRaw; // @[ChiselTop.scala 66:11]
    end
    if (reset) begin // @[ChiselTop.scala 64:25]
      btnS1 <= 4'h0; // @[ChiselTop.scala 64:25]
    end else begin
      btnS1 <= btnS0; // @[ChiselTop.scala 67:11]
    end
    if (reset) begin // @[ChiselTop.scala 65:25]
      btnPrev <= 4'h0; // @[ChiselTop.scala 65:25]
    end else begin
      btnPrev <= btnS1; // @[ChiselTop.scala 69:11]
    end
    if (reset) begin // @[ChiselTop.scala 81:25]
      state <= 2'h0; // @[ChiselTop.scala 81:25]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          state <= _GEN_230;
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_0 <= _GEN_200;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_1 <= _GEN_201;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_2 <= _GEN_202;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_3 <= _GEN_203;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_4 <= _GEN_204;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_5 <= _GEN_205;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_6 <= _GEN_206;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_7 <= _GEN_207;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_8 <= _GEN_208;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 174:16]
            sequence_9 <= _GEN_209;
          end
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 84:25]
      count <= 4'h0; // @[ChiselTop.scala 84:25]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          count <= _GEN_227;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 85:25]
      playIdx <= 4'h0; // @[ChiselTop.scala 85:25]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          playIdx <= _GEN_228;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 88:27]
      playTimer <= 32'h0; // @[ChiselTop.scala 88:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 174:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 174:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 174:16]
          playTimer <= _GEN_229;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 89:27]
      blinkTimer <= 32'h0; // @[ChiselTop.scala 89:27]
    end else if (blinkTimer >= 32'h5f5e10) begin // @[ChiselTop.scala 93:34]
      blinkTimer <= 32'h0; // @[ChiselTop.scala 94:16]
    end else begin
      blinkTimer <= _blinkTimer_T_1; // @[ChiselTop.scala 92:14]
    end
    if (reset) begin // @[ChiselTop.scala 90:27]
      blinkState <= 1'h0; // @[ChiselTop.scala 90:27]
    end else if (blinkTimer >= 32'h5f5e10) begin // @[ChiselTop.scala 93:34]
      blinkState <= ~blinkState; // @[ChiselTop.scala 95:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  fast = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  medium_ = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  slow = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  tick2hz = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  tick1hz = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  cntReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  diceReg = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  switch5EdgeDetector_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  capturedDice = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  seconds = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  minutes = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  hours = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  days = _RAND_12[8:0];
  _RAND_13 = {1{`RANDOM}};
  years = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  pwmCount = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  brightness = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  changeDirection = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  btnS0 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  btnS1 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  btnPrev = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  state = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  sequence_0 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  sequence_1 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  sequence_2 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  sequence_3 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  sequence_4 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  sequence_5 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  sequence_6 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  sequence_7 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  sequence_8 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  sequence_9 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  count = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  playIdx = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  playTimer = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  blinkTimer = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  blinkState = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
