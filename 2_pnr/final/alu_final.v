module alu (clk,
    overflow_flag,
    rst_n,
    zero_flag,
    a,
    b,
    opcode,
    result);
 input clk;
 output overflow_flag;
 input rst_n;
 output zero_flag;
 input [7:0] a;
 input [7:0] b;
 input [3:0] opcode;
 output [7:0] result;

 wire clknet_0_clk;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;
 wire _222_;
 wire _223_;
 wire _224_;
 wire _225_;
 wire _226_;
 wire _227_;
 wire _228_;
 wire _229_;
 wire _230_;
 wire _231_;
 wire _232_;
 wire _233_;
 wire _234_;
 wire _235_;
 wire _236_;
 wire _237_;
 wire _238_;
 wire _239_;
 wire _240_;
 wire _241_;
 wire _242_;
 wire _243_;
 wire net70;
 wire net69;
 wire net68;
 wire net67;
 wire net66;
 wire net65;
 wire net64;
 wire net63;
 wire net62;
 wire net61;
 wire net60;
 wire net59;
 wire net58;
 wire net57;
 wire net56;
 wire net55;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net81;
 wire net82;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net156;
 wire net157;
 wire net158;
 wire net159;
 wire net160;
 wire net161;
 wire net162;
 wire net163;
 wire net164;
 wire net165;
 wire net166;
 wire net167;
 wire net168;
 wire net169;
 wire net170;
 wire net171;
 wire net172;
 wire net173;
 wire net174;
 wire net175;
 wire net176;
 wire net177;
 wire net178;
 wire net179;
 wire net180;
 wire net181;
 wire net182;
 wire net183;
 wire net184;
 wire net185;
 wire net186;
 wire net187;

 INV_X1 _244_ (.A(a[7]),
    .ZN(_167_));
 INV_X1 _245_ (.A(a[6]),
    .ZN(_168_));
 INV_X1 _246_ (.A(b[6]),
    .ZN(_169_));
 INV_X1 _247_ (.A(net108),
    .ZN(_170_));
 INV_X1 _248_ (.A(net119),
    .ZN(_171_));
 INV_X1 _249_ (.A(a[3]),
    .ZN(_172_));
 INV_X1 _250_ (.A(a[2]),
    .ZN(_173_));
 INV_X2 _251_ (.A(net63),
    .ZN(_174_));
 INV_X1 _252_ (.A(a[1]),
    .ZN(_175_));
 INV_X2 _253_ (.A(net66),
    .ZN(_176_));
 INV_X1 _254_ (.A(a[0]),
    .ZN(_177_));
 INV_X2 _255_ (.A(net76),
    .ZN(_178_));
 INV_X1 _256_ (.A(net60),
    .ZN(_179_));
 INV_X1 _257_ (.A(net103),
    .ZN(_180_));
 INV_X2 _258_ (.A(net98),
    .ZN(_181_));
 INV_X1 _259_ (.A(net57),
    .ZN(_182_));
 NOR2_X4 _260_ (.A1(net80),
    .A2(rst_n),
    .ZN(_183_));
 LOGIC0_X1 _260__80 (.Z(net80));
 INV_X1 _261_ (.A(_183_),
    .ZN(_184_));
 NOR2_X4 _262_ (.A1(net136),
    .A2(_181_),
    .ZN(_185_));
 NAND3_X1 _263_ (.A1(net59),
    .A2(net103),
    .A3(_185_),
    .ZN(_186_));
 NAND2_X1 _264_ (.A1(a[6]),
    .A2(b[6]),
    .ZN(_187_));
 INV_X1 _265_ (.A(_187_),
    .ZN(_188_));
 XOR2_X2 _266_ (.A(net171),
    .B(net142),
    .Z(_189_));
 XNOR2_X2 _267_ (.A(a[6]),
    .B(b[6]),
    .ZN(_190_));
 NAND2_X1 _268_ (.A1(a[7]),
    .A2(net113),
    .ZN(_191_));
 INV_X1 _269_ (.A(net114),
    .ZN(_192_));
 XOR2_X2 _270_ (.A(a[7]),
    .B(net113),
    .Z(_193_));
 NOR2_X1 _271_ (.A1(_170_),
    .A2(b[5]),
    .ZN(_194_));
 NOR3_X1 _272_ (.A1(_189_),
    .A2(_193_),
    .A3(_194_),
    .ZN(_195_));
 NAND2_X1 _273_ (.A1(_170_),
    .A2(b[5]),
    .ZN(_196_));
 NAND2_X1 _274_ (.A1(net124),
    .A2(net119),
    .ZN(_197_));
 INV_X1 _275_ (.A(net125),
    .ZN(_198_));
 XOR2_X2 _276_ (.A(net79),
    .B(net119),
    .Z(_199_));
 XNOR2_X2 _277_ (.A(net79),
    .B(net119),
    .ZN(_200_));
 NAND2_X1 _278_ (.A1(net79),
    .A2(_171_),
    .ZN(_201_));
 OAI21_X1 _279_ (.A(_196_),
    .B1(_171_),
    .B2(net79),
    .ZN(_202_));
 NAND3_X1 _280_ (.A1(_195_),
    .A2(_196_),
    .A3(_200_),
    .ZN(_203_));
 NAND2_X1 _281_ (.A1(net173),
    .A2(b[3]),
    .ZN(_204_));
 XOR2_X2 _282_ (.A(net173),
    .B(net175),
    .Z(_205_));
 NOR2_X2 _283_ (.A1(net130),
    .A2(net63),
    .ZN(_206_));
 AND2_X1 _284_ (.A1(net130),
    .A2(net63),
    .ZN(_207_));
 NOR2_X2 _285_ (.A1(_206_),
    .A2(net55),
    .ZN(_208_));
 NOR3_X2 _286_ (.A1(_203_),
    .A2(_205_),
    .A3(_208_),
    .ZN(_209_));
 NAND2_X2 _287_ (.A1(net186),
    .A2(_178_),
    .ZN(_210_));
 NAND2_X1 _288_ (.A1(net71),
    .A2(_210_),
    .ZN(_211_));
 NOR2_X2 _289_ (.A1(net71),
    .A2(_210_),
    .ZN(_212_));
 NOR2_X1 _290_ (.A1(_175_),
    .A2(net71),
    .ZN(_213_));
 OAI21_X1 _291_ (.A(_211_),
    .B1(_212_),
    .B2(a[1]),
    .ZN(_214_));
 NOR2_X1 _292_ (.A1(_172_),
    .A2(b[3]),
    .ZN(_215_));
 NOR3_X1 _293_ (.A1(a[2]),
    .A2(_174_),
    .A3(_215_),
    .ZN(_216_));
 AOI21_X1 _294_ (.A(_216_),
    .B1(b[3]),
    .B2(_172_),
    .ZN(_217_));
 NOR3_X1 _295_ (.A1(a[6]),
    .A2(_169_),
    .A3(_193_),
    .ZN(_218_));
 AOI22_X1 _296_ (.A1(_167_),
    .A2(net113),
    .B1(_195_),
    .B2(_202_),
    .ZN(_219_));
 OAI21_X1 _297_ (.A(_219_),
    .B1(_217_),
    .B2(_203_),
    .ZN(_220_));
 AOI211_X2 _298_ (.A(_218_),
    .B(_220_),
    .C1(_209_),
    .C2(_214_),
    .ZN(_221_));
 AND4_X1 _299_ (.A1(net59),
    .A2(net165),
    .A3(_185_),
    .A4(_221_),
    .ZN(_222_));
 NAND3_X4 _300_ (.A1(net59),
    .A2(_180_),
    .A3(_185_),
    .ZN(_223_));
 NOR2_X2 _301_ (.A1(net94),
    .A2(_223_),
    .ZN(_224_));
 NAND3_X2 _302_ (.A1(_179_),
    .A2(net103),
    .A3(_185_),
    .ZN(_225_));
 NOR2_X4 _303_ (.A1(net94),
    .A2(_225_),
    .ZN(_226_));
 NOR2_X2 _304_ (.A1(_174_),
    .A2(_225_),
    .ZN(_227_));
 MUX2_X1 _305_ (.A(net79),
    .B(net108),
    .S(net73),
    .Z(_228_));
 NAND2_X1 _306_ (.A1(net56),
    .A2(_228_),
    .ZN(_229_));
 NOR2_X1 _307_ (.A1(_168_),
    .A2(net73),
    .ZN(_230_));
 AOI21_X2 _308_ (.A(_230_),
    .B1(net73),
    .B2(a[7]),
    .ZN(_231_));
 OAI21_X2 _309_ (.A(_229_),
    .B1(_231_),
    .B2(net56),
    .ZN(_232_));
 NAND2_X1 _310_ (.A1(net168),
    .A2(net76),
    .ZN(_233_));
 NOR2_X1 _311_ (.A1(net136),
    .A2(net98),
    .ZN(_011_));
 NAND2_X2 _312_ (.A1(net165),
    .A2(_011_),
    .ZN(_012_));
 OAI21_X1 _313_ (.A(net60),
    .B1(net77),
    .B2(a[0]),
    .ZN(_013_));
 AOI21_X1 _314_ (.A(_012_),
    .B1(_013_),
    .B2(_233_),
    .ZN(_014_));
 NOR3_X4 _315_ (.A1(net103),
    .A2(opcode[3]),
    .A3(net98),
    .ZN(_015_));
 NOR4_X4 _316_ (.A1(net60),
    .A2(net103),
    .A3(net136),
    .A4(_181_),
    .ZN(_016_));
 XOR2_X1 _317_ (.A(a[0]),
    .B(net76),
    .Z(_017_));
 OAI21_X1 _318_ (.A(_017_),
    .B1(_016_),
    .B2(_015_),
    .ZN(_018_));
 MUX2_X1 _319_ (.A(net130),
    .B(a[3]),
    .S(net73),
    .Z(_019_));
 NAND2_X1 _320_ (.A1(a[1]),
    .A2(net76),
    .ZN(_020_));
 NAND2_X1 _321_ (.A1(_210_),
    .A2(_020_),
    .ZN(_021_));
 MUX2_X1 _322_ (.A(_019_),
    .B(_021_),
    .S(_176_),
    .Z(_022_));
 AOI221_X2 _323_ (.A(_014_),
    .B1(_022_),
    .B2(_226_),
    .C1(_227_),
    .C2(_232_),
    .ZN(_023_));
 NAND2_X1 _324_ (.A1(_018_),
    .A2(_023_),
    .ZN(_024_));
 AOI211_X2 _325_ (.A(net166),
    .B(_024_),
    .C1(net95),
    .C2(_212_),
    .ZN(_025_));
 NAND2_X1 _326_ (.A1(net81),
    .A2(_182_),
    .ZN(_026_));
 LOGIC0_X1 _326__81 (.Z(net81));
 AOI21_X1 _327_ (.A(_183_),
    .B1(net96),
    .B2(net57),
    .ZN(_001_));
 NAND2_X1 _328_ (.A1(a[1]),
    .A2(net69),
    .ZN(_027_));
 XOR2_X2 _329_ (.A(a[1]),
    .B(net69),
    .Z(_028_));
 XNOR2_X2 _330_ (.A(a[1]),
    .B(net71),
    .ZN(_029_));
 AOI21_X2 _331_ (.A(_028_),
    .B1(net76),
    .B2(_177_),
    .ZN(_030_));
 OAI21_X1 _332_ (.A(_029_),
    .B1(_178_),
    .B2(net168),
    .ZN(_031_));
 AND2_X1 _333_ (.A1(_210_),
    .A2(_030_),
    .ZN(_032_));
 AOI21_X1 _334_ (.A(_221_),
    .B1(_032_),
    .B2(_209_),
    .ZN(_033_));
 AOI211_X1 _335_ (.A(net104),
    .B(_221_),
    .C1(_032_),
    .C2(_209_),
    .ZN(_034_));
 OAI21_X1 _336_ (.A(net60),
    .B1(net71),
    .B2(a[1]),
    .ZN(_035_));
 AOI21_X1 _337_ (.A(_012_),
    .B1(_027_),
    .B2(_035_),
    .ZN(_036_));
 NOR2_X1 _338_ (.A1(_170_),
    .A2(net73),
    .ZN(_037_));
 AOI21_X1 _339_ (.A(_037_),
    .B1(net73),
    .B2(a[6]),
    .ZN(_038_));
 NAND2_X1 _340_ (.A1(a[7]),
    .A2(_178_),
    .ZN(_039_));
 NAND3_X1 _341_ (.A1(a[7]),
    .A2(net66),
    .A3(_178_),
    .ZN(_040_));
 OAI21_X1 _342_ (.A(_040_),
    .B1(_038_),
    .B2(net66),
    .ZN(_041_));
 AOI221_X1 _343_ (.A(_036_),
    .B1(_041_),
    .B2(_227_),
    .C1(_016_),
    .C2(_028_),
    .ZN(_042_));
 NOR2_X1 _344_ (.A1(_175_),
    .A2(net76),
    .ZN(_043_));
 AOI21_X1 _345_ (.A(_043_),
    .B1(net76),
    .B2(a[0]),
    .ZN(_044_));
 OR2_X1 _346_ (.A1(net69),
    .A2(_044_),
    .ZN(_045_));
 NOR3_X1 _347_ (.A1(net63),
    .A2(_223_),
    .A3(_045_),
    .ZN(_046_));
 NOR2_X1 _348_ (.A1(_172_),
    .A2(net74),
    .ZN(_047_));
 AOI21_X1 _349_ (.A(_047_),
    .B1(net74),
    .B2(net79),
    .ZN(_048_));
 AOI211_X1 _350_ (.A(net69),
    .B(_043_),
    .C1(net77),
    .C2(a[2]),
    .ZN(_049_));
 AOI21_X1 _351_ (.A(_049_),
    .B1(_048_),
    .B2(net69),
    .ZN(_050_));
 AOI21_X1 _352_ (.A(_046_),
    .B1(_050_),
    .B2(_226_),
    .ZN(_051_));
 NAND3_X1 _353_ (.A1(_177_),
    .A2(net76),
    .A3(_028_),
    .ZN(_052_));
 AND2_X1 _354_ (.A1(net59),
    .A2(_015_),
    .ZN(_053_));
 NAND2_X2 _355_ (.A1(net59),
    .A2(net99),
    .ZN(_054_));
 NAND3_X1 _356_ (.A1(_031_),
    .A2(_052_),
    .A3(_053_),
    .ZN(_055_));
 NAND2_X4 _357_ (.A1(_179_),
    .A2(net99),
    .ZN(_056_));
 AOI21_X1 _358_ (.A(_056_),
    .B1(_029_),
    .B2(_233_),
    .ZN(_057_));
 OAI21_X1 _359_ (.A(_057_),
    .B1(_029_),
    .B2(_233_),
    .ZN(_058_));
 NAND4_X1 _360_ (.A1(_042_),
    .A2(_051_),
    .A3(_055_),
    .A4(net169),
    .ZN(_059_));
 NOR2_X1 _361_ (.A1(net105),
    .A2(net170),
    .ZN(_060_));
 AOI21_X1 _362_ (.A(_183_),
    .B1(net106),
    .B2(net57),
    .ZN(_002_));
 OAI21_X1 _363_ (.A(_027_),
    .B1(_029_),
    .B2(_233_),
    .ZN(_061_));
 OR2_X1 _364_ (.A1(_208_),
    .A2(_061_),
    .ZN(_062_));
 AND2_X1 _365_ (.A1(_208_),
    .A2(_061_),
    .ZN(_063_));
 NAND2_X1 _366_ (.A1(_208_),
    .A2(net137),
    .ZN(_064_));
 OAI21_X1 _367_ (.A(net138),
    .B1(_063_),
    .B2(_056_),
    .ZN(_065_));
 OAI211_X1 _368_ (.A(_208_),
    .B(_031_),
    .C1(_175_),
    .C2(net71),
    .ZN(_066_));
 OAI22_X4 _369_ (.A1(_206_),
    .A2(net55),
    .B1(_213_),
    .B2(_030_),
    .ZN(_067_));
 NAND2_X1 _370_ (.A1(_066_),
    .A2(_067_),
    .ZN(_068_));
 MUX2_X1 _371_ (.A(_228_),
    .B(_019_),
    .S(net56),
    .Z(_069_));
 NOR2_X1 _372_ (.A1(net66),
    .A2(_231_),
    .ZN(_070_));
 AOI22_X1 _373_ (.A1(_226_),
    .A2(_069_),
    .B1(_070_),
    .B2(_227_),
    .ZN(_071_));
 OAI21_X1 _374_ (.A(_020_),
    .B1(net77),
    .B2(_173_),
    .ZN(_072_));
 INV_X1 _375_ (.A(_072_),
    .ZN(_073_));
 NOR2_X1 _376_ (.A1(net69),
    .A2(_072_),
    .ZN(_074_));
 AOI21_X1 _377_ (.A(_074_),
    .B1(_210_),
    .B2(net69),
    .ZN(_075_));
 OAI211_X1 _378_ (.A(net103),
    .B(_011_),
    .C1(net55),
    .C2(net59),
    .ZN(_076_));
 AOI21_X1 _379_ (.A(_076_),
    .B1(_206_),
    .B2(net59),
    .ZN(_077_));
 AOI211_X1 _380_ (.A(_182_),
    .B(_077_),
    .C1(_075_),
    .C2(_224_),
    .ZN(_078_));
 OAI211_X1 _381_ (.A(_071_),
    .B(_078_),
    .C1(_054_),
    .C2(_068_),
    .ZN(_079_));
 AOI21_X1 _382_ (.A(_079_),
    .B1(net139),
    .B2(_062_),
    .ZN(_080_));
 NOR2_X1 _383_ (.A1(_183_),
    .A2(net140),
    .ZN(_003_));
 OAI21_X2 _384_ (.A(_205_),
    .B1(net55),
    .B2(_063_),
    .ZN(_081_));
 NOR3_X1 _385_ (.A1(_205_),
    .A2(net55),
    .A3(_063_),
    .ZN(_082_));
 NOR2_X1 _386_ (.A1(_056_),
    .A2(_082_),
    .ZN(_083_));
 NAND2_X1 _387_ (.A1(net130),
    .A2(_174_),
    .ZN(_084_));
 NAND3_X1 _388_ (.A1(_205_),
    .A2(_067_),
    .A3(_084_),
    .ZN(_085_));
 AOI21_X2 _389_ (.A(_205_),
    .B1(_067_),
    .B2(net131),
    .ZN(_086_));
 NAND2_X1 _390_ (.A1(_053_),
    .A2(_085_),
    .ZN(_087_));
 MUX2_X1 _391_ (.A(a[3]),
    .B(a[2]),
    .S(net74),
    .Z(_088_));
 NAND2_X1 _392_ (.A1(net56),
    .A2(_088_),
    .ZN(_089_));
 OAI21_X1 _393_ (.A(_089_),
    .B1(_044_),
    .B2(net56),
    .ZN(_090_));
 AND2_X1 _394_ (.A1(net56),
    .A2(_048_),
    .ZN(_091_));
 AOI21_X1 _395_ (.A(_091_),
    .B1(_038_),
    .B2(net66),
    .ZN(_092_));
 AOI22_X1 _396_ (.A1(net95),
    .A2(_090_),
    .B1(_092_),
    .B2(_226_),
    .ZN(_093_));
 NOR2_X1 _397_ (.A1(net67),
    .A2(_039_),
    .ZN(_094_));
 OAI21_X1 _398_ (.A(net59),
    .B1(b[3]),
    .B2(a[3]),
    .ZN(_095_));
 AOI21_X1 _399_ (.A(_012_),
    .B1(_095_),
    .B2(_204_),
    .ZN(_096_));
 AOI221_X2 _400_ (.A(_096_),
    .B1(_094_),
    .B2(_227_),
    .C1(_205_),
    .C2(_016_),
    .ZN(_097_));
 OAI211_X1 _401_ (.A(_093_),
    .B(_097_),
    .C1(net132),
    .C2(_087_),
    .ZN(_098_));
 AOI21_X1 _402_ (.A(net133),
    .B1(_083_),
    .B2(_081_),
    .ZN(_099_));
 AOI21_X1 _403_ (.A(_183_),
    .B1(net134),
    .B2(net57),
    .ZN(_004_));
 OAI21_X1 _404_ (.A(_200_),
    .B1(_215_),
    .B2(_086_),
    .ZN(_100_));
 OR3_X1 _405_ (.A1(_200_),
    .A2(_215_),
    .A3(_086_),
    .ZN(_101_));
 NAND3_X1 _406_ (.A1(_053_),
    .A2(_100_),
    .A3(_101_),
    .ZN(_102_));
 AOI21_X2 _407_ (.A(net120),
    .B1(net174),
    .B2(_081_),
    .ZN(_103_));
 NAND3_X1 _408_ (.A1(net120),
    .A2(net174),
    .A3(_081_),
    .ZN(_104_));
 NOR2_X1 _409_ (.A1(_056_),
    .A2(_103_),
    .ZN(_105_));
 MUX2_X1 _410_ (.A(net79),
    .B(a[3]),
    .S(net74),
    .Z(_106_));
 OAI21_X1 _411_ (.A(_174_),
    .B1(net66),
    .B2(_106_),
    .ZN(_107_));
 AOI21_X1 _412_ (.A(_107_),
    .B1(_073_),
    .B2(net69),
    .ZN(_108_));
 AOI21_X1 _413_ (.A(_108_),
    .B1(_212_),
    .B2(net94),
    .ZN(_109_));
 OAI21_X1 _414_ (.A(net61),
    .B1(net119),
    .B2(net79),
    .ZN(_110_));
 AOI21_X1 _415_ (.A(_012_),
    .B1(_110_),
    .B2(_197_),
    .ZN(_111_));
 AOI221_X2 _416_ (.A(_111_),
    .B1(_232_),
    .B2(_226_),
    .C1(_199_),
    .C2(_016_),
    .ZN(_112_));
 OAI211_X1 _417_ (.A(_102_),
    .B(_112_),
    .C1(_109_),
    .C2(_223_),
    .ZN(_113_));
 AOI21_X1 _418_ (.A(_113_),
    .B1(_105_),
    .B2(net121),
    .ZN(_114_));
 AOI21_X1 _419_ (.A(_183_),
    .B1(net122),
    .B2(net57),
    .ZN(_005_));
 NAND2_X1 _420_ (.A1(net108),
    .A2(b[5]),
    .ZN(_115_));
 XOR2_X2 _421_ (.A(net108),
    .B(b[5]),
    .Z(_116_));
 NAND2_X1 _422_ (.A1(_201_),
    .A2(_100_),
    .ZN(_117_));
 XOR2_X1 _423_ (.A(_116_),
    .B(_117_),
    .Z(_118_));
 OAI21_X1 _424_ (.A(_116_),
    .B1(_103_),
    .B2(net126),
    .ZN(_119_));
 NOR3_X1 _425_ (.A1(net126),
    .A2(_103_),
    .A3(_116_),
    .ZN(_120_));
 NOR2_X1 _426_ (.A1(_056_),
    .A2(_120_),
    .ZN(_121_));
 NAND2_X1 _427_ (.A1(net66),
    .A2(_088_),
    .ZN(_122_));
 AOI21_X1 _428_ (.A(_037_),
    .B1(net73),
    .B2(net124),
    .ZN(_123_));
 OAI21_X1 _429_ (.A(_122_),
    .B1(_123_),
    .B2(net67),
    .ZN(_124_));
 AOI21_X1 _430_ (.A(_223_),
    .B1(_045_),
    .B2(net63),
    .ZN(_125_));
 OAI21_X1 _431_ (.A(_125_),
    .B1(_124_),
    .B2(net63),
    .ZN(_126_));
 OAI21_X1 _432_ (.A(net61),
    .B1(b[5]),
    .B2(net108),
    .ZN(_127_));
 AOI21_X1 _433_ (.A(_012_),
    .B1(net109),
    .B2(_127_),
    .ZN(_128_));
 AOI221_X1 _434_ (.A(_128_),
    .B1(_116_),
    .B2(_016_),
    .C1(_226_),
    .C2(_041_),
    .ZN(_129_));
 OAI211_X1 _435_ (.A(_126_),
    .B(_129_),
    .C1(_054_),
    .C2(_118_),
    .ZN(_130_));
 AOI21_X1 _436_ (.A(_130_),
    .B1(_121_),
    .B2(net127),
    .ZN(_131_));
 AOI21_X1 _437_ (.A(_183_),
    .B1(net128),
    .B2(net57),
    .ZN(_006_));
 AOI22_X1 _438_ (.A1(_170_),
    .A2(b[5]),
    .B1(_201_),
    .B2(_100_),
    .ZN(_132_));
 OAI21_X1 _439_ (.A(_190_),
    .B1(_194_),
    .B2(_132_),
    .ZN(_133_));
 OR3_X1 _440_ (.A1(_190_),
    .A2(_194_),
    .A3(_132_),
    .ZN(_134_));
 AND3_X1 _441_ (.A1(_053_),
    .A2(_133_),
    .A3(_134_),
    .ZN(_135_));
 AOI21_X1 _442_ (.A(_190_),
    .B1(net109),
    .B2(_119_),
    .ZN(_136_));
 NAND3_X1 _443_ (.A1(_190_),
    .A2(net109),
    .A3(_119_),
    .ZN(_137_));
 NOR2_X1 _444_ (.A1(_056_),
    .A2(_136_),
    .ZN(_138_));
 OAI21_X1 _445_ (.A(net61),
    .B1(b[6]),
    .B2(a[6]),
    .ZN(_139_));
 AOI21_X1 _446_ (.A(_012_),
    .B1(_139_),
    .B2(_187_),
    .ZN(_140_));
 OAI21_X1 _447_ (.A(net56),
    .B1(_178_),
    .B2(_170_),
    .ZN(_141_));
 NAND2_X1 _448_ (.A1(_226_),
    .A2(_070_),
    .ZN(_142_));
 OAI221_X1 _449_ (.A(_174_),
    .B1(net56),
    .B2(_106_),
    .C1(_141_),
    .C2(_230_),
    .ZN(_143_));
 NAND2_X1 _450_ (.A1(net94),
    .A2(_075_),
    .ZN(_144_));
 AOI21_X1 _451_ (.A(_223_),
    .B1(_143_),
    .B2(_144_),
    .ZN(_145_));
 AOI211_X1 _452_ (.A(_140_),
    .B(_145_),
    .C1(_189_),
    .C2(_016_),
    .ZN(_146_));
 NAND2_X1 _453_ (.A1(_142_),
    .A2(_146_),
    .ZN(_147_));
 AOI211_X2 _454_ (.A(_135_),
    .B(_147_),
    .C1(_138_),
    .C2(net110),
    .ZN(_148_));
 AOI21_X1 _455_ (.A(_183_),
    .B1(net111),
    .B2(net57),
    .ZN(_007_));
 OAI21_X1 _456_ (.A(_133_),
    .B1(net142),
    .B2(_168_),
    .ZN(_149_));
 XOR2_X1 _457_ (.A(_193_),
    .B(_149_),
    .Z(_150_));
 OR2_X1 _458_ (.A1(_188_),
    .A2(_136_),
    .ZN(_151_));
 XNOR2_X1 _459_ (.A(_193_),
    .B(_151_),
    .ZN(_152_));
 AOI21_X1 _460_ (.A(net66),
    .B1(net73),
    .B2(a[6]),
    .ZN(_153_));
 AOI221_X1 _461_ (.A(net63),
    .B1(net67),
    .B2(_123_),
    .C1(_153_),
    .C2(_039_),
    .ZN(_154_));
 AOI21_X1 _462_ (.A(_154_),
    .B1(_090_),
    .B2(net63),
    .ZN(_155_));
 OAI21_X1 _463_ (.A(net61),
    .B1(b[7]),
    .B2(a[7]),
    .ZN(_156_));
 AOI21_X1 _464_ (.A(_012_),
    .B1(_156_),
    .B2(_191_),
    .ZN(_157_));
 AOI21_X1 _465_ (.A(_157_),
    .B1(_094_),
    .B2(_226_),
    .ZN(_158_));
 OAI21_X1 _466_ (.A(_158_),
    .B1(_155_),
    .B2(_223_),
    .ZN(_159_));
 AOI21_X1 _467_ (.A(_159_),
    .B1(_016_),
    .B2(_193_),
    .ZN(_160_));
 OAI221_X2 _468_ (.A(_160_),
    .B1(_152_),
    .B2(_056_),
    .C1(net100),
    .C2(net143),
    .ZN(_161_));
 MUX2_X1 _469_ (.A(net82),
    .B(net101),
    .S(net57),
    .Z(_008_));
 LOGIC0_X1 _469__82 (.Z(net82));
 AND4_X1 _470_ (.A1(net96),
    .A2(_060_),
    .A3(_080_),
    .A4(_099_),
    .ZN(_162_));
 NAND4_X1 _471_ (.A1(net122),
    .A2(net128),
    .A3(net111),
    .A4(_162_),
    .ZN(_163_));
 OAI21_X1 _472_ (.A(_026_),
    .B1(net101),
    .B2(_163_),
    .ZN(_009_));
 AOI21_X1 _473_ (.A(net115),
    .B1(_193_),
    .B2(_151_),
    .ZN(_164_));
 AOI21_X1 _474_ (.A(_182_),
    .B1(_033_),
    .B2(_053_),
    .ZN(_165_));
 OAI21_X1 _475_ (.A(_165_),
    .B1(net116),
    .B2(_056_),
    .ZN(_166_));
 AND2_X1 _476_ (.A1(_184_),
    .A2(net117),
    .ZN(_010_));
 DFF_X2 _477_ (.D(net97),
    .CK(clknet_1_1__leaf_clk),
    .Q(net90),
    .QN(_243_));
 DFF_X2 _478_ (.D(net107),
    .CK(clknet_1_1__leaf_clk),
    .Q(net91),
    .QN(_242_));
 DFF_X2 _479_ (.D(net141),
    .CK(clknet_1_1__leaf_clk),
    .Q(net92),
    .QN(_241_));
 DFF_X2 _480_ (.D(net135),
    .CK(clknet_1_1__leaf_clk),
    .Q(net89),
    .QN(_240_));
 DFF_X2 _481_ (.D(net123),
    .CK(clknet_1_0__leaf_clk),
    .Q(net83),
    .QN(_239_));
 DFF_X2 _482_ (.D(net129),
    .CK(clknet_1_0__leaf_clk),
    .Q(net85),
    .QN(_238_));
 DFF_X2 _483_ (.D(net112),
    .CK(clknet_1_0__leaf_clk),
    .Q(net88),
    .QN(_237_));
 DFF_X2 _484_ (.D(_008_),
    .CK(clknet_1_0__leaf_clk),
    .Q(net86),
    .QN(_236_));
 DFF_X2 _485_ (.D(net102),
    .CK(clknet_1_0__leaf_clk),
    .Q(net87),
    .QN(_235_));
 DFF_X2 _486_ (.D(net118),
    .CK(clknet_1_0__leaf_clk),
    .Q(net84),
    .QN(_234_));
 CLKBUF_X3 clkbuf_0_clk (.A(clk),
    .Z(clknet_0_clk));
 CLKBUF_X3 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_0__leaf_clk));
 CLKBUF_X3 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_1__leaf_clk));
 BUF_X2 fanout57 (.A(rst_n),
    .Z(net57));
 BUF_X1 fanout58 (.A(net60),
    .Z(net58));
 BUF_X2 fanout60 (.A(net61),
    .Z(net60));
 CLKBUF_X2 fanout61 (.A(opcode[0]),
    .Z(net61));
 BUF_X2 fanout62 (.A(net93),
    .Z(net62));
 BUF_X2 fanout64 (.A(net93),
    .Z(net64));
 BUF_X2 fanout65 (.A(net67),
    .Z(net65));
 BUF_X1 fanout67 (.A(b[1]),
    .Z(net67));
 BUF_X2 fanout68 (.A(b[1]),
    .Z(net68));
 BUF_X2 fanout70 (.A(b[1]),
    .Z(net70));
 BUF_X2 fanout72 (.A(b[0]),
    .Z(net72));
 BUF_X1 fanout74 (.A(b[0]),
    .Z(net74));
 BUF_X2 fanout75 (.A(net77),
    .Z(net75));
 BUF_X1 fanout77 (.A(b[0]),
    .Z(net77));
 BUF_X1 fanout78 (.A(net124),
    .Z(net78));
 BUF_X4 gain55 (.A(_207_),
    .Z(net55));
 BUF_X4 gain56 (.A(_176_),
    .Z(net56));
 BUF_X4 gain59 (.A(net58),
    .Z(net59));
 BUF_X4 gain63 (.A(net62),
    .Z(net63));
 BUF_X4 gain66 (.A(net65),
    .Z(net66));
 BUF_X4 gain69 (.A(net68),
    .Z(net69));
 BUF_X4 gain71 (.A(net70),
    .Z(net71));
 BUF_X4 gain73 (.A(net72),
    .Z(net73));
 BUF_X4 gain76 (.A(net75),
    .Z(net76));
 BUF_X4 gain79 (.A(net78),
    .Z(net79));
 CLKBUF_X1 hold100 (.A(_054_),
    .Z(net100));
 CLKBUF_X1 hold101 (.A(net144),
    .Z(net101));
 CLKBUF_X1 hold102 (.A(_009_),
    .Z(net102));
 CLKBUF_X1 hold103 (.A(opcode[1]),
    .Z(net103));
 CLKBUF_X1 hold104 (.A(_186_),
    .Z(net104));
 CLKBUF_X1 hold105 (.A(_034_),
    .Z(net105));
 CLKBUF_X1 hold106 (.A(_060_),
    .Z(net106));
 CLKBUF_X1 hold107 (.A(_002_),
    .Z(net107));
 CLKBUF_X1 hold108 (.A(a[5]),
    .Z(net108));
 CLKBUF_X1 hold109 (.A(_115_),
    .Z(net109));
 CLKBUF_X1 hold110 (.A(_137_),
    .Z(net110));
 CLKBUF_X1 hold111 (.A(net172),
    .Z(net111));
 CLKBUF_X1 hold112 (.A(_007_),
    .Z(net112));
 CLKBUF_X1 hold113 (.A(b[7]),
    .Z(net113));
 CLKBUF_X1 hold114 (.A(_191_),
    .Z(net114));
 CLKBUF_X1 hold115 (.A(_192_),
    .Z(net115));
 CLKBUF_X1 hold116 (.A(_164_),
    .Z(net116));
 CLKBUF_X1 hold117 (.A(_166_),
    .Z(net117));
 CLKBUF_X1 hold118 (.A(_010_),
    .Z(net118));
 CLKBUF_X1 hold119 (.A(b[4]),
    .Z(net119));
 CLKBUF_X1 hold120 (.A(_200_),
    .Z(net120));
 CLKBUF_X1 hold121 (.A(_104_),
    .Z(net121));
 CLKBUF_X1 hold122 (.A(_114_),
    .Z(net122));
 CLKBUF_X1 hold123 (.A(_005_),
    .Z(net123));
 CLKBUF_X1 hold124 (.A(a[4]),
    .Z(net124));
 CLKBUF_X1 hold125 (.A(_197_),
    .Z(net125));
 CLKBUF_X1 hold126 (.A(_198_),
    .Z(net126));
 CLKBUF_X1 hold127 (.A(_119_),
    .Z(net127));
 CLKBUF_X1 hold128 (.A(_131_),
    .Z(net128));
 CLKBUF_X1 hold129 (.A(_006_),
    .Z(net129));
 CLKBUF_X1 hold130 (.A(a[2]),
    .Z(net130));
 CLKBUF_X1 hold131 (.A(_084_),
    .Z(net131));
 CLKBUF_X1 hold132 (.A(_086_),
    .Z(net132));
 CLKBUF_X1 hold133 (.A(_098_),
    .Z(net133));
 CLKBUF_X1 hold134 (.A(_099_),
    .Z(net134));
 CLKBUF_X1 hold135 (.A(_004_),
    .Z(net135));
 CLKBUF_X1 hold136 (.A(opcode[3]),
    .Z(net136));
 CLKBUF_X1 hold137 (.A(_016_),
    .Z(net137));
 CLKBUF_X1 hold138 (.A(_064_),
    .Z(net138));
 CLKBUF_X1 hold139 (.A(_065_),
    .Z(net139));
 CLKBUF_X1 hold140 (.A(_080_),
    .Z(net140));
 CLKBUF_X1 hold141 (.A(_003_),
    .Z(net141));
 CLKBUF_X1 hold142 (.A(b[6]),
    .Z(net142));
 CLKBUF_X1 hold143 (.A(_150_),
    .Z(net143));
 CLKBUF_X1 hold144 (.A(_161_),
    .Z(net144));
 CLKBUF_X1 hold145 (.A(net177),
    .Z(net145));
 CLKBUF_X1 hold146 (.A(net146),
    .Z(overflow_flag));
 CLKBUF_X1 hold147 (.A(net176),
    .Z(net147));
 CLKBUF_X1 hold148 (.A(net148),
    .Z(result[4]));
 CLKBUF_X1 hold149 (.A(net178),
    .Z(net149));
 CLKBUF_X1 hold150 (.A(net150),
    .Z(result[5]));
 CLKBUF_X1 hold151 (.A(net180),
    .Z(net151));
 CLKBUF_X1 hold152 (.A(net152),
    .Z(result[6]));
 CLKBUF_X1 hold153 (.A(net179),
    .Z(net153));
 CLKBUF_X1 hold154 (.A(net154),
    .Z(result[7]));
 CLKBUF_X1 hold155 (.A(net181),
    .Z(net155));
 CLKBUF_X1 hold156 (.A(net156),
    .Z(zero_flag));
 CLKBUF_X1 hold157 (.A(net182),
    .Z(net157));
 CLKBUF_X1 hold158 (.A(net158),
    .Z(result[3]));
 CLKBUF_X1 hold159 (.A(net183),
    .Z(net159));
 CLKBUF_X1 hold160 (.A(net160),
    .Z(result[0]));
 CLKBUF_X1 hold161 (.A(net184),
    .Z(net161));
 CLKBUF_X1 hold162 (.A(net162),
    .Z(result[1]));
 CLKBUF_X1 hold163 (.A(net185),
    .Z(net163));
 CLKBUF_X1 hold164 (.A(net164),
    .Z(result[2]));
 CLKBUF_X1 hold165 (.A(opcode[1]),
    .Z(net165));
 CLKBUF_X1 hold166 (.A(_222_),
    .Z(net166));
 CLKBUF_X1 hold167 (.A(net187),
    .Z(net167));
 CLKBUF_X1 hold168 (.A(a[0]),
    .Z(net168));
 CLKBUF_X1 hold169 (.A(_058_),
    .Z(net169));
 CLKBUF_X1 hold170 (.A(_059_),
    .Z(net170));
 CLKBUF_X1 hold171 (.A(a[6]),
    .Z(net171));
 CLKBUF_X1 hold172 (.A(_148_),
    .Z(net172));
 CLKBUF_X1 hold173 (.A(a[3]),
    .Z(net173));
 CLKBUF_X1 hold174 (.A(_204_),
    .Z(net174));
 CLKBUF_X1 hold175 (.A(b[3]),
    .Z(net175));
 CLKBUF_X1 hold176 (.A(net83),
    .Z(net176));
 CLKBUF_X1 hold177 (.A(net84),
    .Z(net177));
 CLKBUF_X1 hold178 (.A(net85),
    .Z(net178));
 CLKBUF_X1 hold179 (.A(net86),
    .Z(net179));
 CLKBUF_X1 hold180 (.A(net88),
    .Z(net180));
 CLKBUF_X1 hold181 (.A(net87),
    .Z(net181));
 CLKBUF_X1 hold182 (.A(net89),
    .Z(net182));
 CLKBUF_X1 hold183 (.A(net90),
    .Z(net183));
 CLKBUF_X1 hold184 (.A(net91),
    .Z(net184));
 CLKBUF_X1 hold185 (.A(net92),
    .Z(net185));
 CLKBUF_X1 hold186 (.A(a[0]),
    .Z(net186));
 CLKBUF_X1 hold187 (.A(_025_),
    .Z(net187));
 CLKBUF_X1 hold83 (.A(net147),
    .Z(net148));
 CLKBUF_X1 hold84 (.A(net145),
    .Z(net146));
 CLKBUF_X1 hold85 (.A(net149),
    .Z(net150));
 CLKBUF_X1 hold86 (.A(net153),
    .Z(net154));
 CLKBUF_X1 hold87 (.A(net155),
    .Z(net156));
 CLKBUF_X1 hold88 (.A(net151),
    .Z(net152));
 CLKBUF_X1 hold89 (.A(net157),
    .Z(net158));
 CLKBUF_X1 hold90 (.A(net159),
    .Z(net160));
 CLKBUF_X1 hold91 (.A(net161),
    .Z(net162));
 CLKBUF_X1 hold92 (.A(net163),
    .Z(net164));
 CLKBUF_X1 hold93 (.A(b[2]),
    .Z(net93));
 CLKBUF_X1 hold94 (.A(net64),
    .Z(net94));
 CLKBUF_X1 hold95 (.A(_224_),
    .Z(net95));
 CLKBUF_X1 hold96 (.A(net167),
    .Z(net96));
 CLKBUF_X1 hold97 (.A(_001_),
    .Z(net97));
 CLKBUF_X1 hold98 (.A(opcode[2]),
    .Z(net98));
 CLKBUF_X1 hold99 (.A(_015_),
    .Z(net99));
endmodule
