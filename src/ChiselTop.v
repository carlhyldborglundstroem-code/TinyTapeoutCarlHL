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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 26:24]
  reg [3:0] medium_; // @[ChiselTop.scala 27:24]
  reg [3:0] slow; // @[ChiselTop.scala 28:24]
  reg [2:0] tick2hz; // @[ChiselTop.scala 29:24]
  reg [3:0] tick1hz; // @[ChiselTop.scala 30:24]
  reg [31:0] cntReg; // @[ChiselTop.scala 31:24]
  reg [2:0] diceReg; // @[ChiselTop.scala 33:24]
  reg [23:0] timer; // @[ChiselTop.scala 34:24]
  reg [5:0] seconds; // @[ChiselTop.scala 37:26]
  reg [5:0] minutes; // @[ChiselTop.scala 38:26]
  reg [4:0] hours; // @[ChiselTop.scala 39:26]
  reg [8:0] days; // @[ChiselTop.scala 40:26]
  reg [6:0] years; // @[ChiselTop.scala 41:26]
  reg [15:0] debounce; // @[ChiselTop.scala 51:27]
  reg [1:0] seqMem_0; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_1; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_2; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_3; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_4; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_5; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_6; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_7; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_8; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_9; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_10; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_11; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_12; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_13; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_14; // @[ChiselTop.scala 52:27]
  reg [1:0] seqMem_15; // @[ChiselTop.scala 52:27]
  reg [4:0] gameLevel; // @[ChiselTop.scala 53:27]
  reg [4:0] gameIdx; // @[ChiselTop.scala 54:27]
  reg [2:0] simonState; // @[ChiselTop.scala 55:27]
  wire [2:0] _GEN_1 = io_ui_in[1] ? 3'h1 : 3'h0; // @[ChiselTop.scala 81:28 82:10]
  wire [2:0] _GEN_2 = io_ui_in[2] ? 3'h2 : _GEN_1; // @[ChiselTop.scala 79:28 80:10]
  wire [2:0] _GEN_3 = io_ui_in[3] ? 3'h3 : _GEN_2; // @[ChiselTop.scala 77:28 78:10]
  wire [2:0] _GEN_4 = io_ui_in[4] ? 3'h4 : _GEN_3; // @[ChiselTop.scala 75:28 76:10]
  wire [2:0] _GEN_5 = io_ui_in[5] ? 3'h5 : _GEN_4; // @[ChiselTop.scala 73:28 74:10]
  wire [2:0] _GEN_6 = io_ui_in[6] ? 3'h6 : _GEN_5; // @[ChiselTop.scala 71:28 72:10]
  wire [2:0] mode = io_ui_in[7] ? 3'h7 : _GEN_6; // @[ChiselTop.scala 69:21 70:10]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[ChiselTop.scala 90:20]
  wire [2:0] _diceReg_T_1 = diceReg + 3'h1; // @[ChiselTop.scala 91:22]
  wire [2:0] _fast_T_1 = fast + 3'h1; // @[ChiselTop.scala 99:18]
  wire [2:0] _tick2hz_T_1 = tick2hz + 3'h1; // @[ChiselTop.scala 103:24]
  wire [3:0] _medium_T_1 = medium_ + 4'h1; // @[ChiselTop.scala 106:24]
  wire [3:0] _tick1hz_T_1 = tick1hz + 4'h1; // @[ChiselTop.scala 111:26]
  wire [3:0] _slow_T_1 = slow + 4'h1; // @[ChiselTop.scala 114:22]
  wire [3:0] _GEN_11 = slow == 4'h9 ? 4'h0 : _slow_T_1; // @[ChiselTop.scala 114:14 115:29 116:16]
  wire [5:0] _seconds_T_1 = seconds + 6'h1; // @[ChiselTop.scala 118:28]
  wire [5:0] _minutes_T_1 = minutes + 6'h1; // @[ChiselTop.scala 121:30]
  wire [4:0] _hours_T_1 = hours + 5'h1; // @[ChiselTop.scala 124:28]
  wire [8:0] _days_T_1 = days + 9'h1; // @[ChiselTop.scala 127:28]
  wire [6:0] _years_T_1 = years + 7'h1; // @[ChiselTop.scala 130:32]
  wire [8:0] _GEN_12 = days == 9'h16c ? 9'h0 : _days_T_1; // @[ChiselTop.scala 127:20 128:37 129:22]
  wire [6:0] _GEN_13 = days == 9'h16c ? _years_T_1 : years; // @[ChiselTop.scala 128:37 130:23 41:26]
  wire [4:0] _GEN_14 = hours == 5'h17 ? 5'h0 : _hours_T_1; // @[ChiselTop.scala 124:19 125:35 126:21]
  wire [8:0] _GEN_15 = hours == 5'h17 ? _GEN_12 : days; // @[ChiselTop.scala 125:35 40:26]
  wire [6:0] _GEN_16 = hours == 5'h17 ? _GEN_13 : years; // @[ChiselTop.scala 125:35 41:26]
  wire [5:0] _GEN_17 = minutes == 6'h3b ? 6'h0 : _minutes_T_1; // @[ChiselTop.scala 121:19 122:35 123:21]
  wire [4:0] _GEN_18 = minutes == 6'h3b ? _GEN_14 : hours; // @[ChiselTop.scala 122:35 39:26]
  wire [8:0] _GEN_19 = minutes == 6'h3b ? _GEN_15 : days; // @[ChiselTop.scala 122:35 40:26]
  wire [6:0] _GEN_20 = minutes == 6'h3b ? _GEN_16 : years; // @[ChiselTop.scala 122:35 41:26]
  wire [5:0] _GEN_21 = seconds == 6'h3b ? 6'h0 : _seconds_T_1; // @[ChiselTop.scala 118:17 119:33 120:19]
  wire [5:0] _GEN_22 = seconds == 6'h3b ? _GEN_17 : minutes; // @[ChiselTop.scala 119:33 38:26]
  wire [4:0] _GEN_23 = seconds == 6'h3b ? _GEN_18 : hours; // @[ChiselTop.scala 119:33 39:26]
  wire [8:0] _GEN_24 = seconds == 6'h3b ? _GEN_19 : days; // @[ChiselTop.scala 119:33 40:26]
  wire [6:0] _GEN_25 = seconds == 6'h3b ? _GEN_20 : years; // @[ChiselTop.scala 119:33 41:26]
  wire  _T_20 = 3'h0 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_21 = 3'h1 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_22 = 3'h2 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_23 = 3'h3 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_24 = 3'h4 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_25 = 3'h5 == fast; // @[ChiselTop.scala 148:20]
  wire  _T_26 = 3'h6 == fast; // @[ChiselTop.scala 148:20]
  wire [7:0] _GEN_53 = 3'h6 == fast ? 8'h40 : 8'hff; // @[ChiselTop.scala 148:20 155:25 32:28]
  wire [7:0] _GEN_54 = 3'h5 == fast ? 8'h20 : _GEN_53; // @[ChiselTop.scala 148:20 154:25]
  wire [7:0] _GEN_55 = 3'h4 == fast ? 8'h10 : _GEN_54; // @[ChiselTop.scala 148:20 153:25]
  wire [7:0] _GEN_56 = 3'h3 == fast ? 8'h8 : _GEN_55; // @[ChiselTop.scala 148:20 152:25]
  wire [7:0] _GEN_57 = 3'h2 == fast ? 8'h4 : _GEN_56; // @[ChiselTop.scala 148:20 151:25]
  wire [7:0] _GEN_58 = 3'h1 == fast ? 8'h2 : _GEN_57; // @[ChiselTop.scala 148:20 150:25]
  wire [7:0] _GEN_59 = 3'h0 == fast ? 8'h1 : _GEN_58; // @[ChiselTop.scala 148:20 149:25]
  wire [7:0] _GEN_60 = _T_20 ? 8'h40 : 8'hff; // @[ChiselTop.scala 163:20 170:25 32:28]
  wire [7:0] _GEN_61 = _T_21 ? 8'h20 : _GEN_60; // @[ChiselTop.scala 163:20 169:25]
  wire [7:0] _GEN_62 = _T_22 ? 8'h10 : _GEN_61; // @[ChiselTop.scala 163:20 168:25]
  wire [7:0] _GEN_63 = _T_23 ? 8'h8 : _GEN_62; // @[ChiselTop.scala 163:20 167:25]
  wire [7:0] _GEN_64 = _T_24 ? 8'h4 : _GEN_63; // @[ChiselTop.scala 163:20 166:25]
  wire [7:0] _GEN_65 = _T_25 ? 8'h2 : _GEN_64; // @[ChiselTop.scala 163:20 165:25]
  wire [7:0] _GEN_66 = _T_26 ? 8'h1 : _GEN_65; // @[ChiselTop.scala 163:20 164:25]
  wire [7:0] _GEN_67 = 4'h9 == slow ? 8'h6f : 8'hff; // @[ChiselTop.scala 178:20 188:25 32:28]
  wire [7:0] _GEN_68 = 4'h8 == slow ? 8'h7f : _GEN_67; // @[ChiselTop.scala 178:20 187:25]
  wire [7:0] _GEN_69 = 4'h7 == slow ? 8'h7 : _GEN_68; // @[ChiselTop.scala 178:20 186:25]
  wire [7:0] _GEN_70 = 4'h6 == slow ? 8'h7d : _GEN_69; // @[ChiselTop.scala 178:20 185:25]
  wire [7:0] _GEN_71 = 4'h5 == slow ? 8'h6d : _GEN_70; // @[ChiselTop.scala 178:20 184:25]
  wire [7:0] _GEN_72 = 4'h4 == slow ? 8'h66 : _GEN_71; // @[ChiselTop.scala 178:20 183:25]
  wire [7:0] _GEN_73 = 4'h3 == slow ? 8'h4f : _GEN_72; // @[ChiselTop.scala 178:20 182:25]
  wire [7:0] _GEN_74 = 4'h2 == slow ? 8'h5b : _GEN_73; // @[ChiselTop.scala 178:20 181:25]
  wire [7:0] _GEN_75 = 4'h1 == slow ? 8'h6 : _GEN_74; // @[ChiselTop.scala 178:20 180:25]
  wire [7:0] _GEN_76 = 4'h0 == slow ? 8'h3f : _GEN_75; // @[ChiselTop.scala 178:20 179:25]
  wire [7:0] _GEN_77 = 4'hf == medium_ ? 8'h0 : 8'hff; // @[ChiselTop.scala 196:22 212:26 32:28]
  wire [7:0] _GEN_78 = 4'he == medium_ ? 8'h80 : _GEN_77; // @[ChiselTop.scala 196:22 211:26]
  wire [7:0] _GEN_79 = 4'hd == medium_ ? 8'h0 : _GEN_78; // @[ChiselTop.scala 196:22 210:26]
  wire [7:0] _GEN_80 = 4'hc == medium_ ? 8'h80 : _GEN_79; // @[ChiselTop.scala 196:22 209:26]
  wire [7:0] _GEN_81 = 4'hb == medium_ ? 8'h0 : _GEN_80; // @[ChiselTop.scala 196:22 208:26]
  wire [7:0] _GEN_82 = 4'ha == medium_ ? 8'h5e : _GEN_81; // @[ChiselTop.scala 196:22 207:26]
  wire [7:0] _GEN_83 = 4'h9 == medium_ ? 8'h38 : _GEN_82; // @[ChiselTop.scala 196:22 206:25]
  wire [7:0] _GEN_84 = 4'h8 == medium_ ? 8'h50 : _GEN_83; // @[ChiselTop.scala 196:22 205:25]
  wire [7:0] _GEN_85 = 4'h7 == medium_ ? 8'h3f : _GEN_84; // @[ChiselTop.scala 196:22 204:25]
  wire [7:0] _GEN_86 = 4'h6 == medium_ ? 8'h6a : _GEN_85; // @[ChiselTop.scala 196:22 203:25]
  wire [7:0] _GEN_87 = 4'h5 == medium_ ? 8'h0 : _GEN_86; // @[ChiselTop.scala 196:22 202:25]
  wire [7:0] _GEN_88 = 4'h4 == medium_ ? 8'h3f : _GEN_87; // @[ChiselTop.scala 196:22 201:25]
  wire [7:0] _GEN_89 = 4'h3 == medium_ ? 8'h38 : _GEN_88; // @[ChiselTop.scala 196:22 200:25]
  wire [7:0] _GEN_90 = 4'h2 == medium_ ? 8'h38 : _GEN_89; // @[ChiselTop.scala 196:22 199:25]
  wire [7:0] _GEN_91 = 4'h1 == medium_ ? 8'h79 : _GEN_90; // @[ChiselTop.scala 196:22 198:25]
  wire [7:0] _GEN_92 = 4'h0 == medium_ ? 8'h76 : _GEN_91; // @[ChiselTop.scala 196:22 197:25]
  wire [7:0] _GEN_93 = 3'h6 == diceReg ? 8'h7d : 8'hff; // @[ChiselTop.scala 220:23 227:26 32:28]
  wire [7:0] _GEN_94 = 3'h5 == diceReg ? 8'h6d : _GEN_93; // @[ChiselTop.scala 220:23 226:26]
  wire [7:0] _GEN_95 = 3'h4 == diceReg ? 8'h66 : _GEN_94; // @[ChiselTop.scala 220:23 225:26]
  wire [7:0] _GEN_96 = 3'h3 == diceReg ? 8'h4f : _GEN_95; // @[ChiselTop.scala 220:23 224:26]
  wire [7:0] _GEN_97 = 3'h2 == diceReg ? 8'h5b : _GEN_96; // @[ChiselTop.scala 220:23 223:26]
  wire [7:0] _GEN_98 = 3'h1 == diceReg ? 8'h6 : _GEN_97; // @[ChiselTop.scala 220:23 222:26]
  wire [7:0] _GEN_99 = 3'h0 == diceReg ? 8'h3f : _GEN_98; // @[ChiselTop.scala 220:23 221:26]
  reg [9:0] muxClock; // @[ChiselTop.scala 235:29]
  wire [9:0] _muxClock_T_1 = muxClock + 10'h1; // @[ChiselTop.scala 235:63]
  wire [1:0] currentDigit = muxClock[9:8]; // @[ChiselTop.scala 236:34]
  wire  isBlinking = muxClock[9]; // @[ChiselTop.scala 237:32]
  wire [7:0] _sevSeg_T = isBlinking ? 8'h80 : 8'h0; // @[ChiselTop.scala 242:24]
  wire  _T_74 = |io_ui_in[3:0]; // @[ChiselTop.scala 243:30]
  wire [4:0] _GEN_100 = |io_ui_in[3:0] ? 5'h1 : gameLevel; // @[ChiselTop.scala 243:{35,47} 53:27]
  wire [2:0] _GEN_101 = |io_ui_in[3:0] ? 3'h1 : simonState; // @[ChiselTop.scala 243:{35,66} 55:27]
  wire [4:0] _T_77 = gameLevel - 5'h1; // @[ChiselTop.scala 247:28]
  wire [1:0] _GEN_102 = 4'h0 == _T_77[3:0] ? diceReg[1:0] : seqMem_0; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_103 = 4'h1 == _T_77[3:0] ? diceReg[1:0] : seqMem_1; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_104 = 4'h2 == _T_77[3:0] ? diceReg[1:0] : seqMem_2; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_105 = 4'h3 == _T_77[3:0] ? diceReg[1:0] : seqMem_3; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_106 = 4'h4 == _T_77[3:0] ? diceReg[1:0] : seqMem_4; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_107 = 4'h5 == _T_77[3:0] ? diceReg[1:0] : seqMem_5; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_108 = 4'h6 == _T_77[3:0] ? diceReg[1:0] : seqMem_6; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_109 = 4'h7 == _T_77[3:0] ? diceReg[1:0] : seqMem_7; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_110 = 4'h8 == _T_77[3:0] ? diceReg[1:0] : seqMem_8; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_111 = 4'h9 == _T_77[3:0] ? diceReg[1:0] : seqMem_9; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_112 = 4'ha == _T_77[3:0] ? diceReg[1:0] : seqMem_10; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_113 = 4'hb == _T_77[3:0] ? diceReg[1:0] : seqMem_11; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_114 = 4'hc == _T_77[3:0] ? diceReg[1:0] : seqMem_12; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_115 = 4'hd == _T_77[3:0] ? diceReg[1:0] : seqMem_13; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_116 = 4'he == _T_77[3:0] ? diceReg[1:0] : seqMem_14; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [1:0] _GEN_117 = 4'hf == _T_77[3:0] ? diceReg[1:0] : seqMem_15; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [23:0] _timer_T_1 = timer + 24'h1; // @[ChiselTop.scala 251:26]
  wire  _T_80 = 2'h0 == currentDigit; // @[ChiselTop.scala 252:32]
  wire [1:0] _GEN_119 = 4'h1 == gameIdx[3:0] ? seqMem_1 : seqMem_0; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_120 = 4'h2 == gameIdx[3:0] ? seqMem_2 : _GEN_119; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_121 = 4'h3 == gameIdx[3:0] ? seqMem_3 : _GEN_120; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_122 = 4'h4 == gameIdx[3:0] ? seqMem_4 : _GEN_121; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_123 = 4'h5 == gameIdx[3:0] ? seqMem_5 : _GEN_122; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_124 = 4'h6 == gameIdx[3:0] ? seqMem_6 : _GEN_123; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_125 = 4'h7 == gameIdx[3:0] ? seqMem_7 : _GEN_124; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_126 = 4'h8 == gameIdx[3:0] ? seqMem_8 : _GEN_125; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_127 = 4'h9 == gameIdx[3:0] ? seqMem_9 : _GEN_126; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_128 = 4'ha == gameIdx[3:0] ? seqMem_10 : _GEN_127; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_129 = 4'hb == gameIdx[3:0] ? seqMem_11 : _GEN_128; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_130 = 4'hc == gameIdx[3:0] ? seqMem_12 : _GEN_129; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_131 = 4'hd == gameIdx[3:0] ? seqMem_13 : _GEN_130; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_132 = 4'he == gameIdx[3:0] ? seqMem_14 : _GEN_131; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _GEN_133 = 4'hf == gameIdx[3:0] ? seqMem_15 : _GEN_132; // @[ChiselTop.scala 256:{71,71}]
  wire [1:0] _sevSeg_T_4 = _GEN_133 + 2'h1; // @[ChiselTop.scala 256:71]
  wire [5:0] _sevSeg_T_6 = 2'h1 == _sevSeg_T_4 ? 6'h6 : 6'h3f; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_8 = 2'h2 == _sevSeg_T_4 ? 7'h5b : {{1'd0}, _sevSeg_T_6}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_10 = 2'h3 == _sevSeg_T_4 ? 7'h4f : _sevSeg_T_8; // @[Mux.scala 81:58]
  wire [2:0] _GEN_388 = {{1'd0}, _sevSeg_T_4}; // @[Mux.scala 81:61]
  wire [6:0] _sevSeg_T_12 = 3'h4 == _GEN_388 ? 7'h66 : _sevSeg_T_10; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_14 = 3'h5 == _GEN_388 ? 7'h6d : _sevSeg_T_12; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_16 = 3'h6 == _GEN_388 ? 7'h7d : _sevSeg_T_14; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_18 = 3'h7 == _GEN_388 ? 7'h7 : _sevSeg_T_16; // @[Mux.scala 81:58]
  wire [3:0] _GEN_392 = {{2'd0}, _sevSeg_T_4}; // @[Mux.scala 81:61]
  wire [6:0] _sevSeg_T_20 = 4'h8 == _GEN_392 ? 7'h7f : _sevSeg_T_18; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_22 = 4'h9 == _GEN_392 ? 7'h6f : _sevSeg_T_20; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_24 = 4'ha == _GEN_392 ? 7'h6d : _sevSeg_T_22; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_25 = timer < 24'hf4240 ? _sevSeg_T_24 : 7'h0; // @[ChiselTop.scala 256:28]
  wire [4:0] _sevSeg_T_26 = gameLevel / 4'ha; // @[ChiselTop.scala 258:72]
  wire [5:0] _sevSeg_T_28 = 5'h0 == _sevSeg_T_26 ? 6'h3f : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _sevSeg_T_30 = 5'h1 == _sevSeg_T_26 ? 6'h6 : _sevSeg_T_28; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_32 = 5'h2 == _sevSeg_T_26 ? 7'h5b : {{1'd0}, _sevSeg_T_30}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_34 = 5'h3 == _sevSeg_T_26 ? 7'h4f : _sevSeg_T_32; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_36 = 5'h4 == _sevSeg_T_26 ? 7'h66 : _sevSeg_T_34; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_38 = 5'h5 == _sevSeg_T_26 ? 7'h6d : _sevSeg_T_36; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_40 = 5'h6 == _sevSeg_T_26 ? 7'h7d : _sevSeg_T_38; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_42 = 5'h7 == _sevSeg_T_26 ? 7'h7 : _sevSeg_T_40; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_44 = 5'h8 == _sevSeg_T_26 ? 7'h7f : _sevSeg_T_42; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_46 = 5'h9 == _sevSeg_T_26 ? 7'h6f : _sevSeg_T_44; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_48 = 5'ha == _sevSeg_T_26 ? 7'h6d : _sevSeg_T_46; // @[Mux.scala 81:58]
  wire [4:0] _GEN_0 = gameLevel % 5'ha; // @[ChiselTop.scala 259:72]
  wire [5:0] _sevSeg_T_51 = 4'h0 == _GEN_0[3:0] ? 6'h3f : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _sevSeg_T_53 = 4'h1 == _GEN_0[3:0] ? 6'h6 : _sevSeg_T_51; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_55 = 4'h2 == _GEN_0[3:0] ? 7'h5b : {{1'd0}, _sevSeg_T_53}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_57 = 4'h3 == _GEN_0[3:0] ? 7'h4f : _sevSeg_T_55; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_59 = 4'h4 == _GEN_0[3:0] ? 7'h66 : _sevSeg_T_57; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_61 = 4'h5 == _GEN_0[3:0] ? 7'h6d : _sevSeg_T_59; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_63 = 4'h6 == _GEN_0[3:0] ? 7'h7d : _sevSeg_T_61; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_65 = 4'h7 == _GEN_0[3:0] ? 7'h7 : _sevSeg_T_63; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_67 = 4'h8 == _GEN_0[3:0] ? 7'h7f : _sevSeg_T_65; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_69 = 4'h9 == _GEN_0[3:0] ? 7'h6f : _sevSeg_T_67; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_71 = 4'ha == _GEN_0[3:0] ? 7'h6d : _sevSeg_T_69; // @[Mux.scala 81:58]
  wire [7:0] _GEN_134 = 2'h2 == currentDigit ? 8'h4 : 8'h0; // @[ChiselTop.scala 252:32 259:32 56:32]
  wire [7:0] _GEN_135 = 2'h2 == currentDigit ? {{1'd0}, _sevSeg_T_71} : 8'hff; // @[ChiselTop.scala 252:32 259:52 32:28]
  wire [7:0] _GEN_136 = 2'h1 == currentDigit ? 8'h2 : _GEN_134; // @[ChiselTop.scala 252:32 258:32]
  wire [7:0] _GEN_137 = 2'h1 == currentDigit ? {{1'd0}, _sevSeg_T_48} : _GEN_135; // @[ChiselTop.scala 252:32 258:52]
  wire [7:0] _GEN_138 = 2'h0 == currentDigit ? 8'h1 : _GEN_136; // @[ChiselTop.scala 252:32 254:24]
  wire [7:0] _GEN_139 = 2'h0 == currentDigit ? {{1'd0}, _sevSeg_T_25} : _GEN_137; // @[ChiselTop.scala 252:32 256:22]
  wire [4:0] _gameIdx_T_1 = gameIdx + 5'h1; // @[ChiselTop.scala 262:46]
  wire  _T_86 = gameIdx == _T_77; // @[ChiselTop.scala 263:26]
  wire [4:0] _GEN_140 = gameIdx == _T_77 ? 5'h0 : _gameIdx_T_1; // @[ChiselTop.scala 262:35 263:{47,57}]
  wire [2:0] _GEN_141 = gameIdx == _T_77 ? 3'h3 : simonState; // @[ChiselTop.scala 263:{47,76} 55:27]
  wire [23:0] _GEN_142 = timer == 24'h16e360 ? 24'h0 : _timer_T_1; // @[ChiselTop.scala 251:17 261:37 262:19]
  wire [4:0] _GEN_143 = timer == 24'h16e360 ? _GEN_140 : gameIdx; // @[ChiselTop.scala 261:37 54:27]
  wire [2:0] _GEN_144 = timer == 24'h16e360 ? _GEN_141 : simonState; // @[ChiselTop.scala 261:37 55:27]
  wire [7:0] _GEN_150 = _T_80 ? 8'h80 : _GEN_137; // @[ChiselTop.scala 267:32 268:52]
  wire  _T_94 = _T_74 & debounce == 16'h0; // @[ChiselTop.scala 272:34]
  wire [1:0] _btnVal_T_5 = io_ui_in[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _btnVal_T_6 = io_ui_in[1] ? 2'h1 : _btnVal_T_5; // @[Mux.scala 47:70]
  wire [1:0] btnVal = io_ui_in[0] ? 2'h0 : _btnVal_T_6; // @[Mux.scala 47:70]
  wire [4:0] _gameLevel_T_1 = gameLevel + 5'h1; // @[ChiselTop.scala 279:53]
  wire [2:0] _GEN_167 = gameLevel == 5'h10 ? 3'h4 : 3'h1; // @[ChiselTop.scala 278:{42,55} 279:71]
  wire [4:0] _GEN_168 = gameLevel == 5'h10 ? gameLevel : _gameLevel_T_1; // @[ChiselTop.scala 278:42 53:27 279:40]
  wire [2:0] _GEN_169 = _T_86 ? _GEN_167 : simonState; // @[ChiselTop.scala 277:49 55:27]
  wire [4:0] _GEN_170 = _T_86 ? _GEN_168 : gameLevel; // @[ChiselTop.scala 277:49 53:27]
  wire [4:0] _GEN_171 = btnVal == _GEN_133 ? _gameIdx_T_1 : gameIdx; // @[ChiselTop.scala 275:46 276:23 54:27]
  wire [2:0] _GEN_172 = btnVal == _GEN_133 ? _GEN_169 : 3'h0; // @[ChiselTop.scala 275:46 281:39]
  wire [4:0] _GEN_173 = btnVal == _GEN_133 ? _GEN_170 : gameLevel; // @[ChiselTop.scala 275:46 53:27]
  wire [15:0] _GEN_174 = _T_74 & debounce == 16'h0 ? 16'h9c40 : debounce; // @[ChiselTop.scala 272:55 273:22 51:27]
  wire [4:0] _GEN_175 = _T_74 & debounce == 16'h0 ? _GEN_171 : gameIdx; // @[ChiselTop.scala 272:55 54:27]
  wire [2:0] _GEN_176 = _T_74 & debounce == 16'h0 ? _GEN_172 : simonState; // @[ChiselTop.scala 272:55 55:27]
  wire [4:0] _GEN_177 = _T_74 & debounce == 16'h0 ? _GEN_173 : gameLevel; // @[ChiselTop.scala 272:55 53:27]
  wire [7:0] _sevSeg_T_118 = isBlinking ? 8'hff : 8'h0; // @[ChiselTop.scala 286:24]
  wire [2:0] _GEN_178 = _T_94 ? 3'h0 : simonState; // @[ChiselTop.scala 287:{55,68} 55:27]
  wire [7:0] _GEN_179 = 3'h4 == simonState ? 8'h7 : 8'h0; // @[ChiselTop.scala 239:26 285:20 56:32]
  wire [7:0] _GEN_180 = 3'h4 == simonState ? _sevSeg_T_118 : 8'hff; // @[ChiselTop.scala 239:26 286:18 32:28]
  wire [2:0] _GEN_181 = 3'h4 == simonState ? _GEN_178 : simonState; // @[ChiselTop.scala 239:26 55:27]
  wire [7:0] _GEN_182 = 3'h3 == simonState ? _GEN_138 : _GEN_179; // @[ChiselTop.scala 239:26]
  wire [7:0] _GEN_183 = 3'h3 == simonState ? _GEN_150 : _GEN_180; // @[ChiselTop.scala 239:26]
  wire [15:0] _GEN_184 = 3'h3 == simonState ? _GEN_174 : debounce; // @[ChiselTop.scala 239:26 51:27]
  wire [4:0] _GEN_185 = 3'h3 == simonState ? _GEN_175 : gameIdx; // @[ChiselTop.scala 239:26 54:27]
  wire [2:0] _GEN_186 = 3'h3 == simonState ? _GEN_176 : _GEN_181; // @[ChiselTop.scala 239:26]
  wire [4:0] _GEN_187 = 3'h3 == simonState ? _GEN_177 : gameLevel; // @[ChiselTop.scala 239:26 53:27]
  wire [23:0] _GEN_188 = 3'h2 == simonState ? _GEN_142 : timer; // @[ChiselTop.scala 239:26 34:24]
  wire [7:0] _GEN_189 = 3'h2 == simonState ? _GEN_138 : _GEN_182; // @[ChiselTop.scala 239:26]
  wire [7:0] _GEN_190 = 3'h2 == simonState ? _GEN_139 : _GEN_183; // @[ChiselTop.scala 239:26]
  wire [4:0] _GEN_191 = 3'h2 == simonState ? _GEN_143 : _GEN_185; // @[ChiselTop.scala 239:26]
  wire [2:0] _GEN_192 = 3'h2 == simonState ? _GEN_144 : _GEN_186; // @[ChiselTop.scala 239:26]
  wire [15:0] _GEN_193 = 3'h2 == simonState ? debounce : _GEN_184; // @[ChiselTop.scala 239:26 51:27]
  wire [4:0] _GEN_194 = 3'h2 == simonState ? gameLevel : _GEN_187; // @[ChiselTop.scala 239:26 53:27]
  wire [1:0] _GEN_195 = 3'h1 == simonState ? _GEN_102 : seqMem_0; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_196 = 3'h1 == simonState ? _GEN_103 : seqMem_1; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_197 = 3'h1 == simonState ? _GEN_104 : seqMem_2; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_198 = 3'h1 == simonState ? _GEN_105 : seqMem_3; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_199 = 3'h1 == simonState ? _GEN_106 : seqMem_4; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_200 = 3'h1 == simonState ? _GEN_107 : seqMem_5; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_201 = 3'h1 == simonState ? _GEN_108 : seqMem_6; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_202 = 3'h1 == simonState ? _GEN_109 : seqMem_7; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_203 = 3'h1 == simonState ? _GEN_110 : seqMem_8; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_204 = 3'h1 == simonState ? _GEN_111 : seqMem_9; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_205 = 3'h1 == simonState ? _GEN_112 : seqMem_10; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_206 = 3'h1 == simonState ? _GEN_113 : seqMem_11; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_207 = 3'h1 == simonState ? _GEN_114 : seqMem_12; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_208 = 3'h1 == simonState ? _GEN_115 : seqMem_13; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_209 = 3'h1 == simonState ? _GEN_116 : seqMem_14; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_210 = 3'h1 == simonState ? _GEN_117 : seqMem_15; // @[ChiselTop.scala 239:26 52:27]
  wire [4:0] _GEN_211 = 3'h1 == simonState ? 5'h0 : _GEN_191; // @[ChiselTop.scala 239:26 248:19]
  wire [23:0] _GEN_212 = 3'h1 == simonState ? 24'h0 : _GEN_188; // @[ChiselTop.scala 239:26 248:33]
  wire [2:0] _GEN_213 = 3'h1 == simonState ? 3'h2 : _GEN_192; // @[ChiselTop.scala 239:26 248:52]
  wire [7:0] _GEN_214 = 3'h1 == simonState ? 8'h0 : _GEN_189; // @[ChiselTop.scala 239:26 56:32]
  wire [7:0] _GEN_215 = 3'h1 == simonState ? 8'hff : _GEN_190; // @[ChiselTop.scala 239:26 32:28]
  wire [15:0] _GEN_216 = 3'h1 == simonState ? debounce : _GEN_193; // @[ChiselTop.scala 239:26 51:27]
  wire [4:0] _GEN_217 = 3'h1 == simonState ? gameLevel : _GEN_194; // @[ChiselTop.scala 239:26 53:27]
  wire [7:0] _GEN_218 = 3'h0 == simonState ? 8'h7 : _GEN_214; // @[ChiselTop.scala 239:26 241:20]
  wire [7:0] _GEN_219 = 3'h0 == simonState ? _sevSeg_T : _GEN_215; // @[ChiselTop.scala 239:26 242:18]
  wire [4:0] _GEN_220 = 3'h0 == simonState ? _GEN_100 : _GEN_217; // @[ChiselTop.scala 239:26]
  wire [2:0] _GEN_221 = 3'h0 == simonState ? _GEN_101 : _GEN_213; // @[ChiselTop.scala 239:26]
  wire [1:0] _GEN_222 = 3'h0 == simonState ? seqMem_0 : _GEN_195; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_223 = 3'h0 == simonState ? seqMem_1 : _GEN_196; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_224 = 3'h0 == simonState ? seqMem_2 : _GEN_197; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_225 = 3'h0 == simonState ? seqMem_3 : _GEN_198; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_226 = 3'h0 == simonState ? seqMem_4 : _GEN_199; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_227 = 3'h0 == simonState ? seqMem_5 : _GEN_200; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_228 = 3'h0 == simonState ? seqMem_6 : _GEN_201; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_229 = 3'h0 == simonState ? seqMem_7 : _GEN_202; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_230 = 3'h0 == simonState ? seqMem_8 : _GEN_203; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_231 = 3'h0 == simonState ? seqMem_9 : _GEN_204; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_232 = 3'h0 == simonState ? seqMem_10 : _GEN_205; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_233 = 3'h0 == simonState ? seqMem_11 : _GEN_206; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_234 = 3'h0 == simonState ? seqMem_12 : _GEN_207; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_235 = 3'h0 == simonState ? seqMem_13 : _GEN_208; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_236 = 3'h0 == simonState ? seqMem_14 : _GEN_209; // @[ChiselTop.scala 239:26 52:27]
  wire [1:0] _GEN_237 = 3'h0 == simonState ? seqMem_15 : _GEN_210; // @[ChiselTop.scala 239:26 52:27]
  wire [4:0] _GEN_238 = 3'h0 == simonState ? gameIdx : _GEN_211; // @[ChiselTop.scala 239:26 54:27]
  wire [23:0] _GEN_239 = 3'h0 == simonState ? timer : _GEN_212; // @[ChiselTop.scala 239:26 34:24]
  wire [15:0] _GEN_240 = 3'h0 == simonState ? debounce : _GEN_216; // @[ChiselTop.scala 239:26 51:27]
  wire [1:0] _hammingWeight_T_8 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_10 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_12 = _hammingWeight_T_8 + _hammingWeight_T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_14 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_16 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_18 = _hammingWeight_T_14 + _hammingWeight_T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _hammingWeight_T_20 = _hammingWeight_T_12 + _hammingWeight_T_18; // @[Bitwise.scala 51:90]
  wire [3:0] hammingWeight = _hammingWeight_T_20 - 4'h1; // @[ChiselTop.scala 296:46]
  wire [7:0] _GEN_241 = 4'h7 == hammingWeight ? 8'h7 : 8'hff; // @[ChiselTop.scala 297:29 305:26 32:28]
  wire [7:0] _GEN_242 = 4'h6 == hammingWeight ? 8'h7d : _GEN_241; // @[ChiselTop.scala 297:29 304:26]
  wire [7:0] _GEN_243 = 4'h5 == hammingWeight ? 8'h6d : _GEN_242; // @[ChiselTop.scala 297:29 303:26]
  wire [7:0] _GEN_244 = 4'h4 == hammingWeight ? 8'h66 : _GEN_243; // @[ChiselTop.scala 297:29 302:26]
  wire [7:0] _GEN_245 = 4'h3 == hammingWeight ? 8'h4f : _GEN_244; // @[ChiselTop.scala 297:29 301:26]
  wire [7:0] _GEN_246 = 4'h2 == hammingWeight ? 8'h5b : _GEN_245; // @[ChiselTop.scala 297:29 300:26]
  wire [7:0] _GEN_247 = 4'h1 == hammingWeight ? 8'h6 : _GEN_246; // @[ChiselTop.scala 297:29 299:26]
  wire [7:0] _GEN_248 = 4'h0 == hammingWeight ? 8'h3f : _GEN_247; // @[ChiselTop.scala 297:29 298:26]
  wire [7:0] _GEN_249 = 3'h7 == mode ? _GEN_248 : 8'hff; // @[ChiselTop.scala 142:16 32:28]
  wire [7:0] _GEN_250 = 3'h5 == mode ? _GEN_218 : 8'h0; // @[ChiselTop.scala 142:16 56:32]
  wire [7:0] _GEN_251 = 3'h5 == mode ? _GEN_219 : _GEN_249; // @[ChiselTop.scala 142:16]
  wire [4:0] _GEN_252 = 3'h5 == mode ? _GEN_220 : gameLevel; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_253 = 3'h5 == mode ? _GEN_221 : simonState; // @[ChiselTop.scala 142:16 55:27]
  wire [1:0] _GEN_254 = 3'h5 == mode ? _GEN_222 : seqMem_0; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_255 = 3'h5 == mode ? _GEN_223 : seqMem_1; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_256 = 3'h5 == mode ? _GEN_224 : seqMem_2; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_257 = 3'h5 == mode ? _GEN_225 : seqMem_3; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_258 = 3'h5 == mode ? _GEN_226 : seqMem_4; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_259 = 3'h5 == mode ? _GEN_227 : seqMem_5; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_260 = 3'h5 == mode ? _GEN_228 : seqMem_6; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_261 = 3'h5 == mode ? _GEN_229 : seqMem_7; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_262 = 3'h5 == mode ? _GEN_230 : seqMem_8; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_263 = 3'h5 == mode ? _GEN_231 : seqMem_9; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_264 = 3'h5 == mode ? _GEN_232 : seqMem_10; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_265 = 3'h5 == mode ? _GEN_233 : seqMem_11; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_266 = 3'h5 == mode ? _GEN_234 : seqMem_12; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_267 = 3'h5 == mode ? _GEN_235 : seqMem_13; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_268 = 3'h5 == mode ? _GEN_236 : seqMem_14; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_269 = 3'h5 == mode ? _GEN_237 : seqMem_15; // @[ChiselTop.scala 142:16 52:27]
  wire [4:0] _GEN_270 = 3'h5 == mode ? _GEN_238 : gameIdx; // @[ChiselTop.scala 142:16 54:27]
  wire [23:0] _GEN_271 = 3'h5 == mode ? _GEN_239 : timer; // @[ChiselTop.scala 142:16 34:24]
  wire [15:0] _GEN_272 = 3'h5 == mode ? _GEN_240 : debounce; // @[ChiselTop.scala 142:16 51:27]
  wire [7:0] _GEN_273 = 3'h4 == mode ? _GEN_99 : _GEN_251; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_274 = 3'h4 == mode ? 8'h0 : _GEN_250; // @[ChiselTop.scala 142:16 56:32]
  wire [4:0] _GEN_275 = 3'h4 == mode ? gameLevel : _GEN_252; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_276 = 3'h4 == mode ? simonState : _GEN_253; // @[ChiselTop.scala 142:16 55:27]
  wire [1:0] _GEN_277 = 3'h4 == mode ? seqMem_0 : _GEN_254; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_278 = 3'h4 == mode ? seqMem_1 : _GEN_255; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_279 = 3'h4 == mode ? seqMem_2 : _GEN_256; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_280 = 3'h4 == mode ? seqMem_3 : _GEN_257; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_281 = 3'h4 == mode ? seqMem_4 : _GEN_258; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_282 = 3'h4 == mode ? seqMem_5 : _GEN_259; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_283 = 3'h4 == mode ? seqMem_6 : _GEN_260; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_284 = 3'h4 == mode ? seqMem_7 : _GEN_261; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_285 = 3'h4 == mode ? seqMem_8 : _GEN_262; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_286 = 3'h4 == mode ? seqMem_9 : _GEN_263; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_287 = 3'h4 == mode ? seqMem_10 : _GEN_264; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_288 = 3'h4 == mode ? seqMem_11 : _GEN_265; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_289 = 3'h4 == mode ? seqMem_12 : _GEN_266; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_290 = 3'h4 == mode ? seqMem_13 : _GEN_267; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_291 = 3'h4 == mode ? seqMem_14 : _GEN_268; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_292 = 3'h4 == mode ? seqMem_15 : _GEN_269; // @[ChiselTop.scala 142:16 52:27]
  wire [4:0] _GEN_293 = 3'h4 == mode ? gameIdx : _GEN_270; // @[ChiselTop.scala 142:16 54:27]
  wire [23:0] _GEN_294 = 3'h4 == mode ? timer : _GEN_271; // @[ChiselTop.scala 142:16 34:24]
  wire [15:0] _GEN_295 = 3'h4 == mode ? debounce : _GEN_272; // @[ChiselTop.scala 142:16 51:27]
  wire [7:0] _GEN_296 = 3'h3 == mode ? _GEN_92 : _GEN_273; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_297 = 3'h3 == mode ? 8'h0 : _GEN_274; // @[ChiselTop.scala 142:16 56:32]
  wire [4:0] _GEN_298 = 3'h3 == mode ? gameLevel : _GEN_275; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_299 = 3'h3 == mode ? simonState : _GEN_276; // @[ChiselTop.scala 142:16 55:27]
  wire [1:0] _GEN_300 = 3'h3 == mode ? seqMem_0 : _GEN_277; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_301 = 3'h3 == mode ? seqMem_1 : _GEN_278; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_302 = 3'h3 == mode ? seqMem_2 : _GEN_279; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_303 = 3'h3 == mode ? seqMem_3 : _GEN_280; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_304 = 3'h3 == mode ? seqMem_4 : _GEN_281; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_305 = 3'h3 == mode ? seqMem_5 : _GEN_282; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_306 = 3'h3 == mode ? seqMem_6 : _GEN_283; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_307 = 3'h3 == mode ? seqMem_7 : _GEN_284; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_308 = 3'h3 == mode ? seqMem_8 : _GEN_285; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_309 = 3'h3 == mode ? seqMem_9 : _GEN_286; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_310 = 3'h3 == mode ? seqMem_10 : _GEN_287; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_311 = 3'h3 == mode ? seqMem_11 : _GEN_288; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_312 = 3'h3 == mode ? seqMem_12 : _GEN_289; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_313 = 3'h3 == mode ? seqMem_13 : _GEN_290; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_314 = 3'h3 == mode ? seqMem_14 : _GEN_291; // @[ChiselTop.scala 142:16 52:27]
  wire [1:0] _GEN_315 = 3'h3 == mode ? seqMem_15 : _GEN_292; // @[ChiselTop.scala 142:16 52:27]
  wire [4:0] _GEN_316 = 3'h3 == mode ? gameIdx : _GEN_293; // @[ChiselTop.scala 142:16 54:27]
  wire [23:0] _GEN_317 = 3'h3 == mode ? timer : _GEN_294; // @[ChiselTop.scala 142:16 34:24]
  wire [15:0] _GEN_318 = 3'h3 == mode ? debounce : _GEN_295; // @[ChiselTop.scala 142:16 51:27]
  wire [7:0] _GEN_319 = 3'h2 == mode ? _GEN_76 : _GEN_296; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_320 = 3'h2 == mode ? 8'h0 : _GEN_297; // @[ChiselTop.scala 142:16 56:32]
  wire [7:0] _GEN_342 = 3'h1 == mode ? _GEN_66 : _GEN_319; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_343 = 3'h1 == mode ? 8'h0 : _GEN_320; // @[ChiselTop.scala 142:16 56:32]
  wire [7:0] sevSeg = 3'h0 == mode ? _GEN_59 : _GEN_342; // @[ChiselTop.scala 142:16]
  wire [7:0] uioDrive = 3'h0 == mode ? 8'h0 : _GEN_343; // @[ChiselTop.scala 142:16 56:32]
  wire  centuryLED = years >= 7'h64; // @[ChiselTop.scala 310:25]
  wire  anySwitchOn = |io_ui_in; // @[ChiselTop.scala 311:28]
  wire [7:0] _io_uio_out_T = centuryLED ? 8'h80 : 8'h0; // @[ChiselTop.scala 315:46]
  wire [7:0] _io_uio_out_T_1 = uioDrive | _io_uio_out_T; // @[ChiselTop.scala 315:41]
  assign io_uo_out = anySwitchOn ? sevSeg : 8'h0; // @[ChiselTop.scala 314:18]
  assign io_uio_out = anySwitchOn ? _io_uio_out_T_1 : _io_uio_out_T; // @[ChiselTop.scala 315:18]
  assign io_uio_oe = 8'hff; // @[ChiselTop.scala 18:13]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 26:24]
      fast <= 3'h0; // @[ChiselTop.scala 26:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (fast == 3'h7) begin // @[ChiselTop.scala 100:25]
        fast <= 3'h0; // @[ChiselTop.scala 101:12]
      end else begin
        fast <= _fast_T_1; // @[ChiselTop.scala 99:10]
      end
    end
    if (reset) begin // @[ChiselTop.scala 27:24]
      medium_ <= 4'h0; // @[ChiselTop.scala 27:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (medium_ == 4'hf) begin // @[ChiselTop.scala 107:30]
          medium_ <= 4'h0; // @[ChiselTop.scala 108:16]
        end else begin
          medium_ <= _medium_T_1; // @[ChiselTop.scala 106:14]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 28:24]
      slow <= 4'h0; // @[ChiselTop.scala 28:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          slow <= _GEN_11;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 29:24]
      tick2hz <= 3'h0; // @[ChiselTop.scala 29:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        tick2hz <= 3'h0; // @[ChiselTop.scala 105:15]
      end else begin
        tick2hz <= _tick2hz_T_1; // @[ChiselTop.scala 103:13]
      end
    end
    if (reset) begin // @[ChiselTop.scala 30:24]
      tick1hz <= 4'h0; // @[ChiselTop.scala 30:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          tick1hz <= 4'h0; // @[ChiselTop.scala 113:17]
        end else begin
          tick1hz <= _tick1hz_T_1; // @[ChiselTop.scala 111:15]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 31:24]
      cntReg <= 32'h0; // @[ChiselTop.scala 31:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      cntReg <= 32'h0; // @[ChiselTop.scala 98:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 90:10]
    end
    if (reset) begin // @[ChiselTop.scala 33:24]
      diceReg <= 3'h1; // @[ChiselTop.scala 33:24]
    end else if (diceReg == 3'h7) begin // @[ChiselTop.scala 92:26]
      diceReg <= 3'h1; // @[ChiselTop.scala 93:13]
    end else begin
      diceReg <= _diceReg_T_1; // @[ChiselTop.scala 91:11]
    end
    if (reset) begin // @[ChiselTop.scala 34:24]
      timer <= 24'h0; // @[ChiselTop.scala 34:24]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          timer <= _GEN_317;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 37:26]
      seconds <= 6'h0; // @[ChiselTop.scala 37:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          seconds <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 38:26]
      minutes <= 6'h0; // @[ChiselTop.scala 38:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          minutes <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 39:26]
      hours <= 5'h0; // @[ChiselTop.scala 39:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          hours <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 40:26]
      days <= 9'h0; // @[ChiselTop.scala 40:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          days <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 41:26]
      years <= 7'h0; // @[ChiselTop.scala 41:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 97:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 104:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 112:30]
          years <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 51:27]
      debounce <= 16'h0; // @[ChiselTop.scala 51:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          debounce <= _GEN_318;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_0 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_0 <= _GEN_300;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_1 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_1 <= _GEN_301;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_2 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_2 <= _GEN_302;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_3 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_3 <= _GEN_303;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_4 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_4 <= _GEN_304;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_5 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_5 <= _GEN_305;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_6 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_6 <= _GEN_306;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_7 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_7 <= _GEN_307;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_8 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_8 <= _GEN_308;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_9 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_9 <= _GEN_309;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_10 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_10 <= _GEN_310;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_11 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_11 <= _GEN_311;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_12 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_12 <= _GEN_312;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_13 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_13 <= _GEN_313;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_14 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_14 <= _GEN_314;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_15 <= 2'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_15 <= _GEN_315;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 53:27]
      gameLevel <= 5'h0; // @[ChiselTop.scala 53:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          gameLevel <= _GEN_298;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 54:27]
      gameIdx <= 5'h0; // @[ChiselTop.scala 54:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          gameIdx <= _GEN_316;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 55:27]
      simonState <= 3'h0; // @[ChiselTop.scala 55:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          simonState <= _GEN_299;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 235:29]
      muxClock <= 10'h0; // @[ChiselTop.scala 235:29]
    end else begin
      muxClock <= _muxClock_T_1; // @[ChiselTop.scala 235:51]
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
  timer = _RAND_7[23:0];
  _RAND_8 = {1{`RANDOM}};
  seconds = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  minutes = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  hours = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  days = _RAND_11[8:0];
  _RAND_12 = {1{`RANDOM}};
  years = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  debounce = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  seqMem_0 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  seqMem_1 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  seqMem_2 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  seqMem_3 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  seqMem_4 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  seqMem_5 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  seqMem_6 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  seqMem_7 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  seqMem_8 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  seqMem_9 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  seqMem_10 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  seqMem_11 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  seqMem_12 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  seqMem_13 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  seqMem_14 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  seqMem_15 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  gameLevel = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  gameIdx = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  simonState = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  muxClock = _RAND_33[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
