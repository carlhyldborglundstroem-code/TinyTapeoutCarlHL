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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 26:24]
  reg [3:0] medium_; // @[ChiselTop.scala 27:24]
  reg [3:0] slow; // @[ChiselTop.scala 28:24]
  reg [2:0] tick2hz; // @[ChiselTop.scala 29:24]
  reg [3:0] tick1hz; // @[ChiselTop.scala 30:24]
  reg [21:0] cntReg; // @[ChiselTop.scala 31:24]
  reg [2:0] diceReg; // @[ChiselTop.scala 33:24]
  reg [21:0] timer; // @[ChiselTop.scala 34:24]
  reg [5:0] seconds; // @[ChiselTop.scala 37:26]
  reg [5:0] minutes; // @[ChiselTop.scala 38:26]
  reg [4:0] hours; // @[ChiselTop.scala 39:26]
  reg [8:0] days; // @[ChiselTop.scala 40:26]
  reg [6:0] years; // @[ChiselTop.scala 41:26]
  reg [9:0] muxClock; // @[ChiselTop.scala 51:25]
  wire [9:0] _muxClock_T_1 = muxClock + 10'h1; // @[ChiselTop.scala 52:24]
  reg [1:0] seqMem_0; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_1; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_2; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_3; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_4; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_5; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_6; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_7; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_8; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_9; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_10; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_11; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_12; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_13; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_14; // @[ChiselTop.scala 54:23]
  reg [1:0] seqMem_15; // @[ChiselTop.scala 54:23]
  reg [4:0] gameLevel; // @[ChiselTop.scala 55:27]
  reg [4:0] gameIdx; // @[ChiselTop.scala 56:27]
  reg [2:0] simonState; // @[ChiselTop.scala 57:27]
  wire  _levelTens_T = gameLevel >= 5'ha; // @[ChiselTop.scala 63:30]
  wire [4:0] _levelOnes_T_2 = gameLevel - 5'ha; // @[ChiselTop.scala 64:49]
  wire [4:0] _levelOnes_T_3 = _levelTens_T ? _levelOnes_T_2 : gameLevel; // @[ChiselTop.scala 64:19]
  wire [2:0] _GEN_1 = io_ui_in[1] ? 3'h1 : 3'h0; // @[ChiselTop.scala 89:28 90:10]
  wire [2:0] _GEN_2 = io_ui_in[2] ? 3'h2 : _GEN_1; // @[ChiselTop.scala 87:28 88:10]
  wire [2:0] _GEN_3 = io_ui_in[3] ? 3'h3 : _GEN_2; // @[ChiselTop.scala 85:28 86:10]
  wire [2:0] _GEN_4 = io_ui_in[4] ? 3'h4 : _GEN_3; // @[ChiselTop.scala 83:28 84:10]
  wire [2:0] _GEN_5 = io_ui_in[5] ? 3'h5 : _GEN_4; // @[ChiselTop.scala 81:28 82:10]
  wire [2:0] _GEN_6 = io_ui_in[6] ? 3'h6 : _GEN_5; // @[ChiselTop.scala 79:28 80:10]
  wire [2:0] mode = io_ui_in[7] ? 3'h7 : _GEN_6; // @[ChiselTop.scala 77:21 78:10]
  wire [21:0] _cntReg_T_1 = cntReg + 22'h1; // @[ChiselTop.scala 98:20]
  wire [2:0] _diceReg_T_1 = diceReg + 3'h1; // @[ChiselTop.scala 99:22]
  wire [2:0] _fast_T_1 = fast + 3'h1; // @[ChiselTop.scala 107:18]
  wire [2:0] _tick2hz_T_1 = tick2hz + 3'h1; // @[ChiselTop.scala 111:24]
  wire [3:0] _medium_T_1 = medium_ + 4'h1; // @[ChiselTop.scala 114:24]
  wire [3:0] _tick1hz_T_1 = tick1hz + 4'h1; // @[ChiselTop.scala 119:26]
  wire [3:0] _slow_T_1 = slow + 4'h1; // @[ChiselTop.scala 122:22]
  wire [3:0] _GEN_11 = slow == 4'h9 ? 4'h0 : _slow_T_1; // @[ChiselTop.scala 122:14 123:29 124:16]
  wire [5:0] _seconds_T_1 = seconds + 6'h1; // @[ChiselTop.scala 126:28]
  wire [5:0] _minutes_T_1 = minutes + 6'h1; // @[ChiselTop.scala 129:30]
  wire [4:0] _hours_T_1 = hours + 5'h1; // @[ChiselTop.scala 132:28]
  wire [8:0] _days_T_1 = days + 9'h1; // @[ChiselTop.scala 135:28]
  wire [6:0] _years_T_1 = years + 7'h1; // @[ChiselTop.scala 138:32]
  wire [8:0] _GEN_12 = days == 9'h16c ? 9'h0 : _days_T_1; // @[ChiselTop.scala 135:20 136:37 137:22]
  wire [6:0] _GEN_13 = days == 9'h16c ? _years_T_1 : years; // @[ChiselTop.scala 136:37 138:23 41:26]
  wire [4:0] _GEN_14 = hours == 5'h17 ? 5'h0 : _hours_T_1; // @[ChiselTop.scala 132:19 133:35 134:21]
  wire [8:0] _GEN_15 = hours == 5'h17 ? _GEN_12 : days; // @[ChiselTop.scala 133:35 40:26]
  wire [6:0] _GEN_16 = hours == 5'h17 ? _GEN_13 : years; // @[ChiselTop.scala 133:35 41:26]
  wire [5:0] _GEN_17 = minutes == 6'h3b ? 6'h0 : _minutes_T_1; // @[ChiselTop.scala 129:19 130:35 131:21]
  wire [4:0] _GEN_18 = minutes == 6'h3b ? _GEN_14 : hours; // @[ChiselTop.scala 130:35 39:26]
  wire [8:0] _GEN_19 = minutes == 6'h3b ? _GEN_15 : days; // @[ChiselTop.scala 130:35 40:26]
  wire [6:0] _GEN_20 = minutes == 6'h3b ? _GEN_16 : years; // @[ChiselTop.scala 130:35 41:26]
  wire [5:0] _GEN_21 = seconds == 6'h3b ? 6'h0 : _seconds_T_1; // @[ChiselTop.scala 126:17 127:33 128:19]
  wire [5:0] _GEN_22 = seconds == 6'h3b ? _GEN_17 : minutes; // @[ChiselTop.scala 127:33 38:26]
  wire [4:0] _GEN_23 = seconds == 6'h3b ? _GEN_18 : hours; // @[ChiselTop.scala 127:33 39:26]
  wire [8:0] _GEN_24 = seconds == 6'h3b ? _GEN_19 : days; // @[ChiselTop.scala 127:33 40:26]
  wire [6:0] _GEN_25 = seconds == 6'h3b ? _GEN_20 : years; // @[ChiselTop.scala 127:33 41:26]
  wire  _T_20 = 3'h0 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_21 = 3'h1 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_22 = 3'h2 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_23 = 3'h3 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_24 = 3'h4 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_25 = 3'h5 == fast; // @[ChiselTop.scala 156:20]
  wire  _T_26 = 3'h6 == fast; // @[ChiselTop.scala 156:20]
  wire [7:0] _GEN_53 = 3'h6 == fast ? 8'h40 : 8'hff; // @[ChiselTop.scala 156:20 163:25 32:28]
  wire [7:0] _GEN_54 = 3'h5 == fast ? 8'h20 : _GEN_53; // @[ChiselTop.scala 156:20 162:25]
  wire [7:0] _GEN_55 = 3'h4 == fast ? 8'h10 : _GEN_54; // @[ChiselTop.scala 156:20 161:25]
  wire [7:0] _GEN_56 = 3'h3 == fast ? 8'h8 : _GEN_55; // @[ChiselTop.scala 156:20 160:25]
  wire [7:0] _GEN_57 = 3'h2 == fast ? 8'h4 : _GEN_56; // @[ChiselTop.scala 156:20 159:25]
  wire [7:0] _GEN_58 = 3'h1 == fast ? 8'h2 : _GEN_57; // @[ChiselTop.scala 156:20 158:25]
  wire [7:0] _GEN_59 = 3'h0 == fast ? 8'h1 : _GEN_58; // @[ChiselTop.scala 156:20 157:25]
  wire [7:0] _GEN_60 = _T_20 ? 8'h40 : 8'hff; // @[ChiselTop.scala 171:20 178:25 32:28]
  wire [7:0] _GEN_61 = _T_21 ? 8'h20 : _GEN_60; // @[ChiselTop.scala 171:20 177:25]
  wire [7:0] _GEN_62 = _T_22 ? 8'h10 : _GEN_61; // @[ChiselTop.scala 171:20 176:25]
  wire [7:0] _GEN_63 = _T_23 ? 8'h8 : _GEN_62; // @[ChiselTop.scala 171:20 175:25]
  wire [7:0] _GEN_64 = _T_24 ? 8'h4 : _GEN_63; // @[ChiselTop.scala 171:20 174:25]
  wire [7:0] _GEN_65 = _T_25 ? 8'h2 : _GEN_64; // @[ChiselTop.scala 171:20 173:25]
  wire [7:0] _GEN_66 = _T_26 ? 8'h1 : _GEN_65; // @[ChiselTop.scala 171:20 172:25]
  wire [7:0] _GEN_67 = 4'hf == medium_ ? 8'h0 : 8'hff; // @[ChiselTop.scala 193:22 209:26 32:28]
  wire [7:0] _GEN_68 = 4'he == medium_ ? 8'h80 : _GEN_67; // @[ChiselTop.scala 193:22 208:26]
  wire [7:0] _GEN_69 = 4'hd == medium_ ? 8'h0 : _GEN_68; // @[ChiselTop.scala 193:22 207:26]
  wire [7:0] _GEN_70 = 4'hc == medium_ ? 8'h80 : _GEN_69; // @[ChiselTop.scala 193:22 206:26]
  wire [7:0] _GEN_71 = 4'hb == medium_ ? 8'h0 : _GEN_70; // @[ChiselTop.scala 193:22 205:26]
  wire [7:0] _GEN_72 = 4'ha == medium_ ? 8'h5e : _GEN_71; // @[ChiselTop.scala 193:22 204:26]
  wire [7:0] _GEN_73 = 4'h9 == medium_ ? 8'h38 : _GEN_72; // @[ChiselTop.scala 193:22 203:25]
  wire [7:0] _GEN_74 = 4'h8 == medium_ ? 8'h50 : _GEN_73; // @[ChiselTop.scala 193:22 202:25]
  wire [7:0] _GEN_75 = 4'h7 == medium_ ? 8'h3f : _GEN_74; // @[ChiselTop.scala 193:22 201:25]
  wire [7:0] _GEN_76 = 4'h6 == medium_ ? 8'h6a : _GEN_75; // @[ChiselTop.scala 193:22 200:25]
  wire [7:0] _GEN_77 = 4'h5 == medium_ ? 8'h0 : _GEN_76; // @[ChiselTop.scala 193:22 199:25]
  wire [7:0] _GEN_78 = 4'h4 == medium_ ? 8'h3f : _GEN_77; // @[ChiselTop.scala 193:22 198:25]
  wire [7:0] _GEN_79 = 4'h3 == medium_ ? 8'h38 : _GEN_78; // @[ChiselTop.scala 193:22 197:25]
  wire [7:0] _GEN_80 = 4'h2 == medium_ ? 8'h38 : _GEN_79; // @[ChiselTop.scala 193:22 196:25]
  wire [7:0] _GEN_81 = 4'h1 == medium_ ? 8'h79 : _GEN_80; // @[ChiselTop.scala 193:22 195:25]
  wire [7:0] _GEN_82 = 4'h0 == medium_ ? 8'h76 : _GEN_81; // @[ChiselTop.scala 193:22 194:25]
  wire [7:0] _GEN_83 = 3'h6 == diceReg ? 8'h7d : 8'hff; // @[ChiselTop.scala 217:23 224:26 32:28]
  wire [7:0] _GEN_84 = 3'h5 == diceReg ? 8'h6d : _GEN_83; // @[ChiselTop.scala 217:23 223:26]
  wire [7:0] _GEN_85 = 3'h4 == diceReg ? 8'h66 : _GEN_84; // @[ChiselTop.scala 217:23 222:26]
  wire [7:0] _GEN_86 = 3'h3 == diceReg ? 8'h4f : _GEN_85; // @[ChiselTop.scala 217:23 221:26]
  wire [7:0] _GEN_87 = 3'h2 == diceReg ? 8'h5b : _GEN_86; // @[ChiselTop.scala 217:23 220:26]
  wire [7:0] _GEN_88 = 3'h1 == diceReg ? 8'h6 : _GEN_87; // @[ChiselTop.scala 217:23 219:26]
  wire [7:0] _GEN_89 = 3'h0 == diceReg ? 8'h3f : _GEN_88; // @[ChiselTop.scala 217:23 218:26]
  wire [1:0] currentDigit = muxClock[9:8]; // @[ChiselTop.scala 232:34]
  wire [7:0] _sevSeg_T_1 = muxClock[9] ? 8'h80 : 8'h0; // @[ChiselTop.scala 237:26]
  wire [4:0] _GEN_90 = |io_ui_in[3:0] ? 5'h1 : gameLevel; // @[ChiselTop.scala 238:{35,47} 55:27]
  wire [2:0] _GEN_91 = |io_ui_in[3:0] ? 3'h1 : simonState; // @[ChiselTop.scala 238:{35,66} 57:27]
  wire [4:0] _T_67 = gameLevel - 5'h1; // @[ChiselTop.scala 241:28]
  wire [1:0] _GEN_92 = 4'h0 == _T_67[3:0] ? diceReg[1:0] : seqMem_0; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_93 = 4'h1 == _T_67[3:0] ? diceReg[1:0] : seqMem_1; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_94 = 4'h2 == _T_67[3:0] ? diceReg[1:0] : seqMem_2; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_95 = 4'h3 == _T_67[3:0] ? diceReg[1:0] : seqMem_3; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_96 = 4'h4 == _T_67[3:0] ? diceReg[1:0] : seqMem_4; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_97 = 4'h5 == _T_67[3:0] ? diceReg[1:0] : seqMem_5; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_98 = 4'h6 == _T_67[3:0] ? diceReg[1:0] : seqMem_6; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_99 = 4'h7 == _T_67[3:0] ? diceReg[1:0] : seqMem_7; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_100 = 4'h8 == _T_67[3:0] ? diceReg[1:0] : seqMem_8; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_101 = 4'h9 == _T_67[3:0] ? diceReg[1:0] : seqMem_9; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_102 = 4'ha == _T_67[3:0] ? diceReg[1:0] : seqMem_10; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_103 = 4'hb == _T_67[3:0] ? diceReg[1:0] : seqMem_11; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_104 = 4'hc == _T_67[3:0] ? diceReg[1:0] : seqMem_12; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_105 = 4'hd == _T_67[3:0] ? diceReg[1:0] : seqMem_13; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_106 = 4'he == _T_67[3:0] ? diceReg[1:0] : seqMem_14; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [1:0] _GEN_107 = 4'hf == _T_67[3:0] ? diceReg[1:0] : seqMem_15; // @[ChiselTop.scala 241:{35,35} 54:23]
  wire [21:0] _timer_T_1 = timer + 22'h1; // @[ChiselTop.scala 245:26]
  wire  _T_70 = 2'h0 == currentDigit; // @[ChiselTop.scala 246:32]
  wire [1:0] _GEN_109 = 4'h1 == gameIdx[3:0] ? seqMem_1 : seqMem_0; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_110 = 4'h2 == gameIdx[3:0] ? seqMem_2 : _GEN_109; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_111 = 4'h3 == gameIdx[3:0] ? seqMem_3 : _GEN_110; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_112 = 4'h4 == gameIdx[3:0] ? seqMem_4 : _GEN_111; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_113 = 4'h5 == gameIdx[3:0] ? seqMem_5 : _GEN_112; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_114 = 4'h6 == gameIdx[3:0] ? seqMem_6 : _GEN_113; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_115 = 4'h7 == gameIdx[3:0] ? seqMem_7 : _GEN_114; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_116 = 4'h8 == gameIdx[3:0] ? seqMem_8 : _GEN_115; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_117 = 4'h9 == gameIdx[3:0] ? seqMem_9 : _GEN_116; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_118 = 4'ha == gameIdx[3:0] ? seqMem_10 : _GEN_117; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_119 = 4'hb == gameIdx[3:0] ? seqMem_11 : _GEN_118; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_120 = 4'hc == gameIdx[3:0] ? seqMem_12 : _GEN_119; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_121 = 4'hd == gameIdx[3:0] ? seqMem_13 : _GEN_120; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_122 = 4'he == gameIdx[3:0] ? seqMem_14 : _GEN_121; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _GEN_123 = 4'hf == gameIdx[3:0] ? seqMem_15 : _GEN_122; // @[ChiselTop.scala 247:{101,101}]
  wire [1:0] _sevSeg_T_5 = _GEN_123 + 2'h1; // @[ChiselTop.scala 247:101]
  wire [5:0] _sevSeg_T_7 = 2'h1 == _sevSeg_T_5 ? 6'h6 : 6'h3f; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_9 = 2'h2 == _sevSeg_T_5 ? 7'h5b : {{1'd0}, _sevSeg_T_7}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_11 = 2'h3 == _sevSeg_T_5 ? 7'h4f : _sevSeg_T_9; // @[Mux.scala 81:58]
  wire [2:0] _GEN_337 = {{1'd0}, _sevSeg_T_5}; // @[Mux.scala 81:61]
  wire [6:0] _sevSeg_T_13 = 3'h4 == _GEN_337 ? 7'h66 : _sevSeg_T_11; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_15 = 3'h5 == _GEN_337 ? 7'h6d : _sevSeg_T_13; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_17 = 3'h6 == _GEN_337 ? 7'h7d : _sevSeg_T_15; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_19 = 3'h7 == _GEN_337 ? 7'h7 : _sevSeg_T_17; // @[Mux.scala 81:58]
  wire [3:0] _GEN_341 = {{2'd0}, _sevSeg_T_5}; // @[Mux.scala 81:61]
  wire [6:0] _sevSeg_T_21 = 4'h8 == _GEN_341 ? 7'h7f : _sevSeg_T_19; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_23 = 4'h9 == _GEN_341 ? 7'h6f : _sevSeg_T_21; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_25 = 4'ha == _GEN_341 ? 7'h6d : _sevSeg_T_23; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_26 = timer < 22'hf4240 ? _sevSeg_T_25 : 7'h0; // @[ChiselTop.scala 247:58]
  wire [7:0] _GEN_124 = 2'h2 == currentDigit ? 8'h4 : 8'h0; // @[ChiselTop.scala 246:32 249:32 58:32]
  wire [3:0] levelOnes = _levelOnes_T_3[3:0]; // @[ChiselTop.scala 62:23 64:13]
  wire [3:0] _GEN_125 = 2'h2 == currentDigit ? levelOnes : 4'h0; // @[ChiselTop.scala 246:32 249:58 59:33]
  wire [7:0] _GEN_126 = 2'h1 == currentDigit ? 8'h2 : _GEN_124; // @[ChiselTop.scala 246:32 248:32]
  wire [3:0] levelTens = {{3'd0}, gameLevel >= 5'ha}; // @[ChiselTop.scala 61:23 63:13]
  wire [3:0] _GEN_127 = 2'h1 == currentDigit ? levelTens : _GEN_125; // @[ChiselTop.scala 246:32 248:58]
  wire [7:0] _GEN_128 = 2'h0 == currentDigit ? 8'h1 : _GEN_126; // @[ChiselTop.scala 246:32 247:32]
  wire [7:0] _GEN_129 = 2'h0 == currentDigit ? {{1'd0}, _sevSeg_T_26} : 8'hff; // @[ChiselTop.scala 246:32 247:52 32:28]
  wire [3:0] _GEN_130 = 2'h0 == currentDigit ? 4'h0 : _GEN_127; // @[ChiselTop.scala 246:32 59:33]
  wire [4:0] _gameIdx_T_1 = gameIdx + 5'h1; // @[ChiselTop.scala 252:46]
  wire [4:0] _GEN_131 = gameIdx == _T_67 ? 5'h0 : _gameIdx_T_1; // @[ChiselTop.scala 252:35 253:{47,57}]
  wire [2:0] _GEN_132 = gameIdx == _T_67 ? 3'h3 : simonState; // @[ChiselTop.scala 253:{47,76} 57:27]
  wire [21:0] _GEN_133 = timer == 22'h16e360 ? 22'h0 : _timer_T_1; // @[ChiselTop.scala 245:17 251:37 252:19]
  wire [4:0] _GEN_134 = timer == 22'h16e360 ? _GEN_131 : gameIdx; // @[ChiselTop.scala 251:37 56:27]
  wire [2:0] _GEN_135 = timer == 22'h16e360 ? _GEN_132 : simonState; // @[ChiselTop.scala 251:37 57:27]
  wire [7:0] _GEN_141 = _T_70 ? 8'h80 : 8'hff; // @[ChiselTop.scala 257:32 258:52 32:28]
  wire [7:0] _GEN_143 = 3'h4 == simonState ? 8'h7 : 8'h0; // @[ChiselTop.scala 234:26 265:20 58:32]
  wire [7:0] _GEN_144 = 3'h3 == simonState ? _GEN_128 : _GEN_143; // @[ChiselTop.scala 234:26]
  wire [7:0] _GEN_145 = 3'h3 == simonState ? _GEN_141 : 8'hff; // @[ChiselTop.scala 234:26 32:28]
  wire [3:0] _GEN_146 = 3'h3 == simonState ? _GEN_130 : 4'h0; // @[ChiselTop.scala 234:26 59:33]
  wire [21:0] _GEN_147 = 3'h2 == simonState ? _GEN_133 : timer; // @[ChiselTop.scala 234:26 34:24]
  wire [7:0] _GEN_148 = 3'h2 == simonState ? _GEN_128 : _GEN_144; // @[ChiselTop.scala 234:26]
  wire [7:0] _GEN_149 = 3'h2 == simonState ? _GEN_129 : _GEN_145; // @[ChiselTop.scala 234:26]
  wire [3:0] _GEN_150 = 3'h2 == simonState ? _GEN_130 : _GEN_146; // @[ChiselTop.scala 234:26]
  wire [4:0] _GEN_151 = 3'h2 == simonState ? _GEN_134 : gameIdx; // @[ChiselTop.scala 234:26 56:27]
  wire [2:0] _GEN_152 = 3'h2 == simonState ? _GEN_135 : simonState; // @[ChiselTop.scala 234:26 57:27]
  wire [1:0] _GEN_153 = 3'h1 == simonState ? _GEN_92 : seqMem_0; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_154 = 3'h1 == simonState ? _GEN_93 : seqMem_1; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_155 = 3'h1 == simonState ? _GEN_94 : seqMem_2; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_156 = 3'h1 == simonState ? _GEN_95 : seqMem_3; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_157 = 3'h1 == simonState ? _GEN_96 : seqMem_4; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_158 = 3'h1 == simonState ? _GEN_97 : seqMem_5; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_159 = 3'h1 == simonState ? _GEN_98 : seqMem_6; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_160 = 3'h1 == simonState ? _GEN_99 : seqMem_7; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_161 = 3'h1 == simonState ? _GEN_100 : seqMem_8; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_162 = 3'h1 == simonState ? _GEN_101 : seqMem_9; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_163 = 3'h1 == simonState ? _GEN_102 : seqMem_10; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_164 = 3'h1 == simonState ? _GEN_103 : seqMem_11; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_165 = 3'h1 == simonState ? _GEN_104 : seqMem_12; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_166 = 3'h1 == simonState ? _GEN_105 : seqMem_13; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_167 = 3'h1 == simonState ? _GEN_106 : seqMem_14; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_168 = 3'h1 == simonState ? _GEN_107 : seqMem_15; // @[ChiselTop.scala 234:26 54:23]
  wire [4:0] _GEN_169 = 3'h1 == simonState ? 5'h0 : _GEN_151; // @[ChiselTop.scala 234:26 242:19]
  wire [21:0] _GEN_170 = 3'h1 == simonState ? 22'h0 : _GEN_147; // @[ChiselTop.scala 234:26 242:33]
  wire [2:0] _GEN_171 = 3'h1 == simonState ? 3'h2 : _GEN_152; // @[ChiselTop.scala 234:26 242:52]
  wire [7:0] _GEN_172 = 3'h1 == simonState ? 8'h0 : _GEN_148; // @[ChiselTop.scala 234:26 58:32]
  wire [7:0] _GEN_173 = 3'h1 == simonState ? 8'hff : _GEN_149; // @[ChiselTop.scala 234:26 32:28]
  wire [3:0] _GEN_174 = 3'h1 == simonState ? 4'h0 : _GEN_150; // @[ChiselTop.scala 234:26 59:33]
  wire [7:0] _GEN_175 = 3'h0 == simonState ? 8'h7 : _GEN_172; // @[ChiselTop.scala 234:26 236:20]
  wire [7:0] _GEN_176 = 3'h0 == simonState ? _sevSeg_T_1 : _GEN_173; // @[ChiselTop.scala 234:26 237:20]
  wire [4:0] _GEN_177 = 3'h0 == simonState ? _GEN_90 : gameLevel; // @[ChiselTop.scala 234:26 55:27]
  wire [2:0] _GEN_178 = 3'h0 == simonState ? _GEN_91 : _GEN_171; // @[ChiselTop.scala 234:26]
  wire [1:0] _GEN_179 = 3'h0 == simonState ? seqMem_0 : _GEN_153; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_180 = 3'h0 == simonState ? seqMem_1 : _GEN_154; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_181 = 3'h0 == simonState ? seqMem_2 : _GEN_155; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_182 = 3'h0 == simonState ? seqMem_3 : _GEN_156; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_183 = 3'h0 == simonState ? seqMem_4 : _GEN_157; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_184 = 3'h0 == simonState ? seqMem_5 : _GEN_158; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_185 = 3'h0 == simonState ? seqMem_6 : _GEN_159; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_186 = 3'h0 == simonState ? seqMem_7 : _GEN_160; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_187 = 3'h0 == simonState ? seqMem_8 : _GEN_161; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_188 = 3'h0 == simonState ? seqMem_9 : _GEN_162; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_189 = 3'h0 == simonState ? seqMem_10 : _GEN_163; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_190 = 3'h0 == simonState ? seqMem_11 : _GEN_164; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_191 = 3'h0 == simonState ? seqMem_12 : _GEN_165; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_192 = 3'h0 == simonState ? seqMem_13 : _GEN_166; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_193 = 3'h0 == simonState ? seqMem_14 : _GEN_167; // @[ChiselTop.scala 234:26 54:23]
  wire [1:0] _GEN_194 = 3'h0 == simonState ? seqMem_15 : _GEN_168; // @[ChiselTop.scala 234:26 54:23]
  wire [4:0] _GEN_195 = 3'h0 == simonState ? gameIdx : _GEN_169; // @[ChiselTop.scala 234:26 56:27]
  wire [21:0] _GEN_196 = 3'h0 == simonState ? timer : _GEN_170; // @[ChiselTop.scala 234:26 34:24]
  wire [3:0] _GEN_197 = 3'h0 == simonState ? 4'h0 : _GEN_174; // @[ChiselTop.scala 234:26 59:33]
  wire [1:0] _displayValue_T_8 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _displayValue_T_10 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _displayValue_T_12 = _displayValue_T_8 + _displayValue_T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _displayValue_T_14 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _displayValue_T_16 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _displayValue_T_18 = _displayValue_T_14 + _displayValue_T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _displayValue_T_20 = _displayValue_T_12 + _displayValue_T_18; // @[Bitwise.scala 51:90]
  wire [3:0] _displayValue_T_23 = _displayValue_T_20 - 4'h1; // @[ChiselTop.scala 274:42]
  wire [3:0] _GEN_198 = 3'h7 == mode ? _displayValue_T_23 : 4'h0; // @[ChiselTop.scala 150:16 274:20 59:33]
  wire [7:0] _GEN_199 = 3'h5 == mode ? _GEN_175 : 8'h0; // @[ChiselTop.scala 150:16 58:32]
  wire [7:0] _GEN_200 = 3'h5 == mode ? _GEN_176 : 8'hff; // @[ChiselTop.scala 150:16 32:28]
  wire [4:0] _GEN_201 = 3'h5 == mode ? _GEN_177 : gameLevel; // @[ChiselTop.scala 150:16 55:27]
  wire [2:0] _GEN_202 = 3'h5 == mode ? _GEN_178 : simonState; // @[ChiselTop.scala 150:16 57:27]
  wire [1:0] _GEN_203 = 3'h5 == mode ? _GEN_179 : seqMem_0; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_204 = 3'h5 == mode ? _GEN_180 : seqMem_1; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_205 = 3'h5 == mode ? _GEN_181 : seqMem_2; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_206 = 3'h5 == mode ? _GEN_182 : seqMem_3; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_207 = 3'h5 == mode ? _GEN_183 : seqMem_4; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_208 = 3'h5 == mode ? _GEN_184 : seqMem_5; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_209 = 3'h5 == mode ? _GEN_185 : seqMem_6; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_210 = 3'h5 == mode ? _GEN_186 : seqMem_7; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_211 = 3'h5 == mode ? _GEN_187 : seqMem_8; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_212 = 3'h5 == mode ? _GEN_188 : seqMem_9; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_213 = 3'h5 == mode ? _GEN_189 : seqMem_10; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_214 = 3'h5 == mode ? _GEN_190 : seqMem_11; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_215 = 3'h5 == mode ? _GEN_191 : seqMem_12; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_216 = 3'h5 == mode ? _GEN_192 : seqMem_13; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_217 = 3'h5 == mode ? _GEN_193 : seqMem_14; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_218 = 3'h5 == mode ? _GEN_194 : seqMem_15; // @[ChiselTop.scala 150:16 54:23]
  wire [4:0] _GEN_219 = 3'h5 == mode ? _GEN_195 : gameIdx; // @[ChiselTop.scala 150:16 56:27]
  wire [21:0] _GEN_220 = 3'h5 == mode ? _GEN_196 : timer; // @[ChiselTop.scala 150:16 34:24]
  wire [3:0] _GEN_221 = 3'h5 == mode ? _GEN_197 : _GEN_198; // @[ChiselTop.scala 150:16]
  wire [7:0] _GEN_222 = 3'h4 == mode ? _GEN_89 : _GEN_200; // @[ChiselTop.scala 150:16]
  wire [7:0] _GEN_223 = 3'h4 == mode ? 8'h0 : _GEN_199; // @[ChiselTop.scala 150:16 58:32]
  wire [4:0] _GEN_224 = 3'h4 == mode ? gameLevel : _GEN_201; // @[ChiselTop.scala 150:16 55:27]
  wire [2:0] _GEN_225 = 3'h4 == mode ? simonState : _GEN_202; // @[ChiselTop.scala 150:16 57:27]
  wire [1:0] _GEN_226 = 3'h4 == mode ? seqMem_0 : _GEN_203; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_227 = 3'h4 == mode ? seqMem_1 : _GEN_204; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_228 = 3'h4 == mode ? seqMem_2 : _GEN_205; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_229 = 3'h4 == mode ? seqMem_3 : _GEN_206; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_230 = 3'h4 == mode ? seqMem_4 : _GEN_207; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_231 = 3'h4 == mode ? seqMem_5 : _GEN_208; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_232 = 3'h4 == mode ? seqMem_6 : _GEN_209; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_233 = 3'h4 == mode ? seqMem_7 : _GEN_210; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_234 = 3'h4 == mode ? seqMem_8 : _GEN_211; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_235 = 3'h4 == mode ? seqMem_9 : _GEN_212; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_236 = 3'h4 == mode ? seqMem_10 : _GEN_213; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_237 = 3'h4 == mode ? seqMem_11 : _GEN_214; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_238 = 3'h4 == mode ? seqMem_12 : _GEN_215; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_239 = 3'h4 == mode ? seqMem_13 : _GEN_216; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_240 = 3'h4 == mode ? seqMem_14 : _GEN_217; // @[ChiselTop.scala 150:16 54:23]
  wire [1:0] _GEN_241 = 3'h4 == mode ? seqMem_15 : _GEN_218; // @[ChiselTop.scala 150:16 54:23]
  wire [4:0] _GEN_242 = 3'h4 == mode ? gameIdx : _GEN_219; // @[ChiselTop.scala 150:16 56:27]
  wire [21:0] _GEN_243 = 3'h4 == mode ? timer : _GEN_220; // @[ChiselTop.scala 150:16 34:24]
  wire [3:0] _GEN_244 = 3'h4 == mode ? 4'h0 : _GEN_221; // @[ChiselTop.scala 150:16 59:33]
  wire [7:0] _GEN_245 = 3'h3 == mode ? _GEN_82 : _GEN_222; // @[ChiselTop.scala 150:16]
  wire [7:0] _GEN_246 = 3'h3 == mode ? 8'h0 : _GEN_223; // @[ChiselTop.scala 150:16 58:32]
  wire [4:0] _GEN_247 = 3'h3 == mode ? gameLevel : _GEN_224; // @[ChiselTop.scala 150:16 55:27]
  wire [2:0] _GEN_248 = 3'h3 == mode ? simonState : _GEN_225; // @[ChiselTop.scala 150:16 57:27]
  wire [4:0] _GEN_265 = 3'h3 == mode ? gameIdx : _GEN_242; // @[ChiselTop.scala 150:16 56:27]
  wire [21:0] _GEN_266 = 3'h3 == mode ? timer : _GEN_243; // @[ChiselTop.scala 150:16 34:24]
  wire [3:0] _GEN_267 = 3'h3 == mode ? 4'h0 : _GEN_244; // @[ChiselTop.scala 150:16 59:33]
  wire [3:0] _GEN_268 = 3'h2 == mode ? slow : _GEN_267; // @[ChiselTop.scala 150:16 186:20]
  wire [7:0] _GEN_269 = 3'h2 == mode ? 8'hff : _GEN_245; // @[ChiselTop.scala 150:16 32:28]
  wire [7:0] _GEN_270 = 3'h2 == mode ? 8'h0 : _GEN_246; // @[ChiselTop.scala 150:16 58:32]
  wire [7:0] _GEN_291 = 3'h1 == mode ? _GEN_66 : _GEN_269; // @[ChiselTop.scala 150:16]
  wire [3:0] _GEN_292 = 3'h1 == mode ? 4'h0 : _GEN_268; // @[ChiselTop.scala 150:16 59:33]
  wire [7:0] _GEN_293 = 3'h1 == mode ? 8'h0 : _GEN_270; // @[ChiselTop.scala 150:16 58:32]
  wire [7:0] sevSeg = 3'h0 == mode ? _GEN_59 : _GEN_291; // @[ChiselTop.scala 150:16]
  wire [3:0] displayValue = 3'h0 == mode ? 4'h0 : _GEN_292; // @[ChiselTop.scala 150:16 59:33]
  wire [7:0] uioDrive = 3'h0 == mode ? 8'h0 : _GEN_293; // @[ChiselTop.scala 150:16 58:32]
  wire  isLevelDisplay = mode == 3'h5 & currentDigit != 2'h0; // @[ChiselTop.scala 279:36]
  wire  useFoldedLogic = mode == 3'h2 | mode == 3'h7 | isLevelDisplay; // @[ChiselTop.scala 281:52]
  wire [5:0] _finalSegments_T_1 = 4'h0 == displayValue ? 6'h3f : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _finalSegments_T_3 = 4'h1 == displayValue ? 6'h6 : _finalSegments_T_1; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_5 = 4'h2 == displayValue ? 7'h5b : {{1'd0}, _finalSegments_T_3}; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_7 = 4'h3 == displayValue ? 7'h4f : _finalSegments_T_5; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_9 = 4'h4 == displayValue ? 7'h66 : _finalSegments_T_7; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_11 = 4'h5 == displayValue ? 7'h6d : _finalSegments_T_9; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_13 = 4'h6 == displayValue ? 7'h7d : _finalSegments_T_11; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_15 = 4'h7 == displayValue ? 7'h7 : _finalSegments_T_13; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_17 = 4'h8 == displayValue ? 7'h7f : _finalSegments_T_15; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_19 = 4'h9 == displayValue ? 7'h6f : _finalSegments_T_17; // @[Mux.scala 81:58]
  wire [6:0] _finalSegments_T_21 = 4'ha == displayValue ? 7'h6d : _finalSegments_T_19; // @[Mux.scala 81:58]
  wire [7:0] _finalSegments_T_23 = {{1'd0}, _finalSegments_T_21}; // @[ChiselTop.scala 286:46]
  wire [7:0] finalSegments = useFoldedLogic ? _finalSegments_T_23 : sevSeg; // @[ChiselTop.scala 285:24]
  wire  centuryLED = years >= 7'h64; // @[ChiselTop.scala 290:27]
  wire  anySwitchOn = |io_ui_in; // @[ChiselTop.scala 291:30]
  wire [7:0] _io_uio_out_T = centuryLED ? 8'h80 : 8'h0; // @[ChiselTop.scala 296:35]
  wire [7:0] _io_uio_out_T_1 = uioDrive | _io_uio_out_T; // @[ChiselTop.scala 296:30]
  assign io_uo_out = anySwitchOn ? finalSegments : 8'h0; // @[ChiselTop.scala 294:20]
  assign io_uio_out = anySwitchOn ? _io_uio_out_T_1 : _io_uio_out_T; // @[ChiselTop.scala 295:20]
  assign io_uio_oe = 8'hff; // @[ChiselTop.scala 18:13]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 26:24]
      fast <= 3'h0; // @[ChiselTop.scala 26:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (fast == 3'h7) begin // @[ChiselTop.scala 108:25]
        fast <= 3'h0; // @[ChiselTop.scala 109:12]
      end else begin
        fast <= _fast_T_1; // @[ChiselTop.scala 107:10]
      end
    end
    if (reset) begin // @[ChiselTop.scala 27:24]
      medium_ <= 4'h0; // @[ChiselTop.scala 27:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (medium_ == 4'hf) begin // @[ChiselTop.scala 115:30]
          medium_ <= 4'h0; // @[ChiselTop.scala 116:16]
        end else begin
          medium_ <= _medium_T_1; // @[ChiselTop.scala 114:14]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 28:24]
      slow <= 4'h0; // @[ChiselTop.scala 28:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          slow <= _GEN_11;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 29:24]
      tick2hz <= 3'h0; // @[ChiselTop.scala 29:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        tick2hz <= 3'h0; // @[ChiselTop.scala 113:15]
      end else begin
        tick2hz <= _tick2hz_T_1; // @[ChiselTop.scala 111:13]
      end
    end
    if (reset) begin // @[ChiselTop.scala 30:24]
      tick1hz <= 4'h0; // @[ChiselTop.scala 30:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          tick1hz <= 4'h0; // @[ChiselTop.scala 121:17]
        end else begin
          tick1hz <= _tick1hz_T_1; // @[ChiselTop.scala 119:15]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 31:24]
      cntReg <= 22'h0; // @[ChiselTop.scala 31:24]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      cntReg <= 22'h0; // @[ChiselTop.scala 106:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 98:10]
    end
    if (reset) begin // @[ChiselTop.scala 33:24]
      diceReg <= 3'h1; // @[ChiselTop.scala 33:24]
    end else if (diceReg == 3'h7) begin // @[ChiselTop.scala 100:26]
      diceReg <= 3'h1; // @[ChiselTop.scala 101:13]
    end else begin
      diceReg <= _diceReg_T_1; // @[ChiselTop.scala 99:11]
    end
    if (reset) begin // @[ChiselTop.scala 34:24]
      timer <= 22'h0; // @[ChiselTop.scala 34:24]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          timer <= _GEN_266;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 37:26]
      seconds <= 6'h0; // @[ChiselTop.scala 37:26]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          seconds <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 38:26]
      minutes <= 6'h0; // @[ChiselTop.scala 38:26]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          minutes <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 39:26]
      hours <= 5'h0; // @[ChiselTop.scala 39:26]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          hours <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 40:26]
      days <= 9'h0; // @[ChiselTop.scala 40:26]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          days <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 41:26]
      years <= 7'h0; // @[ChiselTop.scala 41:26]
    end else if (cntReg == 22'h2625a0) begin // @[ChiselTop.scala 105:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 112:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 120:30]
          years <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 51:25]
      muxClock <= 10'h0; // @[ChiselTop.scala 51:25]
    end else begin
      muxClock <= _muxClock_T_1; // @[ChiselTop.scala 52:12]
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_0 <= _GEN_226;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_1 <= _GEN_227;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_2 <= _GEN_228;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_3 <= _GEN_229;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_4 <= _GEN_230;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_5 <= _GEN_231;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_6 <= _GEN_232;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_7 <= _GEN_233;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_8 <= _GEN_234;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_9 <= _GEN_235;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_10 <= _GEN_236;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_11 <= _GEN_237;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_12 <= _GEN_238;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_13 <= _GEN_239;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_14 <= _GEN_240;
          end
        end
      end
    end
    if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          if (!(3'h3 == mode)) begin // @[ChiselTop.scala 150:16]
            seqMem_15 <= _GEN_241;
          end
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 55:27]
      gameLevel <= 5'h0; // @[ChiselTop.scala 55:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          gameLevel <= _GEN_247;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 56:27]
      gameIdx <= 5'h0; // @[ChiselTop.scala 56:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          gameIdx <= _GEN_265;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 57:27]
      simonState <= 3'h0; // @[ChiselTop.scala 57:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 150:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 150:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 150:16]
          simonState <= _GEN_248;
        end
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
  cntReg = _RAND_5[21:0];
  _RAND_6 = {1{`RANDOM}};
  diceReg = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  timer = _RAND_7[21:0];
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
  muxClock = _RAND_13[9:0];
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
