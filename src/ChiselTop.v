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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] fast; // @[ChiselTop.scala 24:24]
  reg [3:0] medium_; // @[ChiselTop.scala 25:24]
  reg [3:0] slow; // @[ChiselTop.scala 26:24]
  reg [2:0] tick2hz; // @[ChiselTop.scala 27:24]
  reg [3:0] tick1hz; // @[ChiselTop.scala 28:24]
  reg [31:0] cntReg; // @[ChiselTop.scala 29:24]
  reg [2:0] diceReg; // @[ChiselTop.scala 31:24]
  reg [5:0] seconds; // @[ChiselTop.scala 33:26]
  reg [5:0] minutes; // @[ChiselTop.scala 34:26]
  reg [4:0] hours; // @[ChiselTop.scala 35:26]
  reg [8:0] days; // @[ChiselTop.scala 36:26]
  reg [6:0] years; // @[ChiselTop.scala 37:26]
  reg [3:0] pwmCount; // @[ChiselTop.scala 39:32]
  reg [3:0] brightness; // @[ChiselTop.scala 40:32]
  reg  changeDirection; // @[ChiselTop.scala 41:32]
  wire  ledStatus = pwmCount < brightness; // @[ChiselTop.scala 42:28]
  wire [2:0] _GEN_1 = io_ui_in[1] ? 3'h1 : 3'h0; // @[ChiselTop.scala 59:28 60:10]
  wire [2:0] _GEN_2 = io_ui_in[2] ? 3'h2 : _GEN_1; // @[ChiselTop.scala 57:28 58:10]
  wire [2:0] _GEN_3 = io_ui_in[3] ? 3'h3 : _GEN_2; // @[ChiselTop.scala 55:28 56:10]
  wire [2:0] _GEN_4 = io_ui_in[4] ? 3'h4 : _GEN_3; // @[ChiselTop.scala 53:28 54:10]
  wire [2:0] _GEN_5 = io_ui_in[5] ? 3'h5 : _GEN_4; // @[ChiselTop.scala 51:28 52:10]
  wire [2:0] _GEN_6 = io_ui_in[6] ? 3'h6 : _GEN_5; // @[ChiselTop.scala 49:28 50:10]
  wire [2:0] mode = io_ui_in[7] ? 3'h7 : _GEN_6; // @[ChiselTop.scala 47:21 48:10]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[ChiselTop.scala 68:20]
  wire [2:0] _diceReg_T_1 = diceReg + 3'h1; // @[ChiselTop.scala 69:22]
  wire [3:0] _pwmCount_T_1 = pwmCount + 4'h1; // @[ChiselTop.scala 73:24]
  wire  _T_9 = cntReg == 32'h2625a0; // @[ChiselTop.scala 75:16]
  wire [2:0] _fast_T_1 = fast + 3'h1; // @[ChiselTop.scala 77:18]
  wire [2:0] _tick2hz_T_1 = tick2hz + 3'h1; // @[ChiselTop.scala 81:24]
  wire [3:0] _medium_T_1 = medium_ + 4'h1; // @[ChiselTop.scala 84:24]
  wire [3:0] _tick1hz_T_1 = tick1hz + 4'h1; // @[ChiselTop.scala 89:26]
  wire [3:0] _slow_T_1 = slow + 4'h1; // @[ChiselTop.scala 92:22]
  wire [3:0] _GEN_11 = slow == 4'h9 ? 4'h0 : _slow_T_1; // @[ChiselTop.scala 92:14 93:29 94:16]
  wire [5:0] _seconds_T_1 = seconds + 6'h1; // @[ChiselTop.scala 96:28]
  wire [5:0] _minutes_T_1 = minutes + 6'h1; // @[ChiselTop.scala 99:30]
  wire [4:0] _hours_T_1 = hours + 5'h1; // @[ChiselTop.scala 102:28]
  wire [8:0] _days_T_1 = days + 9'h1; // @[ChiselTop.scala 105:28]
  wire [6:0] _years_T_1 = years + 7'h1; // @[ChiselTop.scala 108:32]
  wire [8:0] _GEN_12 = days == 9'h16c ? 9'h0 : _days_T_1; // @[ChiselTop.scala 105:20 106:37 107:22]
  wire [6:0] _GEN_13 = days == 9'h16c ? _years_T_1 : years; // @[ChiselTop.scala 106:37 108:23 37:26]
  wire [4:0] _GEN_14 = hours == 5'h17 ? 5'h0 : _hours_T_1; // @[ChiselTop.scala 102:19 103:35 104:21]
  wire [8:0] _GEN_15 = hours == 5'h17 ? _GEN_12 : days; // @[ChiselTop.scala 103:35 36:26]
  wire [6:0] _GEN_16 = hours == 5'h17 ? _GEN_13 : years; // @[ChiselTop.scala 103:35 37:26]
  wire [5:0] _GEN_17 = minutes == 6'h3b ? 6'h0 : _minutes_T_1; // @[ChiselTop.scala 100:35 101:21 99:19]
  wire [4:0] _GEN_18 = minutes == 6'h3b ? _GEN_14 : hours; // @[ChiselTop.scala 100:35 35:26]
  wire [8:0] _GEN_19 = minutes == 6'h3b ? _GEN_15 : days; // @[ChiselTop.scala 100:35 36:26]
  wire [6:0] _GEN_20 = minutes == 6'h3b ? _GEN_16 : years; // @[ChiselTop.scala 100:35 37:26]
  wire [5:0] _GEN_21 = seconds == 6'h3b ? 6'h0 : _seconds_T_1; // @[ChiselTop.scala 96:17 97:33 98:19]
  wire [5:0] _GEN_22 = seconds == 6'h3b ? _GEN_17 : minutes; // @[ChiselTop.scala 34:26 97:33]
  wire [4:0] _GEN_23 = seconds == 6'h3b ? _GEN_18 : hours; // @[ChiselTop.scala 35:26 97:33]
  wire [8:0] _GEN_24 = seconds == 6'h3b ? _GEN_19 : days; // @[ChiselTop.scala 36:26 97:33]
  wire [6:0] _GEN_25 = seconds == 6'h3b ? _GEN_20 : years; // @[ChiselTop.scala 37:26 97:33]
  wire  _T_20 = 3'h0 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_21 = 3'h1 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_22 = 3'h2 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_23 = 3'h3 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_24 = 3'h4 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_25 = 3'h5 == fast; // @[ChiselTop.scala 126:20]
  wire  _T_26 = 3'h6 == fast; // @[ChiselTop.scala 126:20]
  wire [7:0] _GEN_53 = 3'h6 == fast ? 8'h40 : 8'hff; // @[ChiselTop.scala 126:20 133:25 30:28]
  wire [7:0] _GEN_54 = 3'h5 == fast ? 8'h20 : _GEN_53; // @[ChiselTop.scala 126:20 132:25]
  wire [7:0] _GEN_55 = 3'h4 == fast ? 8'h10 : _GEN_54; // @[ChiselTop.scala 126:20 131:25]
  wire [7:0] _GEN_56 = 3'h3 == fast ? 8'h8 : _GEN_55; // @[ChiselTop.scala 126:20 130:25]
  wire [7:0] _GEN_57 = 3'h2 == fast ? 8'h4 : _GEN_56; // @[ChiselTop.scala 126:20 129:25]
  wire [7:0] _GEN_58 = 3'h1 == fast ? 8'h2 : _GEN_57; // @[ChiselTop.scala 126:20 128:25]
  wire [7:0] _GEN_59 = 3'h0 == fast ? 8'h1 : _GEN_58; // @[ChiselTop.scala 126:20 127:25]
  wire [7:0] _GEN_60 = _T_20 ? 8'h40 : 8'hff; // @[ChiselTop.scala 141:20 148:25 30:28]
  wire [7:0] _GEN_61 = _T_21 ? 8'h20 : _GEN_60; // @[ChiselTop.scala 141:20 147:25]
  wire [7:0] _GEN_62 = _T_22 ? 8'h10 : _GEN_61; // @[ChiselTop.scala 141:20 146:25]
  wire [7:0] _GEN_63 = _T_23 ? 8'h8 : _GEN_62; // @[ChiselTop.scala 141:20 145:25]
  wire [7:0] _GEN_64 = _T_24 ? 8'h4 : _GEN_63; // @[ChiselTop.scala 141:20 144:25]
  wire [7:0] _GEN_65 = _T_25 ? 8'h2 : _GEN_64; // @[ChiselTop.scala 141:20 143:25]
  wire [7:0] _GEN_66 = _T_26 ? 8'h1 : _GEN_65; // @[ChiselTop.scala 141:20 142:25]
  wire [7:0] _GEN_67 = 4'h9 == slow ? 8'h6f : 8'hff; // @[ChiselTop.scala 156:20 166:25 30:28]
  wire [7:0] _GEN_68 = 4'h8 == slow ? 8'h7f : _GEN_67; // @[ChiselTop.scala 156:20 165:25]
  wire [7:0] _GEN_69 = 4'h7 == slow ? 8'h7 : _GEN_68; // @[ChiselTop.scala 156:20 164:25]
  wire [7:0] _GEN_70 = 4'h6 == slow ? 8'h7d : _GEN_69; // @[ChiselTop.scala 156:20 163:25]
  wire [7:0] _GEN_71 = 4'h5 == slow ? 8'h6d : _GEN_70; // @[ChiselTop.scala 156:20 162:25]
  wire [7:0] _GEN_72 = 4'h4 == slow ? 8'h66 : _GEN_71; // @[ChiselTop.scala 156:20 161:25]
  wire [7:0] _GEN_73 = 4'h3 == slow ? 8'h4f : _GEN_72; // @[ChiselTop.scala 156:20 160:25]
  wire [7:0] _GEN_74 = 4'h2 == slow ? 8'h5b : _GEN_73; // @[ChiselTop.scala 156:20 159:25]
  wire [7:0] _GEN_75 = 4'h1 == slow ? 8'h6 : _GEN_74; // @[ChiselTop.scala 156:20 158:25]
  wire [7:0] _GEN_76 = 4'h0 == slow ? 8'h3f : _GEN_75; // @[ChiselTop.scala 156:20 157:25]
  wire [7:0] _GEN_77 = 4'hf == medium_ ? 8'h0 : 8'hff; // @[ChiselTop.scala 174:22 190:26 30:28]
  wire [7:0] _GEN_78 = 4'he == medium_ ? 8'h80 : _GEN_77; // @[ChiselTop.scala 174:22 189:26]
  wire [7:0] _GEN_79 = 4'hd == medium_ ? 8'h0 : _GEN_78; // @[ChiselTop.scala 174:22 188:26]
  wire [7:0] _GEN_80 = 4'hc == medium_ ? 8'h80 : _GEN_79; // @[ChiselTop.scala 174:22 187:26]
  wire [7:0] _GEN_81 = 4'hb == medium_ ? 8'h0 : _GEN_80; // @[ChiselTop.scala 174:22 186:26]
  wire [7:0] _GEN_82 = 4'ha == medium_ ? 8'h5e : _GEN_81; // @[ChiselTop.scala 174:22 185:26]
  wire [7:0] _GEN_83 = 4'h9 == medium_ ? 8'h38 : _GEN_82; // @[ChiselTop.scala 174:22 184:25]
  wire [7:0] _GEN_84 = 4'h8 == medium_ ? 8'h50 : _GEN_83; // @[ChiselTop.scala 174:22 183:25]
  wire [7:0] _GEN_85 = 4'h7 == medium_ ? 8'h3f : _GEN_84; // @[ChiselTop.scala 174:22 182:25]
  wire [7:0] _GEN_86 = 4'h6 == medium_ ? 8'h6a : _GEN_85; // @[ChiselTop.scala 174:22 181:25]
  wire [7:0] _GEN_87 = 4'h5 == medium_ ? 8'h0 : _GEN_86; // @[ChiselTop.scala 174:22 180:25]
  wire [7:0] _GEN_88 = 4'h4 == medium_ ? 8'h3f : _GEN_87; // @[ChiselTop.scala 174:22 179:25]
  wire [7:0] _GEN_89 = 4'h3 == medium_ ? 8'h38 : _GEN_88; // @[ChiselTop.scala 174:22 178:25]
  wire [7:0] _GEN_90 = 4'h2 == medium_ ? 8'h38 : _GEN_89; // @[ChiselTop.scala 174:22 177:25]
  wire [7:0] _GEN_91 = 4'h1 == medium_ ? 8'h79 : _GEN_90; // @[ChiselTop.scala 174:22 176:25]
  wire [7:0] _GEN_92 = 4'h0 == medium_ ? 8'h76 : _GEN_91; // @[ChiselTop.scala 174:22 175:25]
  wire [7:0] _GEN_93 = 3'h6 == diceReg ? 8'h7d : 8'hff; // @[ChiselTop.scala 198:23 205:26 30:28]
  wire [7:0] _GEN_94 = 3'h5 == diceReg ? 8'h6d : _GEN_93; // @[ChiselTop.scala 198:23 204:26]
  wire [7:0] _GEN_95 = 3'h4 == diceReg ? 8'h66 : _GEN_94; // @[ChiselTop.scala 198:23 203:26]
  wire [7:0] _GEN_96 = 3'h3 == diceReg ? 8'h4f : _GEN_95; // @[ChiselTop.scala 198:23 202:26]
  wire [7:0] _GEN_97 = 3'h2 == diceReg ? 8'h5b : _GEN_96; // @[ChiselTop.scala 198:23 201:26]
  wire [7:0] _GEN_98 = 3'h1 == diceReg ? 8'h6 : _GEN_97; // @[ChiselTop.scala 198:23 200:26]
  wire [7:0] _GEN_99 = 3'h0 == diceReg ? 8'h3f : _GEN_98; // @[ChiselTop.scala 198:23 199:26]
  wire [3:0] _brightness_T_1 = brightness + 4'h1; // @[ChiselTop.scala 222:36]
  wire  _GEN_100 = brightness == 4'he ? 1'h0 : changeDirection; // @[ChiselTop.scala 223:{38,56} 41:32]
  wire [3:0] _brightness_T_3 = brightness - 4'h1; // @[ChiselTop.scala 226:36]
  wire  _GEN_101 = brightness == 4'h1 | changeDirection; // @[ChiselTop.scala 227:{37,55} 41:32]
  wire [3:0] _GEN_102 = changeDirection ? _brightness_T_1 : _brightness_T_3; // @[ChiselTop.scala 221:32 222:22 226:22]
  wire  _GEN_103 = changeDirection ? _GEN_100 : _GEN_101; // @[ChiselTop.scala 221:32]
  wire [3:0] _GEN_104 = _T_9 ? _GEN_102 : brightness; // @[ChiselTop.scala 220:35 40:32]
  wire  _GEN_105 = _T_9 ? _GEN_103 : changeDirection; // @[ChiselTop.scala 220:35 41:32]
  wire [7:0] _sevSeg_T = ledStatus ? 8'hff : 8'h0; // @[ChiselTop.scala 230:20]
  wire [1:0] _hammingWeight_T_8 = io_ui_in[0] + io_ui_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_10 = io_ui_in[2] + io_ui_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_12 = _hammingWeight_T_8 + _hammingWeight_T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_14 = io_ui_in[4] + io_ui_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _hammingWeight_T_16 = io_ui_in[6] + io_ui_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _hammingWeight_T_18 = _hammingWeight_T_14 + _hammingWeight_T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _hammingWeight_T_20 = _hammingWeight_T_12 + _hammingWeight_T_18; // @[Bitwise.scala 51:90]
  wire [3:0] hammingWeight = _hammingWeight_T_20 - 4'h1; // @[ChiselTop.scala 237:46]
  wire [7:0] _GEN_106 = 4'h7 == hammingWeight ? 8'h7 : 8'hff; // @[ChiselTop.scala 238:29 246:26 30:28]
  wire [7:0] _GEN_107 = 4'h6 == hammingWeight ? 8'h7d : _GEN_106; // @[ChiselTop.scala 238:29 245:26]
  wire [7:0] _GEN_108 = 4'h5 == hammingWeight ? 8'h6d : _GEN_107; // @[ChiselTop.scala 238:29 244:26]
  wire [7:0] _GEN_109 = 4'h4 == hammingWeight ? 8'h66 : _GEN_108; // @[ChiselTop.scala 238:29 243:26]
  wire [7:0] _GEN_110 = 4'h3 == hammingWeight ? 8'h4f : _GEN_109; // @[ChiselTop.scala 238:29 242:26]
  wire [7:0] _GEN_111 = 4'h2 == hammingWeight ? 8'h5b : _GEN_110; // @[ChiselTop.scala 238:29 241:26]
  wire [7:0] _GEN_112 = 4'h1 == hammingWeight ? 8'h6 : _GEN_111; // @[ChiselTop.scala 238:29 240:26]
  wire [7:0] _GEN_113 = 4'h0 == hammingWeight ? 8'h3f : _GEN_112; // @[ChiselTop.scala 238:29 239:26]
  wire [7:0] _GEN_114 = 3'h7 == mode ? _GEN_113 : 8'hff; // @[ChiselTop.scala 120:16 30:28]
  wire [3:0] _GEN_115 = 3'h6 == mode ? _GEN_104 : brightness; // @[ChiselTop.scala 120:16 40:32]
  wire  _GEN_116 = 3'h6 == mode ? _GEN_105 : changeDirection; // @[ChiselTop.scala 120:16 41:32]
  wire [7:0] _GEN_117 = 3'h6 == mode ? _sevSeg_T : _GEN_114; // @[ChiselTop.scala 120:16 230:14]
  wire [3:0] _GEN_118 = 3'h5 == mode ? brightness : _GEN_115; // @[ChiselTop.scala 120:16 40:32]
  wire  _GEN_119 = 3'h5 == mode ? changeDirection : _GEN_116; // @[ChiselTop.scala 120:16 41:32]
  wire [7:0] _GEN_120 = 3'h5 == mode ? 8'hff : _GEN_117; // @[ChiselTop.scala 120:16 30:28]
  wire [7:0] _GEN_121 = 3'h4 == mode ? _GEN_99 : _GEN_120; // @[ChiselTop.scala 120:16]
  wire [3:0] _GEN_122 = 3'h4 == mode ? brightness : _GEN_118; // @[ChiselTop.scala 120:16 40:32]
  wire  _GEN_123 = 3'h4 == mode ? changeDirection : _GEN_119; // @[ChiselTop.scala 120:16 41:32]
  wire [7:0] _GEN_124 = 3'h3 == mode ? _GEN_92 : _GEN_121; // @[ChiselTop.scala 120:16]
  wire [3:0] _GEN_125 = 3'h3 == mode ? brightness : _GEN_122; // @[ChiselTop.scala 120:16 40:32]
  wire  _GEN_126 = 3'h3 == mode ? changeDirection : _GEN_123; // @[ChiselTop.scala 120:16 41:32]
  wire [7:0] _GEN_127 = 3'h2 == mode ? _GEN_76 : _GEN_124; // @[ChiselTop.scala 120:16]
  wire  _GEN_129 = 3'h2 == mode ? changeDirection : _GEN_126; // @[ChiselTop.scala 120:16 41:32]
  wire [7:0] _GEN_130 = 3'h1 == mode ? _GEN_66 : _GEN_127; // @[ChiselTop.scala 120:16]
  wire  _GEN_132 = 3'h1 == mode ? changeDirection : _GEN_129; // @[ChiselTop.scala 120:16 41:32]
  wire  _GEN_135 = 3'h0 == mode ? changeDirection : _GEN_132; // @[ChiselTop.scala 120:16 41:32]
  wire  _T_85 = years == 7'h64; // @[ChiselTop.scala 250:12]
  assign io_uo_out = 3'h0 == mode ? _GEN_59 : _GEN_130; // @[ChiselTop.scala 120:16]
  assign io_uio_out = {{7'd0}, _T_85};
  assign io_uio_oe = 8'hff; // @[ChiselTop.scala 18:14]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 24:24]
      fast <= 3'h0; // @[ChiselTop.scala 24:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (fast == 3'h7) begin // @[ChiselTop.scala 78:25]
        fast <= 3'h0; // @[ChiselTop.scala 79:12]
      end else begin
        fast <= _fast_T_1; // @[ChiselTop.scala 77:10]
      end
    end
    if (reset) begin // @[ChiselTop.scala 25:24]
      medium_ <= 4'h0; // @[ChiselTop.scala 25:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (medium_ == 4'hf) begin // @[ChiselTop.scala 85:30]
          medium_ <= 4'h0; // @[ChiselTop.scala 86:16]
        end else begin
          medium_ <= _medium_T_1; // @[ChiselTop.scala 84:14]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 26:24]
      slow <= 4'h0; // @[ChiselTop.scala 26:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          slow <= _GEN_11;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 27:24]
      tick2hz <= 3'h0; // @[ChiselTop.scala 27:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        tick2hz <= 3'h0; // @[ChiselTop.scala 83:15]
      end else begin
        tick2hz <= _tick2hz_T_1; // @[ChiselTop.scala 81:13]
      end
    end
    if (reset) begin // @[ChiselTop.scala 28:24]
      tick1hz <= 4'h0; // @[ChiselTop.scala 28:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          tick1hz <= 4'h0; // @[ChiselTop.scala 91:17]
        end else begin
          tick1hz <= _tick1hz_T_1; // @[ChiselTop.scala 89:15]
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 29:24]
      cntReg <= 32'h0; // @[ChiselTop.scala 29:24]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      cntReg <= 32'h0; // @[ChiselTop.scala 76:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 68:10]
    end
    if (reset) begin // @[ChiselTop.scala 31:24]
      diceReg <= 3'h1; // @[ChiselTop.scala 31:24]
    end else if (diceReg == 3'h7) begin // @[ChiselTop.scala 70:26]
      diceReg <= 3'h1; // @[ChiselTop.scala 71:13]
    end else begin
      diceReg <= _diceReg_T_1; // @[ChiselTop.scala 69:11]
    end
    if (reset) begin // @[ChiselTop.scala 33:26]
      seconds <= 6'h0; // @[ChiselTop.scala 33:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          seconds <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 34:26]
      minutes <= 6'h0; // @[ChiselTop.scala 34:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          minutes <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 35:26]
      hours <= 5'h0; // @[ChiselTop.scala 35:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          hours <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 36:26]
      days <= 9'h0; // @[ChiselTop.scala 36:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          days <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 37:26]
      years <= 7'h0; // @[ChiselTop.scala 37:26]
    end else if (cntReg == 32'h2625a0) begin // @[ChiselTop.scala 75:31]
      if (tick2hz == 3'h4) begin // @[ChiselTop.scala 82:28]
        if (tick1hz == 4'h1) begin // @[ChiselTop.scala 90:30]
          years <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[ChiselTop.scala 39:32]
      pwmCount <= 4'h0; // @[ChiselTop.scala 39:32]
    end else begin
      pwmCount <= _pwmCount_T_1; // @[ChiselTop.scala 73:12]
    end
    if (reset) begin // @[ChiselTop.scala 40:32]
      brightness <= 4'h0; // @[ChiselTop.scala 40:32]
    end else if (!(3'h0 == mode)) begin // @[ChiselTop.scala 120:16]
      if (!(3'h1 == mode)) begin // @[ChiselTop.scala 120:16]
        if (!(3'h2 == mode)) begin // @[ChiselTop.scala 120:16]
          brightness <= _GEN_125;
        end
      end
    end
    changeDirection <= reset | _GEN_135; // @[ChiselTop.scala 41:{32,32}]
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
  seconds = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  minutes = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  hours = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  days = _RAND_10[8:0];
  _RAND_11 = {1{`RANDOM}};
  years = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  pwmCount = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  brightness = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  changeDirection = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
