{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import AST
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,518) ([0,0,0,0,60,0,0,0,61440,0,0,0,0,0,0,0,0,0,15,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,15360,0,0,4096,0,0,0,0,128,0,0,0,16,0,0,0,0,0,0,0,0,0,0,61440,0,0,0,2,0,0,0,0,0,0,0,15352,34,64576,1,0,0,0,0,0,49024,547,50176,31,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,65408,27,0,0,32768,32769,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2048,0,0,0,0,32,0,0,0,32894,0,28688,0,63488,513,16384,448,0,2016,8,256,7,0,8192,0,0,0,0,128,0,0,0,0,2,0,0,32768,0,0,0,0,0,64,0,0,0,32894,0,28688,0,0,0,0,0,0,0,6144,0,0,0,16384,65408,27,0,0,1024,28670,0,0,64,0,0,0,57344,2055,0,1793,0,8064,32,1024,28,0,32894,0,28688,0,63488,513,16384,448,0,0,32,0,0,0,0,0,0,0,0,8192,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32894,0,28688,0,63488,513,16384,448,0,2016,8,256,7,32768,8223,0,7172,0,32256,128,4096,112,0,504,2,49216,1,57344,2055,0,1793,0,8064,32,1024,28,0,32894,0,28688,0,63488,513,16384,448,0,2016,8,256,7,32768,8223,0,7172,0,32256,128,4096,112,0,504,2,49216,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49144,0,0,0,57344,255,0,0,0,3968,0,0,0,0,62,0,0,0,63488,0,0,0,0,992,0,0,0,32768,975,0,0,0,15872,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,57344,0,0,0,16384,65504,6,0,8064,32,1024,28,0,16,0,0,0,0,0,49145,1,0,0,57376,1791,0,0,16384,0,0,0,0,256,28670,0,0,0,63492,447,0,57344,2055,0,1793,0,0,0,8192,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,16384,65408,27,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,65028,111,0,63488,8763,16384,508,0,61408,136,61696,7,0,0,0,0,0,32256,128,4096,112,0,0,0,0,0,0,0,0,0,0,0,32768,7167,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32256,128,4096,112,0,0,63492,447,0,57344,35055,0,2033,0,0,0,0,0,0,36606,8,32528,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Prog","FuncDeclList","FunDecl","ParamList","Param","Stmt","SimpleExp","AssignStmTE","AssignStmT","AssignStm","IfThen","IfThenElse","Block","While","For","Return","StmtList","Exp","VarAccess","PosOp","FunCall","ExpList","IdentList","Type","num","real","str","ident","true","false","if","else","while","for","return","const","break","continue","'('","')'","','","';'","'{'","'}'","'['","']'","'++'","'--'","'+'","'-'","'*'","'/'","'%'","'=='","'!='","'<'","'<='","'>'","'>='","'!'","'&&'","'||'","'='","double","int","bool","string","PrintInt","ScanInt","PrintStr","%eof"]
        bit_start = st * 74
        bit_end = (st + 1) * 74
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..73]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (67) = happyShift action_5
action_0 (68) = happyShift action_6
action_0 (69) = happyShift action_7
action_0 (70) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (27) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (67) = happyShift action_5
action_1 (68) = happyShift action_6
action_1 (69) = happyShift action_7
action_1 (70) = happyShift action_8
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (27) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (67) = happyShift action_5
action_3 (68) = happyShift action_6
action_3 (69) = happyShift action_7
action_3 (70) = happyShift action_8
action_3 (5) = happyGoto action_11
action_3 (6) = happyGoto action_3
action_3 (27) = happyGoto action_4
action_3 _ = happyReduce_3

action_4 (31) = happyShift action_10
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_71

action_6 _ = happyReduce_69

action_7 _ = happyReduce_70

action_8 _ = happyReduce_72

action_9 (74) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (42) = happyShift action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_2

action_12 (67) = happyShift action_5
action_12 (68) = happyShift action_6
action_12 (69) = happyShift action_7
action_12 (70) = happyShift action_8
action_12 (7) = happyGoto action_13
action_12 (8) = happyGoto action_14
action_12 (27) = happyGoto action_15
action_12 _ = happyReduce_7

action_13 (43) = happyShift action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (44) = happyShift action_17
action_14 _ = happyReduce_6

action_15 (31) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_8

action_17 (67) = happyShift action_5
action_17 (68) = happyShift action_6
action_17 (69) = happyShift action_7
action_17 (70) = happyShift action_8
action_17 (7) = happyGoto action_21
action_17 (8) = happyGoto action_14
action_17 (27) = happyGoto action_15
action_17 _ = happyReduce_7

action_18 (46) = happyShift action_20
action_18 (16) = happyGoto action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_4

action_20 (28) = happyShift action_38
action_20 (29) = happyShift action_39
action_20 (30) = happyShift action_40
action_20 (31) = happyShift action_41
action_20 (32) = happyShift action_42
action_20 (33) = happyShift action_43
action_20 (34) = happyShift action_44
action_20 (36) = happyShift action_45
action_20 (37) = happyShift action_46
action_20 (38) = happyShift action_47
action_20 (42) = happyShift action_48
action_20 (46) = happyShift action_20
action_20 (63) = happyShift action_49
action_20 (67) = happyShift action_5
action_20 (68) = happyShift action_6
action_20 (69) = happyShift action_7
action_20 (70) = happyShift action_8
action_20 (71) = happyShift action_50
action_20 (72) = happyShift action_51
action_20 (73) = happyShift action_52
action_20 (9) = happyGoto action_22
action_20 (10) = happyGoto action_23
action_20 (11) = happyGoto action_24
action_20 (12) = happyGoto action_25
action_20 (13) = happyGoto action_26
action_20 (14) = happyGoto action_27
action_20 (15) = happyGoto action_28
action_20 (16) = happyGoto action_29
action_20 (17) = happyGoto action_30
action_20 (18) = happyGoto action_31
action_20 (19) = happyGoto action_32
action_20 (20) = happyGoto action_33
action_20 (21) = happyGoto action_34
action_20 (22) = happyGoto action_35
action_20 (24) = happyGoto action_36
action_20 (27) = happyGoto action_37
action_20 _ = happyReduce_32

action_21 _ = happyReduce_5

action_22 (28) = happyShift action_38
action_22 (29) = happyShift action_39
action_22 (30) = happyShift action_40
action_22 (31) = happyShift action_41
action_22 (32) = happyShift action_42
action_22 (33) = happyShift action_43
action_22 (34) = happyShift action_44
action_22 (36) = happyShift action_45
action_22 (37) = happyShift action_46
action_22 (38) = happyShift action_47
action_22 (42) = happyShift action_48
action_22 (46) = happyShift action_20
action_22 (63) = happyShift action_49
action_22 (67) = happyShift action_5
action_22 (68) = happyShift action_6
action_22 (69) = happyShift action_7
action_22 (70) = happyShift action_8
action_22 (71) = happyShift action_50
action_22 (72) = happyShift action_51
action_22 (73) = happyShift action_52
action_22 (9) = happyGoto action_22
action_22 (10) = happyGoto action_23
action_22 (11) = happyGoto action_24
action_22 (12) = happyGoto action_25
action_22 (13) = happyGoto action_26
action_22 (14) = happyGoto action_27
action_22 (15) = happyGoto action_28
action_22 (16) = happyGoto action_29
action_22 (17) = happyGoto action_30
action_22 (18) = happyGoto action_31
action_22 (19) = happyGoto action_32
action_22 (20) = happyGoto action_87
action_22 (21) = happyGoto action_34
action_22 (22) = happyGoto action_35
action_22 (24) = happyGoto action_36
action_22 (27) = happyGoto action_37
action_22 _ = happyReduce_32

action_23 (45) = happyShift action_86
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (45) = happyReduce_20
action_24 _ = happyReduce_10

action_25 (45) = happyReduce_21
action_25 _ = happyReduce_11

action_26 _ = happyReduce_12

action_27 _ = happyReduce_13

action_28 _ = happyReduce_14

action_29 _ = happyReduce_15

action_30 _ = happyReduce_16

action_31 _ = happyReduce_17

action_32 _ = happyReduce_18

action_33 (47) = happyShift action_85
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (52) = happyShift action_72
action_34 (53) = happyShift action_73
action_34 (54) = happyShift action_74
action_34 (55) = happyShift action_75
action_34 (56) = happyShift action_76
action_34 (57) = happyShift action_77
action_34 (58) = happyShift action_78
action_34 (59) = happyShift action_79
action_34 (60) = happyShift action_80
action_34 (61) = happyShift action_81
action_34 (62) = happyShift action_82
action_34 (64) = happyShift action_83
action_34 (65) = happyShift action_84
action_34 _ = happyReduce_19

action_35 (50) = happyShift action_69
action_35 (51) = happyShift action_70
action_35 (66) = happyShift action_71
action_35 (23) = happyGoto action_68
action_35 _ = happyReduce_35

action_36 _ = happyReduce_39

action_37 (31) = happyShift action_67
action_37 (22) = happyGoto action_65
action_37 (26) = happyGoto action_66
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_33

action_39 _ = happyReduce_34

action_40 _ = happyReduce_36

action_41 (42) = happyShift action_63
action_41 (48) = happyShift action_64
action_41 _ = happyReduce_59

action_42 _ = happyReduce_43

action_43 _ = happyReduce_44

action_44 (42) = happyShift action_62
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (42) = happyShift action_61
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (42) = happyShift action_60
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (28) = happyShift action_38
action_47 (29) = happyShift action_39
action_47 (30) = happyShift action_40
action_47 (31) = happyShift action_41
action_47 (32) = happyShift action_42
action_47 (33) = happyShift action_43
action_47 (42) = happyShift action_48
action_47 (63) = happyShift action_49
action_47 (71) = happyShift action_50
action_47 (72) = happyShift action_51
action_47 (73) = happyShift action_52
action_47 (21) = happyGoto action_59
action_47 (22) = happyGoto action_57
action_47 (24) = happyGoto action_36
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (28) = happyShift action_38
action_48 (29) = happyShift action_39
action_48 (30) = happyShift action_40
action_48 (31) = happyShift action_41
action_48 (32) = happyShift action_42
action_48 (33) = happyShift action_43
action_48 (42) = happyShift action_48
action_48 (63) = happyShift action_49
action_48 (71) = happyShift action_50
action_48 (72) = happyShift action_51
action_48 (73) = happyShift action_52
action_48 (21) = happyGoto action_58
action_48 (22) = happyGoto action_57
action_48 (24) = happyGoto action_36
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (28) = happyShift action_38
action_49 (29) = happyShift action_39
action_49 (30) = happyShift action_40
action_49 (31) = happyShift action_41
action_49 (32) = happyShift action_42
action_49 (33) = happyShift action_43
action_49 (42) = happyShift action_48
action_49 (63) = happyShift action_49
action_49 (71) = happyShift action_50
action_49 (72) = happyShift action_51
action_49 (73) = happyShift action_52
action_49 (21) = happyGoto action_56
action_49 (22) = happyGoto action_57
action_49 (24) = happyGoto action_36
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_55
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (42) = happyShift action_54
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (42) = happyShift action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (30) = happyShift action_116
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (43) = happyShift action_115
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (28) = happyShift action_38
action_55 (29) = happyShift action_39
action_55 (30) = happyShift action_40
action_55 (31) = happyShift action_41
action_55 (32) = happyShift action_42
action_55 (33) = happyShift action_43
action_55 (42) = happyShift action_48
action_55 (63) = happyShift action_49
action_55 (71) = happyShift action_50
action_55 (72) = happyShift action_51
action_55 (73) = happyShift action_52
action_55 (21) = happyGoto action_114
action_55 (22) = happyGoto action_57
action_55 (24) = happyGoto action_36
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_45

action_57 (50) = happyShift action_69
action_57 (51) = happyShift action_70
action_57 (23) = happyGoto action_68
action_57 _ = happyReduce_35

action_58 (43) = happyShift action_113
action_58 (52) = happyShift action_72
action_58 (53) = happyShift action_73
action_58 (54) = happyShift action_74
action_58 (55) = happyShift action_75
action_58 (56) = happyShift action_76
action_58 (57) = happyShift action_77
action_58 (58) = happyShift action_78
action_58 (59) = happyShift action_79
action_58 (60) = happyShift action_80
action_58 (61) = happyShift action_81
action_58 (62) = happyShift action_82
action_58 (64) = happyShift action_83
action_58 (65) = happyShift action_84
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (45) = happyShift action_112
action_59 (52) = happyShift action_72
action_59 (53) = happyShift action_73
action_59 (54) = happyShift action_74
action_59 (55) = happyShift action_75
action_59 (56) = happyShift action_76
action_59 (57) = happyShift action_77
action_59 (58) = happyShift action_78
action_59 (59) = happyShift action_79
action_59 (60) = happyShift action_80
action_59 (61) = happyShift action_81
action_59 (62) = happyShift action_82
action_59 (64) = happyShift action_83
action_59 (65) = happyShift action_84
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (31) = happyShift action_111
action_60 (13) = happyGoto action_109
action_60 (22) = happyGoto action_110
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (28) = happyShift action_38
action_61 (29) = happyShift action_39
action_61 (30) = happyShift action_40
action_61 (31) = happyShift action_41
action_61 (32) = happyShift action_42
action_61 (33) = happyShift action_43
action_61 (42) = happyShift action_48
action_61 (63) = happyShift action_49
action_61 (71) = happyShift action_50
action_61 (72) = happyShift action_51
action_61 (73) = happyShift action_52
action_61 (21) = happyGoto action_108
action_61 (22) = happyGoto action_57
action_61 (24) = happyGoto action_36
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (28) = happyShift action_38
action_62 (29) = happyShift action_39
action_62 (30) = happyShift action_40
action_62 (31) = happyShift action_41
action_62 (32) = happyShift action_42
action_62 (33) = happyShift action_43
action_62 (42) = happyShift action_48
action_62 (63) = happyShift action_49
action_62 (71) = happyShift action_50
action_62 (72) = happyShift action_51
action_62 (73) = happyShift action_52
action_62 (21) = happyGoto action_107
action_62 (22) = happyGoto action_57
action_62 (24) = happyGoto action_36
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (28) = happyShift action_38
action_63 (29) = happyShift action_39
action_63 (30) = happyShift action_40
action_63 (31) = happyShift action_41
action_63 (32) = happyShift action_42
action_63 (33) = happyShift action_43
action_63 (42) = happyShift action_48
action_63 (63) = happyShift action_49
action_63 (71) = happyShift action_50
action_63 (72) = happyShift action_51
action_63 (73) = happyShift action_52
action_63 (21) = happyGoto action_105
action_63 (22) = happyGoto action_57
action_63 (24) = happyGoto action_36
action_63 (25) = happyGoto action_106
action_63 _ = happyReduce_66

action_64 (28) = happyShift action_38
action_64 (29) = happyShift action_39
action_64 (30) = happyShift action_40
action_64 (31) = happyShift action_41
action_64 (32) = happyShift action_42
action_64 (33) = happyShift action_43
action_64 (42) = happyShift action_48
action_64 (63) = happyShift action_49
action_64 (71) = happyShift action_50
action_64 (72) = happyShift action_51
action_64 (73) = happyShift action_52
action_64 (21) = happyGoto action_104
action_64 (22) = happyGoto action_57
action_64 (24) = happyGoto action_36
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (44) = happyShift action_103
action_65 _ = happyReduce_68

action_66 _ = happyReduce_23

action_67 (48) = happyShift action_64
action_67 (66) = happyShift action_102
action_67 _ = happyReduce_59

action_68 _ = happyReduce_38

action_69 _ = happyReduce_61

action_70 _ = happyReduce_62

action_71 (28) = happyShift action_38
action_71 (29) = happyShift action_39
action_71 (30) = happyShift action_40
action_71 (31) = happyShift action_41
action_71 (32) = happyShift action_42
action_71 (33) = happyShift action_43
action_71 (42) = happyShift action_48
action_71 (63) = happyShift action_49
action_71 (71) = happyShift action_50
action_71 (72) = happyShift action_51
action_71 (73) = happyShift action_52
action_71 (21) = happyGoto action_101
action_71 (22) = happyGoto action_57
action_71 (24) = happyGoto action_36
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (28) = happyShift action_38
action_72 (29) = happyShift action_39
action_72 (30) = happyShift action_40
action_72 (31) = happyShift action_41
action_72 (32) = happyShift action_42
action_72 (33) = happyShift action_43
action_72 (42) = happyShift action_48
action_72 (63) = happyShift action_49
action_72 (71) = happyShift action_50
action_72 (72) = happyShift action_51
action_72 (73) = happyShift action_52
action_72 (21) = happyGoto action_100
action_72 (22) = happyGoto action_57
action_72 (24) = happyGoto action_36
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (28) = happyShift action_38
action_73 (29) = happyShift action_39
action_73 (30) = happyShift action_40
action_73 (31) = happyShift action_41
action_73 (32) = happyShift action_42
action_73 (33) = happyShift action_43
action_73 (42) = happyShift action_48
action_73 (63) = happyShift action_49
action_73 (71) = happyShift action_50
action_73 (72) = happyShift action_51
action_73 (73) = happyShift action_52
action_73 (21) = happyGoto action_99
action_73 (22) = happyGoto action_57
action_73 (24) = happyGoto action_36
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (28) = happyShift action_38
action_74 (29) = happyShift action_39
action_74 (30) = happyShift action_40
action_74 (31) = happyShift action_41
action_74 (32) = happyShift action_42
action_74 (33) = happyShift action_43
action_74 (42) = happyShift action_48
action_74 (63) = happyShift action_49
action_74 (71) = happyShift action_50
action_74 (72) = happyShift action_51
action_74 (73) = happyShift action_52
action_74 (21) = happyGoto action_98
action_74 (22) = happyGoto action_57
action_74 (24) = happyGoto action_36
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (28) = happyShift action_38
action_75 (29) = happyShift action_39
action_75 (30) = happyShift action_40
action_75 (31) = happyShift action_41
action_75 (32) = happyShift action_42
action_75 (33) = happyShift action_43
action_75 (42) = happyShift action_48
action_75 (63) = happyShift action_49
action_75 (71) = happyShift action_50
action_75 (72) = happyShift action_51
action_75 (73) = happyShift action_52
action_75 (21) = happyGoto action_97
action_75 (22) = happyGoto action_57
action_75 (24) = happyGoto action_36
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (28) = happyShift action_38
action_76 (29) = happyShift action_39
action_76 (30) = happyShift action_40
action_76 (31) = happyShift action_41
action_76 (32) = happyShift action_42
action_76 (33) = happyShift action_43
action_76 (42) = happyShift action_48
action_76 (63) = happyShift action_49
action_76 (71) = happyShift action_50
action_76 (72) = happyShift action_51
action_76 (73) = happyShift action_52
action_76 (21) = happyGoto action_96
action_76 (22) = happyGoto action_57
action_76 (24) = happyGoto action_36
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (28) = happyShift action_38
action_77 (29) = happyShift action_39
action_77 (30) = happyShift action_40
action_77 (31) = happyShift action_41
action_77 (32) = happyShift action_42
action_77 (33) = happyShift action_43
action_77 (42) = happyShift action_48
action_77 (63) = happyShift action_49
action_77 (71) = happyShift action_50
action_77 (72) = happyShift action_51
action_77 (73) = happyShift action_52
action_77 (21) = happyGoto action_95
action_77 (22) = happyGoto action_57
action_77 (24) = happyGoto action_36
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (28) = happyShift action_38
action_78 (29) = happyShift action_39
action_78 (30) = happyShift action_40
action_78 (31) = happyShift action_41
action_78 (32) = happyShift action_42
action_78 (33) = happyShift action_43
action_78 (42) = happyShift action_48
action_78 (63) = happyShift action_49
action_78 (71) = happyShift action_50
action_78 (72) = happyShift action_51
action_78 (73) = happyShift action_52
action_78 (21) = happyGoto action_94
action_78 (22) = happyGoto action_57
action_78 (24) = happyGoto action_36
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (28) = happyShift action_38
action_79 (29) = happyShift action_39
action_79 (30) = happyShift action_40
action_79 (31) = happyShift action_41
action_79 (32) = happyShift action_42
action_79 (33) = happyShift action_43
action_79 (42) = happyShift action_48
action_79 (63) = happyShift action_49
action_79 (71) = happyShift action_50
action_79 (72) = happyShift action_51
action_79 (73) = happyShift action_52
action_79 (21) = happyGoto action_93
action_79 (22) = happyGoto action_57
action_79 (24) = happyGoto action_36
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (28) = happyShift action_38
action_80 (29) = happyShift action_39
action_80 (30) = happyShift action_40
action_80 (31) = happyShift action_41
action_80 (32) = happyShift action_42
action_80 (33) = happyShift action_43
action_80 (42) = happyShift action_48
action_80 (63) = happyShift action_49
action_80 (71) = happyShift action_50
action_80 (72) = happyShift action_51
action_80 (73) = happyShift action_52
action_80 (21) = happyGoto action_92
action_80 (22) = happyGoto action_57
action_80 (24) = happyGoto action_36
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (28) = happyShift action_38
action_81 (29) = happyShift action_39
action_81 (30) = happyShift action_40
action_81 (31) = happyShift action_41
action_81 (32) = happyShift action_42
action_81 (33) = happyShift action_43
action_81 (42) = happyShift action_48
action_81 (63) = happyShift action_49
action_81 (71) = happyShift action_50
action_81 (72) = happyShift action_51
action_81 (73) = happyShift action_52
action_81 (21) = happyGoto action_91
action_81 (22) = happyGoto action_57
action_81 (24) = happyGoto action_36
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (28) = happyShift action_38
action_82 (29) = happyShift action_39
action_82 (30) = happyShift action_40
action_82 (31) = happyShift action_41
action_82 (32) = happyShift action_42
action_82 (33) = happyShift action_43
action_82 (42) = happyShift action_48
action_82 (63) = happyShift action_49
action_82 (71) = happyShift action_50
action_82 (72) = happyShift action_51
action_82 (73) = happyShift action_52
action_82 (21) = happyGoto action_90
action_82 (22) = happyGoto action_57
action_82 (24) = happyGoto action_36
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (28) = happyShift action_38
action_83 (29) = happyShift action_39
action_83 (30) = happyShift action_40
action_83 (31) = happyShift action_41
action_83 (32) = happyShift action_42
action_83 (33) = happyShift action_43
action_83 (42) = happyShift action_48
action_83 (63) = happyShift action_49
action_83 (71) = happyShift action_50
action_83 (72) = happyShift action_51
action_83 (73) = happyShift action_52
action_83 (21) = happyGoto action_89
action_83 (22) = happyGoto action_57
action_83 (24) = happyGoto action_36
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (28) = happyShift action_38
action_84 (29) = happyShift action_39
action_84 (30) = happyShift action_40
action_84 (31) = happyShift action_41
action_84 (32) = happyShift action_42
action_84 (33) = happyShift action_43
action_84 (42) = happyShift action_48
action_84 (63) = happyShift action_49
action_84 (71) = happyShift action_50
action_84 (72) = happyShift action_51
action_84 (73) = happyShift action_52
action_84 (21) = happyGoto action_88
action_84 (22) = happyGoto action_57
action_84 (24) = happyGoto action_36
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_27

action_86 _ = happyReduce_9

action_87 _ = happyReduce_31

action_88 (52) = happyShift action_72
action_88 (53) = happyShift action_73
action_88 (54) = happyShift action_74
action_88 (55) = happyShift action_75
action_88 (56) = happyShift action_76
action_88 (57) = happyShift action_77
action_88 (58) = happyShift action_78
action_88 (59) = happyShift action_79
action_88 (60) = happyShift action_80
action_88 (61) = happyShift action_81
action_88 (62) = happyShift action_82
action_88 (64) = happyShift action_83
action_88 _ = happyReduce_58

action_89 (52) = happyShift action_72
action_89 (53) = happyShift action_73
action_89 (54) = happyShift action_74
action_89 (55) = happyShift action_75
action_89 (56) = happyShift action_76
action_89 (57) = happyShift action_77
action_89 (58) = happyShift action_78
action_89 (59) = happyShift action_79
action_89 (60) = happyShift action_80
action_89 (61) = happyShift action_81
action_89 (62) = happyShift action_82
action_89 _ = happyReduce_57

action_90 (52) = happyShift action_72
action_90 (53) = happyShift action_73
action_90 (54) = happyShift action_74
action_90 (55) = happyShift action_75
action_90 (56) = happyShift action_76
action_90 _ = happyReduce_56

action_91 (52) = happyShift action_72
action_91 (53) = happyShift action_73
action_91 (54) = happyShift action_74
action_91 (55) = happyShift action_75
action_91 (56) = happyShift action_76
action_91 _ = happyReduce_55

action_92 (52) = happyShift action_72
action_92 (53) = happyShift action_73
action_92 (54) = happyShift action_74
action_92 (55) = happyShift action_75
action_92 (56) = happyShift action_76
action_92 _ = happyReduce_54

action_93 (52) = happyShift action_72
action_93 (53) = happyShift action_73
action_93 (54) = happyShift action_74
action_93 (55) = happyShift action_75
action_93 (56) = happyShift action_76
action_93 _ = happyReduce_53

action_94 (52) = happyShift action_72
action_94 (53) = happyShift action_73
action_94 (54) = happyShift action_74
action_94 (55) = happyShift action_75
action_94 (56) = happyShift action_76
action_94 (59) = happyShift action_79
action_94 (60) = happyShift action_80
action_94 (61) = happyShift action_81
action_94 (62) = happyShift action_82
action_94 _ = happyReduce_52

action_95 (52) = happyShift action_72
action_95 (53) = happyShift action_73
action_95 (54) = happyShift action_74
action_95 (55) = happyShift action_75
action_95 (56) = happyShift action_76
action_95 (59) = happyShift action_79
action_95 (60) = happyShift action_80
action_95 (61) = happyShift action_81
action_95 (62) = happyShift action_82
action_95 _ = happyReduce_51

action_96 _ = happyReduce_50

action_97 _ = happyReduce_49

action_98 _ = happyReduce_48

action_99 (54) = happyShift action_74
action_99 (55) = happyShift action_75
action_99 (56) = happyShift action_76
action_99 _ = happyReduce_47

action_100 (54) = happyShift action_74
action_100 (55) = happyShift action_75
action_100 (56) = happyShift action_76
action_100 _ = happyReduce_46

action_101 (45) = happyShift action_127
action_101 (52) = happyShift action_72
action_101 (53) = happyShift action_73
action_101 (54) = happyShift action_74
action_101 (55) = happyShift action_75
action_101 (56) = happyShift action_76
action_101 (57) = happyShift action_77
action_101 (58) = happyShift action_78
action_101 (59) = happyShift action_79
action_101 (60) = happyShift action_80
action_101 (61) = happyShift action_81
action_101 (62) = happyShift action_82
action_101 (64) = happyShift action_83
action_101 (65) = happyShift action_84
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (28) = happyShift action_38
action_102 (29) = happyShift action_39
action_102 (30) = happyShift action_40
action_102 (31) = happyShift action_41
action_102 (32) = happyShift action_42
action_102 (33) = happyShift action_43
action_102 (42) = happyShift action_48
action_102 (63) = happyShift action_49
action_102 (71) = happyShift action_50
action_102 (72) = happyShift action_51
action_102 (73) = happyShift action_52
action_102 (21) = happyGoto action_126
action_102 (22) = happyGoto action_57
action_102 (24) = happyGoto action_36
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (31) = happyShift action_111
action_103 (22) = happyGoto action_65
action_103 (26) = happyGoto action_125
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (49) = happyShift action_124
action_104 (52) = happyShift action_72
action_104 (53) = happyShift action_73
action_104 (54) = happyShift action_74
action_104 (55) = happyShift action_75
action_104 (56) = happyShift action_76
action_104 (57) = happyShift action_77
action_104 (58) = happyShift action_78
action_104 (59) = happyShift action_79
action_104 (60) = happyShift action_80
action_104 (61) = happyShift action_81
action_104 (62) = happyShift action_82
action_104 (64) = happyShift action_83
action_104 (65) = happyShift action_84
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (44) = happyShift action_123
action_105 (52) = happyShift action_72
action_105 (53) = happyShift action_73
action_105 (54) = happyShift action_74
action_105 (55) = happyShift action_75
action_105 (56) = happyShift action_76
action_105 (57) = happyShift action_77
action_105 (58) = happyShift action_78
action_105 (59) = happyShift action_79
action_105 (60) = happyShift action_80
action_105 (61) = happyShift action_81
action_105 (62) = happyShift action_82
action_105 (64) = happyShift action_83
action_105 (65) = happyShift action_84
action_105 _ = happyReduce_65

action_106 (43) = happyShift action_122
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (43) = happyShift action_121
action_107 (52) = happyShift action_72
action_107 (53) = happyShift action_73
action_107 (54) = happyShift action_74
action_107 (55) = happyShift action_75
action_107 (56) = happyShift action_76
action_107 (57) = happyShift action_77
action_107 (58) = happyShift action_78
action_107 (59) = happyShift action_79
action_107 (60) = happyShift action_80
action_107 (61) = happyShift action_81
action_107 (62) = happyShift action_82
action_107 (64) = happyShift action_83
action_107 (65) = happyShift action_84
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (43) = happyShift action_120
action_108 (52) = happyShift action_72
action_108 (53) = happyShift action_73
action_108 (54) = happyShift action_74
action_108 (55) = happyShift action_75
action_108 (56) = happyShift action_76
action_108 (57) = happyShift action_77
action_108 (58) = happyShift action_78
action_108 (59) = happyShift action_79
action_108 (60) = happyShift action_80
action_108 (61) = happyShift action_81
action_108 (62) = happyShift action_82
action_108 (64) = happyShift action_83
action_108 (65) = happyShift action_84
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (28) = happyShift action_38
action_109 (29) = happyShift action_39
action_109 (30) = happyShift action_40
action_109 (31) = happyShift action_41
action_109 (32) = happyShift action_42
action_109 (33) = happyShift action_43
action_109 (42) = happyShift action_48
action_109 (63) = happyShift action_49
action_109 (71) = happyShift action_50
action_109 (72) = happyShift action_51
action_109 (73) = happyShift action_52
action_109 (21) = happyGoto action_119
action_109 (22) = happyGoto action_57
action_109 (24) = happyGoto action_36
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (66) = happyShift action_71
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (48) = happyShift action_64
action_111 _ = happyReduce_59

action_112 _ = happyReduce_30

action_113 _ = happyReduce_37

action_114 (43) = happyShift action_118
action_114 (52) = happyShift action_72
action_114 (53) = happyShift action_73
action_114 (54) = happyShift action_74
action_114 (55) = happyShift action_75
action_114 (56) = happyShift action_76
action_114 (57) = happyShift action_77
action_114 (58) = happyShift action_78
action_114 (59) = happyShift action_79
action_114 (60) = happyShift action_80
action_114 (61) = happyShift action_81
action_114 (62) = happyShift action_82
action_114 (64) = happyShift action_83
action_114 (65) = happyShift action_84
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_40

action_116 (43) = happyShift action_117
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_42

action_118 _ = happyReduce_41

action_119 (45) = happyShift action_131
action_119 (52) = happyShift action_72
action_119 (53) = happyShift action_73
action_119 (54) = happyShift action_74
action_119 (55) = happyShift action_75
action_119 (56) = happyShift action_76
action_119 (57) = happyShift action_77
action_119 (58) = happyShift action_78
action_119 (59) = happyShift action_79
action_119 (60) = happyShift action_80
action_119 (61) = happyShift action_81
action_119 (62) = happyShift action_82
action_119 (64) = happyShift action_83
action_119 (65) = happyShift action_84
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (28) = happyShift action_38
action_120 (29) = happyShift action_39
action_120 (30) = happyShift action_40
action_120 (31) = happyShift action_41
action_120 (32) = happyShift action_42
action_120 (33) = happyShift action_43
action_120 (34) = happyShift action_44
action_120 (36) = happyShift action_45
action_120 (37) = happyShift action_46
action_120 (38) = happyShift action_47
action_120 (42) = happyShift action_48
action_120 (46) = happyShift action_20
action_120 (63) = happyShift action_49
action_120 (67) = happyShift action_5
action_120 (68) = happyShift action_6
action_120 (69) = happyShift action_7
action_120 (70) = happyShift action_8
action_120 (71) = happyShift action_50
action_120 (72) = happyShift action_51
action_120 (73) = happyShift action_52
action_120 (9) = happyGoto action_130
action_120 (10) = happyGoto action_23
action_120 (11) = happyGoto action_24
action_120 (12) = happyGoto action_25
action_120 (13) = happyGoto action_26
action_120 (14) = happyGoto action_27
action_120 (15) = happyGoto action_28
action_120 (16) = happyGoto action_29
action_120 (17) = happyGoto action_30
action_120 (18) = happyGoto action_31
action_120 (19) = happyGoto action_32
action_120 (21) = happyGoto action_34
action_120 (22) = happyGoto action_35
action_120 (24) = happyGoto action_36
action_120 (27) = happyGoto action_37
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (28) = happyShift action_38
action_121 (29) = happyShift action_39
action_121 (30) = happyShift action_40
action_121 (31) = happyShift action_41
action_121 (32) = happyShift action_42
action_121 (33) = happyShift action_43
action_121 (34) = happyShift action_44
action_121 (36) = happyShift action_45
action_121 (37) = happyShift action_46
action_121 (38) = happyShift action_47
action_121 (42) = happyShift action_48
action_121 (46) = happyShift action_20
action_121 (63) = happyShift action_49
action_121 (67) = happyShift action_5
action_121 (68) = happyShift action_6
action_121 (69) = happyShift action_7
action_121 (70) = happyShift action_8
action_121 (71) = happyShift action_50
action_121 (72) = happyShift action_51
action_121 (73) = happyShift action_52
action_121 (9) = happyGoto action_129
action_121 (10) = happyGoto action_23
action_121 (11) = happyGoto action_24
action_121 (12) = happyGoto action_25
action_121 (13) = happyGoto action_26
action_121 (14) = happyGoto action_27
action_121 (15) = happyGoto action_28
action_121 (16) = happyGoto action_29
action_121 (17) = happyGoto action_30
action_121 (18) = happyGoto action_31
action_121 (19) = happyGoto action_32
action_121 (21) = happyGoto action_34
action_121 (22) = happyGoto action_35
action_121 (24) = happyGoto action_36
action_121 (27) = happyGoto action_37
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_63

action_123 (28) = happyShift action_38
action_123 (29) = happyShift action_39
action_123 (30) = happyShift action_40
action_123 (31) = happyShift action_41
action_123 (32) = happyShift action_42
action_123 (33) = happyShift action_43
action_123 (42) = happyShift action_48
action_123 (63) = happyShift action_49
action_123 (71) = happyShift action_50
action_123 (72) = happyShift action_51
action_123 (73) = happyShift action_52
action_123 (21) = happyGoto action_105
action_123 (22) = happyGoto action_57
action_123 (24) = happyGoto action_36
action_123 (25) = happyGoto action_128
action_123 _ = happyReduce_66

action_124 _ = happyReduce_60

action_125 _ = happyReduce_67

action_126 (52) = happyShift action_72
action_126 (53) = happyShift action_73
action_126 (54) = happyShift action_74
action_126 (55) = happyShift action_75
action_126 (56) = happyShift action_76
action_126 (57) = happyShift action_77
action_126 (58) = happyShift action_78
action_126 (59) = happyShift action_79
action_126 (60) = happyShift action_80
action_126 (61) = happyShift action_81
action_126 (62) = happyShift action_82
action_126 (64) = happyShift action_83
action_126 (65) = happyShift action_84
action_126 _ = happyReduce_22

action_127 _ = happyReduce_24

action_128 _ = happyReduce_64

action_129 (35) = happyShift action_133
action_129 _ = happyReduce_25

action_130 _ = happyReduce_28

action_131 (28) = happyShift action_38
action_131 (29) = happyShift action_39
action_131 (30) = happyShift action_40
action_131 (31) = happyShift action_41
action_131 (32) = happyShift action_42
action_131 (33) = happyShift action_43
action_131 (42) = happyShift action_48
action_131 (63) = happyShift action_49
action_131 (71) = happyShift action_50
action_131 (72) = happyShift action_51
action_131 (73) = happyShift action_52
action_131 (21) = happyGoto action_132
action_131 (22) = happyGoto action_57
action_131 (24) = happyGoto action_36
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (43) = happyShift action_135
action_132 (52) = happyShift action_72
action_132 (53) = happyShift action_73
action_132 (54) = happyShift action_74
action_132 (55) = happyShift action_75
action_132 (56) = happyShift action_76
action_132 (57) = happyShift action_77
action_132 (58) = happyShift action_78
action_132 (59) = happyShift action_79
action_132 (60) = happyShift action_80
action_132 (61) = happyShift action_81
action_132 (62) = happyShift action_82
action_132 (64) = happyShift action_83
action_132 (65) = happyShift action_84
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (28) = happyShift action_38
action_133 (29) = happyShift action_39
action_133 (30) = happyShift action_40
action_133 (31) = happyShift action_41
action_133 (32) = happyShift action_42
action_133 (33) = happyShift action_43
action_133 (34) = happyShift action_44
action_133 (36) = happyShift action_45
action_133 (37) = happyShift action_46
action_133 (38) = happyShift action_47
action_133 (42) = happyShift action_48
action_133 (46) = happyShift action_20
action_133 (63) = happyShift action_49
action_133 (67) = happyShift action_5
action_133 (68) = happyShift action_6
action_133 (69) = happyShift action_7
action_133 (70) = happyShift action_8
action_133 (71) = happyShift action_50
action_133 (72) = happyShift action_51
action_133 (73) = happyShift action_52
action_133 (9) = happyGoto action_134
action_133 (10) = happyGoto action_23
action_133 (11) = happyGoto action_24
action_133 (12) = happyGoto action_25
action_133 (13) = happyGoto action_26
action_133 (14) = happyGoto action_27
action_133 (15) = happyGoto action_28
action_133 (16) = happyGoto action_29
action_133 (17) = happyGoto action_30
action_133 (18) = happyGoto action_31
action_133 (19) = happyGoto action_32
action_133 (21) = happyGoto action_34
action_133 (22) = happyGoto action_35
action_133 (24) = happyGoto action_36
action_133 (27) = happyGoto action_37
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_26

action_135 (28) = happyShift action_38
action_135 (29) = happyShift action_39
action_135 (30) = happyShift action_40
action_135 (31) = happyShift action_41
action_135 (32) = happyShift action_42
action_135 (33) = happyShift action_43
action_135 (34) = happyShift action_44
action_135 (36) = happyShift action_45
action_135 (37) = happyShift action_46
action_135 (38) = happyShift action_47
action_135 (42) = happyShift action_48
action_135 (46) = happyShift action_20
action_135 (63) = happyShift action_49
action_135 (67) = happyShift action_5
action_135 (68) = happyShift action_6
action_135 (69) = happyShift action_7
action_135 (70) = happyShift action_8
action_135 (71) = happyShift action_50
action_135 (72) = happyShift action_51
action_135 (73) = happyShift action_52
action_135 (9) = happyGoto action_136
action_135 (10) = happyGoto action_23
action_135 (11) = happyGoto action_24
action_135 (12) = happyGoto action_25
action_135 (13) = happyGoto action_26
action_135 (14) = happyGoto action_27
action_135 (15) = happyGoto action_28
action_135 (16) = happyGoto action_29
action_135 (17) = happyGoto action_30
action_135 (18) = happyGoto action_31
action_135 (19) = happyGoto action_32
action_135 (21) = happyGoto action_34
action_135 (22) = happyGoto action_35
action_135 (24) = happyGoto action_36
action_135 (27) = happyGoto action_37
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_29

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (GDefn happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 6 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn27  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (FunDecl happy_var_1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_0  7 happyReduction_7
happyReduction_7  =  HappyAbsSyn7
		 ([]
	)

happyReduce_8 = happySpecReduce_2  8 happyReduction_8
happyReduction_8 (HappyTerminal (ID happy_var_2))
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn8
		 (Param happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn10
		 (SimpleExp happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 11 happyReduction_22
happyReduction_22 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn27  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AssignStmTE  happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  12 happyReduction_23
happyReduction_23 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn12
		 (AssignStmT happy_var_1 happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 13 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (AssignStm happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 5 14 happyReduction_25
happyReduction_25 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (IfThen happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 15 happyReduction_26
happyReduction_26 ((HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (IfThenElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_3  16 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Block happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 17 happyReduction_28
happyReduction_28 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 8 18 happyReduction_29
happyReduction_29 ((HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (For happy_var_3 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  19 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (Return happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  20 happyReduction_31
happyReduction_31 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1 : happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_0  20 happyReduction_32
happyReduction_32  =  HappyAbsSyn20
		 ([]
	)

happyReduce_33 = happySpecReduce_1  21 happyReduction_33
happyReduction_33 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn21
		 (IntLiteral happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  21 happyReduction_34
happyReduction_34 (HappyTerminal (REAL happy_var_1))
	 =  HappyAbsSyn21
		 (RealLiteral happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  21 happyReduction_35
happyReduction_35 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (VarAccess happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  21 happyReduction_36
happyReduction_36 (HappyTerminal (STR happy_var_1))
	 =  HappyAbsSyn21
		 (Str happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  21 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  21 happyReduction_38
happyReduction_38 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (PosOp happy_var_1 happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  21 happyReduction_39
happyReduction_39 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  21 happyReduction_40
happyReduction_40 _
	_
	_
	 =  HappyAbsSyn21
		 (ScanInt
	)

happyReduce_41 = happyReduce 4 21 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (PrintInt happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 21 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyTerminal (STR happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (PrintStr happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_1  21 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn21
		 (BoolLiteralTrue
	)

happyReduce_44 = happySpecReduce_1  21 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn21
		 (BoolLiteralFalse
	)

happyReduce_45 = happySpecReduce_2  21 happyReduction_45
happyReduction_45 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (Not happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  21 happyReduction_46
happyReduction_46 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Plus happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  21 happyReduction_47
happyReduction_47 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Minus happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  21 happyReduction_48
happyReduction_48 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Mult happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  21 happyReduction_49
happyReduction_49 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Div happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  21 happyReduction_50
happyReduction_50 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Mod happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  21 happyReduction_51
happyReduction_51 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Equal happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  21 happyReduction_52
happyReduction_52 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 NotEqual happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  21 happyReduction_53
happyReduction_53 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 LessThan happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  21 happyReduction_54
happyReduction_54 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 LessThanEqual happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  21 happyReduction_55
happyReduction_55 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 GreaterThan happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  21 happyReduction_56
happyReduction_56 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 GreaterThanEqual happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  21 happyReduction_57
happyReduction_57 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 And happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  21 happyReduction_58
happyReduction_58 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (BinOp happy_var_1 Or happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  22 happyReduction_59
happyReduction_59 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn22
		 (Id happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happyReduce 4 22 happyReduction_60
happyReduction_60 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Array happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_1  23 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn23
		 (PlusPlus
	)

happyReduce_62 = happySpecReduce_1  23 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn23
		 (MinusMinus
	)

happyReduce_63 = happyReduce 4 24 happyReduction_63
happyReduction_63 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (FunCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_64 = happySpecReduce_3  25 happyReduction_64
happyReduction_64 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1 : happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  25 happyReduction_65
happyReduction_65 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_0  25 happyReduction_66
happyReduction_66  =  HappyAbsSyn25
		 ([]
	)

happyReduce_67 = happySpecReduce_3  26 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 : happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  26 happyReduction_68
happyReduction_68 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn26
		 ([happy_var_1]
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  27 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn27
		 (TypeInt
	)

happyReduce_70 = happySpecReduce_1  27 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn27
		 (TypeBool
	)

happyReduce_71 = happySpecReduce_1  27 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn27
		 (TypeDouble
	)

happyReduce_72 = happySpecReduce_1  27 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn27
		 (TypeString
	)

happyNewToken action sts stk [] =
	action 74 74 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	NUM happy_dollar_dollar -> cont 28;
	REAL happy_dollar_dollar -> cont 29;
	STR happy_dollar_dollar -> cont 30;
	ID happy_dollar_dollar -> cont 31;
	TRUE -> cont 32;
	FALSE -> cont 33;
	IF -> cont 34;
	ELSE -> cont 35;
	WHILE -> cont 36;
	FOR -> cont 37;
	RETURN -> cont 38;
	CONST -> cont 39;
	BREAK -> cont 40;
	CONTINUE -> cont 41;
	LPAREN -> cont 42;
	RPAREN -> cont 43;
	COMMA -> cont 44;
	SEMICOLON -> cont 45;
	LBRACE -> cont 46;
	RBRACE -> cont 47;
	LBRACKET -> cont 48;
	RBRACKET -> cont 49;
	PLUSPLUS -> cont 50;
	MINUSMINUS -> cont 51;
	PLUS -> cont 52;
	MINUS -> cont 53;
	MULT -> cont 54;
	DIV -> cont 55;
	MOD -> cont 56;
	EQUAL -> cont 57;
	NOTEQUAL -> cont 58;
	LTHAN -> cont 59;
	LTHANEQUAL -> cont 60;
	GTHAN -> cont 61;
	GTHANEQUAL -> cont 62;
	NOT -> cont 63;
	AND -> cont 64;
	OR -> cont 65;
	ASSIGN -> cont 66;
	DOUBLE -> cont 67;
	INT -> cont 68;
	BOOL -> cont 69;
	STRING -> cont 70;
	PRINTINT -> cont 71;
	SCANINT -> cont 72;
	PRINTSTR -> cont 73;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 74 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error ("parse error" ++ show toks) -- funcao modificada para mostrar toks
--parseError toks = error "parse error" -- funcao original
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
