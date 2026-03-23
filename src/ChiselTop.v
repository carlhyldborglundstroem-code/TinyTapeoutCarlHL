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
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 26:24]
  reg [3:0] medium_; // @[ChiselTop.scala 27:24]
  reg [3:0] slow; // @[ChiselTop.scala 28:24]
  reg [2:0] tick2hz; // @[ChiselTop.scala 29:24]
  reg [3:0] tick1hz; // @[ChiselTop.scala 30:24]
  reg [31:0] cntReg; // @[ChiselTop.scala 31:24]
  reg [2:0] diceReg; // @[ChiselTop.scala 33:24]
  reg [31:0] timer; // @[ChiselTop.scala 34:24]
  reg [5:0] seconds; // @[ChiselTop.scala 37:26]
  reg [5:0] minutes; // @[ChiselTop.scala 38:26]
  reg [4:0] hours; // @[ChiselTop.scala 39:26]
  reg [8:0] days; // @[ChiselTop.scala 40:26]
  reg [6:0] years; // @[ChiselTop.scala 41:26]
  reg [3:0] pwmCount; // @[ChiselTop.scala 44:32]
  reg [3:0] brightness; // @[ChiselTop.scala 45:32]
  reg  changeDirection; // @[ChiselTop.scala 46:32]
  wire  ledStatus = pwmCount < brightness; // @[ChiselTop.scala 47:28]
  reg [19:0] debounce; // @[ChiselTop.scala 51:27]
  reg [2:0] seqMem_0; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_1; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_2; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_3; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_4; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_5; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_6; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_7; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_8; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_9; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_10; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_11; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_12; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_13; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_14; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_15; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_16; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_17; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_18; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_19; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_20; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_21; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_22; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_23; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_24; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_25; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_26; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_27; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_28; // @[ChiselTop.scala 52:27]
  reg [2:0] seqMem_29; // @[ChiselTop.scala 52:27]
  reg [5:0] gameLevel; // @[ChiselTop.scala 53:27]
  reg [5:0] gameIdx; // @[ChiselTop.scala 54:27]
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
  wire [3:0] _pwmCount_T_1 = pwmCount + 4'h1; // @[ChiselTop.scala 95:24]
  wire  _T_9 = cntReg == 32'h2625a0; // @[ChiselTop.scala 97:16]
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
  reg [11:0] muxClock; // @[ChiselTop.scala 235:29]
  wire [11:0] _muxClock_T_1 = muxClock + 12'h1; // @[ChiselTop.scala 235:63]
  wire [1:0] currentDigit = muxClock[11:10]; // @[ChiselTop.scala 236:34]
  reg [20:0] blinkTimer; // @[ChiselTop.scala 237:31]
  wire [20:0] _blinkTimer_T_1 = blinkTimer + 21'h1; // @[ChiselTop.scala 237:69]
  wire  isBlinking = blinkTimer[20]; // @[ChiselTop.scala 238:34]
  wire [7:0] _sevSeg_T = isBlinking ? 8'h80 : 8'h0; // @[ChiselTop.scala 243:24]
  wire  _T_74 = |io_ui_in[3:0]; // @[ChiselTop.scala 244:30]
  wire [5:0] _GEN_100 = |io_ui_in[3:0] ? 6'h1 : gameLevel; // @[ChiselTop.scala 244:{35,47} 53:27]
  wire [2:0] _GEN_101 = |io_ui_in[3:0] ? 3'h1 : simonState; // @[ChiselTop.scala 244:{35,66} 55:27]
  wire [5:0] _T_77 = gameLevel - 6'h1; // @[ChiselTop.scala 247:28]
  wire [1:0] _seqMem_T_2 = diceReg[1:0] + 2'h1; // @[ChiselTop.scala 247:52]
  wire [2:0] _seqMem_T_78 = {{1'd0}, _seqMem_T_2}; // @[ChiselTop.scala 247:{35,35}]
  wire [2:0] _GEN_102 = 5'h0 == _T_77[4:0] ? _seqMem_T_78 : seqMem_0; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_103 = 5'h1 == _T_77[4:0] ? _seqMem_T_78 : seqMem_1; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_104 = 5'h2 == _T_77[4:0] ? _seqMem_T_78 : seqMem_2; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_105 = 5'h3 == _T_77[4:0] ? _seqMem_T_78 : seqMem_3; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_106 = 5'h4 == _T_77[4:0] ? _seqMem_T_78 : seqMem_4; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_107 = 5'h5 == _T_77[4:0] ? _seqMem_T_78 : seqMem_5; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_108 = 5'h6 == _T_77[4:0] ? _seqMem_T_78 : seqMem_6; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_109 = 5'h7 == _T_77[4:0] ? _seqMem_T_78 : seqMem_7; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_110 = 5'h8 == _T_77[4:0] ? _seqMem_T_78 : seqMem_8; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_111 = 5'h9 == _T_77[4:0] ? _seqMem_T_78 : seqMem_9; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_112 = 5'ha == _T_77[4:0] ? _seqMem_T_78 : seqMem_10; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_113 = 5'hb == _T_77[4:0] ? _seqMem_T_78 : seqMem_11; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_114 = 5'hc == _T_77[4:0] ? _seqMem_T_78 : seqMem_12; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_115 = 5'hd == _T_77[4:0] ? _seqMem_T_78 : seqMem_13; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_116 = 5'he == _T_77[4:0] ? _seqMem_T_78 : seqMem_14; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_117 = 5'hf == _T_77[4:0] ? _seqMem_T_78 : seqMem_15; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_118 = 5'h10 == _T_77[4:0] ? _seqMem_T_78 : seqMem_16; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_119 = 5'h11 == _T_77[4:0] ? _seqMem_T_78 : seqMem_17; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_120 = 5'h12 == _T_77[4:0] ? _seqMem_T_78 : seqMem_18; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_121 = 5'h13 == _T_77[4:0] ? _seqMem_T_78 : seqMem_19; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_122 = 5'h14 == _T_77[4:0] ? _seqMem_T_78 : seqMem_20; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_123 = 5'h15 == _T_77[4:0] ? _seqMem_T_78 : seqMem_21; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_124 = 5'h16 == _T_77[4:0] ? _seqMem_T_78 : seqMem_22; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_125 = 5'h17 == _T_77[4:0] ? _seqMem_T_78 : seqMem_23; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_126 = 5'h18 == _T_77[4:0] ? _seqMem_T_78 : seqMem_24; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_127 = 5'h19 == _T_77[4:0] ? _seqMem_T_78 : seqMem_25; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_128 = 5'h1a == _T_77[4:0] ? _seqMem_T_78 : seqMem_26; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_129 = 5'h1b == _T_77[4:0] ? _seqMem_T_78 : seqMem_27; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_130 = 5'h1c == _T_77[4:0] ? _seqMem_T_78 : seqMem_28; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [2:0] _GEN_131 = 5'h1d == _T_77[4:0] ? _seqMem_T_78 : seqMem_29; // @[ChiselTop.scala 247:{35,35} 52:27]
  wire [31:0] _timer_T_1 = timer + 32'h1; // @[ChiselTop.scala 251:26]
  wire  _T_80 = 2'h0 == currentDigit; // @[ChiselTop.scala 252:32]
  wire [2:0] _GEN_133 = 5'h1 == gameIdx[4:0] ? seqMem_1 : seqMem_0; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_134 = 5'h2 == gameIdx[4:0] ? seqMem_2 : _GEN_133; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_135 = 5'h3 == gameIdx[4:0] ? seqMem_3 : _GEN_134; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_136 = 5'h4 == gameIdx[4:0] ? seqMem_4 : _GEN_135; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_137 = 5'h5 == gameIdx[4:0] ? seqMem_5 : _GEN_136; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_138 = 5'h6 == gameIdx[4:0] ? seqMem_6 : _GEN_137; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_139 = 5'h7 == gameIdx[4:0] ? seqMem_7 : _GEN_138; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_140 = 5'h8 == gameIdx[4:0] ? seqMem_8 : _GEN_139; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_141 = 5'h9 == gameIdx[4:0] ? seqMem_9 : _GEN_140; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_142 = 5'ha == gameIdx[4:0] ? seqMem_10 : _GEN_141; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_143 = 5'hb == gameIdx[4:0] ? seqMem_11 : _GEN_142; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_144 = 5'hc == gameIdx[4:0] ? seqMem_12 : _GEN_143; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_145 = 5'hd == gameIdx[4:0] ? seqMem_13 : _GEN_144; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_146 = 5'he == gameIdx[4:0] ? seqMem_14 : _GEN_145; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_147 = 5'hf == gameIdx[4:0] ? seqMem_15 : _GEN_146; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_148 = 5'h10 == gameIdx[4:0] ? seqMem_16 : _GEN_147; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_149 = 5'h11 == gameIdx[4:0] ? seqMem_17 : _GEN_148; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_150 = 5'h12 == gameIdx[4:0] ? seqMem_18 : _GEN_149; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_151 = 5'h13 == gameIdx[4:0] ? seqMem_19 : _GEN_150; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_152 = 5'h14 == gameIdx[4:0] ? seqMem_20 : _GEN_151; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_153 = 5'h15 == gameIdx[4:0] ? seqMem_21 : _GEN_152; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_154 = 5'h16 == gameIdx[4:0] ? seqMem_22 : _GEN_153; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_155 = 5'h17 == gameIdx[4:0] ? seqMem_23 : _GEN_154; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_156 = 5'h18 == gameIdx[4:0] ? seqMem_24 : _GEN_155; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_157 = 5'h19 == gameIdx[4:0] ? seqMem_25 : _GEN_156; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_158 = 5'h1a == gameIdx[4:0] ? seqMem_26 : _GEN_157; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_159 = 5'h1b == gameIdx[4:0] ? seqMem_27 : _GEN_158; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_160 = 5'h1c == gameIdx[4:0] ? seqMem_28 : _GEN_159; // @[Mux.scala 81:{61,61}]
  wire [2:0] _GEN_161 = 5'h1d == gameIdx[4:0] ? seqMem_29 : _GEN_160; // @[Mux.scala 81:{61,61}]
  wire [5:0] _sevSeg_T_4 = 3'h1 == _GEN_161 ? 6'h6 : 6'h3f; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_6 = 3'h2 == _GEN_161 ? 7'h5b : {{1'd0}, _sevSeg_T_4}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_8 = 3'h3 == _GEN_161 ? 7'h4f : _sevSeg_T_6; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_10 = 3'h4 == _GEN_161 ? 7'h66 : _sevSeg_T_8; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_12 = 3'h5 == _GEN_161 ? 7'h6d : _sevSeg_T_10; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_14 = 3'h6 == _GEN_161 ? 7'h7d : _sevSeg_T_12; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_16 = 3'h7 == _GEN_161 ? 7'h7 : _sevSeg_T_14; // @[Mux.scala 81:58]
  wire [3:0] _GEN_563 = {{1'd0}, _GEN_161}; // @[Mux.scala 81:61]
  wire [6:0] _sevSeg_T_18 = 4'h8 == _GEN_563 ? 7'h7f : _sevSeg_T_16; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_20 = 4'h9 == _GEN_563 ? 7'h6f : _sevSeg_T_18; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_22 = 4'ha == _GEN_563 ? 7'h6d : _sevSeg_T_20; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_23 = timer < 32'h1312d0 ? _sevSeg_T_22 : 7'h0; // @[ChiselTop.scala 253:58]
  wire [5:0] _sevSeg_T_24 = gameLevel / 4'ha; // @[ChiselTop.scala 254:72]
  wire [5:0] _sevSeg_T_26 = 6'h0 == _sevSeg_T_24 ? 6'h3f : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _sevSeg_T_28 = 6'h1 == _sevSeg_T_24 ? 6'h6 : _sevSeg_T_26; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_30 = 6'h2 == _sevSeg_T_24 ? 7'h5b : {{1'd0}, _sevSeg_T_28}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_32 = 6'h3 == _sevSeg_T_24 ? 7'h4f : _sevSeg_T_30; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_34 = 6'h4 == _sevSeg_T_24 ? 7'h66 : _sevSeg_T_32; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_36 = 6'h5 == _sevSeg_T_24 ? 7'h6d : _sevSeg_T_34; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_38 = 6'h6 == _sevSeg_T_24 ? 7'h7d : _sevSeg_T_36; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_40 = 6'h7 == _sevSeg_T_24 ? 7'h7 : _sevSeg_T_38; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_42 = 6'h8 == _sevSeg_T_24 ? 7'h7f : _sevSeg_T_40; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_44 = 6'h9 == _sevSeg_T_24 ? 7'h6f : _sevSeg_T_42; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_46 = 6'ha == _sevSeg_T_24 ? 7'h6d : _sevSeg_T_44; // @[Mux.scala 81:58]
  wire [5:0] _GEN_0 = gameLevel % 6'ha; // @[ChiselTop.scala 255:72]
  wire [5:0] _sevSeg_T_49 = 4'h0 == _GEN_0[3:0] ? 6'h3f : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _sevSeg_T_51 = 4'h1 == _GEN_0[3:0] ? 6'h6 : _sevSeg_T_49; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_53 = 4'h2 == _GEN_0[3:0] ? 7'h5b : {{1'd0}, _sevSeg_T_51}; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_55 = 4'h3 == _GEN_0[3:0] ? 7'h4f : _sevSeg_T_53; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_57 = 4'h4 == _GEN_0[3:0] ? 7'h66 : _sevSeg_T_55; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_59 = 4'h5 == _GEN_0[3:0] ? 7'h6d : _sevSeg_T_57; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_61 = 4'h6 == _GEN_0[3:0] ? 7'h7d : _sevSeg_T_59; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_63 = 4'h7 == _GEN_0[3:0] ? 7'h7 : _sevSeg_T_61; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_65 = 4'h8 == _GEN_0[3:0] ? 7'h7f : _sevSeg_T_63; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_67 = 4'h9 == _GEN_0[3:0] ? 7'h6f : _sevSeg_T_65; // @[Mux.scala 81:58]
  wire [6:0] _sevSeg_T_69 = 4'ha == _GEN_0[3:0] ? 7'h6d : _sevSeg_T_67; // @[Mux.scala 81:58]
  wire [7:0] _GEN_162 = 2'h2 == currentDigit ? 8'h4 : 8'h0; // @[ChiselTop.scala 252:32 255:32 56:32]
  wire [7:0] _GEN_163 = 2'h2 == currentDigit ? {{1'd0}, _sevSeg_T_69} : 8'hff; // @[ChiselTop.scala 252:32 255:52 32:28]
  wire [7:0] _GEN_164 = 2'h1 == currentDigit ? 8'h2 : _GEN_162; // @[ChiselTop.scala 252:32 254:32]
  wire [7:0] _GEN_165 = 2'h1 == currentDigit ? {{1'd0}, _sevSeg_T_46} : _GEN_163; // @[ChiselTop.scala 252:32 254:52]
  wire [7:0] _GEN_166 = 2'h0 == currentDigit ? 8'h1 : _GEN_164; // @[ChiselTop.scala 252:32 253:32]
  wire [7:0] _GEN_167 = 2'h0 == currentDigit ? {{1'd0}, _sevSeg_T_23} : _GEN_165; // @[ChiselTop.scala 252:32 253:52]
  wire [5:0] _gameIdx_T_1 = gameIdx + 6'h1; // @[ChiselTop.scala 258:46]
  wire  _T_84 = gameIdx == gameLevel; // @[ChiselTop.scala 259:26]
  wire [5:0] _GEN_168 = gameIdx == gameLevel ? 6'h0 : _gameIdx_T_1; // @[ChiselTop.scala 258:35 259:{41,51}]
  wire [2:0] _GEN_169 = gameIdx == gameLevel ? 3'h3 : simonState; // @[ChiselTop.scala 259:{41,70} 55:27]
  wire [31:0] _GEN_170 = timer == 32'h1b7740 ? 32'h0 : _timer_T_1; // @[ChiselTop.scala 251:17 257:37 258:19]
  wire [5:0] _GEN_171 = timer == 32'h1b7740 ? _GEN_168 : gameIdx; // @[ChiselTop.scala 257:37 54:27]
  wire [2:0] _GEN_172 = timer == 32'h1b7740 ? _GEN_169 : simonState; // @[ChiselTop.scala 257:37 55:27]
  wire [7:0] _GEN_178 = _T_80 ? 8'h80 : _GEN_165; // @[ChiselTop.scala 263:32 264:52]
  wire  _T_92 = _T_74 & debounce == 20'h0; // @[ChiselTop.scala 268:34]
  wire [1:0] _btnVal_T_5 = io_ui_in[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _btnVal_T_6 = io_ui_in[1] ? 2'h1 : _btnVal_T_5; // @[Mux.scala 47:70]
  wire [1:0] _btnVal_T_7 = io_ui_in[0] ? 2'h0 : _btnVal_T_6; // @[Mux.scala 47:70]
  wire [1:0] btnVal = _btnVal_T_7 + 2'h1; // @[ChiselTop.scala 270:57]
  wire [2:0] _GEN_566 = {{1'd0}, btnVal}; // @[ChiselTop.scala 271:25]
  wire [5:0] _gameLevel_T_1 = gameLevel + 6'h1; // @[ChiselTop.scala 275:53]
  wire [2:0] _GEN_209 = gameLevel == 6'h1e ? 3'h4 : 3'h1; // @[ChiselTop.scala 274:{42,55} 275:71]
  wire [5:0] _GEN_210 = gameLevel == 6'h1e ? gameLevel : _gameLevel_T_1; // @[ChiselTop.scala 274:42 53:27 275:40]
  wire [2:0] _GEN_211 = _T_84 ? _GEN_209 : simonState; // @[ChiselTop.scala 273:43 55:27]
  wire [5:0] _GEN_212 = _T_84 ? _GEN_210 : gameLevel; // @[ChiselTop.scala 273:43 53:27]
  wire [5:0] _GEN_213 = _GEN_566 == _GEN_161 ? _gameIdx_T_1 : gameIdx; // @[ChiselTop.scala 271:46 272:23 54:27]
  wire [2:0] _GEN_214 = _GEN_566 == _GEN_161 ? _GEN_211 : 3'h0; // @[ChiselTop.scala 271:46 277:39]
  wire [5:0] _GEN_215 = _GEN_566 == _GEN_161 ? _GEN_212 : gameLevel; // @[ChiselTop.scala 271:46 53:27]
  wire [19:0] _GEN_216 = _T_74 & debounce == 20'h0 ? 20'hf4240 : debounce; // @[ChiselTop.scala 268:55 269:22 51:27]
  wire [5:0] _GEN_217 = _T_74 & debounce == 20'h0 ? _GEN_213 : gameIdx; // @[ChiselTop.scala 268:55 54:27]
  wire [2:0] _GEN_218 = _T_74 & debounce == 20'h0 ? _GEN_214 : simonState; // @[ChiselTop.scala 268:55 55:27]
  wire [5:0] _GEN_219 = _T_74 & debounce == 20'h0 ? _GEN_215 : gameLevel; // @[ChiselTop.scala 268:55 53:27]
  wire [7:0] _sevSeg_T_116 = isBlinking ? 8'hff : 8'h0; // @[ChiselTop.scala 282:24]
  wire [2:0] _GEN_220 = _T_92 ? 3'h0 : simonState; // @[ChiselTop.scala 283:{55,68} 55:27]
  wire [7:0] _GEN_221 = 3'h4 == simonState ? 8'h7 : 8'h0; // @[ChiselTop.scala 240:26 281:20 56:32]
  wire [7:0] _GEN_222 = 3'h4 == simonState ? _sevSeg_T_116 : 8'hff; // @[ChiselTop.scala 240:26 282:18 32:28]
  wire [2:0] _GEN_223 = 3'h4 == simonState ? _GEN_220 : simonState; // @[ChiselTop.scala 240:26 55:27]
  wire [7:0] _GEN_224 = 3'h3 == simonState ? _GEN_166 : _GEN_221; // @[ChiselTop.scala 240:26]
  wire [7:0] _GEN_225 = 3'h3 == simonState ? _GEN_178 : _GEN_222; // @[ChiselTop.scala 240:26]
  wire [19:0] _GEN_226 = 3'h3 == simonState ? _GEN_216 : debounce; // @[ChiselTop.scala 240:26 51:27]
  wire [5:0] _GEN_227 = 3'h3 == simonState ? _GEN_217 : gameIdx; // @[ChiselTop.scala 240:26 54:27]
  wire [2:0] _GEN_228 = 3'h3 == simonState ? _GEN_218 : _GEN_223; // @[ChiselTop.scala 240:26]
  wire [5:0] _GEN_229 = 3'h3 == simonState ? _GEN_219 : gameLevel; // @[ChiselTop.scala 240:26 53:27]
  wire [31:0] _GEN_230 = 3'h2 == simonState ? _GEN_170 : timer; // @[ChiselTop.scala 240:26 34:24]
  wire [7:0] _GEN_231 = 3'h2 == simonState ? _GEN_166 : _GEN_224; // @[ChiselTop.scala 240:26]
  wire [7:0] _GEN_232 = 3'h2 == simonState ? _GEN_167 : _GEN_225; // @[ChiselTop.scala 240:26]
  wire [5:0] _GEN_233 = 3'h2 == simonState ? _GEN_171 : _GEN_227; // @[ChiselTop.scala 240:26]
  wire [2:0] _GEN_234 = 3'h2 == simonState ? _GEN_172 : _GEN_228; // @[ChiselTop.scala 240:26]
  wire [19:0] _GEN_235 = 3'h2 == simonState ? debounce : _GEN_226; // @[ChiselTop.scala 240:26 51:27]
  wire [5:0] _GEN_236 = 3'h2 == simonState ? gameLevel : _GEN_229; // @[ChiselTop.scala 240:26 53:27]
  wire [2:0] _GEN_237 = 3'h1 == simonState ? _GEN_102 : seqMem_0; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_238 = 3'h1 == simonState ? _GEN_103 : seqMem_1; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_239 = 3'h1 == simonState ? _GEN_104 : seqMem_2; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_240 = 3'h1 == simonState ? _GEN_105 : seqMem_3; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_241 = 3'h1 == simonState ? _GEN_106 : seqMem_4; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_242 = 3'h1 == simonState ? _GEN_107 : seqMem_5; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_243 = 3'h1 == simonState ? _GEN_108 : seqMem_6; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_244 = 3'h1 == simonState ? _GEN_109 : seqMem_7; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_245 = 3'h1 == simonState ? _GEN_110 : seqMem_8; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_246 = 3'h1 == simonState ? _GEN_111 : seqMem_9; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_247 = 3'h1 == simonState ? _GEN_112 : seqMem_10; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_248 = 3'h1 == simonState ? _GEN_113 : seqMem_11; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_249 = 3'h1 == simonState ? _GEN_114 : seqMem_12; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_250 = 3'h1 == simonState ? _GEN_115 : seqMem_13; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_251 = 3'h1 == simonState ? _GEN_116 : seqMem_14; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_252 = 3'h1 == simonState ? _GEN_117 : seqMem_15; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_253 = 3'h1 == simonState ? _GEN_118 : seqMem_16; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_254 = 3'h1 == simonState ? _GEN_119 : seqMem_17; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_255 = 3'h1 == simonState ? _GEN_120 : seqMem_18; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_256 = 3'h1 == simonState ? _GEN_121 : seqMem_19; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_257 = 3'h1 == simonState ? _GEN_122 : seqMem_20; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_258 = 3'h1 == simonState ? _GEN_123 : seqMem_21; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_259 = 3'h1 == simonState ? _GEN_124 : seqMem_22; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_260 = 3'h1 == simonState ? _GEN_125 : seqMem_23; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_261 = 3'h1 == simonState ? _GEN_126 : seqMem_24; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_262 = 3'h1 == simonState ? _GEN_127 : seqMem_25; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_263 = 3'h1 == simonState ? _GEN_128 : seqMem_26; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_264 = 3'h1 == simonState ? _GEN_129 : seqMem_27; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_265 = 3'h1 == simonState ? _GEN_130 : seqMem_28; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_266 = 3'h1 == simonState ? _GEN_131 : seqMem_29; // @[ChiselTop.scala 240:26 52:27]
  wire [5:0] _GEN_267 = 3'h1 == simonState ? 6'h0 : _GEN_233; // @[ChiselTop.scala 240:26 248:19]
  wire [31:0] _GEN_268 = 3'h1 == simonState ? 32'h0 : _GEN_230; // @[ChiselTop.scala 240:26 248:33]
  wire [2:0] _GEN_269 = 3'h1 == simonState ? 3'h2 : _GEN_234; // @[ChiselTop.scala 240:26 248:52]
  wire [7:0] _GEN_270 = 3'h1 == simonState ? 8'h0 : _GEN_231; // @[ChiselTop.scala 240:26 56:32]
  wire [7:0] _GEN_271 = 3'h1 == simonState ? 8'hff : _GEN_232; // @[ChiselTop.scala 240:26 32:28]
  wire [19:0] _GEN_272 = 3'h1 == simonState ? debounce : _GEN_235; // @[ChiselTop.scala 240:26 51:27]
  wire [5:0] _GEN_273 = 3'h1 == simonState ? gameLevel : _GEN_236; // @[ChiselTop.scala 240:26 53:27]
  wire [7:0] _GEN_274 = 3'h0 == simonState ? 8'h7 : _GEN_270; // @[ChiselTop.scala 240:26 242:20]
  wire [7:0] _GEN_275 = 3'h0 == simonState ? _sevSeg_T : _GEN_271; // @[ChiselTop.scala 240:26 243:18]
  wire [5:0] _GEN_276 = 3'h0 == simonState ? _GEN_100 : _GEN_273; // @[ChiselTop.scala 240:26]
  wire [2:0] _GEN_277 = 3'h0 == simonState ? _GEN_101 : _GEN_269; // @[ChiselTop.scala 240:26]
  wire [2:0] _GEN_278 = 3'h0 == simonState ? seqMem_0 : _GEN_237; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_279 = 3'h0 == simonState ? seqMem_1 : _GEN_238; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_280 = 3'h0 == simonState ? seqMem_2 : _GEN_239; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_281 = 3'h0 == simonState ? seqMem_3 : _GEN_240; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_282 = 3'h0 == simonState ? seqMem_4 : _GEN_241; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_283 = 3'h0 == simonState ? seqMem_5 : _GEN_242; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_284 = 3'h0 == simonState ? seqMem_6 : _GEN_243; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_285 = 3'h0 == simonState ? seqMem_7 : _GEN_244; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_286 = 3'h0 == simonState ? seqMem_8 : _GEN_245; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_287 = 3'h0 == simonState ? seqMem_9 : _GEN_246; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_288 = 3'h0 == simonState ? seqMem_10 : _GEN_247; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_289 = 3'h0 == simonState ? seqMem_11 : _GEN_248; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_290 = 3'h0 == simonState ? seqMem_12 : _GEN_249; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_291 = 3'h0 == simonState ? seqMem_13 : _GEN_250; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_292 = 3'h0 == simonState ? seqMem_14 : _GEN_251; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_293 = 3'h0 == simonState ? seqMem_15 : _GEN_252; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_294 = 3'h0 == simonState ? seqMem_16 : _GEN_253; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_295 = 3'h0 == simonState ? seqMem_17 : _GEN_254; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_296 = 3'h0 == simonState ? seqMem_18 : _GEN_255; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_297 = 3'h0 == simonState ? seqMem_19 : _GEN_256; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_298 = 3'h0 == simonState ? seqMem_20 : _GEN_257; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_299 = 3'h0 == simonState ? seqMem_21 : _GEN_258; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_300 = 3'h0 == simonState ? seqMem_22 : _GEN_259; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_301 = 3'h0 == simonState ? seqMem_23 : _GEN_260; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_302 = 3'h0 == simonState ? seqMem_24 : _GEN_261; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_303 = 3'h0 == simonState ? seqMem_25 : _GEN_262; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_304 = 3'h0 == simonState ? seqMem_26 : _GEN_263; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_305 = 3'h0 == simonState ? seqMem_27 : _GEN_264; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_306 = 3'h0 == simonState ? seqMem_28 : _GEN_265; // @[ChiselTop.scala 240:26 52:27]
  wire [2:0] _GEN_307 = 3'h0 == simonState ? seqMem_29 : _GEN_266; // @[ChiselTop.scala 240:26 52:27]
  wire [5:0] _GEN_308 = 3'h0 == simonState ? gameIdx : _GEN_267; // @[ChiselTop.scala 240:26 54:27]
  wire [31:0] _GEN_309 = 3'h0 == simonState ? timer : _GEN_268; // @[ChiselTop.scala 240:26 34:24]
  wire [19:0] _GEN_310 = 3'h0 == simonState ? debounce : _GEN_272; // @[ChiselTop.scala 240:26 51:27]
  wire [3:0] _brightness_T_1 = brightness + 4'h1; // @[ChiselTop.scala 293:36]
  wire  _GEN_311 = brightness == 4'he ? 1'h0 : changeDirection; // @[ChiselTop.scala 294:{38,56} 46:32]
  wire [3:0] _brightness_T_3 = brightness - 4'h1; // @[ChiselTop.scala 297:36]
  wire  _GEN_312 = brightness == 4'h1 | changeDirection; // @[ChiselTop.scala 298:{37,55} 46:32]
  wire [3:0] _GEN_313 = changeDirection ? _brightness_T_1 : _brightness_T_3; // @[ChiselTop.scala 292:32 293:22 297:22]
  wire  _GEN_314 = changeDirection ? _GEN_311 : _GEN_312; // @[ChiselTop.scala 292:32]
  wire [3:0] _GEN_315 = _T_9 ? _GEN_313 : brightness; // @[ChiselTop.scala 291:35 45:32]
  wire  _GEN_316 = _T_9 ? _GEN_314 : changeDirection; // @[ChiselTop.scala 291:35 46:32]
  wire [7:0] _sevSeg_T_117 = ledStatus ? 8'hff : 8'h0; // @[ChiselTop.scala 301:20]
  wire [1:0] _hammingWeight_T_8 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_10 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_12 = _hammingWeight_T_8 + _hammingWeight_T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_14 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_16 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_18 = _hammingWeight_T_14 + _hammingWeight_T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _hammingWeight_T_20 = _hammingWeight_T_12 + _hammingWeight_T_18; // @[Bitwise.scala 51:90]
  wire [3:0] hammingWeight = _hammingWeight_T_20 - 4'h1; // @[ChiselTop.scala 308:46]
  wire [7:0] _GEN_317 = 4'h7 == hammingWeight ? 8'h7 : 8'hff; // @[ChiselTop.scala 309:29 317:26 32:28]
  wire [7:0] _GEN_318 = 4'h6 == hammingWeight ? 8'h7d : _GEN_317; // @[ChiselTop.scala 309:29 316:26]
  wire [7:0] _GEN_319 = 4'h5 == hammingWeight ? 8'h6d : _GEN_318; // @[ChiselTop.scala 309:29 315:26]
  wire [7:0] _GEN_320 = 4'h4 == hammingWeight ? 8'h66 : _GEN_319; // @[ChiselTop.scala 309:29 314:26]
  wire [7:0] _GEN_321 = 4'h3 == hammingWeight ? 8'h4f : _GEN_320; // @[ChiselTop.scala 309:29 313:26]
  wire [7:0] _GEN_322 = 4'h2 == hammingWeight ? 8'h5b : _GEN_321; // @[ChiselTop.scala 309:29 312:26]
  wire [7:0] _GEN_323 = 4'h1 == hammingWeight ? 8'h6 : _GEN_322; // @[ChiselTop.scala 309:29 311:26]
  wire [7:0] _GEN_324 = 4'h0 == hammingWeight ? 8'h3f : _GEN_323; // @[ChiselTop.scala 309:29 310:26]
  wire [7:0] _GEN_325 = 3'h7 == mode ? _GEN_324 : 8'hff; // @[ChiselTop.scala 142:16 32:28]
  wire [3:0] _GEN_326 = 3'h6 == mode ? _GEN_315 : brightness; // @[ChiselTop.scala 142:16 45:32]
  wire  _GEN_327 = 3'h6 == mode ? _GEN_316 : changeDirection; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] _GEN_328 = 3'h6 == mode ? _sevSeg_T_117 : _GEN_325; // @[ChiselTop.scala 142:16 301:14]
  wire [7:0] _GEN_329 = 3'h5 == mode ? _GEN_274 : 8'h0; // @[ChiselTop.scala 142:16 56:32]
  wire [7:0] _GEN_330 = 3'h5 == mode ? _GEN_275 : _GEN_328; // @[ChiselTop.scala 142:16]
  wire [5:0] _GEN_331 = 3'h5 == mode ? _GEN_276 : gameLevel; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_332 = 3'h5 == mode ? _GEN_277 : simonState; // @[ChiselTop.scala 142:16 55:27]
  wire [2:0] _GEN_333 = 3'h5 == mode ? _GEN_278 : seqMem_0; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_334 = 3'h5 == mode ? _GEN_279 : seqMem_1; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_335 = 3'h5 == mode ? _GEN_280 : seqMem_2; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_336 = 3'h5 == mode ? _GEN_281 : seqMem_3; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_337 = 3'h5 == mode ? _GEN_282 : seqMem_4; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_338 = 3'h5 == mode ? _GEN_283 : seqMem_5; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_339 = 3'h5 == mode ? _GEN_284 : seqMem_6; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_340 = 3'h5 == mode ? _GEN_285 : seqMem_7; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_341 = 3'h5 == mode ? _GEN_286 : seqMem_8; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_342 = 3'h5 == mode ? _GEN_287 : seqMem_9; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_343 = 3'h5 == mode ? _GEN_288 : seqMem_10; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_344 = 3'h5 == mode ? _GEN_289 : seqMem_11; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_345 = 3'h5 == mode ? _GEN_290 : seqMem_12; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_346 = 3'h5 == mode ? _GEN_291 : seqMem_13; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_347 = 3'h5 == mode ? _GEN_292 : seqMem_14; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_348 = 3'h5 == mode ? _GEN_293 : seqMem_15; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_349 = 3'h5 == mode ? _GEN_294 : seqMem_16; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_350 = 3'h5 == mode ? _GEN_295 : seqMem_17; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_351 = 3'h5 == mode ? _GEN_296 : seqMem_18; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_352 = 3'h5 == mode ? _GEN_297 : seqMem_19; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_353 = 3'h5 == mode ? _GEN_298 : seqMem_20; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_354 = 3'h5 == mode ? _GEN_299 : seqMem_21; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_355 = 3'h5 == mode ? _GEN_300 : seqMem_22; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_356 = 3'h5 == mode ? _GEN_301 : seqMem_23; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_357 = 3'h5 == mode ? _GEN_302 : seqMem_24; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_358 = 3'h5 == mode ? _GEN_303 : seqMem_25; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_359 = 3'h5 == mode ? _GEN_304 : seqMem_26; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_360 = 3'h5 == mode ? _GEN_305 : seqMem_27; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_361 = 3'h5 == mode ? _GEN_306 : seqMem_28; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_362 = 3'h5 == mode ? _GEN_307 : seqMem_29; // @[ChiselTop.scala 142:16 52:27]
  wire [5:0] _GEN_363 = 3'h5 == mode ? _GEN_308 : gameIdx; // @[ChiselTop.scala 142:16 54:27]
  wire [31:0] _GEN_364 = 3'h5 == mode ? _GEN_309 : timer; // @[ChiselTop.scala 142:16 34:24]
  wire [19:0] _GEN_365 = 3'h5 == mode ? _GEN_310 : debounce; // @[ChiselTop.scala 142:16 51:27]
  wire [3:0] _GEN_366 = 3'h5 == mode ? brightness : _GEN_326; // @[ChiselTop.scala 142:16 45:32]
  wire  _GEN_367 = 3'h5 == mode ? changeDirection : _GEN_327; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] _GEN_368 = 3'h4 == mode ? _GEN_99 : _GEN_330; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_369 = 3'h4 == mode ? 8'h0 : _GEN_329; // @[ChiselTop.scala 142:16 56:32]
  wire [5:0] _GEN_370 = 3'h4 == mode ? gameLevel : _GEN_331; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_371 = 3'h4 == mode ? simonState : _GEN_332; // @[ChiselTop.scala 142:16 55:27]
  wire [2:0] _GEN_372 = 3'h4 == mode ? seqMem_0 : _GEN_333; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_373 = 3'h4 == mode ? seqMem_1 : _GEN_334; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_374 = 3'h4 == mode ? seqMem_2 : _GEN_335; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_375 = 3'h4 == mode ? seqMem_3 : _GEN_336; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_376 = 3'h4 == mode ? seqMem_4 : _GEN_337; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_377 = 3'h4 == mode ? seqMem_5 : _GEN_338; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_378 = 3'h4 == mode ? seqMem_6 : _GEN_339; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_379 = 3'h4 == mode ? seqMem_7 : _GEN_340; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_380 = 3'h4 == mode ? seqMem_8 : _GEN_341; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_381 = 3'h4 == mode ? seqMem_9 : _GEN_342; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_382 = 3'h4 == mode ? seqMem_10 : _GEN_343; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_383 = 3'h4 == mode ? seqMem_11 : _GEN_344; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_384 = 3'h4 == mode ? seqMem_12 : _GEN_345; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_385 = 3'h4 == mode ? seqMem_13 : _GEN_346; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_386 = 3'h4 == mode ? seqMem_14 : _GEN_347; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_387 = 3'h4 == mode ? seqMem_15 : _GEN_348; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_388 = 3'h4 == mode ? seqMem_16 : _GEN_349; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_389 = 3'h4 == mode ? seqMem_17 : _GEN_350; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_390 = 3'h4 == mode ? seqMem_18 : _GEN_351; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_391 = 3'h4 == mode ? seqMem_19 : _GEN_352; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_392 = 3'h4 == mode ? seqMem_20 : _GEN_353; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_393 = 3'h4 == mode ? seqMem_21 : _GEN_354; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_394 = 3'h4 == mode ? seqMem_22 : _GEN_355; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_395 = 3'h4 == mode ? seqMem_23 : _GEN_356; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_396 = 3'h4 == mode ? seqMem_24 : _GEN_357; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_397 = 3'h4 == mode ? seqMem_25 : _GEN_358; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_398 = 3'h4 == mode ? seqMem_26 : _GEN_359; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_399 = 3'h4 == mode ? seqMem_27 : _GEN_360; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_400 = 3'h4 == mode ? seqMem_28 : _GEN_361; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_401 = 3'h4 == mode ? seqMem_29 : _GEN_362; // @[ChiselTop.scala 142:16 52:27]
  wire [5:0] _GEN_402 = 3'h4 == mode ? gameIdx : _GEN_363; // @[ChiselTop.scala 142:16 54:27]
  wire [31:0] _GEN_403 = 3'h4 == mode ? timer : _GEN_364; // @[ChiselTop.scala 142:16 34:24]
  wire [19:0] _GEN_404 = 3'h4 == mode ? debounce : _GEN_365; // @[ChiselTop.scala 142:16 51:27]
  wire [3:0] _GEN_405 = 3'h4 == mode ? brightness : _GEN_366; // @[ChiselTop.scala 142:16 45:32]
  wire  _GEN_406 = 3'h4 == mode ? changeDirection : _GEN_367; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] _GEN_407 = 3'h3 == mode ? _GEN_92 : _GEN_368; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_408 = 3'h3 == mode ? 8'h0 : _GEN_369; // @[ChiselTop.scala 142:16 56:32]
  wire [5:0] _GEN_409 = 3'h3 == mode ? gameLevel : _GEN_370; // @[ChiselTop.scala 142:16 53:27]
  wire [2:0] _GEN_410 = 3'h3 == mode ? simonState : _GEN_371; // @[ChiselTop.scala 142:16 55:27]
  wire [2:0] _GEN_411 = 3'h3 == mode ? seqMem_0 : _GEN_372; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_412 = 3'h3 == mode ? seqMem_1 : _GEN_373; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_413 = 3'h3 == mode ? seqMem_2 : _GEN_374; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_414 = 3'h3 == mode ? seqMem_3 : _GEN_375; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_415 = 3'h3 == mode ? seqMem_4 : _GEN_376; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_416 = 3'h3 == mode ? seqMem_5 : _GEN_377; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_417 = 3'h3 == mode ? seqMem_6 : _GEN_378; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_418 = 3'h3 == mode ? seqMem_7 : _GEN_379; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_419 = 3'h3 == mode ? seqMem_8 : _GEN_380; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_420 = 3'h3 == mode ? seqMem_9 : _GEN_381; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_421 = 3'h3 == mode ? seqMem_10 : _GEN_382; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_422 = 3'h3 == mode ? seqMem_11 : _GEN_383; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_423 = 3'h3 == mode ? seqMem_12 : _GEN_384; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_424 = 3'h3 == mode ? seqMem_13 : _GEN_385; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_425 = 3'h3 == mode ? seqMem_14 : _GEN_386; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_426 = 3'h3 == mode ? seqMem_15 : _GEN_387; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_427 = 3'h3 == mode ? seqMem_16 : _GEN_388; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_428 = 3'h3 == mode ? seqMem_17 : _GEN_389; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_429 = 3'h3 == mode ? seqMem_18 : _GEN_390; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_430 = 3'h3 == mode ? seqMem_19 : _GEN_391; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_431 = 3'h3 == mode ? seqMem_20 : _GEN_392; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_432 = 3'h3 == mode ? seqMem_21 : _GEN_393; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_433 = 3'h3 == mode ? seqMem_22 : _GEN_394; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_434 = 3'h3 == mode ? seqMem_23 : _GEN_395; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_435 = 3'h3 == mode ? seqMem_24 : _GEN_396; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_436 = 3'h3 == mode ? seqMem_25 : _GEN_397; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_437 = 3'h3 == mode ? seqMem_26 : _GEN_398; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_438 = 3'h3 == mode ? seqMem_27 : _GEN_399; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_439 = 3'h3 == mode ? seqMem_28 : _GEN_400; // @[ChiselTop.scala 142:16 52:27]
  wire [2:0] _GEN_440 = 3'h3 == mode ? seqMem_29 : _GEN_401; // @[ChiselTop.scala 142:16 52:27]
  wire [5:0] _GEN_441 = 3'h3 == mode ? gameIdx : _GEN_402; // @[ChiselTop.scala 142:16 54:27]
  wire [31:0] _GEN_442 = 3'h3 == mode ? timer : _GEN_403; // @[ChiselTop.scala 142:16 34:24]
  wire [19:0] _GEN_443 = 3'h3 == mode ? debounce : _GEN_404; // @[ChiselTop.scala 142:16 51:27]
  wire [3:0] _GEN_444 = 3'h3 == mode ? brightness : _GEN_405; // @[ChiselTop.scala 142:16 45:32]
  wire  _GEN_445 = 3'h3 == mode ? changeDirection : _GEN_406; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] _GEN_446 = 3'h2 == mode ? _GEN_76 : _GEN_407; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_447 = 3'h2 == mode ? 8'h0 : _GEN_408; // @[ChiselTop.scala 142:16 56:32]
  wire  _GEN_484 = 3'h2 == mode ? changeDirection : _GEN_445; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] _GEN_485 = 3'h1 == mode ? _GEN_66 : _GEN_446; // @[ChiselTop.scala 142:16]
  wire [7:0] _GEN_486 = 3'h1 == mode ? 8'h0 : _GEN_447; // @[ChiselTop.scala 142:16 56:32]
  wire  _GEN_523 = 3'h1 == mode ? changeDirection : _GEN_484; // @[ChiselTop.scala 142:16 46:32]
  wire [7:0] sevSeg = 3'h0 == mode ? _GEN_59 : _GEN_485; // @[ChiselTop.scala 142:16]
  wire [7:0] uioDrive = 3'h0 == mode ? 8'h0 : _GEN_486; // @[ChiselTop.scala 142:16 56:32]
  wire  _GEN_562 = 3'h0 == mode ? changeDirection : _GEN_523; // @[ChiselTop.scala 142:16 46:32]
  wire  centuryLED = years >= 7'h64; // @[ChiselTop.scala 322:25]
  wire  anySwitchOn = |io_ui_in; // @[ChiselTop.scala 323:28]
  wire [7:0] _io_uio_out_T = centuryLED ? 8'h80 : 8'h0; // @[ChiselTop.scala 327:46]
  wire [7:0] _io_uio_out_T_1 = uioDrive | _io_uio_out_T; // @[ChiselTop.scala 327:41]
  assign io_uo_out = anySwitchOn ? sevSeg : 8'h0; // @[ChiselTop.scala 326:18]
  assign io_uio_out = anySwitchOn ? _io_uio_out_T_1 : _io_uio_out_T; // @[ChiselTop.scala 327:18]
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
      timer <= 32'h0; // @[ChiselTop.scala 34:24]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          timer <= _GEN_442;
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
    if (reset) begin // @[ChiselTop.scala 44:32]
      pwmCount <= 4'h0; // @[ChiselTop.scala 44:32]
    end else begin
      pwmCount <= _pwmCount_T_1; // @[ChiselTop.scala 95:12]
    end
    if (reset) begin // @[ChiselTop.scala 45:32]
      brightness <= 4'h0; // @[ChiselTop.scala 45:32]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          brightness <= _GEN_444;
        end
      end
    end
    changeDirection <= reset | _GEN_562; // @[ChiselTop.scala 46:{32,32}]
    if (reset) begin // @[ChiselTop.scala 51:27]
      debounce <= 20'h0; // @[ChiselTop.scala 51:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          debounce <= _GEN_443;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_0 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_0 <= _GEN_411;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_1 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_1 <= _GEN_412;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_2 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_2 <= _GEN_413;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_3 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_3 <= _GEN_414;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_4 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_4 <= _GEN_415;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_5 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_5 <= _GEN_416;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_6 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_6 <= _GEN_417;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_7 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_7 <= _GEN_418;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_8 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_8 <= _GEN_419;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_9 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_9 <= _GEN_420;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_10 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_10 <= _GEN_421;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_11 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_11 <= _GEN_422;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_12 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_12 <= _GEN_423;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_13 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_13 <= _GEN_424;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_14 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_14 <= _GEN_425;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_15 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_15 <= _GEN_426;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_16 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_16 <= _GEN_427;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_17 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_17 <= _GEN_428;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_18 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_18 <= _GEN_429;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_19 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_19 <= _GEN_430;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_20 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_20 <= _GEN_431;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_21 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_21 <= _GEN_432;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_22 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_22 <= _GEN_433;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_23 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_23 <= _GEN_434;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_24 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_24 <= _GEN_435;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_25 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_25 <= _GEN_436;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_26 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_26 <= _GEN_437;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_27 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_27 <= _GEN_438;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_28 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_28 <= _GEN_439;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 52:27]
      seqMem_29 <= 3'h0; // @[ChiselTop.scala 52:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          seqMem_29 <= _GEN_440;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 53:27]
      gameLevel <= 6'h0; // @[ChiselTop.scala 53:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          gameLevel <= _GEN_409;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 54:27]
      gameIdx <= 6'h0; // @[ChiselTop.scala 54:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          gameIdx <= _GEN_441;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 55:27]
      simonState <= 3'h0; // @[ChiselTop.scala 55:27]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 142:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 142:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 142:16]
          simonState <= _GEN_410;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 235:29]
      muxClock <= 12'h0; // @[ChiselTop.scala 235:29]
    end else begin
      muxClock <= _muxClock_T_1; // @[ChiselTop.scala 235:51]
    end
    if (reset) begin // @[ChiselTop.scala 237:31]
      blinkTimer <= 21'h0; // @[ChiselTop.scala 237:31]
    end else begin
      blinkTimer <= _blinkTimer_T_1; // @[ChiselTop.scala 237:55]
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
  timer = _RAND_7[31:0];
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
  pwmCount = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  brightness = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  changeDirection = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  debounce = _RAND_16[19:0];
  _RAND_17 = {1{`RANDOM}};
  seqMem_0 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  seqMem_1 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  seqMem_2 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  seqMem_3 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  seqMem_4 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  seqMem_5 = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  seqMem_6 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  seqMem_7 = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  seqMem_8 = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  seqMem_9 = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  seqMem_10 = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  seqMem_11 = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  seqMem_12 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  seqMem_13 = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  seqMem_14 = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  seqMem_15 = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  seqMem_16 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  seqMem_17 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  seqMem_18 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  seqMem_19 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  seqMem_20 = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  seqMem_21 = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  seqMem_22 = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  seqMem_23 = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  seqMem_24 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  seqMem_25 = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  seqMem_26 = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  seqMem_27 = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  seqMem_28 = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  seqMem_29 = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  gameLevel = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  gameIdx = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  simonState = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  muxClock = _RAND_50[11:0];
  _RAND_51 = {1{`RANDOM}};
  blinkTimer = _RAND_51[20:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
