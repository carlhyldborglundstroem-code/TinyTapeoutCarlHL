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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 27:26]
  reg [3:0] medium_; // @[ChiselTop.scala 28:26]
  reg [3:0] slow; // @[ChiselTop.scala 29:26]
  reg [2:0] tick2hz; // @[ChiselTop.scala 30:26]
  reg [3:0] tick1hz; // @[ChiselTop.scala 31:26]
  reg [31:0] cntReg; // @[ChiselTop.scala 32:26]
  reg [2:0] diceReg; // @[ChiselTop.scala 34:26]
  wire [2:0] _diceReg_T_2 = diceReg + 3'h1; // @[ChiselTop.scala 35:50]
  reg  switch5EdgeDetector_REG; // @[ChiselTop.scala 36:54]
  wire  switch5EdgeDetector = io_ui_in[4] & ~switch5EdgeDetector_REG; // @[ChiselTop.scala 36:43]
  reg [2:0] capturedDice; // @[ChiselTop.scala 37:31]
  reg [7:0] brightness; // @[ChiselTop.scala 43:34]
  reg  changeDirection; // @[ChiselTop.scala 44:34]
  reg [24:0] pulseLog; // @[ChiselTop.scala 46:27]
  wire [24:0] _pulseLog_T_1 = pulseLog + 25'h1; // @[ChiselTop.scala 47:26]
  wire [7:0] pwmSlice = pulseLog[7:0]; // @[ChiselTop.scala 50:31]
  wire  pulseSignal = pwmSlice < brightness; // @[ChiselTop.scala 52:32]
  wire  pulseTick = pulseLog[18]; // @[ChiselTop.scala 54:31]
  reg  pulseEdge_REG; // @[ChiselTop.scala 55:44]
  wire  pulseEdge = pulseTick & ~pulseEdge_REG; // @[ChiselTop.scala 55:33]
  wire [3:0] btnRaw = io_uio_in[3:0]; // @[ChiselTop.scala 66:29]
  reg [3:0] btnS0; // @[ChiselTop.scala 67:27]
  reg [3:0] btnS1; // @[ChiselTop.scala 68:27]
  reg [3:0] btnPrev; // @[ChiselTop.scala 69:27]
  wire [3:0] _btnRise_T = ~btnPrev; // @[ChiselTop.scala 72:27]
  wire [3:0] btnRise = btnS1 & _btnRise_T; // @[ChiselTop.scala 72:25]
  wire  anyPress = |btnRise; // @[ChiselTop.scala 75:29]
  wire [1:0] _pressedBtn_T_4 = btnRise[3] ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _pressedBtn_T_5 = btnRise[2] ? 2'h2 : _pressedBtn_T_4; // @[Mux.scala 101:16]
  wire [1:0] _pressedBtn_T_6 = btnRise[1] ? 2'h1 : _pressedBtn_T_5; // @[Mux.scala 101:16]
  wire [1:0] pressedBtn = btnRise[0] ? 2'h0 : _pressedBtn_T_6; // @[Mux.scala 101:16]
  reg [1:0] state; // @[ChiselTop.scala 85:27]
  reg [1:0] sequence_0; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_1; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_2; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_3; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_4; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_5; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_6; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_7; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_8; // @[ChiselTop.scala 87:23]
  reg [1:0] sequence_9; // @[ChiselTop.scala 87:23]
  reg [3:0] count; // @[ChiselTop.scala 88:27]
  reg [3:0] playIdx; // @[ChiselTop.scala 89:27]
  reg  playTimer; // @[ChiselTop.scala 91:29]
  reg  blinkState; // @[ChiselTop.scala 92:29]
  wire [2:0] _GEN_2 = io_ui_in[1] ? 3'h1 : 3'h0; // @[ChiselTop.scala 111:30 112:12]
  wire [2:0] _GEN_3 = io_ui_in[2] ? 3'h2 : _GEN_2; // @[ChiselTop.scala 109:30 110:12]
  wire [2:0] _GEN_4 = io_ui_in[3] ? 3'h3 : _GEN_3; // @[ChiselTop.scala 107:30 108:12]
  wire [2:0] _GEN_5 = io_ui_in[4] ? 3'h4 : _GEN_4; // @[ChiselTop.scala 105:30 106:12]
  wire [2:0] _GEN_6 = io_ui_in[5] ? 3'h5 : _GEN_5; // @[ChiselTop.scala 103:30 104:12]
  wire [2:0] _GEN_7 = io_ui_in[6] ? 3'h6 : _GEN_6; // @[ChiselTop.scala 101:30 102:12]
  wire [2:0] mode = io_ui_in[7] ? 3'h7 : _GEN_7; // @[ChiselTop.scala 100:12 99:23]
  wire [2:0] _fast_T_1 = fast + 3'h1; // @[ChiselTop.scala 124:20]
  wire [2:0] _tick2hz_T_1 = tick2hz + 3'h1; // @[ChiselTop.scala 128:26]
  wire [3:0] _medium_T_1 = medium_ + 4'h1; // @[ChiselTop.scala 132:26]
  wire [3:0] _tick1hz_T_1 = tick1hz + 4'h1; // @[ChiselTop.scala 137:28]
  wire [3:0] _slow_T_1 = slow + 4'h1; // @[ChiselTop.scala 140:24]
  wire [3:0] _GEN_11 = slow == 4'h9 ? 4'h0 : _slow_T_1; // @[ChiselTop.scala 140:16 142:31 143:18]
  wire  _GEN_14 = tick1hz == 4'h1 ? playTimer + 1'h1 : playTimer; // @[ChiselTop.scala 138:32 141:21 91:29]
  wire  _GEN_20 = tick2hz == 3'h4 ? _GEN_14 : playTimer; // @[ChiselTop.scala 129:30 91:29]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[ChiselTop.scala 148:26]
  wire  _GEN_28 = cntReg == 32'h989680 ? _GEN_20 : playTimer; // @[ChiselTop.scala 122:34 91:29]
  wire  _T_16 = 3'h1 == fast; // @[ChiselTop.scala 160:22]
  wire  _T_17 = 3'h2 == fast; // @[ChiselTop.scala 160:22]
  wire  _T_18 = 3'h3 == fast; // @[ChiselTop.scala 160:22]
  wire  _T_19 = 3'h4 == fast; // @[ChiselTop.scala 160:22]
  wire  _T_20 = 3'h5 == fast; // @[ChiselTop.scala 160:22]
  wire [7:0] _GEN_29 = 3'h5 == fast ? 8'h20 : 8'h0; // @[ChiselTop.scala 160:22 166:27 33:30]
  wire [7:0] _GEN_30 = 3'h4 == fast ? 8'h10 : _GEN_29; // @[ChiselTop.scala 160:22 165:27]
  wire [7:0] _GEN_31 = 3'h3 == fast ? 8'h8 : _GEN_30; // @[ChiselTop.scala 160:22 164:27]
  wire [7:0] _GEN_32 = 3'h2 == fast ? 8'h4 : _GEN_31; // @[ChiselTop.scala 160:22 163:27]
  wire [7:0] _GEN_33 = 3'h1 == fast ? 8'h2 : _GEN_32; // @[ChiselTop.scala 160:22 162:27]
  wire [7:0] _GEN_34 = 3'h0 == fast ? 8'h1 : _GEN_33; // @[ChiselTop.scala 160:22 161:27]
  wire [7:0] _GEN_35 = _T_16 ? 8'h20 : 8'h0; // @[ChiselTop.scala 174:22 180:27 33:30]
  wire [7:0] _GEN_36 = _T_17 ? 8'h10 : _GEN_35; // @[ChiselTop.scala 174:22 179:27]
  wire [7:0] _GEN_37 = _T_18 ? 8'h8 : _GEN_36; // @[ChiselTop.scala 174:22 178:27]
  wire [7:0] _GEN_38 = _T_19 ? 8'h4 : _GEN_37; // @[ChiselTop.scala 174:22 177:27]
  wire [7:0] _GEN_39 = _T_20 ? 8'h2 : _GEN_38; // @[ChiselTop.scala 174:22 176:27]
  wire [7:0] _GEN_40 = 3'h6 == fast ? 8'h1 : _GEN_39; // @[ChiselTop.scala 174:22 175:27]
  wire [7:0] _GEN_41 = 4'h9 == slow ? 8'h6f : 8'h0; // @[ChiselTop.scala 188:22 198:28 33:30]
  wire [7:0] _GEN_42 = 4'h8 == slow ? 8'h7f : _GEN_41; // @[ChiselTop.scala 188:22 197:28]
  wire [7:0] _GEN_43 = 4'h7 == slow ? 8'h7 : _GEN_42; // @[ChiselTop.scala 188:22 196:28]
  wire [7:0] _GEN_44 = 4'h6 == slow ? 8'h7d : _GEN_43; // @[ChiselTop.scala 188:22 195:28]
  wire [7:0] _GEN_45 = 4'h5 == slow ? 8'h6d : _GEN_44; // @[ChiselTop.scala 188:22 194:28]
  wire [7:0] _GEN_46 = 4'h4 == slow ? 8'h66 : _GEN_45; // @[ChiselTop.scala 188:22 193:28]
  wire [7:0] _GEN_47 = 4'h3 == slow ? 8'h4f : _GEN_46; // @[ChiselTop.scala 188:22 192:28]
  wire [7:0] _GEN_48 = 4'h2 == slow ? 8'h5b : _GEN_47; // @[ChiselTop.scala 188:22 191:28]
  wire [7:0] _GEN_49 = 4'h1 == slow ? 8'h6 : _GEN_48; // @[ChiselTop.scala 188:22 190:28]
  wire [7:0] _GEN_50 = 4'h0 == slow ? 8'h3f : _GEN_49; // @[ChiselTop.scala 188:22 189:28]
  wire [7:0] _GEN_52 = 4'he == medium_ ? 8'h80 : 8'h0; // @[ChiselTop.scala 206:24 221:28]
  wire [7:0] _GEN_53 = 4'hd == medium_ ? 8'h0 : _GEN_52; // @[ChiselTop.scala 206:24 220:28]
  wire [7:0] _GEN_54 = 4'hc == medium_ ? 8'h80 : _GEN_53; // @[ChiselTop.scala 206:24 219:28]
  wire [7:0] _GEN_55 = 4'hb == medium_ ? 8'h0 : _GEN_54; // @[ChiselTop.scala 206:24 218:28]
  wire [7:0] _GEN_56 = 4'ha == medium_ ? 8'h5e : _GEN_55; // @[ChiselTop.scala 206:24 217:28]
  wire [7:0] _GEN_57 = 4'h9 == medium_ ? 8'h38 : _GEN_56; // @[ChiselTop.scala 206:24 216:27]
  wire [7:0] _GEN_58 = 4'h8 == medium_ ? 8'h50 : _GEN_57; // @[ChiselTop.scala 206:24 215:27]
  wire [7:0] _GEN_59 = 4'h7 == medium_ ? 8'h3f : _GEN_58; // @[ChiselTop.scala 206:24 214:27]
  wire [7:0] _GEN_60 = 4'h6 == medium_ ? 8'h6a : _GEN_59; // @[ChiselTop.scala 206:24 213:27]
  wire [7:0] _GEN_61 = 4'h5 == medium_ ? 8'h0 : _GEN_60; // @[ChiselTop.scala 206:24 212:27]
  wire [7:0] _GEN_62 = 4'h4 == medium_ ? 8'h3f : _GEN_61; // @[ChiselTop.scala 206:24 211:27]
  wire [7:0] _GEN_63 = 4'h3 == medium_ ? 8'h38 : _GEN_62; // @[ChiselTop.scala 206:24 210:27]
  wire [7:0] _GEN_64 = 4'h2 == medium_ ? 8'h38 : _GEN_63; // @[ChiselTop.scala 206:24 209:27]
  wire [7:0] _GEN_65 = 4'h1 == medium_ ? 8'h79 : _GEN_64; // @[ChiselTop.scala 206:24 208:27]
  wire [7:0] _GEN_66 = 4'h0 == medium_ ? 8'h76 : _GEN_65; // @[ChiselTop.scala 206:24 207:27]
  wire [7:0] _GEN_67 = 3'h6 == capturedDice ? 8'h7d : 8'h0; // @[ChiselTop.scala 230:30 236:28 33:30]
  wire [7:0] _GEN_68 = 3'h5 == capturedDice ? 8'h6d : _GEN_67; // @[ChiselTop.scala 230:30 235:28]
  wire [7:0] _GEN_69 = 3'h4 == capturedDice ? 8'h66 : _GEN_68; // @[ChiselTop.scala 230:30 234:28]
  wire [7:0] _GEN_70 = 3'h3 == capturedDice ? 8'h4f : _GEN_69; // @[ChiselTop.scala 230:30 233:28]
  wire [7:0] _GEN_71 = 3'h2 == capturedDice ? 8'h5b : _GEN_70; // @[ChiselTop.scala 230:30 232:28]
  wire [7:0] _GEN_72 = 3'h1 == capturedDice ? 8'h6 : _GEN_71; // @[ChiselTop.scala 230:30 231:28]
  wire [6:0] _sevSeg_T = blinkState ? 7'h40 : 7'h0; // @[ChiselTop.scala 249:26]
  wire [1:0] _GEN_73 = 4'h0 == count ? pressedBtn : sequence_0; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_74 = 4'h1 == count ? pressedBtn : sequence_1; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_75 = 4'h2 == count ? pressedBtn : sequence_2; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_76 = 4'h3 == count ? pressedBtn : sequence_3; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_77 = 4'h4 == count ? pressedBtn : sequence_4; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_78 = 4'h5 == count ? pressedBtn : sequence_5; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_79 = 4'h6 == count ? pressedBtn : sequence_6; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_80 = 4'h7 == count ? pressedBtn : sequence_7; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_81 = 4'h8 == count ? pressedBtn : sequence_8; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [1:0] _GEN_82 = 4'h9 == count ? pressedBtn : sequence_9; // @[ChiselTop.scala 252:{31,31} 87:23]
  wire [3:0] _count_T_1 = count + 4'h1; // @[ChiselTop.scala 253:40]
  wire [3:0] _GEN_83 = count == 4'h9 ? 4'h0 : playIdx; // @[ChiselTop.scala 255:42 257:27 89:27]
  wire  _GEN_84 = count == 4'h9 ? 1'h0 : _GEN_28; // @[ChiselTop.scala 255:42 258:27]
  wire [1:0] _GEN_85 = count == 4'h9 ? 2'h1 : state; // @[ChiselTop.scala 255:42 259:27 85:27]
  wire [1:0] _GEN_86 = anyPress ? _GEN_73 : sequence_0; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_87 = anyPress ? _GEN_74 : sequence_1; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_88 = anyPress ? _GEN_75 : sequence_2; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_89 = anyPress ? _GEN_76 : sequence_3; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_90 = anyPress ? _GEN_77 : sequence_4; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_91 = anyPress ? _GEN_78 : sequence_5; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_92 = anyPress ? _GEN_79 : sequence_6; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_93 = anyPress ? _GEN_80 : sequence_7; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_94 = anyPress ? _GEN_81 : sequence_8; // @[ChiselTop.scala 251:28 87:23]
  wire [1:0] _GEN_95 = anyPress ? _GEN_82 : sequence_9; // @[ChiselTop.scala 251:28 87:23]
  wire [3:0] _GEN_96 = anyPress ? _count_T_1 : count; // @[ChiselTop.scala 251:28 253:31 88:27]
  wire [3:0] _GEN_97 = anyPress ? _GEN_83 : playIdx; // @[ChiselTop.scala 251:28 89:27]
  wire  _GEN_98 = anyPress ? _GEN_84 : _GEN_28; // @[ChiselTop.scala 251:28]
  wire [1:0] _GEN_99 = anyPress ? _GEN_85 : state; // @[ChiselTop.scala 251:28 85:27]
  wire [1:0] _GEN_101 = 4'h1 == playIdx ? sequence_1 : sequence_0; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_102 = 4'h2 == playIdx ? sequence_2 : _GEN_101; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_103 = 4'h3 == playIdx ? sequence_3 : _GEN_102; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_104 = 4'h4 == playIdx ? sequence_4 : _GEN_103; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_105 = 4'h5 == playIdx ? sequence_5 : _GEN_104; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_106 = 4'h6 == playIdx ? sequence_6 : _GEN_105; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_107 = 4'h7 == playIdx ? sequence_7 : _GEN_106; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_108 = 4'h8 == playIdx ? sequence_8 : _GEN_107; // @[ChiselTop.scala 59:{10,10}]
  wire [1:0] _GEN_109 = 4'h9 == playIdx ? sequence_9 : _GEN_108; // @[ChiselTop.scala 59:{10,10}]
  wire  _sevSeg_T_1 = _GEN_109 == 2'h0; // @[ChiselTop.scala 59:10]
  wire  _sevSeg_T_2 = _GEN_109 == 2'h1; // @[ChiselTop.scala 60:10]
  wire  _sevSeg_T_3 = _GEN_109 == 2'h2; // @[ChiselTop.scala 61:10]
  wire  _sevSeg_T_4 = _GEN_109 == 2'h3; // @[ChiselTop.scala 62:10]
  wire [6:0] _sevSeg_T_5 = _sevSeg_T_4 ? 7'h66 : 7'h0; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_6 = _sevSeg_T_3 ? 7'h4f : _sevSeg_T_5; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_7 = _sevSeg_T_2 ? 7'h5b : _sevSeg_T_6; // @[Mux.scala 101:16]
  wire [6:0] _sevSeg_T_8 = _sevSeg_T_1 ? 7'h6 : _sevSeg_T_7; // @[Mux.scala 101:16]
  wire [3:0] _playIdx_T_1 = playIdx + 4'h1; // @[ChiselTop.scala 275:36]
  wire [3:0] _GEN_110 = playIdx == 4'h9 ? 4'h0 : count; // @[ChiselTop.scala 270:44 272:24 88:27]
  wire [1:0] _GEN_111 = playIdx == 4'h9 ? 2'h0 : state; // @[ChiselTop.scala 270:44 273:24 85:27]
  wire [3:0] _GEN_112 = playIdx == 4'h9 ? playIdx : _playIdx_T_1; // @[ChiselTop.scala 270:44 275:25 89:27]
  wire  _GEN_113 = playTimer >= 1'h1 ? 1'h0 : _GEN_28; // @[ChiselTop.scala 268:36 269:25]
  wire [3:0] _GEN_114 = playTimer >= 1'h1 ? _GEN_110 : count; // @[ChiselTop.scala 268:36 88:27]
  wire [1:0] _GEN_115 = playTimer >= 1'h1 ? _GEN_111 : state; // @[ChiselTop.scala 268:36 85:27]
  wire [3:0] _GEN_116 = playTimer >= 1'h1 ? _GEN_112 : playIdx; // @[ChiselTop.scala 268:36 89:27]
  wire [7:0] _GEN_117 = 2'h1 == state ? {{1'd0}, _sevSeg_T_8} : 8'h0; // @[ChiselTop.scala 245:23 266:23 33:30]
  wire  _GEN_118 = 2'h1 == state ? _GEN_113 : _GEN_28; // @[ChiselTop.scala 245:23]
  wire [3:0] _GEN_119 = 2'h1 == state ? _GEN_114 : count; // @[ChiselTop.scala 245:23 88:27]
  wire [1:0] _GEN_120 = 2'h1 == state ? _GEN_115 : state; // @[ChiselTop.scala 245:23 85:27]
  wire [3:0] _GEN_121 = 2'h1 == state ? _GEN_116 : playIdx; // @[ChiselTop.scala 245:23 89:27]
  wire [7:0] _GEN_122 = 2'h0 == state ? {{1'd0}, _sevSeg_T} : _GEN_117; // @[ChiselTop.scala 245:23 249:20]
  wire [1:0] _GEN_123 = 2'h0 == state ? _GEN_86 : sequence_0; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_124 = 2'h0 == state ? _GEN_87 : sequence_1; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_125 = 2'h0 == state ? _GEN_88 : sequence_2; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_126 = 2'h0 == state ? _GEN_89 : sequence_3; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_127 = 2'h0 == state ? _GEN_90 : sequence_4; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_128 = 2'h0 == state ? _GEN_91 : sequence_5; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_129 = 2'h0 == state ? _GEN_92 : sequence_6; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_130 = 2'h0 == state ? _GEN_93 : sequence_7; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_131 = 2'h0 == state ? _GEN_94 : sequence_8; // @[ChiselTop.scala 245:23 87:23]
  wire [1:0] _GEN_132 = 2'h0 == state ? _GEN_95 : sequence_9; // @[ChiselTop.scala 245:23 87:23]
  wire [3:0] _GEN_133 = 2'h0 == state ? _GEN_96 : _GEN_119; // @[ChiselTop.scala 245:23]
  wire [3:0] _GEN_134 = 2'h0 == state ? _GEN_97 : _GEN_121; // @[ChiselTop.scala 245:23]
  wire  _GEN_135 = 2'h0 == state ? _GEN_98 : _GEN_118; // @[ChiselTop.scala 245:23]
  wire [1:0] _GEN_136 = 2'h0 == state ? _GEN_99 : _GEN_120; // @[ChiselTop.scala 245:23]
  wire [7:0] _brightness_T_1 = brightness + 8'h1; // @[ChiselTop.scala 287:38]
  wire  _GEN_137 = brightness == 8'hfe ? 1'h0 : changeDirection; // @[ChiselTop.scala 288:{41,59} 44:34]
  wire [7:0] _brightness_T_3 = brightness - 8'h1; // @[ChiselTop.scala 290:38]
  wire  _GEN_138 = brightness == 8'h1 | changeDirection; // @[ChiselTop.scala 291:{39,57} 44:34]
  wire [7:0] _GEN_139 = changeDirection ? _brightness_T_1 : _brightness_T_3; // @[ChiselTop.scala 286:34 287:24 290:24]
  wire  _GEN_140 = changeDirection ? _GEN_137 : _GEN_138; // @[ChiselTop.scala 286:34]
  wire [7:0] _GEN_141 = pulseEdge ? _GEN_139 : brightness; // @[ChiselTop.scala 285:26 43:34]
  wire  _GEN_142 = pulseEdge ? _GEN_140 : changeDirection; // @[ChiselTop.scala 285:26 44:34]
  wire [1:0] _T_81 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_83 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_85 = _T_81 + _T_83; // @[Bitwise.scala 51:90]
  wire [1:0] _T_87 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_89 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_91 = _T_87 + _T_89; // @[Bitwise.scala 51:90]
  wire [3:0] _T_93 = _T_85 + _T_91; // @[Bitwise.scala 51:90]
  wire [3:0] _T_96 = _T_93 - 4'h1; // @[ChiselTop.scala 301:35]
  wire [7:0] _GEN_143 = 4'h7 == _T_96 ? 8'h7 : 8'h0; // @[ChiselTop.scala 301:42 309:28 33:30]
  wire [7:0] _GEN_144 = 4'h6 == _T_96 ? 8'h7d : _GEN_143; // @[ChiselTop.scala 301:42 308:28]
  wire [7:0] _GEN_145 = 4'h5 == _T_96 ? 8'h6d : _GEN_144; // @[ChiselTop.scala 301:42 307:28]
  wire [7:0] _GEN_146 = 4'h4 == _T_96 ? 8'h66 : _GEN_145; // @[ChiselTop.scala 301:42 306:28]
  wire [7:0] _GEN_147 = 4'h3 == _T_96 ? 8'h4f : _GEN_146; // @[ChiselTop.scala 301:42 305:28]
  wire [7:0] _GEN_148 = 4'h2 == _T_96 ? 8'h5b : _GEN_147; // @[ChiselTop.scala 301:42 304:28]
  wire [7:0] _GEN_149 = 4'h1 == _T_96 ? 8'h6 : _GEN_148; // @[ChiselTop.scala 301:42 303:28]
  wire [7:0] _GEN_150 = 4'h0 == _T_96 ? 8'h3f : _GEN_149; // @[ChiselTop.scala 301:42 302:28]
  wire [7:0] _GEN_151 = 3'h7 == mode ? _GEN_150 : 8'h0; // @[ChiselTop.scala 154:18 33:30]
  wire [7:0] _GEN_152 = 3'h6 == mode ? _GEN_141 : brightness; // @[ChiselTop.scala 154:18 43:34]
  wire  _GEN_153 = 3'h6 == mode ? _GEN_142 : changeDirection; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] _GEN_154 = 3'h6 == mode ? 8'hff : _GEN_151; // @[ChiselTop.scala 154:18 295:16]
  wire [7:0] _GEN_155 = 3'h5 == mode ? _GEN_122 : _GEN_154; // @[ChiselTop.scala 154:18]
  wire [1:0] _GEN_156 = 3'h5 == mode ? _GEN_123 : sequence_0; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_157 = 3'h5 == mode ? _GEN_124 : sequence_1; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_158 = 3'h5 == mode ? _GEN_125 : sequence_2; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_159 = 3'h5 == mode ? _GEN_126 : sequence_3; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_160 = 3'h5 == mode ? _GEN_127 : sequence_4; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_161 = 3'h5 == mode ? _GEN_128 : sequence_5; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_162 = 3'h5 == mode ? _GEN_129 : sequence_6; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_163 = 3'h5 == mode ? _GEN_130 : sequence_7; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_164 = 3'h5 == mode ? _GEN_131 : sequence_8; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_165 = 3'h5 == mode ? _GEN_132 : sequence_9; // @[ChiselTop.scala 154:18 87:23]
  wire [3:0] _GEN_166 = 3'h5 == mode ? _GEN_133 : count; // @[ChiselTop.scala 154:18 88:27]
  wire [3:0] _GEN_167 = 3'h5 == mode ? _GEN_134 : playIdx; // @[ChiselTop.scala 154:18 89:27]
  wire  _GEN_168 = 3'h5 == mode ? _GEN_135 : _GEN_28; // @[ChiselTop.scala 154:18]
  wire [1:0] _GEN_169 = 3'h5 == mode ? _GEN_136 : state; // @[ChiselTop.scala 154:18 85:27]
  wire [7:0] _GEN_170 = 3'h5 == mode ? brightness : _GEN_152; // @[ChiselTop.scala 154:18 43:34]
  wire  _GEN_171 = 3'h5 == mode ? changeDirection : _GEN_153; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] _GEN_172 = 3'h4 == mode ? _GEN_72 : _GEN_155; // @[ChiselTop.scala 154:18]
  wire [1:0] _GEN_173 = 3'h4 == mode ? sequence_0 : _GEN_156; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_174 = 3'h4 == mode ? sequence_1 : _GEN_157; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_175 = 3'h4 == mode ? sequence_2 : _GEN_158; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_176 = 3'h4 == mode ? sequence_3 : _GEN_159; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_177 = 3'h4 == mode ? sequence_4 : _GEN_160; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_178 = 3'h4 == mode ? sequence_5 : _GEN_161; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_179 = 3'h4 == mode ? sequence_6 : _GEN_162; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_180 = 3'h4 == mode ? sequence_7 : _GEN_163; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_181 = 3'h4 == mode ? sequence_8 : _GEN_164; // @[ChiselTop.scala 154:18 87:23]
  wire [1:0] _GEN_182 = 3'h4 == mode ? sequence_9 : _GEN_165; // @[ChiselTop.scala 154:18 87:23]
  wire [3:0] _GEN_183 = 3'h4 == mode ? count : _GEN_166; // @[ChiselTop.scala 154:18 88:27]
  wire [3:0] _GEN_184 = 3'h4 == mode ? playIdx : _GEN_167; // @[ChiselTop.scala 154:18 89:27]
  wire  _GEN_185 = 3'h4 == mode ? _GEN_28 : _GEN_168; // @[ChiselTop.scala 154:18]
  wire [1:0] _GEN_186 = 3'h4 == mode ? state : _GEN_169; // @[ChiselTop.scala 154:18 85:27]
  wire [7:0] _GEN_187 = 3'h4 == mode ? brightness : _GEN_170; // @[ChiselTop.scala 154:18 43:34]
  wire  _GEN_188 = 3'h4 == mode ? changeDirection : _GEN_171; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] _GEN_189 = 3'h3 == mode ? _GEN_66 : _GEN_172; // @[ChiselTop.scala 154:18]
  wire [3:0] _GEN_200 = 3'h3 == mode ? count : _GEN_183; // @[ChiselTop.scala 154:18 88:27]
  wire [3:0] _GEN_201 = 3'h3 == mode ? playIdx : _GEN_184; // @[ChiselTop.scala 154:18 89:27]
  wire  _GEN_202 = 3'h3 == mode ? _GEN_28 : _GEN_185; // @[ChiselTop.scala 154:18]
  wire [1:0] _GEN_203 = 3'h3 == mode ? state : _GEN_186; // @[ChiselTop.scala 154:18 85:27]
  wire [7:0] _GEN_204 = 3'h3 == mode ? brightness : _GEN_187; // @[ChiselTop.scala 154:18 43:34]
  wire  _GEN_205 = 3'h3 == mode ? changeDirection : _GEN_188; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] _GEN_206 = 3'h2 == mode ? _GEN_50 : _GEN_189; // @[ChiselTop.scala 154:18]
  wire  _GEN_222 = 3'h2 == mode ? changeDirection : _GEN_205; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] _GEN_223 = 3'h1 == mode ? _GEN_40 : _GEN_206; // @[ChiselTop.scala 154:18]
  wire  _GEN_239 = 3'h1 == mode ? changeDirection : _GEN_222; // @[ChiselTop.scala 154:18 44:34]
  wire [7:0] sevSeg = 3'h0 == mode ? _GEN_34 : _GEN_223; // @[ChiselTop.scala 154:18]
  wire  _GEN_256 = 3'h0 == mode ? changeDirection : _GEN_239; // @[ChiselTop.scala 154:18 44:34]
  wire  anySwitchOn = |io_ui_in; // @[ChiselTop.scala 314:32]
  wire  isPulseMode = mode == 3'h6; // @[ChiselTop.scala 318:29]
  wire  pulseGate = isPulseMode ? pulseSignal : 1'h1; // @[ChiselTop.scala 322:24]
  wire [7:0] _finalSegments_T_1 = pulseGate ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] finalSegments = sevSeg & _finalSegments_T_1; // @[ChiselTop.scala 325:32]
  wire [7:0] _io_uo_out_T = ~finalSegments; // @[ChiselTop.scala 328:35]
  assign io_uo_out = anySwitchOn ? _io_uo_out_T : 8'h7f; // @[ChiselTop.scala 328:21]
  assign io_uio_out = 8'h0; // @[ChiselTop.scala 19:16]
  assign io_uio_oe = 8'hf0; // @[ChiselTop.scala 18:15]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 27:26]
      fast <= 3'h0; // @[ChiselTop.scala 27:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (fast == 3'h6) begin // @[ChiselTop.scala 125:27]
        fast <= 3'h0; // @[ChiselTop.scala 126:14]
      end else begin
        fast <= _fast_T_1; // @[ChiselTop.scala 124:12]
      end
    end
    if (reset) begin // @[ChiselTop.scala 28:26]
      medium_ <= 4'h0; // @[ChiselTop.scala 28:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 129:30]
        if (medium_ == 4'hf) begin // @[ChiselTop.scala 133:32]
          medium_ <= 4'h0; // @[ChiselTop.scala 134:18]
        end else begin
          medium_ <= _medium_T_1; // @[ChiselTop.scala 132:16]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 29:26]
      slow <= 4'h0; // @[ChiselTop.scala 29:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 129:30]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 138:32]
          slow <= _GEN_11;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 30:26]
      tick2hz <= 3'h0; // @[ChiselTop.scala 30:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 129:30]
        tick2hz <= 3'h0; // @[ChiselTop.scala 130:17]
      end else begin
        tick2hz <= _tick2hz_T_1; // @[ChiselTop.scala 128:15]
      end
    end
    if (reset) begin // @[ChiselTop.scala 31:26]
      tick1hz <= 4'h0; // @[ChiselTop.scala 31:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 129:30]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 138:32]
          tick1hz <= 4'h0; // @[ChiselTop.scala 139:19]
        end else begin
          tick1hz <= _tick1hz_T_1; // @[ChiselTop.scala 137:17]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 32:26]
      cntReg <= 32'h0; // @[ChiselTop.scala 32:26]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      cntReg <= 32'h0; // @[ChiselTop.scala 123:14]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 148:16]
    end
    if (reset) begin // @[ChiselTop.scala 34:26]
      diceReg <= 3'h1; // @[ChiselTop.scala 34:26]
    end else if (diceReg == 3'h6) begin // @[ChiselTop.scala 35:19]
      diceReg <= 3'h1;
    end else begin
      diceReg <= _diceReg_T_2;
    end
    switch5EdgeDetector_REG <= io_ui_in[4]; // @[ChiselTop.scala 36:63]
    if (reset) begin // @[ChiselTop.scala 37:31]
      capturedDice <= 3'h0; // @[ChiselTop.scala 37:31]
    end else if (switch5EdgeDetector) begin // @[ChiselTop.scala 38:31]
      capturedDice <= diceReg; // @[ChiselTop.scala 39:20]
    end
    if (reset) begin // @[ChiselTop.scala 43:34]
      brightness <= 8'h0; // @[ChiselTop.scala 43:34]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          brightness <= _GEN_204;
        end
      end
    end
    changeDirection <= reset | _GEN_256; // @[ChiselTop.scala 44:{34,34}]
    if (reset) begin // @[ChiselTop.scala 46:27]
      pulseLog <= 25'h0; // @[ChiselTop.scala 46:27]
    end else begin
      pulseLog <= _pulseLog_T_1; // @[ChiselTop.scala 47:14]
    end
    pulseEdge_REG <= pulseLog[18]; // @[ChiselTop.scala 54:31]
    if (reset) begin // @[ChiselTop.scala 67:27]
      btnS0 <= 4'h0; // @[ChiselTop.scala 67:27]
    end else begin
      btnS0 <= btnRaw; // @[ChiselTop.scala 70:13]
    end
    if (reset) begin // @[ChiselTop.scala 68:27]
      btnS1 <= 4'h0; // @[ChiselTop.scala 68:27]
    end else begin
      btnS1 <= btnS0; // @[ChiselTop.scala 71:13]
    end
    if (reset) begin // @[ChiselTop.scala 69:27]
      btnPrev <= 4'h0; // @[ChiselTop.scala 69:27]
    end else begin
      btnPrev <= btnS1; // @[ChiselTop.scala 73:13]
    end
    if (reset) begin // @[ChiselTop.scala 85:27]
      state <= 2'h0; // @[ChiselTop.scala 85:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          state <= _GEN_203;
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_0 <= _GEN_173;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_1 <= _GEN_174;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_2 <= _GEN_175;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_3 <= _GEN_176;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_4 <= _GEN_177;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_5 <= _GEN_178;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_6 <= _GEN_179;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_7 <= _GEN_180;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_8 <= _GEN_181;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 154:18]
            sequence_9 <= _GEN_182;
          end
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 88:27]
      count <= 4'h0; // @[ChiselTop.scala 88:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          count <= _GEN_200;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 89:27]
      playIdx <= 4'h0; // @[ChiselTop.scala 89:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 154:18]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 154:18]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 154:18]
          playIdx <= _GEN_201;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 91:29]
      playTimer <= 1'h0; // @[ChiselTop.scala 91:29]
    end else if (3'h0 == mode) begin // @[ChiselTop.scala 154:18]
      playTimer <= _GEN_28;
    end else if (3'h1 == mode) begin // @[ChiselTop.scala 154:18]
      playTimer <= _GEN_28;
    end else if (3'h2 == mode) begin // @[ChiselTop.scala 154:18]
      playTimer <= _GEN_28;
    end else begin
      playTimer <= _GEN_202;
    end
    if (reset) begin // @[ChiselTop.scala 92:29]
      blinkState <= 1'h0; // @[ChiselTop.scala 92:29]
    end else if (cntReg == 32'h989680) begin // @[ChiselTop.scala 122:34]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 129:30]
        blinkState <= ~blinkState; // @[ChiselTop.scala 131:20]
      end
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
  brightness = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  changeDirection = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  pulseLog = _RAND_11[24:0];
  _RAND_12 = {1{`RANDOM}};
  pulseEdge_REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  btnS0 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  btnS1 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  btnPrev = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  state = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  sequence_0 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  sequence_1 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  sequence_2 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  sequence_3 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  sequence_4 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  sequence_5 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  sequence_6 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  sequence_7 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  sequence_8 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  sequence_9 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  count = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  playIdx = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  playTimer = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  blinkState = _RAND_30[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
