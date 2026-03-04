// BASIC SYS stub so VICE autostart can launch the program
*=$0801
	.byte $0c, $08                               // Pointer to next BASIC line ($080C)
	.byte $0a, $00                               // Line number 10
	.byte $9e                                    // BASIC token for SYS
	.text "4096"                                 // SYS 4096 ($1000)
	.byte $00                                    // End of BASIC line
	.byte $00, $00                               // End of BASIC program

// Load address: $1000  (28666 bytes)
*=$1000

	jsr $6000                                    // $1000
	jsr $7f00                                    // $1003
	jsr $6090                                    // $1006
	jsr $71f5                                    // $1009
	jsr $61ca                                    // $100C
	lda $dc00                                    // $100F  ; CIA1_PRA
	and #$1f                                     // $1012
	eor #$1f                                     // $1014
	.byte $F0, $F7                               // $1016  beq $100F
	lda $d015                                    // $1018  ; VIC_SPEN
	and #$f0                                     // $101B
	sta $d015                                    // $101D  ; VIC_SPEN
	lda $24                                      // $1020
	.byte $F0, $0E                               // $1022  beq $1032
	dec $1d                                      // $1024
	.byte $D0, $07                               // $1026  bne $102F
	lda #$0a                                     // $1028
	sta $1d                                      // $102A
	jsr $6310                                    // $102C
	jmp $113b                                    // $102F
	lda $25                                      // $1032
	.byte $F0, $0E                               // $1034  beq $1044
	dec $1d                                      // $1036
	.byte $D0, $07                               // $1038  bne $1041
	lda #$70                                     // $103A
	sta $1d                                      // $103C
	jsr $63b9                                    // $103E
	jmp $113b                                    // $1041
	lda $18                                      // $1044
	.byte $F0, $1A                               // $1046  beq $1062
	lda $57                                      // $1048
	cmp #$0f                                     // $104A
	.byte $D0, $03                               // $104C  bne $1051
	jsr $6e35                                    // $104E
	lda #$02                                     // $1051
	sta $44                                      // $1053
	jsr $63e0                                    // $1055
	lda $57                                      // $1058
	.byte $F0, $03                               // $105A  beq $105F
	jsr $6e2a                                    // $105C
	jmp $113b                                    // $105F
	lda $19                                      // $1062
	.byte $F0, $14                               // $1064  beq $107A
	lda $57                                      // $1066
	cmp #$f0                                     // $1068
	.byte $D0, $03                               // $106A  bne $106F
	jsr $6e55                                    // $106C
	jsr $6560                                    // $106F
	lda $57                                      // $1072
	.byte $F0, $04                               // $1074  beq $107A
	jsr $6e2a                                    // $1076
	nop                                          // $1079
	lda $dc00                                    // $107A  ; CIA1_PRA
	and #$1f                                     // $107D
	eor #$1f                                     // $107F
	.byte $D0, $03                               // $1081  bne $1086
	jmp $113b                                    // $1083
	cmp #$01                                     // $1086
	.byte $D0, $12                               // $1088  bne $109C
	dec $1d                                      // $108A
	.byte $D0, $0B                               // $108C  bne $1099
	lda #$12                                     // $108E
	sta $1d                                      // $1090
	lda #$00                                     // $1092
	sta $0d                                      // $1094
	jsr $624c                                    // $1096
	jmp $113b                                    // $1099
	cmp #$02                                     // $109C
	.byte $D0, $12                               // $109E  bne $10B2
	dec $1d                                      // $10A0
	.byte $D0, $0B                               // $10A2  bne $10AF
	lda #$12                                     // $10A4
	sta $1d                                      // $10A6
	lda #$01                                     // $10A8
	sta $0d                                      // $10AA
	jsr $6245                                    // $10AC
	jmp $113b                                    // $10AF
	cmp #$10                                     // $10B2
	.byte $D0, $1E                               // $10B4  bne $10D4
	lda $26                                      // $10B6
	.byte $F0, $0E                               // $10B8  beq $10C8
	inc $25                                      // $10BA
	lda #$8f                                     // $10BC
	sta $1d                                      // $10BE
	nop                                          // $10C0
	nop                                          // $10C1
	jsr $63b5                                    // $10C2
	jmp $113b                                    // $10C5
	inc $24                                      // $10C8
	jsr $62d5                                    // $10CA
	lda $23                                      // $10CD
	sta $1d                                      // $10CF
	jmp $113b                                    // $10D1
	cmp #$04                                     // $10D4
	.byte $90, $30                               // $10D6  bcc $1108
	cmp #$07                                     // $10D8
	.byte $B0, $2C                               // $10DA  bcs $1108
	lda $1d                                      // $10DC
	cmp #$20                                     // $10DE
	.byte $90, $04                               // $10E0  bcc $10E6
	lda #$20                                     // $10E2
	sta $1d                                      // $10E4
	dec $1d                                      // $10E6
	.byte $D0, $06                               // $10E8  bne $10F0
	lda $16                                      // $10EA
	.byte $D0, $05                               // $10EC  bne $10F3
	inc $18                                      // $10EE
	jmp $113b                                    // $10F0
	dec $16                                      // $10F3
	dec $16                                      // $10F5
	sec                                          // $10F7
	lda $1b                                      // $10F8
	sbc #$08                                     // $10FA
	sta $1b                                      // $10FC
	jsr $61ca                                    // $10FE
	lda #$18                                     // $1101
	sta $1d                                      // $1103
	jmp $113b                                    // $1105
	cmp #$08                                     // $1108
	.byte $90, $1A                               // $110A  bcc $1126
	cmp #$0b                                     // $110C
	.byte $B0, $16                               // $110E  bcs $1126
	lda $1d                                      // $1110
	cmp #$20                                     // $1112
	.byte $90, $04                               // $1114  bcc $111A
	lda #$20                                     // $1116
	sta $1d                                      // $1118
	dec $1d                                      // $111A
	.byte $D0, $08                               // $111C  bne $1126
	lda $16                                      // $111E
	cmp #$14                                     // $1120
	.byte $90, $05                               // $1122  bcc $1129
	inc $19                                      // $1124
	jmp $113b                                    // $1126
	inc $16                                      // $1129
	inc $16                                      // $112B
	clc                                          // $112D
	lda $1b                                      // $112E
	adc #$08                                     // $1130
	sta $1b                                      // $1132
	jsr $61ca                                    // $1134
	lda #$18                                     // $1137
	sta $1d                                      // $1139
	ldx #$02                                     // $113B
	ldy $68                                      // $113D
	dey                                          // $113F
	.byte $D0, $FD                               // $1140  bne $113F
	dex                                          // $1142
	.byte $D0, $F8                               // $1143  bne $113D
	nop                                          // $1145
	nop                                          // $1146
	nop                                          // $1147
	lda $48                                      // $1148
	.byte $F0, $0B                               // $114A  beq $1157
	dec $4f                                      // $114C
	.byte $D0, $07                               // $114E  bne $1157
	lda #$18                                     // $1150
	sta $4f                                      // $1152
	jsr $7fc5                                    // $1154
	jsr $6800                                    // $1157
	jsr $ffea                                    // $115A
	jsr $ffe1                                    // $115D
	.byte $D0, $03                               // $1160  bne $1165
	jmp $1a00                                    // $1162
	lda $41                                      // $1165
	cmp $69                                      // $1167
	.byte $D0, $03                               // $1169  bne $116E
	jmp $1380                                    // $116B
	cmp $6a                                      // $116E
	.byte $D0, $03                               // $1170  bne $1175
	jmp $1380                                    // $1172
	cmp $6b                                      // $1175
	.byte $D0, $03                               // $1177  bne $117C
	jmp $1380                                    // $1179
	cmp $6c                                      // $117C
	.byte $D0, $03                               // $117E  bne $1183
	jmp $1380                                    // $1180
	cmp $6d                                      // $1183
	.byte $D0, $03                               // $1185  bne $118A
	jmp $1380                                    // $1187
	cmp $6e                                      // $118A
	.byte $D0, $03                               // $118C  bne $1191
	jmp $1380                                    // $118E
	cmp $6f                                      // $1191
	.byte $D0, $03                               // $1193  bne $1198
	jmp $1380                                    // $1195
	lda $d017                                    // $1198  ; VIC_SPYEXP
	and #$fe                                     // $119B
	sta $d017                                    // $119D  ; VIC_SPYEXP
	lda $d01d                                    // $11A0  ; VIC_SPXEXP
	and #$fe                                     // $11A3
	sta $d01d                                    // $11A5  ; VIC_SPXEXP
	lda #$01                                     // $11A8
	sta $d027                                    // $11AA
	lda $27                                      // $11AD
	.byte $D0, $07                               // $11AF  bne $11B8
	lda #$01                                     // $11B1
	sta $5f                                      // $11B3
	jmp $1660                                    // $11B5
	cmp #$0a                                     // $11B8
	.byte $D0, $07                               // $11BA  bne $11C3
	lda #$b2                                     // $11BC
	sta $2e                                      // $11BE
	jsr $11e7                                    // $11C0
	cmp #$14                                     // $11C3
	.byte $D0, $07                               // $11C5  bne $11CE
	lda #$b0                                     // $11C7
	sta $2e                                      // $11C9
	jsr $11e7                                    // $11CB
	cmp #$1e                                     // $11CE
	.byte $D0, $07                               // $11D0  bne $11D9
	lda #$a7                                     // $11D2
	sta $2e                                      // $11D4
	jsr $11e7                                    // $11D6
	cmp #$28                                     // $11D9
	.byte $D0, $07                               // $11DB  bne $11E4
	lda #$a5                                     // $11DD
	sta $2e                                      // $11DF
	jsr $11e7                                    // $11E1
	jmp $1200                                    // $11E4
	ldy #$00                                     // $11E7
	lda #$01                                     // $11E9
	sta ($2e),y                                  // $11EB
	clc                                          // $11ED
	lda $2e                                      // $11EE
	adc #$28                                     // $11F0
	sta $2e                                      // $11F2
	lda #$01                                     // $11F4
	sta ($2e),y                                  // $11F6
	rts                                          // $11F8
	nop                                          // $11F9
	nop                                          // $11FA
	nop                                          // $11FB
	nop                                          // $11FC
	nop                                          // $11FD
	nop                                          // $11FE
	nop                                          // $11FF
	lda $43                                      // $1200
	.byte $F0, $03                               // $1202  beq $1207
	jmp $1800                                    // $1204
	lda $42                                      // $1207
	.byte $D0, $0F                               // $1209  bne $121A
	dec $4b                                      // $120B
	.byte $F0, $03                               // $120D  beq $1212
	jmp $1800                                    // $120F
	lda #$6f                                     // $1212
	sta $4b                                      // $1214
	lda $4e                                      // $1216
	sta $42                                      // $1218
	.byte $10, $03                               // $121A  bpl $121F
	jmp $1500                                    // $121C
	cmp #$01                                     // $121F
	.byte $D0, $1E                               // $1221  bne $1241
	lda $dc04                                    // $1223
	and #$01                                     // $1226
	.byte $F0, $07                               // $1228  beq $1231
	lda #$0f                                     // $122A
	sta $57                                      // $122C
	jmp $1235                                    // $122E
	lda #$f0                                     // $1231
	sta $57                                      // $1233
	jsr $6da5                                    // $1235
	lda $42                                      // $1238
	ora #$80                                     // $123A
	sta $42                                      // $123C
	jmp $1020                                    // $123E
	cmp #$02                                     // $1241
	.byte $D0, $10                               // $1243  bne $1255
	lda #$00                                     // $1245
	sta $57                                      // $1247
	jsr $6d45                                    // $1249
	lda $42                                      // $124C
	ora #$80                                     // $124E
	sta $42                                      // $1250
	jmp $1020                                    // $1252
	cmp #$04                                     // $1255
	.byte $D0, $10                               // $1257  bne $1269
	lda #$00                                     // $1259
	sta $52                                      // $125B
	jsr $6950                                    // $125D
	lda $42                                      // $1260
	ora #$80                                     // $1262
	sta $42                                      // $1264
	jmp $1020                                    // $1266
	cmp #$08                                     // $1269
	.byte $D0, $42                               // $126B  bne $12AF
	dec $55                                      // $126D
	.byte $F0, $03                               // $126F  beq $1274
	jmp $1020                                    // $1271
	lda $dc04                                    // $1274
	and #$0f                                     // $1277
	sta $52                                      // $1279
	cmp #$03                                     // $127B
	.byte $D0, $06                               // $127D  bne $1285
	jsr $6845                                    // $127F
	jmp $129e                                    // $1282
	cmp #$07                                     // $1285
	.byte $D0, $0A                               // $1287  bne $1293
	lda #$00                                     // $1289
	sta $50                                      // $128B
	jsr $7495                                    // $128D
	jmp $129e                                    // $1290
	cmp #$0b                                     // $1293
	.byte $D0, $DA                               // $1295  bne $1271
	lda #$01                                     // $1297
	sta $50                                      // $1299
	jsr $7495                                    // $129B
	lda #$88                                     // $129E
	sta $42                                      // $12A0
	ldx #$06                                     // $12A2
	lda $5e40,x                                  // $12A4
	sta $30,x                                    // $12A7
	dex                                          // $12A9
	.byte $10, $F8                               // $12AA  bpl $12A4
	jmp $1500                                    // $12AC
	cmp #$10                                     // $12AF
	.byte $D0, $53                               // $12B1  bne $1306
	lda $dc04                                    // $12B3
	and #$01                                     // $12B6
	.byte $F0, $07                               // $12B8  beq $12C1
	lda #$0f                                     // $12BA
	sta $57                                      // $12BC
	jmp $12c5                                    // $12BE
	lda #$f0                                     // $12C1
	sta $57                                      // $12C3
	jsr $78c0                                    // $12C5
	lda #$00                                     // $12C8
	sta $33                                      // $12CA
	lda #$c0                                     // $12CC
	sta $30                                      // $12CE
	sta $34                                      // $12D0
	lda #$5b                                     // $12D2
	sta $31                                      // $12D4
	sta $35                                      // $12D6
	lda #$00                                     // $12D8
	sta $50                                      // $12DA
	sta $52                                      // $12DC
	lda #$3f                                     // $12DE
	sta $51                                      // $12E0
	lda #$ff                                     // $12E2
	sta $53                                      // $12E4
	lda $dc04                                    // $12E6
	sta $d004                                    // $12E9
	sta $d006                                    // $12EC
	jsr $7870                                    // $12EF
	lda $42                                      // $12F2
	ora #$80                                     // $12F4
	sta $42                                      // $12F6
	ldx #$7f                                     // $12F8
	lda $2f80,x                                  // $12FA
	sta $2dc0,x                                  // $12FD
	dex                                          // $1300
	.byte $10, $F7                               // $1301  bpl $12FA
	jmp $1020                                    // $1303
	cmp #$40                                     // $1306
	.byte $D0, $32                               // $1308  bne $133C
	lda #$00                                     // $130A
	sta $33                                      // $130C
	lda #$30                                     // $130E
	sta $30                                      // $1310
	sta $34                                      // $1312
	lda #$5c                                     // $1314
	sta $31                                      // $1316
	sta $35                                      // $1318
	jsr $7b40                                    // $131A
	lda $42                                      // $131D
	ora #$80                                     // $131F
	sta $42                                      // $1321
	lda #$81                                     // $1323
	sta $d404                                    // $1325  ; SID_CR1
	sta $d412                                    // $1328
	lda #$11                                     // $132B
	sta $d40b                                    // $132D
	lda #$00                                     // $1330
	sta $d021                                    // $1332  ; VIC_BG0
	lda #$ff                                     // $1335
	sta $46                                      // $1337
	jmp $1020                                    // $1339
	cmp #$20                                     // $133C
	.byte $D0, $1A                               // $133E  bne $135A
	lda #$09                                     // $1340
	sta $53                                      // $1342
	lda #$04                                     // $1344
	sta $54                                      // $1346
	sta $52                                      // $1348
	sta $51                                      // $134A
	sta $55                                      // $134C
	jsr $7d56                                    // $134E
	lda $42                                      // $1351
	ora #$80                                     // $1353
	sta $42                                      // $1355
	jmp $1020                                    // $1357
	jmp $1020                                    // $135A
	nop                                          // $135D
	nop                                          // $135E
	nop                                          // $135F
	nop                                          // $1360
	nop                                          // $1361
	nop                                          // $1362
	nop                                          // $1363
	nop                                          // $1364
	nop                                          // $1365
	nop                                          // $1366
	nop                                          // $1367
	nop                                          // $1368
	nop                                          // $1369
	nop                                          // $136A
	nop                                          // $136B
	nop                                          // $136C
	nop                                          // $136D
	nop                                          // $136E
	nop                                          // $136F
	lda #$03                                     // $1370
	sta $46                                      // $1372
	jmp $100c                                    // $1374
	nop                                          // $1377
	nop                                          // $1378
	nop                                          // $1379
	nop                                          // $137A
	nop                                          // $137B
	nop                                          // $137C
	nop                                          // $137D
	nop                                          // $137E
	nop                                          // $137F
	lda $d01e                                    // $1380  ; VIC_SPCOL
	lda $d015                                    // $1383  ; VIC_SPEN
	and #$f0                                     // $1386
	sta $d015                                    // $1388  ; VIC_SPEN
	lda $d01c                                    // $138B  ; VIC_SPMCOL
	and #$f0                                     // $138E
	sta $d01c                                    // $1390  ; VIC_SPMCOL
	lda $d01b                                    // $1393  ; VIC_SPPRI
	and #$f0                                     // $1396
	sta $d01b                                    // $1398  ; VIC_SPPRI
	lda $d017                                    // $139B  ; VIC_SPYEXP
	and #$f0                                     // $139E
	sta $d017                                    // $13A0  ; VIC_SPYEXP
	lda $d01d                                    // $13A3  ; VIC_SPXEXP
	and #$f0                                     // $13A6
	sta $d01d                                    // $13A8  ; VIC_SPXEXP
	ldx $27                                      // $13AB
	lda $5fc0,x                                  // $13AD
	sta $29                                      // $13B0
	jsr $6800                                    // $13B2
	ldx #$07                                     // $13B5
	lda #$00                                     // $13B7
	sta $d000,x                                  // $13B9  ; VIC_SP0X
	lda $5e38,x                                  // $13BC
	sta $30,x                                    // $13BF
	lda $07c3,x                                  // $13C1
	sta $60,x                                    // $13C4
	dex                                          // $13C6
	.byte $10, $EE                               // $13C7  bpl $13B7
	lda #$03                                     // $13C9
	sta $5f                                      // $13CB
	inc $41                                      // $13CD
	lda $41                                      // $13CF
	sta $5e                                      // $13D1
	asl $4e                                      // $13D3
	lda #$00                                     // $13D5
	sta $42                                      // $13D7
	sta $43                                      // $13D9
	sta $21                                      // $13DB
	sta $22                                      // $13DD
	lda #$21                                     // $13DF
	sta $d404                                    // $13E1  ; SID_CR1
	sta $d40b                                    // $13E4
	lda #$41                                     // $13E7
	sta $d412                                    // $13E9
	lda $16                                      // $13EC
	cmp #$1c                                     // $13EE
	.byte $B0, $04                               // $13F0  bcs $13F6
	lda #$2a                                     // $13F2
	sta $16                                      // $13F4
	dec $16                                      // $13F6
	dec $16                                      // $13F8
	jsr $61ca                                    // $13FA
	lda $d012                                    // $13FD  ; VIC_RASTER
	.byte $D0, $FB                               // $1400  bne $13FD
	inc $21                                      // $1402
	.byte $D0, $F7                               // $1404  bne $13FD
	inc $22                                      // $1406
	lda $22                                      // $1408
	cmp #$2c                                     // $140A
	.byte $D0, $DE                               // $140C  bne $13EC
	lda #$0a                                     // $140E
	sta $16                                      // $1410
	sta $36                                      // $1412
	lda #$28                                     // $1414
	sta $1b                                      // $1416
	jsr $61ca                                    // $1418
	lda $4e                                      // $141B
	cmp #$80                                     // $141D
	.byte $D0, $19                               // $141F  bne $143A
	lda #$01                                     // $1421
	sta $4e                                      // $1423
	jsr $600a                                    // $1425
	jsr $61ca                                    // $1428
	lda #$00                                     // $142B
	sta $41                                      // $142D
	sta $48                                      // $142F
	sta $49                                      // $1431
	lda #$32                                     // $1433
	sta $27                                      // $1435
	jmp $1469                                    // $1437
	lda $68                                      // $143A
	cmp #$6a                                     // $143C
	.byte $90, $07                               // $143E  bcc $1447
	lda #$32                                     // $1440
	sta $27                                      // $1442
	jmp $14a0                                    // $1444
	cmp #$54                                     // $1447
	.byte $D0, $11                               // $1449  bne $145C
	lda $4e                                      // $144B
	cmp #$04                                     // $144D
	.byte $F0, $04                               // $144F  beq $1455
	cmp #$10                                     // $1451
	.byte $D0, $04                               // $1453  bne $1459
	lda #$32                                     // $1455
	sta $27                                      // $1457
	jmp $14a0                                    // $1459
	lda $4e                                      // $145C
	cmp #$08                                     // $145E
	.byte $D0, $04                               // $1460  bne $1466
	lda #$32                                     // $1462
	sta $27                                      // $1464
	jmp $14a0                                    // $1466
	ldx #$07                                     // $1469
	lda $60,x                                    // $146B
	sta $07dd,x                                  // $146D
	dex                                          // $1470
	.byte $10, $F8                               // $1471  bpl $146B
	lda $68                                      // $1473
	cmp #$7f                                     // $1475
	.byte $D0, $05                               // $1477  bne $147E
	ldy #$08                                     // $1479
	jmp $1493                                    // $147B
	cmp #$6a                                     // $147E
	.byte $D0, $05                               // $1480  bne $1487
	ldy #$10                                     // $1482
	jmp $1493                                    // $1484
	cmp #$54                                     // $1487
	.byte $D0, $05                               // $1489  bne $1490
	ldy #$18                                     // $148B
	jmp $1493                                    // $148D
	jmp $1479                                    // $1490
	ldx #$00                                     // $1493
	lda $5b40,y                                  // $1495
	sta $68,x                                    // $1498
	iny                                          // $149A
	inx                                          // $149B
	cpx #$08                                     // $149C
	.byte $D0, $F5                               // $149E  bne $1495
	lda $27                                      // $14A0
	cmp #$28                                     // $14A2
	.byte $B0, $0F                               // $14A4  bcs $14B5
	cmp #$1e                                     // $14A6
	.byte $B0, $0E                               // $14A8  bcs $14B8
	cmp #$14                                     // $14AA
	.byte $B0, $0D                               // $14AC  bcs $14BB
	cmp #$0a                                     // $14AE
	.byte $B0, $0C                               // $14B0  bcs $14BE
	jmp $14f0                                    // $14B2
	jsr $14c4                                    // $14B5
	jsr $14cf                                    // $14B8
	jsr $14da                                    // $14BB
	jsr $14e5                                    // $14BE
	jmp $14f0                                    // $14C1
	lda #$07                                     // $14C4
	sta $07a5                                    // $14C6
	lda #$08                                     // $14C9
	sta $07cd                                    // $14CB
	rts                                          // $14CE
	lda #$07                                     // $14CF
	sta $07a7                                    // $14D1
	lda #$08                                     // $14D4
	sta $07cf                                    // $14D6
	rts                                          // $14D9
	lda #$07                                     // $14DA
	sta $07b0                                    // $14DC
	lda #$08                                     // $14DF
	sta $07d8                                    // $14E1
	rts                                          // $14E4
	lda #$07                                     // $14E5
	sta $07b2                                    // $14E7
	lda #$08                                     // $14EA
	sta $07da                                    // $14EC
	rts                                          // $14EF
	ldx #$06                                     // $14F0
	lda $5e48,x                                  // $14F2
	sta $30,x                                    // $14F5
	dex                                          // $14F7
	.byte $10, $F8                               // $14F8  bpl $14F2
	jsr $6090                                    // $14FA
	jmp $1370                                    // $14FD
	lda $42                                      // $1500
	and #$7f                                     // $1502
	cmp #$01                                     // $1504
	.byte $D0, $14                               // $1506  bne $151C
	dec $4d                                      // $1508
	.byte $D0, $07                               // $150A  bne $1513
	lda #$20                                     // $150C
	sta $4d                                      // $150E
	jsr $6135                                    // $1510
	jsr $73da                                    // $1513
	jsr $7a85                                    // $1516
	jmp $1800                                    // $1519
	cmp #$02                                     // $151C
	.byte $D0, $1A                               // $151E  bne $153A
	dec $4d                                      // $1520
	.byte $D0, $0A                               // $1522  bne $152E
	lda #$60                                     // $1524
	sta $4d                                      // $1526
	jsr $6b35                                    // $1528
	jsr $7310                                    // $152B
	jsr $73da                                    // $152E
	jsr $7a85                                    // $1531
	jsr $61a0                                    // $1534
	jmp $1800                                    // $1537
	cmp #$04                                     // $153A
	.byte $D0, $0D                               // $153C  bne $154B
	lda #$05                                     // $153E
	sta $44                                      // $1540
	jsr $69ba                                    // $1542
	jsr $7ce0                                    // $1545
	jmp $1800                                    // $1548
	cmp #$08                                     // $154B
	.byte $D0, $4E                               // $154D  bne $159D
	lda $52                                      // $154F
	cmp #$03                                     // $1551
	.byte $D0, $13                               // $1553  bne $1568
	lda $50                                      // $1555
	cmp #$09                                     // $1557
	.byte $F0, $03                               // $1559  beq $155E
	jsr $76e0                                    // $155B
	lda $51                                      // $155E
	.byte $F0, $03                               // $1560  beq $1565
	jsr $76a0                                    // $1562
	jmp $1594                                    // $1565
	cmp #$07                                     // $1568
	.byte $D0, $06                               // $156A  bne $1572
	jsr $7567                                    // $156C
	jmp $1579                                    // $156F
	cmp #$0b                                     // $1572
	.byte $D0, $15                               // $1574  bne $158B
	jsr $75f4                                    // $1576
	lda $d002                                    // $1579  ; VIC_SP1X
	cmp #$80                                     // $157C
	.byte $90, $14                               // $157E  bcc $1594
	cmp #$b0                                     // $1580
	.byte $B0, $10                               // $1582  bcs $1594
	lda $d010                                    // $1584  ; VIC_SPXMSB
	and #$02                                     // $1587
	.byte $F0, $09                               // $1589  beq $1594
	lda $42                                      // $158B
	and #$7f                                     // $158D
	sta $42                                      // $158F
	jmp $1020                                    // $1591
	jsr $7ac0                                    // $1594
	jsr $68f9                                    // $1597
	jmp $1800                                    // $159A
	cmp #$10                                     // $159D
	.byte $D0, $29                               // $159F  bne $15CA
	dec $4d                                      // $15A1
	.byte $D0, $10                               // $15A3  bne $15B5
	lda #$20                                     // $15A5
	sta $4d                                      // $15A7
	jsr $6135                                    // $15A9
	jsr $79a5                                    // $15AC
	jsr $794a                                    // $15AF
	jsr $79e0                                    // $15B2
	jmp $1800                                    // $15B5
	jmp $1020                                    // $15B8
	sta $d015                                    // $15BB  ; VIC_SPEN
	lda $4e                                      // $15BE
	sta $42                                      // $15C0
	dec $54                                      // $15C2
	jmp $1020                                    // $15C4
	jmp $1800                                    // $15C7
	cmp #$40                                     // $15CA
	.byte $D0, $35                               // $15CC  bne $1603
	inc $52                                      // $15CE
	.byte $D0, $20                               // $15D0  bne $15F2
	lda #$00                                     // $15D2
	sta $d02e                                    // $15D4
	inc $53                                      // $15D7
	lda $53                                      // $15D9
	cmp #$80                                     // $15DB
	.byte $D0, $03                               // $15DD  bne $15E2
	jsr $7bd0                                    // $15DF
	cmp #$00                                     // $15E2
	.byte $D0, $0C                               // $15E4  bne $15F2
	jsr $7c00                                    // $15E6
	lda $42                                      // $15E9
	and #$7f                                     // $15EB
	sta $43                                      // $15ED
	jmp $1800                                    // $15EF
	jsr $6cf5                                    // $15F2
	lda #$81                                     // $15F5
	sta $d404                                    // $15F7  ; SID_CR1
	sta $d412                                    // $15FA
	jsr $7a45                                    // $15FD
	jmp $1020                                    // $1600
	cmp #$20                                     // $1603
	.byte $D0, $25                               // $1605  bne $162C
	lda $52                                      // $1607
	.byte $F0, $06                               // $1609  beq $1611
	jsr $7e10                                    // $160B
	jmp $161e                                    // $160E
	jsr $7dc0                                    // $1611
	jsr $7ec5                                    // $1614
	lda $55                                      // $1617
	.byte $D0, $06                               // $1619  bne $1621
	jsr $7e72                                    // $161B
	jmp $1020                                    // $161E
	lda $dc04                                    // $1621
	.byte $D0, $03                               // $1624  bne $1629
	jsr $7e2c                                    // $1626
	jmp $1020                                    // $1629
	jmp $1020                                    // $162C
	nop                                          // $162F
	nop                                          // $1630
	nop                                          // $1631
	nop                                          // $1632
	nop                                          // $1633
	nop                                          // $1634
	nop                                          // $1635
	nop                                          // $1636
	nop                                          // $1637
	nop                                          // $1638
	nop                                          // $1639
	nop                                          // $163A
	nop                                          // $163B
	nop                                          // $163C
	nop                                          // $163D
	nop                                          // $163E
	nop                                          // $163F
	nop                                          // $1640
	nop                                          // $1641
	nop                                          // $1642
	nop                                          // $1643
	nop                                          // $1644
	nop                                          // $1645
	nop                                          // $1646
	nop                                          // $1647
	nop                                          // $1648
	nop                                          // $1649
	nop                                          // $164A
	nop                                          // $164B
	nop                                          // $164C
	nop                                          // $164D
	nop                                          // $164E
	nop                                          // $164F
	nop                                          // $1650
	nop                                          // $1651
	nop                                          // $1652
	nop                                          // $1653
	nop                                          // $1654
	nop                                          // $1655
	nop                                          // $1656
	nop                                          // $1657
	nop                                          // $1658
	nop                                          // $1659
	nop                                          // $165A
	nop                                          // $165B
	nop                                          // $165C
	nop                                          // $165D
	nop                                          // $165E
	nop                                          // $165F
	lda #$ff                                     // $1660
	sta $46                                      // $1662
	ldx #$0e                                     // $1664
	lda $d020,x                                  // $1666  ; VIC_BORDER
	sta $5fb0,x                                  // $1669
	dex                                          // $166C
	.byte $10, $F7                               // $166D  bpl $1666
	lda $d010                                    // $166F  ; VIC_SPXMSB
	sta $5fbf                                    // $1672
	dec $5f                                      // $1675
	.byte $F0, $0B                               // $1677  beq $1684
	nop                                          // $1679
	nop                                          // $167A
	nop                                          // $167B
	nop                                          // $167C
	nop                                          // $167D
	nop                                          // $167E
	nop                                          // $167F
	nop                                          // $1680
	jmp $1759                                    // $1681
	ldx #$07                                     // $1684
	lda #$00                                     // $1686
	sta $50,x                                    // $1688
	lda #$10                                     // $168A
	sta $60,x                                    // $168C
	dex                                          // $168E
	.byte $10, $F5                               // $168F  bpl $1686
	lda $5e                                      // $1691
	sta $41                                      // $1693
	lda #$93                                     // $1695
	jsr $ffd2                                    // $1697
	lda #$00                                     // $169A
	sta $2a                                      // $169C
	sta $2b                                      // $169E
	sta $2c                                      // $16A0
	sta $2d                                      // $16A2
	sta $d015                                    // $16A4  ; VIC_SPEN
	sta $d021                                    // $16A7  ; VIC_BG0
	sta $d022                                    // $16AA
	sta $d023                                    // $16AD
	sta $33                                      // $16B0
	lda #$21                                     // $16B2
	sta $d404                                    // $16B4  ; SID_CR1
	sta $d40b                                    // $16B7
	lda #$41                                     // $16BA
	sta $d412                                    // $16BC
	lda #$e0                                     // $16BF
	sta $34                                      // $16C1
	lda #$50                                     // $16C3
	sta $35                                      // $16C5
	lda #$5a                                     // $16C7
	sta $58                                      // $16C9
	sta $5a                                      // $16CB
	lda #$04                                     // $16CD
	sta $59                                      // $16CF
	lda #$d8                                     // $16D1
	sta $5b                                      // $16D3
	lda #$5f                                     // $16D5
	sta $5c                                      // $16D7
	lda #$13                                     // $16D9
	sta $5d                                      // $16DB
	lda #$09                                     // $16DD
	sta $45                                      // $16DF
	jsr $7110                                    // $16E1
	lda #$08                                     // $16E4
	sta $36                                      // $16E6
	lda #$04                                     // $16E8
	sta $50                                      // $16EA
	dec $53                                      // $16EC
	.byte $D0, $14                               // $16EE  bne $1704
	dec $52                                      // $16F0
	.byte $D0, $10                               // $16F2  bne $1704
	lda #$12                                     // $16F4
	sta $52                                      // $16F6
	jsr $6f5c                                    // $16F8
	lda $50                                      // $16FB
	.byte $D0, $05                               // $16FD  bne $1704
	lda #$f0                                     // $16FF
	sta $d015                                    // $1701  ; VIC_SPEN
	lda $33                                      // $1704
	cmp #$64                                     // $1706
	.byte $D0, $E2                               // $1708  bne $16EC
	lda #$93                                     // $170A
	jsr $ffd2                                    // $170C
	lda #$00                                     // $170F
	sta $d418                                    // $1711  ; SID_FMODE
	lda $d018                                    // $1714  ; VIC_MEMCFG
	and #$f0                                     // $1717
	ora #$04                                     // $1719
	sta $d018                                    // $171B  ; VIC_MEMCFG
	ldx #$3f                                     // $171E
	lda $5cf0,x                                  // $1720
	jsr $ffd2                                    // $1723
	dex                                          // $1726
	.byte $10, $F7                               // $1727  bpl $1720
	jsr $ffea                                    // $1729
	jsr $ffe1                                    // $172C
	.byte $D0, $03                               // $172F  bne $1734
	jmp $1a00                                    // $1731
	lda $dc00                                    // $1734  ; CIA1_PRA
	and #$1f                                     // $1737
	eor #$1f                                     // $1739
	.byte $F0, $EC                               // $173B  beq $1729
	ldx #$07                                     // $173D
	lda #$00                                     // $173F
	sta $50,x                                    // $1741
	nop                                          // $1743
	nop                                          // $1744
	dex                                          // $1745
	.byte $10, $F9                               // $1746  bpl $1741
	lda #$32                                     // $1748
	sta $27                                      // $174A
	lda #$03                                     // $174C
	sta $5f                                      // $174E
	jsr $6020                                    // $1750
	jsr $6090                                    // $1753
	jmp $177a                                    // $1756
	lda $27                                      // $1759
	cmp #$28                                     // $175B
	.byte $B0, $0F                               // $175D  bcs $176E
	cmp #$1e                                     // $175F
	.byte $B0, $0E                               // $1761  bcs $1771
	cmp #$14                                     // $1763
	.byte $B0, $0D                               // $1765  bcs $1774
	cmp #$0a                                     // $1767
	.byte $B0, $0C                               // $1769  bcs $1777
	jmp $177a                                    // $176B
	jsr $14c4                                    // $176E
	jsr $14cf                                    // $1771
	jsr $14da                                    // $1774
	jsr $14e5                                    // $1777
	lda #$0c                                     // $177A
	sta $36                                      // $177C
	lda #$00                                     // $177E
	sta $33                                      // $1780
	sta $30                                      // $1782
	sta $34                                      // $1784
	lda #$58                                     // $1786
	sta $31                                      // $1788
	sta $35                                      // $178A
	lda #$00                                     // $178C
	sta $42                                      // $178E
	sta $43                                      // $1790
	sta $24                                      // $1792
	lda #$01                                     // $1794
	sta $26                                      // $1796
	ldx #$07                                     // $1798
	lda #$00                                     // $179A
	sta $50,x                                    // $179C
	dex                                          // $179E
	.byte $10, $FB                               // $179F  bpl $179C
	lda #$0a                                     // $17A1
	sta $16                                      // $17A3
	lda #$28                                     // $17A5
	sta $1b                                      // $17A7
	lda #$f0                                     // $17A9
	sta $d015                                    // $17AB  ; VIC_SPEN
	lda #$41                                     // $17AE
	sta $d412                                    // $17B0
	lda #$0f                                     // $17B3
	sta $d418                                    // $17B5  ; SID_FMODE
	lda $4e                                      // $17B8
	cmp #$40                                     // $17BA
	.byte $D0, $03                               // $17BC  bne $17C1
	jmp $1a00                                    // $17BE
	lda #$04                                     // $17C1
	sta $46                                      // $17C3
	ldx #$0e                                     // $17C5
	lda $5fb0,x                                  // $17C7
	sta $d020,x                                  // $17CA  ; VIC_BORDER
	dex                                          // $17CD
	.byte $10, $F7                               // $17CE  bpl $17C7
	lda $5fbf                                    // $17D0
	sta $d010                                    // $17D3  ; VIC_SPXMSB
	ldx #$ff                                     // $17D6
	ldy #$ff                                     // $17D8
	dey                                          // $17DA
	.byte $D0, $FD                               // $17DB  bne $17DA
	dey                                          // $17DD
	.byte $D0, $FD                               // $17DE  bne $17DD
	dex                                          // $17E0
	.byte $D0, $F5                               // $17E1  bne $17D8
	nop                                          // $17E3
	nop                                          // $17E4
	nop                                          // $17E5
	nop                                          // $17E6
	nop                                          // $17E7
	nop                                          // $17E8
	nop                                          // $17E9
	nop                                          // $17EA
	lda #$01                                     // $17EB
	sta $07d1                                    // $17ED
	sta $07d6                                    // $17F0
	jmp $100c                                    // $17F3
	nop                                          // $17F6
	nop                                          // $17F7
	nop                                          // $17F8
	nop                                          // $17F9
	nop                                          // $17FA
	nop                                          // $17FB
	nop                                          // $17FC
	nop                                          // $17FD
	nop                                          // $17FE
	nop                                          // $17FF
	lda $43                                      // $1800
	.byte $D0, $03                               // $1802  bne $1807
	jmp $1020                                    // $1804
	.byte $10, $03                               // $1807  bpl $180C
	jmp $1b00                                    // $1809
	cmp #$01                                     // $180C
	.byte $D0, $03                               // $180E  bne $1813
	jmp $7075                                    // $1810
	cmp #$02                                     // $1813
	.byte $D0, $03                               // $1815  bne $181A
	jmp $7075                                    // $1817
	cmp #$08                                     // $181A
	.byte $D0, $5B                               // $181C  bne $1879
	lda #$81                                     // $181E
	sta $d404                                    // $1820  ; SID_CR1
	sta $d40b                                    // $1823
	sta $d412                                    // $1826
	lda #$00                                     // $1829
	sta $51                                      // $182B
	sta $52                                      // $182D
	lda $d015                                    // $182F  ; VIC_SPEN
	and #$fe                                     // $1832
	sta $d015                                    // $1834  ; VIC_SPEN
	lda $d01c                                    // $1837  ; VIC_SPMCOL
	and #$f6                                     // $183A
	sta $d01c                                    // $183C  ; VIC_SPMCOL
	jsr $6c40                                    // $183F
	ldx #$1f                                     // $1842
	ldy #$ff                                     // $1844
	dey                                          // $1846
	.byte $D0, $FD                               // $1847  bne $1846
	dex                                          // $1849
	.byte $D0, $F8                               // $184A  bne $1844
	jsr $7f85                                    // $184C
	lda $51                                      // $184F
	cmp #$08                                     // $1851
	.byte $D0, $EA                               // $1853  bne $183F
	jsr $6c2a                                    // $1855
	jsr $61a0                                    // $1858
	jsr $7f85                                    // $185B
	ldx #$2f                                     // $185E
	ldy #$ff                                     // $1860
	dey                                          // $1862
	.byte $D0, $FD                               // $1863  bne $1862
	dex                                          // $1865
	.byte $D0, $F8                               // $1866  bne $1860
	inc $d003                                    // $1868  ; VIC_SP1Y
	inc $d005                                    // $186B
	inc $50                                      // $186E
	lda $50                                      // $1870
	cmp #$50                                     // $1872
	.byte $D0, $E2                               // $1874  bne $1858
	jmp $18cb                                    // $1876
	cmp #$04                                     // $1879
	.byte $D0, $63                               // $187B  bne $18E0
	lda #$00                                     // $187D
	sta $33                                      // $187F
	lda #$b0                                     // $1881
	sta $34                                      // $1883
	lda #$d0                                     // $1885
	sta $30                                      // $1887
	lda #$57                                     // $1889
	sta $35                                      // $188B
	sta $31                                      // $188D
	jsr $6090                                    // $188F
	jsr $7f60                                    // $1892
	lda $37                                      // $1895
	asl                                          // $1897
	tax                                          // $1898
	lda #$c8                                     // $1899
	sta $d001,x                                  // $189B  ; VIC_SP0Y
	jsr $18bd                                    // $189E
	ldx #$01                                     // $18A1
	inc $d003                                    // $18A3  ; VIC_SP1Y
	inc $d005                                    // $18A6
	inc $d007                                    // $18A9
	dex                                          // $18AC
	.byte $D0, $F4                               // $18AD  bne $18A3
	jsr $18bd                                    // $18AF
	inc $50                                      // $18B2
	lda $50                                      // $18B4
	cmp #$30                                     // $18B6
	.byte $D0, $DB                               // $18B8  bne $1895
	jmp $70fe                                    // $18BA
	ldx #$2f                                     // $18BD
	ldy #$ff                                     // $18BF
	dey                                          // $18C1
	.byte $D0, $FD                               // $18C2  bne $18C1
	dex                                          // $18C4
	.byte $D0, $F8                               // $18C5  bne $18BF
	rts                                          // $18C7
	jmp $1020                                    // $18C8
	lda #$21                                     // $18CB
	sta $d404                                    // $18CD  ; SID_CR1
	sta $d40b                                    // $18D0
	lda #$41                                     // $18D3
	sta $d412                                    // $18D5
	lda #$00                                     // $18D8
	sta $d006                                    // $18DA
	jmp $70fe                                    // $18DD
	cmp #$10                                     // $18E0
	.byte $D0, $13                               // $18E2  bne $18F7
	lda $d017                                    // $18E4  ; VIC_SPYEXP
	and #$f3                                     // $18E7
	sta $d017                                    // $18E9  ; VIC_SPYEXP
	lda $d01d                                    // $18EC  ; VIC_SPXEXP
	and #$f3                                     // $18EF
	sta $d01d                                    // $18F1  ; VIC_SPXEXP
	jmp $7075                                    // $18F4
	cmp #$40                                     // $18F7
	.byte $D0, $5B                               // $18F9  bne $1956
	lda #$00                                     // $18FB
	sta $50                                      // $18FD
	sta $51                                      // $18FF
	sta $52                                      // $1901
	sta $33                                      // $1903
	lda #$a0                                     // $1905
	sta $30                                      // $1907
	sta $34                                      // $1909
	lda #$5c                                     // $190B
	sta $31                                      // $190D
	sta $35                                      // $190F
	lda #$41                                     // $1911
	sta $d404                                    // $1913  ; SID_CR1
	sta $d40b                                    // $1916
	sta $d412                                    // $1919
	jsr $7c90                                    // $191C
	lda $52                                      // $191F
	.byte $D0, $15                               // $1921  bne $1938
	ldx #$10                                     // $1923
	ldy #$ff                                     // $1925
	dey                                          // $1927
	.byte $D0, $FD                               // $1928  bne $1927
	dex                                          // $192A
	.byte $D0, $F8                               // $192B  bne $1925
	lda #$ff                                     // $192D
	sta $d017                                    // $192F  ; VIC_SPYEXP
	sta $d01d                                    // $1932  ; VIC_SPXEXP
	jmp $191c                                    // $1935
	ldx #$ff                                     // $1938
	ldy #$ff                                     // $193A
	dey                                          // $193C
	.byte $D0, $FD                               // $193D  bne $193C
	dex                                          // $193F
	.byte $D0, $F8                               // $1940  bne $193A
	lda #$21                                     // $1942
	sta $d404                                    // $1944  ; SID_CR1
	sta $d40b                                    // $1947
	lda #$41                                     // $194A
	sta $d412                                    // $194C
	lda #$01                                     // $194F
	sta $5f                                      // $1951
	jmp $1660                                    // $1953
	cmp #$20                                     // $1956
	.byte $F0, $03                               // $1958  beq $195D
	jmp $1020                                    // $195A
	lda #$81                                     // $195D
	sta $d412                                    // $195F
	ldx #$06                                     // $1962
	lda $5e30,x                                  // $1964
	sta $30,x                                    // $1967
	dex                                          // $1969
	.byte $10, $F8                               // $196A  bpl $1964
	lda #$a2                                     // $196C
	sta $d002                                    // $196E  ; VIC_SP1X
	nop                                          // $1971
	lda #$01                                     // $1972
	ldx #$03                                     // $1974
	sta $06ba,x                                  // $1976
	dex                                          // $1979
	.byte $10, $FA                               // $197A  bpl $1976
	ldx #$03                                     // $197C
	sta $06e2,x                                  // $197E
	dex                                          // $1981
	.byte $10, $FA                               // $1982  bpl $197E
	ldx #$03                                     // $1984
	sta $070a,x                                  // $1986
	dex                                          // $1989
	.byte $10, $FA                               // $198A  bpl $1986
	inc $d003                                    // $198C  ; VIC_SP1Y
	lda $d003                                    // $198F  ; VIC_SP1Y
	cmp #$dc                                     // $1992
	.byte $90, $0D                               // $1994  bcc $19A3
	ldx #$03                                     // $1996
	lda #$01                                     // $1998
	sta $07aa,x                                  // $199A
	dex                                          // $199D
	.byte $10, $FA                               // $199E  bpl $199A
	jmp $19e3                                    // $19A0
	cmp #$d4                                     // $19A3
	.byte $90, $0D                               // $19A5  bcc $19B4
	ldx #$03                                     // $19A7
	lda #$01                                     // $19A9
	sta $0782,x                                  // $19AB
	dex                                          // $19AE
	.byte $10, $FA                               // $19AF  bpl $19AB
	jmp $19d6                                    // $19B1
	cmp #$cc                                     // $19B4
	.byte $90, $0D                               // $19B6  bcc $19C5
	ldx #$03                                     // $19B8
	lda #$01                                     // $19BA
	sta $075a,x                                  // $19BC
	dex                                          // $19BF
	.byte $10, $FA                               // $19C0  bpl $19BC
	jmp $19d6                                    // $19C2
	cmp #$c4                                     // $19C5
	.byte $90, $0D                               // $19C7  bcc $19D6
	ldx #$03                                     // $19C9
	lda #$01                                     // $19CB
	sta $0732,x                                  // $19CD
	dex                                          // $19D0
	.byte $10, $FA                               // $19D1  bpl $19CD
	nop                                          // $19D3
	nop                                          // $19D4
	nop                                          // $19D5
	ldx #$4f                                     // $19D6
	ldy #$ff                                     // $19D8
	dey                                          // $19DA
	.byte $D0, $FD                               // $19DB  bne $19DA
	dex                                          // $19DD
	.byte $D0, $F8                               // $19DE  bne $19D8
	jmp $198c                                    // $19E0
	ldx #$ff                                     // $19E3
	ldy #$ff                                     // $19E5
	dey                                          // $19E7
	.byte $D0, $FD                               // $19E8  bne $19E7
	dex                                          // $19EA
	.byte $D0, $F8                               // $19EB  bne $19E5
	lda #$70                                     // $19ED
	sta $d003                                    // $19EF  ; VIC_SP1Y
	jmp $1660                                    // $19F2
	nop                                          // $19F5
	nop                                          // $19F6
	nop                                          // $19F7
	nop                                          // $19F8
	nop                                          // $19F9
	nop                                          // $19FA
	nop                                          // $19FB
	nop                                          // $19FC
	nop                                          // $19FD
	nop                                          // $19FE
	nop                                          // $19FF
	lda #$93                                     // $1A00
	jsr $ffd2                                    // $1A02
	lda #$05                                     // $1A05
	jsr $ffd2                                    // $1A07
	lda #$00                                     // $1A0A
	sta $d020                                    // $1A0C  ; VIC_BORDER
	sta $d021                                    // $1A0F  ; VIC_BG0
	lda $d018                                    // $1A12  ; VIC_MEMCFG
	and #$f0                                     // $1A15
	ora #$04                                     // $1A17
	sta $d018                                    // $1A19  ; VIC_MEMCFG
	lda #$00                                     // $1A1C
	sta $d015                                    // $1A1E  ; VIC_SPEN
	sta $d418                                    // $1A21  ; SID_FMODE
	ldx #$28                                     // $1A24
	lda #$00                                     // $1A26
	sta $d400,x                                  // $1A28  ; SID_FR1LO
	dex                                          // $1A2B
	.byte $10, $FA                               // $1A2C  bpl $1A28
	lda #$00                                     // $1A2E
	sta $d010                                    // $1A30  ; VIC_SPXMSB
	sta $d017                                    // $1A33  ; VIC_SPYEXP
	sta $d01d                                    // $1A36  ; VIC_SPXEXP
	sta $d01c                                    // $1A39  ; VIC_SPMCOL
	sta $d01b                                    // $1A3C  ; VIC_SPPRI
	lda #$00                                     // $1A3F
	sta $d01a                                    // $1A41  ; VIC_IRQEN
	lda #$31                                     // $1A44
	sta $0314                                    // $1A46
	lda #$ea                                     // $1A49
	sta $0315                                    // $1A4B
	ldx #$00                                     // $1A4E
	lda $5a20,x                                  // $1A50
	jsr $ffd2                                    // $1A53
	inx                                          // $1A56
	.byte $D0, $F7                               // $1A57  bne $1A50
	lda $5b20,x                                  // $1A59
	jsr $ffd2                                    // $1A5C
	inx                                          // $1A5F
	cpx #$20                                     // $1A60
	.byte $D0, $F5                               // $1A62  bne $1A59
	jsr $ffe4                                    // $1A64
	cmp #$85                                     // $1A67
	.byte $D0, $05                               // $1A69  bne $1A70
	ldy #$00                                     // $1A6B
	jmp $1a88                                    // $1A6D
	cmp #$86                                     // $1A70
	.byte $D0, $05                               // $1A72  bne $1A79
	ldy #$08                                     // $1A74
	jmp $1a88                                    // $1A76
	cmp #$87                                     // $1A79
	.byte $D0, $05                               // $1A7B  bne $1A82
	ldy #$10                                     // $1A7D
	jmp $1a88                                    // $1A7F
	cmp #$88                                     // $1A82
	.byte $D0, $DE                               // $1A84  bne $1A64
	ldy #$18                                     // $1A86
	ldx #$00                                     // $1A88
	lda $5b40,y                                  // $1A8A
	sta $68,x                                    // $1A8D
	iny                                          // $1A8F
	inx                                          // $1A90
	cpx #$08                                     // $1A91
	.byte $D0, $F5                               // $1A93  bne $1A8A
	ldx #$00                                     // $1A95
	lda $5b60,x                                  // $1A97
	jsr $ffd2                                    // $1A9A
	inx                                          // $1A9D
	cpx #$12                                     // $1A9E
	.byte $D0, $F5                               // $1AA0  bne $1A97
	jsr $ffea                                    // $1AA2
	jsr $ffe1                                    // $1AA5
	.byte $D0, $01                               // $1AA8  bne $1AAB
	brk                                          // $1AAA
	lda $dc00                                    // $1AAB  ; CIA1_PRA
	and #$1f                                     // $1AAE
	eor #$1f                                     // $1AB0
	.byte $F0, $EE                               // $1AB2  beq $1AA2
	jmp $1000                                    // $1AB4
	nop                                          // $1AB7
	nop                                          // $1AB8
	nop                                          // $1AB9
	nop                                          // $1ABA
	nop                                          // $1ABB
	nop                                          // $1ABC
	nop                                          // $1ABD
	nop                                          // $1ABE
	nop                                          // $1ABF
	nop                                          // $1AC0
	nop                                          // $1AC1
	nop                                          // $1AC2
	nop                                          // $1AC3
	nop                                          // $1AC4
	nop                                          // $1AC5
	nop                                          // $1AC6
	nop                                          // $1AC7
	nop                                          // $1AC8
	nop                                          // $1AC9
	nop                                          // $1ACA
	nop                                          // $1ACB
	nop                                          // $1ACC
	nop                                          // $1ACD
	nop                                          // $1ACE
	nop                                          // $1ACF
	nop                                          // $1AD0
	nop                                          // $1AD1
	nop                                          // $1AD2
	nop                                          // $1AD3
	nop                                          // $1AD4
	nop                                          // $1AD5
	nop                                          // $1AD6
	nop                                          // $1AD7
	nop                                          // $1AD8
	nop                                          // $1AD9
	nop                                          // $1ADA
	nop                                          // $1ADB
	nop                                          // $1ADC
	nop                                          // $1ADD
	nop                                          // $1ADE
	nop                                          // $1ADF
	nop                                          // $1AE0
	nop                                          // $1AE1
	nop                                          // $1AE2
	nop                                          // $1AE3
	nop                                          // $1AE4
	nop                                          // $1AE5
	nop                                          // $1AE6
	nop                                          // $1AE7
	nop                                          // $1AE8
	nop                                          // $1AE9
	nop                                          // $1AEA
	nop                                          // $1AEB
	nop                                          // $1AEC
	nop                                          // $1AED
	nop                                          // $1AEE
	nop                                          // $1AEF
	nop                                          // $1AF0
	nop                                          // $1AF1
	nop                                          // $1AF2
	nop                                          // $1AF3
	nop                                          // $1AF4
	nop                                          // $1AF5
	nop                                          // $1AF6
	nop                                          // $1AF7
	nop                                          // $1AF8
	nop                                          // $1AF9
	nop                                          // $1AFA
	nop                                          // $1AFB
	nop                                          // $1AFC
	nop                                          // $1AFD
	nop                                          // $1AFE
	nop                                          // $1AFF
	lda $43                                      // $1B00
	and #$7f                                     // $1B02
	cmp #$01                                     // $1B04
	.byte $D0, $0E                               // $1B06  bne $1B16
	jsr $737a                                    // $1B08
	lda #$00                                     // $1B0B
	sta $43                                      // $1B0D
	sta $42                                      // $1B0F
	inc $41                                      // $1B11
	jmp $1020                                    // $1B13
	cmp #$02                                     // $1B16
	.byte $D0, $53                               // $1B18  bne $1B6D
	lda $d015                                    // $1B1A  ; VIC_SPEN
	and #$f4                                     // $1B1D
	sta $d015                                    // $1B1F  ; VIC_SPEN
	lda #$00                                     // $1B22
	sta $51                                      // $1B24
	sta $52                                      // $1B26
	nop                                          // $1B28
	nop                                          // $1B29
	sta $28                                      // $1B2A
	sta $42                                      // $1B2C
	sta $43                                      // $1B2E
	lda #$81                                     // $1B30
	sta $d404                                    // $1B32  ; SID_CR1
	sta $d40b                                    // $1B35
	lda #$20                                     // $1B38
	sta $29                                      // $1B3A
	jsr $6c40                                    // $1B3C
	lda $51                                      // $1B3F
	cmp #$06                                     // $1B41
	.byte $F0, $0D                               // $1B43  beq $1B52
	ldx #$1f                                     // $1B45
	ldy #$ff                                     // $1B47
	dey                                          // $1B49
	.byte $D0, $FD                               // $1B4A  bne $1B49
	dex                                          // $1B4C
	.byte $D0, $F8                               // $1B4D  bne $1B47
	jmp $1b3c                                    // $1B4F
	lda #$21                                     // $1B52
	sta $d404                                    // $1B54  ; SID_CR1
	lda #$41                                     // $1B57
	sta $d40b                                    // $1B59
	sta $d412                                    // $1B5C
	lda #$f0                                     // $1B5F
	sta $d015                                    // $1B61  ; VIC_SPEN
	inc $41                                      // $1B64
	lda #$01                                     // $1B66
	sta $26                                      // $1B68
	jmp $1020                                    // $1B6A
	cmp #$04                                     // $1B6D
	.byte $D0, $03                               // $1B6F  bne $1B74
	jmp $1020                                    // $1B71
	cmp #$08                                     // $1B74
	.byte $F0, $03                               // $1B76  beq $1B7B
	jmp $1c97                                    // $1B78
	lda #$81                                     // $1B7B
	sta $d404                                    // $1B7D  ; SID_CR1
	sta $d40b                                    // $1B80
	sta $d412                                    // $1B83
	lda $d002                                    // $1B86  ; VIC_SP1X
	sta $d000                                    // $1B89  ; VIC_SP0X
	lda $d004                                    // $1B8C
	sta $d006                                    // $1B8F
	lda $d003                                    // $1B92  ; VIC_SP1Y
	sta $d001                                    // $1B95  ; VIC_SP0Y
	sta $d007                                    // $1B98
	lda $07fa                                    // $1B9B
	sta $07fb                                    // $1B9E
	lda #$dd                                     // $1BA1
	sta $07f8                                    // $1BA3
	lda #$de                                     // $1BA6
	sta $07fa                                    // $1BA8
	lda $d01c                                    // $1BAB  ; VIC_SPMCOL
	and #$f0                                     // $1BAE
	ora #$0a                                     // $1BB0
	sta $d01c                                    // $1BB2  ; VIC_SPMCOL
	lda #$02                                     // $1BB5
	sta $d028                                    // $1BB7
	sta $d02a                                    // $1BBA
	lda #$07                                     // $1BBD
	sta $d027                                    // $1BBF
	lda #$08                                     // $1BC2
	sta $d029                                    // $1BC4
	lda $d015                                    // $1BC7  ; VIC_SPEN
	ora #$0f                                     // $1BCA
	sta $d015                                    // $1BCC  ; VIC_SPEN
	lda $d017                                    // $1BCF  ; VIC_SPYEXP
	ora #$0f                                     // $1BD2
	sta $d017                                    // $1BD4  ; VIC_SPYEXP
	lda $d01d                                    // $1BD7  ; VIC_SPXEXP
	ora #$0f                                     // $1BDA
	sta $d01d                                    // $1BDC  ; VIC_SPXEXP
	lda $52                                      // $1BDF
	cmp #$03                                     // $1BE1
	.byte $D0, $15                               // $1BE3  bne $1BFA
	lda $50                                      // $1BE5
	cmp #$06                                     // $1BE7
	.byte $B0, $0F                               // $1BE9  bcs $1BFA
	lda $d01b                                    // $1BEB  ; VIC_SPPRI
	ora #$0f                                     // $1BEE
	sta $d01b                                    // $1BF0  ; VIC_SPPRI
	lda #$80                                     // $1BF3
	sta $55                                      // $1BF5
	jmp $1c06                                    // $1BF7
	lda $d01b                                    // $1BFA  ; VIC_SPPRI
	and #$f0                                     // $1BFD
	sta $d01b                                    // $1BFF  ; VIC_SPPRI
	lda #$98                                     // $1C02
	sta $55                                      // $1C04
	lda $07f8                                    // $1C06
	cmp #$dd                                     // $1C09
	.byte $D0, $0F                               // $1C0B  bne $1C1C
	inc $07f8                                    // $1C0D
	inc $d027                                    // $1C10
	dec $07fa                                    // $1C13
	dec $d029                                    // $1C16
	jmp $1c28                                    // $1C19
	dec $07f8                                    // $1C1C
	dec $d027                                    // $1C1F
	inc $07fa                                    // $1C22
	inc $d029                                    // $1C25
	ldx #$14                                     // $1C28
	ldy #$ff                                     // $1C2A
	dey                                          // $1C2C
	.byte $D0, $FD                               // $1C2D  bne $1C2C
	dex                                          // $1C2F
	.byte $D0, $F8                               // $1C30  bne $1C2A
	inc $d001                                    // $1C32  ; VIC_SP0Y
	inc $d003                                    // $1C35  ; VIC_SP1Y
	inc $d005                                    // $1C38
	inc $d007                                    // $1C3B
	lda $d001                                    // $1C3E  ; VIC_SP0Y
	cmp $55                                      // $1C41
	.byte $90, $C1                               // $1C43  bcc $1C06
	lda #$bc                                     // $1C45
	sta $07f8                                    // $1C47
	lda #$bd                                     // $1C4A
	sta $07fa                                    // $1C4C
	lda $07f8                                    // $1C4F
	cmp #$bc                                     // $1C52
	.byte $D0, $0F                               // $1C54  bne $1C65
	inc $07f8                                    // $1C56
	inc $d027                                    // $1C59
	dec $07fa                                    // $1C5C
	dec $d029                                    // $1C5F
	jmp $1c71                                    // $1C62
	dec $07f8                                    // $1C65
	dec $d027                                    // $1C68
	inc $07fa                                    // $1C6B
	inc $d029                                    // $1C6E
	ldx #$1f                                     // $1C71
	ldy #$ff                                     // $1C73
	dey                                          // $1C75
	.byte $D0, $FD                               // $1C76  bne $1C75
	dex                                          // $1C78
	.byte $D0, $F8                               // $1C79  bne $1C73
	inc $50                                      // $1C7B
	.byte $D0, $D0                               // $1C7D  bne $1C4F
	lda #$00                                     // $1C7F
	sta $42                                      // $1C81
	sta $43                                      // $1C83
	inc $41                                      // $1C85
	lda #$21                                     // $1C87
	sta $d404                                    // $1C89  ; SID_CR1
	sta $d40b                                    // $1C8C
	lda #$41                                     // $1C8F
	sta $d412                                    // $1C91
	jmp $1d1f                                    // $1C94
	cmp #$10                                     // $1C97
	.byte $F0, $03                               // $1C99  beq $1C9E
	jmp $1d43                                    // $1C9B
	ldx #$06                                     // $1C9E
	lda $5e28,x                                  // $1CA0
	sta $30,x                                    // $1CA3
	dex                                          // $1CA5
	.byte $10, $F8                               // $1CA6  bpl $1CA0
	nop                                          // $1CA8
	nop                                          // $1CA9
	nop                                          // $1CAA
	lda #$81                                     // $1CAB
	sta $d412                                    // $1CAD
	lda #$00                                     // $1CB0
	sta $50                                      // $1CB2
	sta $53                                      // $1CB4
	lda #$3f                                     // $1CB6
	sta $51                                      // $1CB8
	jsr $6bd5                                    // $1CBA
	lda $53                                      // $1CBD
	cmp #$ff                                     // $1CBF
	.byte $F0, $22                               // $1CC1  beq $1CE5
	lda $dc04                                    // $1CC3
	and #$03                                     // $1CC6
	cmp #$02                                     // $1CC8
	.byte $D0, $0C                               // $1CCA  bne $1CD8
	lda $dc04                                    // $1CCC
	and #$1e                                     // $1CCF
	lsr                                          // $1CD1
	sta $d029                                    // $1CD2
	sta $d02a                                    // $1CD5
	ldx #$08                                     // $1CD8
	ldy #$ff                                     // $1CDA
	dey                                          // $1CDC
	.byte $D0, $FD                               // $1CDD  bne $1CDC
	dex                                          // $1CDF
	.byte $D0, $F8                               // $1CE0  bne $1CDA
	jmp $1cba                                    // $1CE2
	lda #$f0                                     // $1CE5
	sta $d015                                    // $1CE7  ; VIC_SPEN
	ldx #$7f                                     // $1CEA
	lda $2f80,x                                  // $1CEC
	sta $2dc0,x                                  // $1CEF
	dex                                          // $1CF2
	.byte $10, $F7                               // $1CF3  bpl $1CEC
	lda #$41                                     // $1CF5
	sta $d412                                    // $1CF7
	inc $41                                      // $1CFA
	lda #$00                                     // $1CFC
	sta $42                                      // $1CFE
	sta $43                                      // $1D00
	nop                                          // $1D02
	nop                                          // $1D03
	lda $d015                                    // $1D04  ; VIC_SPEN
	and #$f0                                     // $1D07
	sta $d015                                    // $1D09  ; VIC_SPEN
	lda #$00                                     // $1D0C
	sta $33                                      // $1D0E
	lda #$c0                                     // $1D10
	sta $30                                      // $1D12
	sta $34                                      // $1D14
	lda #$5b                                     // $1D16
	sta $31                                      // $1D18
	sta $35                                      // $1D1A
	jmp $1020                                    // $1D1C
	lda #$00                                     // $1D1F
	sta $33                                      // $1D21
	lda #$90                                     // $1D23
	sta $30                                      // $1D25
	sta $34                                      // $1D27
	lda #$55                                     // $1D29
	sta $31                                      // $1D2B
	sta $35                                      // $1D2D
	lda $d015                                    // $1D2F  ; VIC_SPEN
	and #$f0                                     // $1D32
	sta $d015                                    // $1D34  ; VIC_SPEN
	jmp $1020                                    // $1D37
	nop                                          // $1D3A
	nop                                          // $1D3B
	lda #$60                                     // $1D3C
	sta $29                                      // $1D3E
	jmp $1020                                    // $1D40
	cmp #$40                                     // $1D43
	.byte $F0, $03                               // $1D45  beq $1D4A
	jmp $1e02                                    // $1D47
	lda #$00                                     // $1D4A
	sta $33                                      // $1D4C
	lda #$40                                     // $1D4E
	sta $30                                      // $1D50
	sta $34                                      // $1D52
	lda #$5c                                     // $1D54
	sta $31                                      // $1D56
	sta $35                                      // $1D58
	ldx #$07                                     // $1D5A
	lda #$dd                                     // $1D5C
	sta $07f8,x                                  // $1D5E
	lda #$07                                     // $1D61
	sta $d027,x                                  // $1D63
	dex                                          // $1D66
	.byte $10, $F3                               // $1D67  bpl $1D5C
	lda #$00                                     // $1D69
	sta $50                                      // $1D6B
	sta $d01b                                    // $1D6D  ; VIC_SPPRI
	sta $d01c                                    // $1D70  ; VIC_SPMCOL
	sta $d017                                    // $1D73  ; VIC_SPYEXP
	sta $d01d                                    // $1D76  ; VIC_SPXEXP
	lda #$ff                                     // $1D79
	sta $d015                                    // $1D7B  ; VIC_SPEN
	lda #$06                                     // $1D7E
	sta $51                                      // $1D80
	lda $d000                                    // $1D82  ; VIC_SP0X
	sta $52                                      // $1D85
	lda $d001                                    // $1D87  ; VIC_SP0Y
	sta $53                                      // $1D8A
	ldx #$0e                                     // $1D8C
	lda $52                                      // $1D8E
	sta $d000,x                                  // $1D90  ; VIC_SP0X
	lda $53                                      // $1D93
	sta $d001,x                                  // $1D95  ; VIC_SP0Y
	dex                                          // $1D98
	dex                                          // $1D99
	.byte $10, $F2                               // $1D9A  bpl $1D8E
	lda $d012                                    // $1D9C  ; VIC_RASTER
	.byte $D0, $FB                               // $1D9F  bne $1D9C
	inc $d021                                    // $1DA1  ; VIC_BG0
	dec $d001                                    // $1DA4  ; VIC_SP0Y
	inc $d002                                    // $1DA7  ; VIC_SP1X
	dec $d003                                    // $1DAA  ; VIC_SP1Y
	inc $d004                                    // $1DAD
	inc $d006                                    // $1DB0
	inc $d007                                    // $1DB3
	inc $d009                                    // $1DB6
	dec $d00a                                    // $1DB9
	inc $d00b                                    // $1DBC
	dec $d00c                                    // $1DBF
	dec $d00e                                    // $1DC2
	dec $d00f                                    // $1DC5
	ldx #$01                                     // $1DC8
	ldy #$2f                                     // $1DCA
	dey                                          // $1DCC
	.byte $D0, $FD                               // $1DCD  bne $1DCC
	dex                                          // $1DCF
	.byte $D0, $F8                               // $1DD0  bne $1DCA
	lda #$00                                     // $1DD2
	sta $33                                      // $1DD4
	lda $d009                                    // $1DD6
	.byte $D0, $03                               // $1DD9  bne $1DDE
	jmp $1d8c                                    // $1DDB
	dec $50                                      // $1DDE
	.byte $D0, $BA                               // $1DE0  bne $1D9C
	dec $51                                      // $1DE2
	.byte $D0, $B6                               // $1DE4  bne $1D9C
	lda #$00                                     // $1DE6
	sta $d021                                    // $1DE8  ; VIC_BG0
	lda #$21                                     // $1DEB
	sta $d404                                    // $1DED  ; SID_CR1
	sta $d40b                                    // $1DF0
	lda #$41                                     // $1DF3
	sta $d412                                    // $1DF5
	lda #$00                                     // $1DF8
	sta $d015                                    // $1DFA  ; VIC_SPEN
	inc $41                                      // $1DFD
	jmp $1020                                    // $1DFF
	cmp #$20                                     // $1E02
	.byte $D0, $F9                               // $1E04  bne $1DFF
	ldx #$06                                     // $1E06
	lda $5e08,x                                  // $1E08
	sta $30,x                                    // $1E0B
	dex                                          // $1E0D
	.byte $10, $F8                               // $1E0E  bpl $1E08
	lda #$96                                     // $1E10
	sta $07fa                                    // $1E12
	lda #$dd                                     // $1E15
	sta $07f8                                    // $1E17
	lda #$02                                     // $1E1A
	sta $d027                                    // $1E1C
	lda $d015                                    // $1E1F  ; VIC_SPEN
	lda #$fd                                     // $1E22
	sta $d015                                    // $1E24  ; VIC_SPEN
	inc $d005                                    // $1E27
	inc $d001                                    // $1E2A  ; VIC_SP0Y
	lda $d005                                    // $1E2D
	cmp #$84                                     // $1E30
	.byte $90, $03                               // $1E32  bcc $1E37
	jmp $1e50                                    // $1E34
	cmp #$70                                     // $1E37
	.byte $90, $08                               // $1E39  bcc $1E43
	lda $d01b                                    // $1E3B  ; VIC_SPPRI
	and #$fb                                     // $1E3E
	sta $d01b                                    // $1E40  ; VIC_SPPRI
	ldx #$0a                                     // $1E43
	ldy #$ff                                     // $1E45
	dey                                          // $1E47
	.byte $D0, $FD                               // $1E48  bne $1E47
	dex                                          // $1E4A
	.byte $D0, $F8                               // $1E4B  bne $1E45
	jmp $1e27                                    // $1E4D
	lda #$91                                     // $1E50
	sta $07fb                                    // $1E52
	lda #$02                                     // $1E55
	sta $d02a                                    // $1E57
	lda $d01b                                    // $1E5A  ; VIC_SPPRI
	and #$f3                                     // $1E5D
	sta $d01b                                    // $1E5F  ; VIC_SPPRI
	lda $d01c                                    // $1E62  ; VIC_SPMCOL
	and #$f7                                     // $1E65
	sta $d01c                                    // $1E67  ; VIC_SPMCOL
	lda $d017                                    // $1E6A  ; VIC_SPYEXP
	and #$ff                                     // $1E6D
	sta $d017                                    // $1E6F  ; VIC_SPYEXP
	lda $d01d                                    // $1E72  ; VIC_SPXEXP
	and #$ff                                     // $1E75
	sta $d01d                                    // $1E77  ; VIC_SPXEXP
	inc $d007                                    // $1E7A
	lda $d007                                    // $1E7D
	cmp #$a0                                     // $1E80
	.byte $B0, $0D                               // $1E82  bcs $1E91
	ldx #$af                                     // $1E84
	ldy #$ff                                     // $1E86
	dey                                          // $1E88
	.byte $D0, $FD                               // $1E89  bne $1E88
	dex                                          // $1E8B
	.byte $D0, $F8                               // $1E8C  bne $1E86
	jmp $1e7a                                    // $1E8E
	inc $41                                      // $1E91
	lda #$00                                     // $1E93
	sta $43                                      // $1E95
	jmp $1020                                    // $1E97
	nop                                          // $1E9A
	nop                                          // $1E9B
	nop                                          // $1E9C
	nop                                          // $1E9D
	nop                                          // $1E9E
	nop                                          // $1E9F
	nop                                          // $1EA0
	nop                                          // $1EA1
	nop                                          // $1EA2
	nop                                          // $1EA3
	nop                                          // $1EA4
	nop                                          // $1EA5
	nop                                          // $1EA6
	nop                                          // $1EA7
	nop                                          // $1EA8
	nop                                          // $1EA9
	nop                                          // $1EAA
	nop                                          // $1EAB
	nop                                          // $1EAC
	nop                                          // $1EAD
	nop                                          // $1EAE
	nop                                          // $1EAF
	nop                                          // $1EB0
	nop                                          // $1EB1
	nop                                          // $1EB2
	nop                                          // $1EB3
	nop                                          // $1EB4
	nop                                          // $1EB5
	nop                                          // $1EB6
	nop                                          // $1EB7
	nop                                          // $1EB8
	nop                                          // $1EB9
	nop                                          // $1EBA
	nop                                          // $1EBB
	nop                                          // $1EBC
	nop                                          // $1EBD
	nop                                          // $1EBE
	nop                                          // $1EBF
	nop                                          // $1EC0
	nop                                          // $1EC1
	nop                                          // $1EC2
	nop                                          // $1EC3
	nop                                          // $1EC4
	nop                                          // $1EC5
	nop                                          // $1EC6
	nop                                          // $1EC7
	nop                                          // $1EC8
	nop                                          // $1EC9
	nop                                          // $1ECA
	nop                                          // $1ECB
	nop                                          // $1ECC
	nop                                          // $1ECD
	nop                                          // $1ECE
	nop                                          // $1ECF
	nop                                          // $1ED0
	nop                                          // $1ED1
	nop                                          // $1ED2
	nop                                          // $1ED3
	nop                                          // $1ED4
	nop                                          // $1ED5
	nop                                          // $1ED6
	nop                                          // $1ED7
	nop                                          // $1ED8
	nop                                          // $1ED9
	nop                                          // $1EDA
	nop                                          // $1EDB
	nop                                          // $1EDC
	nop                                          // $1EDD
	nop                                          // $1EDE
	nop                                          // $1EDF
	nop                                          // $1EE0
	nop                                          // $1EE1
	nop                                          // $1EE2
	nop                                          // $1EE3
	nop                                          // $1EE4
	nop                                          // $1EE5
	nop                                          // $1EE6
	nop                                          // $1EE7
	nop                                          // $1EE8
	nop                                          // $1EE9
	nop                                          // $1EEA
	nop                                          // $1EEB
	nop                                          // $1EEC
	nop                                          // $1EED
	nop                                          // $1EEE
	nop                                          // $1EEF
	nop                                          // $1EF0
	nop                                          // $1EF1
	nop                                          // $1EF2
	nop                                          // $1EF3
	nop                                          // $1EF4
	nop                                          // $1EF5
	nop                                          // $1EF6
	nop                                          // $1EF7
	nop                                          // $1EF8
	nop                                          // $1EF9
	nop                                          // $1EFA
	nop                                          // $1EFB
	nop                                          // $1EFC
	nop                                          // $1EFD
	nop                                          // $1EFE
	nop                                          // $1EFF
	nop                                          // $1F00
	nop                                          // $1F01
	nop                                          // $1F02
	nop                                          // $1F03
	nop                                          // $1F04
	nop                                          // $1F05
	nop                                          // $1F06
	nop                                          // $1F07
	nop                                          // $1F08
	nop                                          // $1F09
	nop                                          // $1F0A
	nop                                          // $1F0B
	nop                                          // $1F0C
	nop                                          // $1F0D
	nop                                          // $1F0E
	nop                                          // $1F0F
	nop                                          // $1F10
	nop                                          // $1F11
	nop                                          // $1F12
	nop                                          // $1F13
	nop                                          // $1F14
	nop                                          // $1F15
	nop                                          // $1F16
	nop                                          // $1F17
	nop                                          // $1F18
	nop                                          // $1F19
	nop                                          // $1F1A
	nop                                          // $1F1B
	nop                                          // $1F1C
	nop                                          // $1F1D
	nop                                          // $1F1E
	nop                                          // $1F1F
	nop                                          // $1F20
	nop                                          // $1F21
	nop                                          // $1F22
	nop                                          // $1F23
	nop                                          // $1F24
	nop                                          // $1F25
	nop                                          // $1F26
	nop                                          // $1F27
	nop                                          // $1F28
	nop                                          // $1F29
	nop                                          // $1F2A
	nop                                          // $1F2B
	nop                                          // $1F2C
	nop                                          // $1F2D
	nop                                          // $1F2E
	nop                                          // $1F2F
	nop                                          // $1F30
	nop                                          // $1F31
	nop                                          // $1F32
	nop                                          // $1F33
	nop                                          // $1F34
	nop                                          // $1F35
	nop                                          // $1F36
	nop                                          // $1F37
	nop                                          // $1F38
	nop                                          // $1F39
	nop                                          // $1F3A
	nop                                          // $1F3B
	nop                                          // $1F3C
	nop                                          // $1F3D
	nop                                          // $1F3E
	nop                                          // $1F3F
	nop                                          // $1F40
	nop                                          // $1F41
	nop                                          // $1F42
	nop                                          // $1F43
	nop                                          // $1F44
	nop                                          // $1F45
	nop                                          // $1F46
	nop                                          // $1F47
	nop                                          // $1F48
	nop                                          // $1F49
	nop                                          // $1F4A
	nop                                          // $1F4B
	nop                                          // $1F4C
	nop                                          // $1F4D
	nop                                          // $1F4E
	nop                                          // $1F4F
	nop                                          // $1F50
	nop                                          // $1F51
	nop                                          // $1F52
	nop                                          // $1F53
	nop                                          // $1F54
	nop                                          // $1F55
	nop                                          // $1F56
	nop                                          // $1F57
	nop                                          // $1F58
	nop                                          // $1F59
	nop                                          // $1F5A
	nop                                          // $1F5B
	nop                                          // $1F5C
	nop                                          // $1F5D
	nop                                          // $1F5E
	nop                                          // $1F5F
	nop                                          // $1F60
	nop                                          // $1F61
	nop                                          // $1F62
	nop                                          // $1F63
	nop                                          // $1F64
	nop                                          // $1F65
	nop                                          // $1F66
	nop                                          // $1F67
	nop                                          // $1F68
	nop                                          // $1F69
	nop                                          // $1F6A
	nop                                          // $1F6B
	nop                                          // $1F6C
	nop                                          // $1F6D
	nop                                          // $1F6E
	nop                                          // $1F6F
	nop                                          // $1F70
	nop                                          // $1F71
	nop                                          // $1F72
	nop                                          // $1F73
	nop                                          // $1F74
	nop                                          // $1F75
	nop                                          // $1F76
	nop                                          // $1F77
	nop                                          // $1F78
	nop                                          // $1F79
	nop                                          // $1F7A
	nop                                          // $1F7B
	nop                                          // $1F7C
	nop                                          // $1F7D
	nop                                          // $1F7E
	nop                                          // $1F7F
	nop                                          // $1F80
	nop                                          // $1F81
	nop                                          // $1F82
	nop                                          // $1F83
	nop                                          // $1F84
	nop                                          // $1F85
	nop                                          // $1F86
	nop                                          // $1F87
	nop                                          // $1F88
	nop                                          // $1F89
	nop                                          // $1F8A
	nop                                          // $1F8B
	nop                                          // $1F8C
	nop                                          // $1F8D
	nop                                          // $1F8E
	nop                                          // $1F8F
	nop                                          // $1F90
	nop                                          // $1F91
	nop                                          // $1F92
	nop                                          // $1F93
	nop                                          // $1F94
	nop                                          // $1F95
	nop                                          // $1F96
	nop                                          // $1F97
	nop                                          // $1F98
	nop                                          // $1F99
	nop                                          // $1F9A
	nop                                          // $1F9B
	nop                                          // $1F9C
	nop                                          // $1F9D
	nop                                          // $1F9E
	nop                                          // $1F9F
	nop                                          // $1FA0
	nop                                          // $1FA1
	nop                                          // $1FA2
	nop                                          // $1FA3
	nop                                          // $1FA4
	nop                                          // $1FA5
	nop                                          // $1FA6
	nop                                          // $1FA7
	nop                                          // $1FA8
	nop                                          // $1FA9
	nop                                          // $1FAA
	nop                                          // $1FAB
	nop                                          // $1FAC
	nop                                          // $1FAD
	nop                                          // $1FAE
	nop                                          // $1FAF
	nop                                          // $1FB0
	nop                                          // $1FB1
	nop                                          // $1FB2
	nop                                          // $1FB3
	nop                                          // $1FB4
	nop                                          // $1FB5
	nop                                          // $1FB6
	nop                                          // $1FB7
	nop                                          // $1FB8
	nop                                          // $1FB9
	nop                                          // $1FBA
	nop                                          // $1FBB
	nop                                          // $1FBC
	nop                                          // $1FBD
	nop                                          // $1FBE
	nop                                          // $1FBF
	nop                                          // $1FC0
	nop                                          // $1FC1
	nop                                          // $1FC2
	nop                                          // $1FC3
	nop                                          // $1FC4
	nop                                          // $1FC5
	nop                                          // $1FC6
	nop                                          // $1FC7
	nop                                          // $1FC8
	nop                                          // $1FC9
	nop                                          // $1FCA
	nop                                          // $1FCB
	nop                                          // $1FCC
	nop                                          // $1FCD
	nop                                          // $1FCE
	nop                                          // $1FCF
	nop                                          // $1FD0
	nop                                          // $1FD1
	nop                                          // $1FD2
	nop                                          // $1FD3
	nop                                          // $1FD4
	nop                                          // $1FD5
	nop                                          // $1FD6
	nop                                          // $1FD7
	nop                                          // $1FD8
	nop                                          // $1FD9
	nop                                          // $1FDA
	nop                                          // $1FDB
	nop                                          // $1FDC
	nop                                          // $1FDD
	nop                                          // $1FDE
	nop                                          // $1FDF
	nop                                          // $1FE0
	nop                                          // $1FE1
	nop                                          // $1FE2
	nop                                          // $1FE3
	nop                                          // $1FE4
	nop                                          // $1FE5
	nop                                          // $1FE6
	nop                                          // $1FE7
	nop                                          // $1FE8
	nop                                          // $1FE9
	nop                                          // $1FEA
	nop                                          // $1FEB
	nop                                          // $1FEC
	nop                                          // $1FED
	nop                                          // $1FEE
	nop                                          // $1FEF
	nop                                          // $1FF0
	nop                                          // $1FF1
	nop                                          // $1FF2
	nop                                          // $1FF3
	nop                                          // $1FF4
	nop                                          // $1FF5
	nop                                          // $1FF6
	nop                                          // $1FF7
	nop                                          // $1FF8
	nop                                          // $1FF9
	nop                                          // $1FFA
	nop                                          // $1FFB
	nop                                          // $1FFC
	nop                                          // $1FFD
	nop                                          // $1FFE
	nop                                          // $1FFF
	nop                                          // $2000
	nop                                          // $2001
	nop                                          // $2002
	nop                                          // $2003
	nop                                          // $2004
	nop                                          // $2005
	nop                                          // $2006
	nop                                          // $2007
	nop                                          // $2008
	nop                                          // $2009
	nop                                          // $200A
	nop                                          // $200B
	nop                                          // $200C
	nop                                          // $200D
	nop                                          // $200E
	nop                                          // $200F
	nop                                          // $2010
	nop                                          // $2011
	nop                                          // $2012
	nop                                          // $2013
	nop                                          // $2014
	nop                                          // $2015
	nop                                          // $2016
	nop                                          // $2017
	nop                                          // $2018
	nop                                          // $2019
	nop                                          // $201A
	nop                                          // $201B
	nop                                          // $201C
	nop                                          // $201D
	nop                                          // $201E
	nop                                          // $201F
	nop                                          // $2020
	nop                                          // $2021
	nop                                          // $2022
	nop                                          // $2023
	nop                                          // $2024
	nop                                          // $2025
	nop                                          // $2026
	nop                                          // $2027
	nop                                          // $2028
	nop                                          // $2029
	nop                                          // $202A
	nop                                          // $202B
	nop                                          // $202C
	nop                                          // $202D
	nop                                          // $202E
	nop                                          // $202F
	nop                                          // $2030
	nop                                          // $2031
	nop                                          // $2032
	nop                                          // $2033
	nop                                          // $2034
	nop                                          // $2035
	nop                                          // $2036
	nop                                          // $2037
	nop                                          // $2038
	nop                                          // $2039
	nop                                          // $203A
	nop                                          // $203B
	nop                                          // $203C
	nop                                          // $203D
	nop                                          // $203E
	nop                                          // $203F
	nop                                          // $2040
	nop                                          // $2041
	nop                                          // $2042
	nop                                          // $2043
	nop                                          // $2044
	nop                                          // $2045
	nop                                          // $2046
	nop                                          // $2047
	nop                                          // $2048
	nop                                          // $2049
	nop                                          // $204A
	nop                                          // $204B
	nop                                          // $204C
	nop                                          // $204D
	nop                                          // $204E
	nop                                          // $204F
	nop                                          // $2050
	nop                                          // $2051
	nop                                          // $2052
	nop                                          // $2053
	nop                                          // $2054
	nop                                          // $2055
	nop                                          // $2056
	nop                                          // $2057
	nop                                          // $2058
	nop                                          // $2059
	nop                                          // $205A
	nop                                          // $205B
	nop                                          // $205C
	nop                                          // $205D
	nop                                          // $205E
	nop                                          // $205F
	nop                                          // $2060
	nop                                          // $2061
	nop                                          // $2062
	nop                                          // $2063
	nop                                          // $2064
	nop                                          // $2065
	nop                                          // $2066
	nop                                          // $2067
	nop                                          // $2068
	nop                                          // $2069
	nop                                          // $206A
	nop                                          // $206B
	nop                                          // $206C
	nop                                          // $206D
	nop                                          // $206E
	nop                                          // $206F
	nop                                          // $2070
	nop                                          // $2071
	nop                                          // $2072
	nop                                          // $2073
	nop                                          // $2074
	nop                                          // $2075
	nop                                          // $2076
	nop                                          // $2077
	nop                                          // $2078
	nop                                          // $2079
	nop                                          // $207A
	nop                                          // $207B
	nop                                          // $207C
	nop                                          // $207D
	nop                                          // $207E
	nop                                          // $207F
	nop                                          // $2080
	nop                                          // $2081
	nop                                          // $2082
	nop                                          // $2083
	nop                                          // $2084
	nop                                          // $2085
	nop                                          // $2086
	nop                                          // $2087
	nop                                          // $2088
	nop                                          // $2089
	nop                                          // $208A
	nop                                          // $208B
	nop                                          // $208C
	nop                                          // $208D
	nop                                          // $208E
	nop                                          // $208F
	nop                                          // $2090
	nop                                          // $2091
	nop                                          // $2092
	nop                                          // $2093
	nop                                          // $2094
	nop                                          // $2095
	nop                                          // $2096
	nop                                          // $2097
	nop                                          // $2098
	nop                                          // $2099
	nop                                          // $209A
	nop                                          // $209B
	nop                                          // $209C
	nop                                          // $209D
	nop                                          // $209E
	nop                                          // $209F
	nop                                          // $20A0
	nop                                          // $20A1
	nop                                          // $20A2
	nop                                          // $20A3
	nop                                          // $20A4
	nop                                          // $20A5
	nop                                          // $20A6
	nop                                          // $20A7
	nop                                          // $20A8
	nop                                          // $20A9
	nop                                          // $20AA
	nop                                          // $20AB
	nop                                          // $20AC
	nop                                          // $20AD
	nop                                          // $20AE
	nop                                          // $20AF
	nop                                          // $20B0
	nop                                          // $20B1
	nop                                          // $20B2
	nop                                          // $20B3
	nop                                          // $20B4
	nop                                          // $20B5
	nop                                          // $20B6
	nop                                          // $20B7
	nop                                          // $20B8
	nop                                          // $20B9
	nop                                          // $20BA
	nop                                          // $20BB
	nop                                          // $20BC
	nop                                          // $20BD
	nop                                          // $20BE
	nop                                          // $20BF
	nop                                          // $20C0
	nop                                          // $20C1
	nop                                          // $20C2
	nop                                          // $20C3
	nop                                          // $20C4
	nop                                          // $20C5
	nop                                          // $20C6
	nop                                          // $20C7
	nop                                          // $20C8
	nop                                          // $20C9
	nop                                          // $20CA
	nop                                          // $20CB
	nop                                          // $20CC
	nop                                          // $20CD
	nop                                          // $20CE
	nop                                          // $20CF
	nop                                          // $20D0
	nop                                          // $20D1
	nop                                          // $20D2
	nop                                          // $20D3
	nop                                          // $20D4
	nop                                          // $20D5
	nop                                          // $20D6
	nop                                          // $20D7
	nop                                          // $20D8
	nop                                          // $20D9
	nop                                          // $20DA
	nop                                          // $20DB
	nop                                          // $20DC
	nop                                          // $20DD
	nop                                          // $20DE
	nop                                          // $20DF
	nop                                          // $20E0
	nop                                          // $20E1
	nop                                          // $20E2
	nop                                          // $20E3
	nop                                          // $20E4
	nop                                          // $20E5
	nop                                          // $20E6
	nop                                          // $20E7
	nop                                          // $20E8
	nop                                          // $20E9
	nop                                          // $20EA
	nop                                          // $20EB
	nop                                          // $20EC
	nop                                          // $20ED
	nop                                          // $20EE
	nop                                          // $20EF
	nop                                          // $20F0
	nop                                          // $20F1
	nop                                          // $20F2
	nop                                          // $20F3
	nop                                          // $20F4
	nop                                          // $20F5
	nop                                          // $20F6
	nop                                          // $20F7
	nop                                          // $20F8
	nop                                          // $20F9
	nop                                          // $20FA
	nop                                          // $20FB
	nop                                          // $20FC
	nop                                          // $20FD
	nop                                          // $20FE
	nop                                          // $20FF
	nop                                          // $2100
	nop                                          // $2101
	nop                                          // $2102
	nop                                          // $2103
	nop                                          // $2104
	nop                                          // $2105
	nop                                          // $2106
	nop                                          // $2107
	nop                                          // $2108
	nop                                          // $2109
	nop                                          // $210A
	nop                                          // $210B
	nop                                          // $210C
	nop                                          // $210D
	nop                                          // $210E
	nop                                          // $210F
	nop                                          // $2110
	nop                                          // $2111
	nop                                          // $2112
	nop                                          // $2113
	nop                                          // $2114
	nop                                          // $2115
	nop                                          // $2116
	nop                                          // $2117
	nop                                          // $2118
	nop                                          // $2119
	nop                                          // $211A
	nop                                          // $211B
	nop                                          // $211C
	nop                                          // $211D
	nop                                          // $211E
	nop                                          // $211F
	nop                                          // $2120
	nop                                          // $2121
	nop                                          // $2122
	nop                                          // $2123
	nop                                          // $2124
	nop                                          // $2125
	nop                                          // $2126
	nop                                          // $2127
	nop                                          // $2128
	nop                                          // $2129
	nop                                          // $212A
	nop                                          // $212B
	nop                                          // $212C
	nop                                          // $212D
	nop                                          // $212E
	nop                                          // $212F
	nop                                          // $2130
	nop                                          // $2131
	nop                                          // $2132
	nop                                          // $2133
	nop                                          // $2134
	nop                                          // $2135
	nop                                          // $2136
	nop                                          // $2137
	nop                                          // $2138
	nop                                          // $2139
	nop                                          // $213A
	nop                                          // $213B
	nop                                          // $213C
	nop                                          // $213D
	nop                                          // $213E
	nop                                          // $213F
	nop                                          // $2140
	nop                                          // $2141
	nop                                          // $2142
	nop                                          // $2143
	nop                                          // $2144
	nop                                          // $2145
	nop                                          // $2146
	nop                                          // $2147
	nop                                          // $2148
	nop                                          // $2149
	nop                                          // $214A
	nop                                          // $214B
	nop                                          // $214C
	nop                                          // $214D
	nop                                          // $214E
	nop                                          // $214F
	nop                                          // $2150
	nop                                          // $2151
	nop                                          // $2152
	nop                                          // $2153
	nop                                          // $2154
	nop                                          // $2155
	nop                                          // $2156
	nop                                          // $2157
	nop                                          // $2158
	nop                                          // $2159
	nop                                          // $215A
	nop                                          // $215B
	nop                                          // $215C
	nop                                          // $215D
	nop                                          // $215E
	nop                                          // $215F
	nop                                          // $2160
	nop                                          // $2161
	nop                                          // $2162
	nop                                          // $2163
	nop                                          // $2164
	nop                                          // $2165
	nop                                          // $2166
	nop                                          // $2167
	nop                                          // $2168
	nop                                          // $2169
	nop                                          // $216A
	nop                                          // $216B
	nop                                          // $216C
	nop                                          // $216D
	nop                                          // $216E
	nop                                          // $216F
	nop                                          // $2170
	nop                                          // $2171
	nop                                          // $2172
	nop                                          // $2173
	nop                                          // $2174
	nop                                          // $2175
	nop                                          // $2176
	nop                                          // $2177
	nop                                          // $2178
	nop                                          // $2179
	nop                                          // $217A
	nop                                          // $217B
	nop                                          // $217C
	nop                                          // $217D
	nop                                          // $217E
	nop                                          // $217F
	nop                                          // $2180
	nop                                          // $2181
	nop                                          // $2182
	nop                                          // $2183
	nop                                          // $2184
	nop                                          // $2185
	nop                                          // $2186
	nop                                          // $2187
	nop                                          // $2188
	nop                                          // $2189
	nop                                          // $218A
	nop                                          // $218B
	nop                                          // $218C
	nop                                          // $218D
	nop                                          // $218E
	nop                                          // $218F
	nop                                          // $2190
	nop                                          // $2191
	nop                                          // $2192
	nop                                          // $2193
	nop                                          // $2194
	nop                                          // $2195
	nop                                          // $2196
	nop                                          // $2197
	nop                                          // $2198
	nop                                          // $2199
	nop                                          // $219A
	nop                                          // $219B
	nop                                          // $219C
	nop                                          // $219D
	nop                                          // $219E
	nop                                          // $219F
	nop                                          // $21A0
	nop                                          // $21A1
	nop                                          // $21A2
	nop                                          // $21A3
	nop                                          // $21A4
	nop                                          // $21A5
	nop                                          // $21A6
	nop                                          // $21A7
	nop                                          // $21A8
	nop                                          // $21A9
	nop                                          // $21AA
	nop                                          // $21AB
	nop                                          // $21AC
	nop                                          // $21AD
	nop                                          // $21AE
	nop                                          // $21AF
	nop                                          // $21B0
	nop                                          // $21B1
	nop                                          // $21B2
	nop                                          // $21B3
	nop                                          // $21B4
	nop                                          // $21B5
	nop                                          // $21B6
	nop                                          // $21B7
	nop                                          // $21B8
	nop                                          // $21B9
	nop                                          // $21BA
	nop                                          // $21BB
	nop                                          // $21BC
	nop                                          // $21BD
	nop                                          // $21BE
	nop                                          // $21BF
	nop                                          // $21C0
	nop                                          // $21C1
	nop                                          // $21C2
	nop                                          // $21C3
	nop                                          // $21C4
	nop                                          // $21C5
	nop                                          // $21C6
	nop                                          // $21C7
	nop                                          // $21C8
	nop                                          // $21C9
	nop                                          // $21CA
	nop                                          // $21CB
	nop                                          // $21CC
	nop                                          // $21CD
	nop                                          // $21CE
	nop                                          // $21CF
	nop                                          // $21D0
	nop                                          // $21D1
	nop                                          // $21D2
	nop                                          // $21D3
	nop                                          // $21D4
	nop                                          // $21D5
	nop                                          // $21D6
	nop                                          // $21D7
	nop                                          // $21D8
	nop                                          // $21D9
	nop                                          // $21DA
	nop                                          // $21DB
	nop                                          // $21DC
	nop                                          // $21DD
	nop                                          // $21DE
	nop                                          // $21DF
	nop                                          // $21E0
	nop                                          // $21E1
	nop                                          // $21E2
	nop                                          // $21E3
	nop                                          // $21E4
	nop                                          // $21E5
	nop                                          // $21E6
	nop                                          // $21E7
	nop                                          // $21E8
	nop                                          // $21E9
	nop                                          // $21EA
	nop                                          // $21EB
	nop                                          // $21EC
	nop                                          // $21ED
	nop                                          // $21EE
	nop                                          // $21EF
	nop                                          // $21F0
	nop                                          // $21F1
	nop                                          // $21F2
	nop                                          // $21F3
	nop                                          // $21F4
	nop                                          // $21F5
	nop                                          // $21F6
	nop                                          // $21F7
	nop                                          // $21F8
	nop                                          // $21F9
	nop                                          // $21FA
	nop                                          // $21FB
	nop                                          // $21FC
	nop                                          // $21FD
	nop                                          // $21FE
	nop                                          // $21FF
	nop                                          // $2200
	nop                                          // $2201
	nop                                          // $2202
	nop                                          // $2203
	nop                                          // $2204
	nop                                          // $2205
	nop                                          // $2206
	nop                                          // $2207
	nop                                          // $2208
	nop                                          // $2209
	nop                                          // $220A
	nop                                          // $220B
	nop                                          // $220C
	nop                                          // $220D
	nop                                          // $220E
	nop                                          // $220F
	nop                                          // $2210
	nop                                          // $2211
	nop                                          // $2212
	nop                                          // $2213
	nop                                          // $2214
	nop                                          // $2215
	nop                                          // $2216
	nop                                          // $2217
	nop                                          // $2218
	nop                                          // $2219
	nop                                          // $221A
	nop                                          // $221B
	nop                                          // $221C
	nop                                          // $221D
	nop                                          // $221E
	nop                                          // $221F
	nop                                          // $2220
	nop                                          // $2221
	nop                                          // $2222
	nop                                          // $2223
	nop                                          // $2224
	nop                                          // $2225
	nop                                          // $2226
	nop                                          // $2227
	nop                                          // $2228
	nop                                          // $2229
	nop                                          // $222A
	nop                                          // $222B
	nop                                          // $222C
	nop                                          // $222D
	nop                                          // $222E
	nop                                          // $222F
	nop                                          // $2230
	nop                                          // $2231
	nop                                          // $2232
	nop                                          // $2233
	nop                                          // $2234
	nop                                          // $2235
	nop                                          // $2236
	nop                                          // $2237
	nop                                          // $2238
	nop                                          // $2239
	nop                                          // $223A
	nop                                          // $223B
	nop                                          // $223C
	nop                                          // $223D
	nop                                          // $223E
	nop                                          // $223F
	nop                                          // $2240
	nop                                          // $2241
	nop                                          // $2242
	nop                                          // $2243
	nop                                          // $2244
	nop                                          // $2245
	nop                                          // $2246
	nop                                          // $2247
	nop                                          // $2248
	nop                                          // $2249
	nop                                          // $224A
	nop                                          // $224B
	nop                                          // $224C
	nop                                          // $224D
	nop                                          // $224E
	nop                                          // $224F
	nop                                          // $2250
	nop                                          // $2251
	nop                                          // $2252
	nop                                          // $2253
	nop                                          // $2254
	nop                                          // $2255
	nop                                          // $2256
	nop                                          // $2257
	nop                                          // $2258
	nop                                          // $2259
	nop                                          // $225A
	nop                                          // $225B
	nop                                          // $225C
	nop                                          // $225D
	nop                                          // $225E
	nop                                          // $225F
	nop                                          // $2260
	nop                                          // $2261
	nop                                          // $2262
	nop                                          // $2263
	nop                                          // $2264
	nop                                          // $2265
	nop                                          // $2266
	nop                                          // $2267
	nop                                          // $2268
	nop                                          // $2269
	nop                                          // $226A
	nop                                          // $226B
	nop                                          // $226C
	nop                                          // $226D
	nop                                          // $226E
	nop                                          // $226F
	nop                                          // $2270
	nop                                          // $2271
	nop                                          // $2272
	nop                                          // $2273
	nop                                          // $2274
	nop                                          // $2275
	nop                                          // $2276
	nop                                          // $2277
	nop                                          // $2278
	nop                                          // $2279
	nop                                          // $227A
	nop                                          // $227B
	nop                                          // $227C
	nop                                          // $227D
	nop                                          // $227E
	nop                                          // $227F
	nop                                          // $2280
	nop                                          // $2281
	nop                                          // $2282
	nop                                          // $2283
	nop                                          // $2284
	nop                                          // $2285
	nop                                          // $2286
	nop                                          // $2287
	nop                                          // $2288
	nop                                          // $2289
	nop                                          // $228A
	nop                                          // $228B
	nop                                          // $228C
	nop                                          // $228D
	nop                                          // $228E
	nop                                          // $228F
	nop                                          // $2290
	nop                                          // $2291
	nop                                          // $2292
	nop                                          // $2293
	nop                                          // $2294
	nop                                          // $2295
	nop                                          // $2296
	nop                                          // $2297
	nop                                          // $2298
	nop                                          // $2299
	nop                                          // $229A
	nop                                          // $229B
	nop                                          // $229C
	nop                                          // $229D
	nop                                          // $229E
	nop                                          // $229F
	nop                                          // $22A0
	nop                                          // $22A1
	nop                                          // $22A2
	nop                                          // $22A3
	nop                                          // $22A4
	nop                                          // $22A5
	nop                                          // $22A6
	nop                                          // $22A7
	nop                                          // $22A8
	nop                                          // $22A9
	nop                                          // $22AA
	nop                                          // $22AB
	nop                                          // $22AC
	nop                                          // $22AD
	nop                                          // $22AE
	nop                                          // $22AF
	nop                                          // $22B0
	nop                                          // $22B1
	nop                                          // $22B2
	nop                                          // $22B3
	nop                                          // $22B4
	nop                                          // $22B5
	nop                                          // $22B6
	nop                                          // $22B7
	nop                                          // $22B8
	nop                                          // $22B9
	nop                                          // $22BA
	nop                                          // $22BB
	nop                                          // $22BC
	nop                                          // $22BD
	nop                                          // $22BE
	nop                                          // $22BF
	nop                                          // $22C0
	nop                                          // $22C1
	nop                                          // $22C2
	nop                                          // $22C3
	nop                                          // $22C4
	nop                                          // $22C5
	nop                                          // $22C6
	nop                                          // $22C7
	nop                                          // $22C8
	nop                                          // $22C9
	nop                                          // $22CA
	nop                                          // $22CB
	nop                                          // $22CC
	nop                                          // $22CD
	nop                                          // $22CE
	nop                                          // $22CF
	nop                                          // $22D0
	nop                                          // $22D1
	nop                                          // $22D2
	nop                                          // $22D3
	nop                                          // $22D4
	nop                                          // $22D5
	nop                                          // $22D6
	nop                                          // $22D7
	nop                                          // $22D8
	nop                                          // $22D9
	nop                                          // $22DA
	nop                                          // $22DB
	nop                                          // $22DC
	nop                                          // $22DD
	nop                                          // $22DE
	nop                                          // $22DF
	nop                                          // $22E0
	nop                                          // $22E1
	nop                                          // $22E2
	nop                                          // $22E3
	nop                                          // $22E4
	nop                                          // $22E5
	nop                                          // $22E6
	nop                                          // $22E7
	nop                                          // $22E8
	nop                                          // $22E9
	nop                                          // $22EA
	nop                                          // $22EB
	nop                                          // $22EC
	nop                                          // $22ED
	nop                                          // $22EE
	nop                                          // $22EF
	nop                                          // $22F0
	nop                                          // $22F1
	nop                                          // $22F2
	nop                                          // $22F3
	nop                                          // $22F4
	nop                                          // $22F5
	nop                                          // $22F6
	nop                                          // $22F7
	nop                                          // $22F8
	nop                                          // $22F9
	nop                                          // $22FA
	nop                                          // $22FB
	nop                                          // $22FC
	nop                                          // $22FD
	nop                                          // $22FE
	nop                                          // $22FF
	nop                                          // $2300
	nop                                          // $2301
	nop                                          // $2302
	nop                                          // $2303
	nop                                          // $2304
	nop                                          // $2305
	nop                                          // $2306
	nop                                          // $2307
	nop                                          // $2308
	nop                                          // $2309
	nop                                          // $230A
	nop                                          // $230B
	nop                                          // $230C
	nop                                          // $230D
	nop                                          // $230E
	nop                                          // $230F
	nop                                          // $2310
	nop                                          // $2311
	nop                                          // $2312
	nop                                          // $2313
	nop                                          // $2314
	nop                                          // $2315
	nop                                          // $2316
	nop                                          // $2317
	nop                                          // $2318
	nop                                          // $2319
	nop                                          // $231A
	nop                                          // $231B
	nop                                          // $231C
	nop                                          // $231D
	nop                                          // $231E
	nop                                          // $231F
	nop                                          // $2320
	nop                                          // $2321
	nop                                          // $2322
	nop                                          // $2323
	nop                                          // $2324
	nop                                          // $2325
	nop                                          // $2326
	nop                                          // $2327
	nop                                          // $2328
	nop                                          // $2329
	nop                                          // $232A
	nop                                          // $232B
	nop                                          // $232C
	nop                                          // $232D
	nop                                          // $232E
	nop                                          // $232F
	nop                                          // $2330
	nop                                          // $2331
	nop                                          // $2332
	nop                                          // $2333
	nop                                          // $2334
	nop                                          // $2335
	nop                                          // $2336
	nop                                          // $2337
	nop                                          // $2338
	nop                                          // $2339
	nop                                          // $233A
	nop                                          // $233B
	nop                                          // $233C
	nop                                          // $233D
	nop                                          // $233E
	nop                                          // $233F
	nop                                          // $2340
	nop                                          // $2341
	nop                                          // $2342
	nop                                          // $2343
	nop                                          // $2344
	nop                                          // $2345
	nop                                          // $2346
	nop                                          // $2347
	nop                                          // $2348
	nop                                          // $2349
	nop                                          // $234A
	nop                                          // $234B
	nop                                          // $234C
	nop                                          // $234D
	nop                                          // $234E
	nop                                          // $234F
	nop                                          // $2350
	nop                                          // $2351
	nop                                          // $2352
	nop                                          // $2353
	nop                                          // $2354
	nop                                          // $2355
	nop                                          // $2356
	nop                                          // $2357
	nop                                          // $2358
	nop                                          // $2359
	nop                                          // $235A
	nop                                          // $235B
	nop                                          // $235C
	nop                                          // $235D
	nop                                          // $235E
	nop                                          // $235F
	nop                                          // $2360
	nop                                          // $2361
	nop                                          // $2362
	nop                                          // $2363
	nop                                          // $2364
	nop                                          // $2365
	nop                                          // $2366
	nop                                          // $2367
	nop                                          // $2368
	nop                                          // $2369
	nop                                          // $236A
	nop                                          // $236B
	nop                                          // $236C
	nop                                          // $236D
	nop                                          // $236E
	nop                                          // $236F
	nop                                          // $2370
	nop                                          // $2371
	nop                                          // $2372
	nop                                          // $2373
	nop                                          // $2374
	nop                                          // $2375
	nop                                          // $2376
	nop                                          // $2377
	nop                                          // $2378
	nop                                          // $2379
	nop                                          // $237A
	nop                                          // $237B
	nop                                          // $237C
	nop                                          // $237D
	nop                                          // $237E
	nop                                          // $237F
	nop                                          // $2380
	nop                                          // $2381
	nop                                          // $2382
	nop                                          // $2383
	nop                                          // $2384
	nop                                          // $2385
	nop                                          // $2386
	nop                                          // $2387
	nop                                          // $2388
	nop                                          // $2389
	nop                                          // $238A
	nop                                          // $238B
	nop                                          // $238C
	nop                                          // $238D
	nop                                          // $238E
	nop                                          // $238F
	nop                                          // $2390
	nop                                          // $2391
	nop                                          // $2392
	nop                                          // $2393
	nop                                          // $2394
	nop                                          // $2395
	nop                                          // $2396
	nop                                          // $2397
	nop                                          // $2398
	nop                                          // $2399
	nop                                          // $239A
	nop                                          // $239B
	nop                                          // $239C
	nop                                          // $239D
	nop                                          // $239E
	nop                                          // $239F
	nop                                          // $23A0
	nop                                          // $23A1
	nop                                          // $23A2
	nop                                          // $23A3
	nop                                          // $23A4
	nop                                          // $23A5
	nop                                          // $23A6
	nop                                          // $23A7
	nop                                          // $23A8
	nop                                          // $23A9
	nop                                          // $23AA
	nop                                          // $23AB
	nop                                          // $23AC
	nop                                          // $23AD
	nop                                          // $23AE
	nop                                          // $23AF
	nop                                          // $23B0
	nop                                          // $23B1
	nop                                          // $23B2
	nop                                          // $23B3
	nop                                          // $23B4
	nop                                          // $23B5
	nop                                          // $23B6
	nop                                          // $23B7
	nop                                          // $23B8
	nop                                          // $23B9
	nop                                          // $23BA
	nop                                          // $23BB
	nop                                          // $23BC
	nop                                          // $23BD
	nop                                          // $23BE
	nop                                          // $23BF
	nop                                          // $23C0
	nop                                          // $23C1
	nop                                          // $23C2
	nop                                          // $23C3
	nop                                          // $23C4
	nop                                          // $23C5
	nop                                          // $23C6
	nop                                          // $23C7
	nop                                          // $23C8
	nop                                          // $23C9
	nop                                          // $23CA
	nop                                          // $23CB
	nop                                          // $23CC
	nop                                          // $23CD
	nop                                          // $23CE
	nop                                          // $23CF
	nop                                          // $23D0
	nop                                          // $23D1
	nop                                          // $23D2
	nop                                          // $23D3
	nop                                          // $23D4
	nop                                          // $23D5
	nop                                          // $23D6
	nop                                          // $23D7
	nop                                          // $23D8
	nop                                          // $23D9
	nop                                          // $23DA
	nop                                          // $23DB
	nop                                          // $23DC
	nop                                          // $23DD
	nop                                          // $23DE
	nop                                          // $23DF
	nop                                          // $23E0
	nop                                          // $23E1
	nop                                          // $23E2
	nop                                          // $23E3
	nop                                          // $23E4
	nop                                          // $23E5
	nop                                          // $23E6
	nop                                          // $23E7
	nop                                          // $23E8
	nop                                          // $23E9
	nop                                          // $23EA
	nop                                          // $23EB
	nop                                          // $23EC
	nop                                          // $23ED
	nop                                          // $23EE
	nop                                          // $23EF
	nop                                          // $23F0
	nop                                          // $23F1
	nop                                          // $23F2
	nop                                          // $23F3
	nop                                          // $23F4
	nop                                          // $23F5
	nop                                          // $23F6
	nop                                          // $23F7
	nop                                          // $23F8
	nop                                          // $23F9
	nop                                          // $23FA
	nop                                          // $23FB
	nop                                          // $23FC
	nop                                          // $23FD
	nop                                          // $23FE
	nop                                          // $23FF
	nop                                          // $2400
	nop                                          // $2401
	nop                                          // $2402
	nop                                          // $2403
	nop                                          // $2404
	nop                                          // $2405
	nop                                          // $2406
	nop                                          // $2407
	nop                                          // $2408
	nop                                          // $2409
	nop                                          // $240A
	nop                                          // $240B
	nop                                          // $240C
	nop                                          // $240D
	nop                                          // $240E
	nop                                          // $240F
	nop                                          // $2410
	nop                                          // $2411
	nop                                          // $2412
	nop                                          // $2413
	nop                                          // $2414
	nop                                          // $2415
	nop                                          // $2416
	nop                                          // $2417
	nop                                          // $2418
	nop                                          // $2419
	nop                                          // $241A
	nop                                          // $241B
	nop                                          // $241C
	nop                                          // $241D
	nop                                          // $241E
	nop                                          // $241F
	nop                                          // $2420
	nop                                          // $2421
	nop                                          // $2422
	nop                                          // $2423
	nop                                          // $2424
	nop                                          // $2425
	nop                                          // $2426
	nop                                          // $2427
	nop                                          // $2428
	nop                                          // $2429
	nop                                          // $242A
	nop                                          // $242B
	nop                                          // $242C
	nop                                          // $242D
	nop                                          // $242E
	nop                                          // $242F
	nop                                          // $2430
	nop                                          // $2431
	nop                                          // $2432
	nop                                          // $2433
	nop                                          // $2434
	nop                                          // $2435
	nop                                          // $2436
	nop                                          // $2437
	nop                                          // $2438
	nop                                          // $2439
	nop                                          // $243A
	nop                                          // $243B
	nop                                          // $243C
	nop                                          // $243D
	nop                                          // $243E
	nop                                          // $243F
	brk                                          // $2440
	brk                                          // $2441
	brk                                          // $2442
	brk                                          // $2443
	.byte $22                                    // $2444  ???
	brk                                          // $2445
	brk                                          // $2446
	rol $00,x                                    // $2447
	brk                                          // $2449
	.byte $7C                                    // $244A  ???
	brk                                          // $244B
	ora ($fe,x)                                  // $244C
	brk                                          // $244E
	.byte $03                                    // $244F  ???
	.byte $7F                                    // $2450  ???
	brk                                          // $2451
	asl $3f                                      // $2452
	brk                                          // $2454
	.byte $04                                    // $2455  ???
	.byte $7B                                    // $2456  ???
	.byte $80                                    // $2457  ???
	brk                                          // $2458
	adc $01c0,y                                  // $2459
	.byte $F0, $F0                               // $245C  beq $244E
	brk                                          // $245E
	sbc ($60),y                                  // $245F
	ora ($e2,x)                                  // $2461
	.byte $70, $03                               // $2463  bvs $2468
	cpy $78                                      // $2465
	.byte $07                                    // $2467  ???
	.byte $64                                    // $2468  ???
	cpx $200e                                    // $2469
	.byte $44                                    // $246C  ???
	.byte $1A                                    // $246D  ???
	rts                                          // $246E
	cpx $c012                                    // $246F
	ror $34                                      // $2472
	.byte $80                                    // $2474  ???
	.byte $22                                    // $2475  ???
	pla                                          // $2476
	brk                                          // $2477
	.byte $54                                    // $2478  ???
	rti                                          // $2479
	brk                                          // $247A
	.byte $10, $00                               // $247B  bpl $247D
	brk                                          // $247D
	brk                                          // $247E
	brk                                          // $247F
	brk                                          // $2480
	brk                                          // $2481
	brk                                          // $2482
	brk                                          // $2483
	.byte $10, $00                               // $2484  bpl $2486
	brk                                          // $2486
	.byte $30, $00                               // $2487  bmi $2489
	brk                                          // $2489
	sei                                          // $248A
	brk                                          // $248B
	brk                                          // $248C
	.byte $7C                                    // $248D  ???
	brk                                          // $248E
	brk                                          // $248F
	.byte $3C                                    // $2490  ???
	brk                                          // $2491
	brk                                          // $2492
	.byte $7E, $00, $00                          // $2493  ror $0000,x
	.byte $FE, $00, $00                          // $2496  inc $0000,x
	.byte $FF                                    // $2499  ???
	brk                                          // $249A
	ora ($ff,x)                                  // $249B
	brk                                          // $249D
	.byte $03                                    // $249E  ???
	.byte $FF                                    // $249F  ???
	.byte $80                                    // $24A0  ???
	.byte $03                                    // $24A1  ???
	.byte $7C                                    // $24A2  ???
	.byte $80                                    // $24A3  ???
	.byte $02                                    // $24A4  ???
	ror $00,x                                    // $24A5
	brk                                          // $24A7
	.byte $32                                    // $24A8  ???
	brk                                          // $24A9
	brk                                          // $24AA
	.byte $30, $00                               // $24AB  bmi $24AD
	brk                                          // $24AD
	rts                                          // $24AE
	brk                                          // $24AF
	brk                                          // $24B0
	rts                                          // $24B1
	brk                                          // $24B2
	brk                                          // $24B3
	rti                                          // $24B4
	brk                                          // $24B5
	brk                                          // $24B6
	brk                                          // $24B7
	brk                                          // $24B8
	brk                                          // $24B9
	brk                                          // $24BA
	brk                                          // $24BB
	brk                                          // $24BC
	brk                                          // $24BD
	brk                                          // $24BE
	brk                                          // $24BF
	.byte $02                                    // $24C0  ???
	tax                                          // $24C1
	rti                                          // $24C2
	brk                                          // $24C3
	ror                                          // $24C4
	ldy #$00                                     // $24C5
	rol                                          // $24C7
	ldy #$00                                     // $24C8
	.byte $1A                                    // $24CA  ???
	ldy $00                                      // $24CB
	asl                                          // $24CD
	tay                                          // $24CE
	brk                                          // $24CF
	asl $a8                                      // $24D0
	brk                                          // $24D2
	asl                                          // $24D3
	ldy $00                                      // $24D4
	asl $a8                                      // $24D6
	brk                                          // $24D8
	asl                                          // $24D9
	tay                                          // $24DA
	brk                                          // $24DB
	.byte $1A                                    // $24DC  ???
	ldy $00                                      // $24DD
	rol                                          // $24DF
	ldy #$00                                     // $24E0
	ror                                          // $24E2
	ldy #$00                                     // $24E3
	tax                                          // $24E5
	.byte $90, $01                               // $24E6  bcc $24E9
	tax                                          // $24E8
	rti                                          // $24E9
	.byte $02                                    // $24EA  ???
	tax                                          // $24EB
	.byte $80                                    // $24EC  ???
	.byte $02                                    // $24ED  ???
	tax                                          // $24EE
	rti                                          // $24EF
	asl $aa                                      // $24F0
	brk                                          // $24F2
	asl                                          // $24F3
	lda #$00                                     // $24F4
	asl                                          // $24F6
	tay                                          // $24F7
	brk                                          // $24F8
	.byte $1A                                    // $24F9  ???
	ldy $00                                      // $24FA
	brk                                          // $24FC
	brk                                          // $24FD
	brk                                          // $24FE
	brk                                          // $24FF
	brk                                          // $2500
	brk                                          // $2501
	brk                                          // $2502
	brk                                          // $2503
	brk                                          // $2504
	brk                                          // $2505
	asl                                          // $2506
	.byte $80                                    // $2507  ???
	brk                                          // $2508
	rol                                          // $2509
	.byte $90, $00                               // $250A  bcc $250C
	and #$a4                                     // $250C
	brk                                          // $250E
	ldx $a8                                      // $250F
	brk                                          // $2511
	txs                                          // $2512
	ror $00                                      // $2513
	.byte $AE, $A9, $00                          // $2515  ldx $00A9
	adc #$9a                                     // $2518
	.byte $80                                    // $251A  ???
	tax                                          // $251B
	tax                                          // $251C
	.byte $80                                    // $251D  ???
	ror $66                                      // $251E
	rts                                          // $2520
	txa                                          // $2521
	txs                                          // $2522
	.byte $90, $62                               // $2523  bcc $2587
	inc $a0                                      // $2525
	tay                                          // $2527
	tsx                                          // $2528
	ldy #$6a                                     // $2529
	.byte $2F                                    // $252B  ???
	.byte $80                                    // $252C  ???
	tax                                          // $252D
	txa                                          // $252E
	brk                                          // $252F
	tax                                          // $2530
	.byte $80                                    // $2531  ???
	brk                                          // $2532
	ror                                          // $2533
	.byte $80                                    // $2534  ???
	brk                                          // $2535
	rol                                          // $2536
	.byte $80                                    // $2537  ???
	brk                                          // $2538
	.byte $1A                                    // $2539  ???
	ldy #$00                                     // $253A
	brk                                          // $253C
	brk                                          // $253D
	brk                                          // $253E
	brk                                          // $253F
	rol                                          // $2540
	tay                                          // $2541
	brk                                          // $2542
	asl                                          // $2543
	tax                                          // $2544
	brk                                          // $2545
	asl $aa                                      // $2546
	brk                                          // $2548
	asl                                          // $2549
	tax                                          // $254A
	.byte $80                                    // $254B  ???
	asl $aa                                      // $254C
	ldy #$02                                     // $254E
	tax                                          // $2550
	ldy #$01                                     // $2551
	tax                                          // $2553
	tay                                          // $2554
	brk                                          // $2555
	tax                                          // $2556
	tay                                          // $2557
	brk                                          // $2558
	ror                                          // $2559
	tay                                          // $255A
	brk                                          // $255B
	rol                                          // $255C
	tax                                          // $255D
	brk                                          // $255E
	.byte $1A                                    // $255F  ???
	tax                                          // $2560
	brk                                          // $2561
	asl                                          // $2562
	tax                                          // $2563
	brk                                          // $2564
	asl $aa                                      // $2565
	brk                                          // $2567
	.byte $02                                    // $2568  ???
	tax                                          // $2569
	brk                                          // $256A
	ora ($aa,x)                                  // $256B
	brk                                          // $256D
	.byte $02                                    // $256E  ???
	tax                                          // $256F
	brk                                          // $2570
	ora ($aa,x)                                  // $2571
	brk                                          // $2573
	.byte $02                                    // $2574  ???
	tax                                          // $2575
	brk                                          // $2576
	ora ($aa,x)                                  // $2577
	brk                                          // $2579
	.byte $02                                    // $257A  ???
	tax                                          // $257B
	brk                                          // $257C
	brk                                          // $257D
	brk                                          // $257E
	tax                                          // $257F
	brk                                          // $2580
	tax                                          // $2581
	brk                                          // $2582
	.byte $02                                    // $2583  ???
	adc #$80                                     // $2584
	ora #$aa                                     // $2586
	rts                                          // $2588
	rol $aa                                      // $2589
	tya                                          // $258B
	rol                                          // $258C
	adc #$a8                                     // $258D
	and #$aa                                     // $258F
	pla                                          // $2591
	rol $96,x                                    // $2592
	.byte $9C                                    // $2594  ???
	rol                                          // $2595
	adc #$a8                                     // $2596
	and #$aa                                     // $2598
	pla                                          // $259A
	rol $96                                      // $259B
	tya                                          // $259D
	rol                                          // $259E
	adc #$a8                                     // $259F
	ora #$aa                                     // $25A1
	rts                                          // $25A3
	asl                                          // $25A4
	stx $a0,y                                    // $25A5
	asl                                          // $25A7
	adc #$a0                                     // $25A8
	.byte $02                                    // $25AA  ???
	stx $80,y                                    // $25AB
	.byte $02                                    // $25AD  ???
	adc #$80                                     // $25AE
	.byte $02                                    // $25B0  ???
	tax                                          // $25B1
	.byte $80                                    // $25B2  ???
	brk                                          // $25B3
	tax                                          // $25B4
	brk                                          // $25B5
	brk                                          // $25B6
	.byte $BE, $00, $00                          // $25B7  ldx $0000,y
	plp                                          // $25BA
	brk                                          // $25BB
	brk                                          // $25BC
	brk                                          // $25BD
	brk                                          // $25BE
	brk                                          // $25BF
	asl $a9                                      // $25C0
	brk                                          // $25C2
	asl                                          // $25C3
	tay                                          // $25C4
	brk                                          // $25C5
	asl $a4                                      // $25C6
	brk                                          // $25C8
	asl                                          // $25C9
	tay                                          // $25CA
	brk                                          // $25CB
	asl $a4                                      // $25CC
	brk                                          // $25CE
	asl                                          // $25CF
	tay                                          // $25D0
	brk                                          // $25D1
	asl $a4                                      // $25D2
	brk                                          // $25D4
	asl                                          // $25D5
	tax                                          // $25D6
	brk                                          // $25D7
	ora ($a9,x)                                  // $25D8
	brk                                          // $25DA
	.byte $02                                    // $25DB  ???
	tax                                          // $25DC
	rti                                          // $25DD
	ora ($aa,x)                                  // $25DE
	.byte $80                                    // $25E0  ???
	brk                                          // $25E1
	tax                                          // $25E2
	.byte $80                                    // $25E3  ???
	brk                                          // $25E4
	ror                                          // $25E5
	.byte $90, $00                               // $25E6  bcc $25E8
	rol                                          // $25E8
	ldy #$00                                     // $25E9
	.byte $1A                                    // $25EB  ???
	ldy $00                                      // $25EC
	asl                                          // $25EE
	tay                                          // $25EF
	brk                                          // $25F0
	asl $a4                                      // $25F1
	brk                                          // $25F3
	asl                                          // $25F4
	tay                                          // $25F5
	brk                                          // $25F6
	asl $a9                                      // $25F7
	brk                                          // $25F9
	asl                                          // $25FA
	tax                                          // $25FB
	brk                                          // $25FC
	brk                                          // $25FD
	brk                                          // $25FE
	tax                                          // $25FF
	.byte $54                                    // $2600  ???
	brk                                          // $2601
	brk                                          // $2602
	eor $00,x                                    // $2603
	brk                                          // $2605
	ora $50,x                                    // $2606
	brk                                          // $2608
	ora $54                                      // $2609
	brk                                          // $260B
	ora ($55,x)                                  // $260C
	brk                                          // $260E
	ora ($55,x)                                  // $260F
	rti                                          // $2611
	brk                                          // $2612
	eor $57,x                                    // $2613
	brk                                          // $2615
	eor $5f,x                                    // $2616
	brk                                          // $2618
	ora $7c,x                                    // $2619
	brk                                          // $261B
	ora $f3,x                                    // $261C
	brk                                          // $261E
	.byte $07                                    // $261F  ???
	.byte $CF                                    // $2620  ???
	brk                                          // $2621
	.byte $0F                                    // $2622  ???
	.byte $3F                                    // $2623  ???
	brk                                          // $2624
	.byte $33                                    // $2625  ???
	.byte $FF                                    // $2626  ???
	brk                                          // $2627
	.byte $CF                                    // $2628  ???
	.byte $FF                                    // $2629  ???
	.byte $03                                    // $262A  ???
	.byte $FF                                    // $262B  ???
	.byte $FF                                    // $262C  ???
	asl $ffbf                                    // $262D
	ora ($6f,x)                                  // $2630
	.byte $FF                                    // $2632  ???
	.byte $CF                                    // $2633  ???
	.byte $5B                                    // $2634  ???
	.byte $FF                                    // $2635  ???
	.byte $3F                                    // $2636  ???
	lsr $ff,x                                    // $2637
	.byte $3F                                    // $2639  ???
	cmp $bf,x                                    // $263A
	.byte $3F                                    // $263C  ???
	cmp $08,x                                    // $263D
	.byte $FF                                    // $263F  ???
	brk                                          // $2640
	.byte $42                                    // $2641  ???
	brk                                          // $2642
	ora ($52,x)                                  // $2643
	.byte $80                                    // $2645  ???
	ora $5a                                      // $2646
	brk                                          // $2648
	ora $5a                                      // $2649
	ldy $5635                                    // $264B
	ldy $5af5                                    // $264E
	.byte $AF                                    // $2651  ???
	and $6a,x                                    // $2652
	.byte $AB                                    // $2654  ???
	cmp $5a,x                                    // $2655
	.byte $AB                                    // $2657  ???
	sbc $56,x                                    // $2658
	.byte $AF                                    // $265A  ???
	sbc $56,x                                    // $265B
	.byte $AB                                    // $265D  ???
	cmp $5a,x                                    // $265E
	.byte $AF                                    // $2660  ???
	cmp $5a,x                                    // $2661
	.byte $AB                                    // $2663  ???
	sbc $56,x                                    // $2664
	.byte $AF                                    // $2666  ???
	cmp $56,x                                    // $2667
	.byte $AF                                    // $2669  ???
	sbc $5a,x                                    // $266A
	.byte $AB                                    // $266C  ???
	cmp $5a,x                                    // $266D
	.byte $AB                                    // $266F  ???
	cmp $6a,x                                    // $2670
	.byte $AF                                    // $2672  ???
	sbc $5a,x                                    // $2673
	.byte $AF                                    // $2675  ???
	sbc $56,x                                    // $2676
	.byte $AB                                    // $2678  ???
	cmp $5a,x                                    // $2679
	.byte $AB                                    // $267B  ???
	cmp $5a,x                                    // $267C
	.byte $AB                                    // $267E  ???
	.byte $FF                                    // $267F  ???
	brk                                          // $2680
	brk                                          // $2681
	ora $00,x                                    // $2682
	brk                                          // $2684
	eor $00,x                                    // $2685
	ora ($54,x)                                  // $2687
	brk                                          // $2689
	ora $54                                      // $268A
	brk                                          // $268C
	ora $50,x                                    // $268D
	brk                                          // $268F
	eor $50,x                                    // $2690
	cmp ($55,x)                                  // $2692
	rti                                          // $2694
	sbc $55,x                                    // $2695
	rti                                          // $2697
	.byte $FD, $55, $00                          // $2698  sbc $0055,x
	.byte $F3                                    // $269B  ???
	eor $00,x                                    // $269C
	.byte $FC                                    // $269E  ???
	.byte $F4                                    // $269F  ???
	brk                                          // $26A0
	.byte $FF                                    // $26A1  ???
	.byte $3C                                    // $26A2  ???
	brk                                          // $26A3
	.byte $FF                                    // $26A4  ???
	.byte $CF                                    // $26A5  ???
	brk                                          // $26A6
	.byte $FF                                    // $26A7  ???
	.byte $F3                                    // $26A8  ???
	cpy #$ff                                     // $26A9
	.byte $FF                                    // $26AB  ???
	.byte $F0, $FF                               // $26AC  beq $26AD
	inc $ffbc,x                                  // $26AE
	sbc $ff7f,y                                  // $26B1
	sbc $7f                                      // $26B4
	.byte $FF                                    // $26B6  ???
	sta $ff,x                                    // $26B7
	inc $fc55,x                                  // $26B9
	sec                                          // $26BC
	brk                                          // $26BD
	.byte $FC                                    // $26BE  ???
	.byte $FF                                    // $26BF  ???
	.byte $FF                                    // $26C0  ???
	cmp $1f,x                                    // $26C1
	.byte $FF                                    // $26C3  ???
	sbc $15,x                                    // $26C4
	.byte $3F                                    // $26C6  ???
	sbc $15,x                                    // $26C7
	.byte $3F                                    // $26C9  ???
	sbc $15,x                                    // $26CA
	.byte $CF                                    // $26CC  ???
	sbc $f357,x                                  // $26CD
	sbc $0f5f,x                                  // $26D0
	.byte $FF                                    // $26D3  ???
	.byte $7F                                    // $26D4  ???
	.byte $33                                    // $26D5  ???
	.byte $FF                                    // $26D6  ???
	.byte $FF                                    // $26D7  ???
	.byte $0F                                    // $26D8  ???
	.byte $FF                                    // $26D9  ???
	sbc $ff0c,x                                  // $26DA
	sbc $3f03,x                                  // $26DD
	.byte $FC                                    // $26E0  ???
	brk                                          // $26E1
	.byte $CF                                    // $26E2  ???
	inc $f300,x                                  // $26E3
	.byte $FA                                    // $26E6  ???
	brk                                          // $26E7
	.byte $0F                                    // $26E8  ???
	.byte $FA                                    // $26E9  ???
	brk                                          // $26EA
	.byte $33                                    // $26EB  ???
	nop                                          // $26EC
	brk                                          // $26ED
	.byte $0F                                    // $26EE  ???
	nop                                          // $26EF
	brk                                          // $26F0
	.byte $03                                    // $26F1  ???
	txa                                          // $26F2
	brk                                          // $26F3
	.byte $0F                                    // $26F4  ???
	tax                                          // $26F5
	brk                                          // $26F6
	.byte $02                                    // $26F7  ???
	rol                                          // $26F8
	brk                                          // $26F9
	.byte $02                                    // $26FA  ???
	lda #$00                                     // $26FB
	brk                                          // $26FD
	tax                                          // $26FE
	.byte $FF                                    // $26FF  ???
	cmp $6a,x                                    // $2700
	.byte $AF                                    // $2702  ???
	sbc $5a,x                                    // $2703
	.byte $AB                                    // $2705  ???
	sbc $56,x                                    // $2706
	.byte $AF                                    // $2708  ???
	cmp $56,x                                    // $2709
	.byte $AF                                    // $270B  ???
	sbc $6a,x                                    // $270C
	ldx $6ad5                                    // $270E
	.byte $AF                                    // $2711  ???
	cmp $5a,x                                    // $2712
	.byte $AB                                    // $2714  ???
	eor $56,x                                    // $2715
	tax                                          // $2717
	eor $4a                                      // $2718
	.byte $82                                    // $271A  ???
	and ($22,x)                                  // $271B
	plp                                          // $271D
	tay                                          // $271E
	tay                                          // $271F
	tax                                          // $2720
	tax                                          // $2721
	tax                                          // $2722
	tax                                          // $2723
	tax                                          // $2724
	tax                                          // $2725
	tax                                          // $2726
	tax                                          // $2727
	tax                                          // $2728
	tax                                          // $2729
	ldx $aa                                      // $272A
	ror $95                                      // $272C
	lda #$55                                     // $272E
	eor $aa,x                                    // $2730
	eor $56,x                                    // $2732
	tax                                          // $2734
	sta $5a,x                                    // $2735
	tax                                          // $2737
	lda $6a                                      // $2738
	tax                                          // $273A
	tax                                          // $273B
	tax                                          // $273C
	tax                                          // $273D
	tax                                          // $273E
	.byte $FF                                    // $273F  ???
	.byte $F4                                    // $2740  ???
	.byte $57                                    // $2741  ???
	.byte $FF                                    // $2742  ???
	cpx $57                                      // $2743
	.byte $FF                                    // $2745  ???
	.byte $54                                    // $2746  ???
	.byte $5F                                    // $2747  ???
	.byte $FC                                    // $2748  ???
	.byte $54                                    // $2749  ???
	.byte $5F                                    // $274A  ???
	.byte $F0, $D5                               // $274B  beq $2722
	.byte $7F                                    // $274D  ???
	.byte $FF                                    // $274E  ???
	sbc $7f,x                                    // $274F
	.byte $F3                                    // $2751  ???
	sbc $ccff,x                                  // $2752
	.byte $FF                                    // $2755  ???
	.byte $FF                                    // $2756  ???
	.byte $F0, $FF                               // $2757  beq $2758
	.byte $FF                                    // $2759  ???
	.byte $30, $BF                               // $275A  bmi $271B
	.byte $FF                                    // $275C  ???
	cpy #$bf                                     // $275D
	.byte $FC                                    // $275F  ???
	cpy #$bf                                     // $2760
	.byte $FF                                    // $2762  ???
	brk                                          // $2763
	.byte $AF                                    // $2764  ???
	.byte $F3                                    // $2765  ???
	brk                                          // $2766
	.byte $AF                                    // $2767  ???
	.byte $FF                                    // $2768  ???
	brk                                          // $2769
	.byte $AB                                    // $276A  ???
	.byte $F0, $00                               // $276B  beq $276D
	.byte $AB                                    // $276D  ???
	.byte $FC                                    // $276E  ???
	brk                                          // $276F
	ror                                          // $2770
	.byte $F0, $00                               // $2771  beq $2773
	.byte $5A                                    // $2773  ???
	.byte $F0, $00                               // $2774  beq $2776
	ror                                          // $2776
	.byte $80                                    // $2777  ???
	brk                                          // $2778
	tax                                          // $2779
	.byte $80                                    // $277A  ???
	brk                                          // $277B
	tax                                          // $277C
	.byte $80                                    // $277D  ???
	brk                                          // $277E
	.byte $FF                                    // $277F  ???
	.byte $22                                    // $2780  ???
	tax                                          // $2781
	tax                                          // $2782
	tax                                          // $2783
	tax                                          // $2784
	tax                                          // $2785
	tsx                                          // $2786
	tax                                          // $2787
	ldy #$aa                                     // $2788
	tax                                          // $278A
	.byte $80                                    // $278B  ???
	.byte $FA                                    // $278C  ???
	ldx $ea00                                    // $278D
	.byte $BF                                    // $2790  ???
	brk                                          // $2791
	tsx                                          // $2792
	.byte $BF                                    // $2793  ???
	rti                                          // $2794
	tax                                          // $2795
	.byte $8F                                    // $2796  ???
	.byte $D0, $3A                               // $2797  bne $27D3
	.byte $83                                    // $2799  ???
	.byte $F4                                    // $279A  ???
	rol $ffa0                                    // $279B
	asl                                          // $279E
	tay                                          // $279F
	.byte $0F                                    // $27A0  ???
	asl                                          // $27A1
	tax                                          // $27A2
	brk                                          // $27A3
	asl $80aa                                    // $27A4
	asl                                          // $27A7
	tax                                          // $27A8
	ldy #$02                                     // $27A9
	tax                                          // $27AB
	brk                                          // $27AC
	.byte $02                                    // $27AD  ???
	tax                                          // $27AE
	brk                                          // $27AF
	brk                                          // $27B0
	tax                                          // $27B1
	.byte $80                                    // $27B2  ???
	brk                                          // $27B3
	tax                                          // $27B4
	ldy #$00                                     // $27B5
	rol                                          // $27B7
	.byte $80                                    // $27B8  ???
	brk                                          // $27B9
	asl                                          // $27BA
	brk                                          // $27BB
	brk                                          // $27BC
	brk                                          // $27BD
	brk                                          // $27BE
	.byte $FF                                    // $27BF  ???
	tax                                          // $27C0
	tax                                          // $27C1
	.byte $AF                                    // $27C2  ???
	tax                                          // $27C3
	tax                                          // $27C4
	.byte $AB                                    // $27C5  ???
	asl                                          // $27C6
	tax                                          // $27C7
	ldx $aa02                                    // $27C8
	tax                                          // $27CB
	.byte $03                                    // $27CC  ???
	ldx $07af                                    // $27CD
	inc $1fab,x                                  // $27D0
	inc $7fae,x                                  // $27D3
	dex                                          // $27D6
	tax                                          // $27D7
	.byte $FF                                    // $27D8  ???
	asl                                          // $27D9
	.byte $AB                                    // $27DA  ???
	.byte $F0, $EA                               // $27DB  beq $27C7
	tay                                          // $27DD
	cpy #$aa                                     // $27DE
	ldy #$02                                     // $27E0
	tax                                          // $27E2
	.byte $B0, $0A                               // $27E3  bcs $27EF
	tax                                          // $27E5
	ldy #$2a                                     // $27E6
	tax                                          // $27E8
	ldy #$02                                     // $27E9
	tax                                          // $27EB
	.byte $80                                    // $27EC  ???
	brk                                          // $27ED
	tax                                          // $27EE
	.byte $80                                    // $27EF  ???
	.byte $02                                    // $27F0  ???
	tax                                          // $27F1
	brk                                          // $27F2
	asl                                          // $27F3
	tax                                          // $27F4
	brk                                          // $27F5
	.byte $02                                    // $27F6  ???
	tay                                          // $27F7
	brk                                          // $27F8
	brk                                          // $27F9
	ldy #$00                                     // $27FA
	brk                                          // $27FC
	brk                                          // $27FD
	brk                                          // $27FE
	.byte $FF                                    // $27FF  ???
	brk                                          // $2800
	brk                                          // $2801
	brk                                          // $2802
	brk                                          // $2803
	brk                                          // $2804
	brk                                          // $2805
	brk                                          // $2806
	brk                                          // $2807
	brk                                          // $2808
	brk                                          // $2809
	.byte $03                                    // $280A  ???
	cpy #$00                                     // $280B
	.byte $0D, $F2, $00                          // $280D  ora $00F2
	and $7a,x                                    // $2810
	brk                                          // $2812
	.byte $D0, $EA                               // $2813  bne $27FF
	brk                                          // $2815
	brk                                          // $2816
	rol                                          // $2817
	brk                                          // $2818
	brk                                          // $2819
	.byte $3B                                    // $281A  ???
	brk                                          // $281B
	brk                                          // $281C
	php                                          // $281D
	brk                                          // $281E
	brk                                          // $281F
	brk                                          // $2820
	brk                                          // $2821
	brk                                          // $2822
	brk                                          // $2823
	brk                                          // $2824
	brk                                          // $2825
	brk                                          // $2826
	brk                                          // $2827
	brk                                          // $2828
	brk                                          // $2829
	brk                                          // $282A
	brk                                          // $282B
	brk                                          // $282C
	brk                                          // $282D
	brk                                          // $282E
	brk                                          // $282F
	brk                                          // $2830
	brk                                          // $2831
	brk                                          // $2832
	brk                                          // $2833
	brk                                          // $2834
	brk                                          // $2835
	brk                                          // $2836
	brk                                          // $2837
	brk                                          // $2838
	brk                                          // $2839
	brk                                          // $283A
	brk                                          // $283B
	brk                                          // $283C
	brk                                          // $283D
	brk                                          // $283E
	brk                                          // $283F
	brk                                          // $2840
	brk                                          // $2841
	brk                                          // $2842
	brk                                          // $2843
	brk                                          // $2844
	brk                                          // $2845
	brk                                          // $2846
	brk                                          // $2847
	brk                                          // $2848
	.byte $0C                                    // $2849  ???
	brk                                          // $284A
	brk                                          // $284B
	.byte $BF                                    // $284C  ???
	brk                                          // $284D
	brk                                          // $284E
	cmp $c0,x                                    // $284F
	brk                                          // $2851
	rts                                          // $2852
	.byte $70, $00                               // $2853  bvs $2855
	tay                                          // $2855
	.byte $1C                                    // $2856  ???
	brk                                          // $2857
	tay                                          // $2858
	brk                                          // $2859
	brk                                          // $285A
	plp                                          // $285B
	.byte $80                                    // $285C  ???
	brk                                          // $285D
	asl                                          // $285E
	brk                                          // $285F
	brk                                          // $2860
	brk                                          // $2861
	brk                                          // $2862
	brk                                          // $2863
	brk                                          // $2864
	brk                                          // $2865
	brk                                          // $2866
	brk                                          // $2867
	brk                                          // $2868
	brk                                          // $2869
	brk                                          // $286A
	brk                                          // $286B
	brk                                          // $286C
	brk                                          // $286D
	brk                                          // $286E
	brk                                          // $286F
	brk                                          // $2870
	brk                                          // $2871
	brk                                          // $2872
	brk                                          // $2873
	brk                                          // $2874
	brk                                          // $2875
	brk                                          // $2876
	brk                                          // $2877
	brk                                          // $2878
	brk                                          // $2879
	brk                                          // $287A
	brk                                          // $287B
	brk                                          // $287C
	brk                                          // $287D
	brk                                          // $287E
	brk                                          // $287F
	brk                                          // $2880
	brk                                          // $2881
	brk                                          // $2882
	brk                                          // $2883
	brk                                          // $2884
	brk                                          // $2885
	brk                                          // $2886
	brk                                          // $2887
	asl                                          // $2888
	brk                                          // $2889
	.byte $3C                                    // $288A  ???
	rol                                          // $288B
	brk                                          // $288C
	.byte $FF                                    // $288D  ???
	tax                                          // $288E
	brk                                          // $288F
	.byte $57                                    // $2890  ???
	.byte $EB                                    // $2891  ???
	.byte $03                                    // $2892  ???
	eor $6a,x                                    // $2893
	ora ($41,x)                                  // $2895
	tax                                          // $2897
	ora $6a00                                    // $2898
	.byte $04                                    // $289B  ???
	brk                                          // $289C
	nop                                          // $289D
	.byte $F0, $00                               // $289E  beq $28A0
	rol                                          // $28A0
	brk                                          // $28A1
	brk                                          // $28A2
	.byte $3B                                    // $28A3  ???
	brk                                          // $28A4
	brk                                          // $28A5
	rol                                          // $28A6
	brk                                          // $28A7
	brk                                          // $28A8
	php                                          // $28A9
	brk                                          // $28AA
	brk                                          // $28AB
	php                                          // $28AC
	brk                                          // $28AD
	brk                                          // $28AE
	brk                                          // $28AF
	brk                                          // $28B0
	brk                                          // $28B1
	brk                                          // $28B2
	brk                                          // $28B3
	brk                                          // $28B4
	brk                                          // $28B5
	brk                                          // $28B6
	brk                                          // $28B7
	brk                                          // $28B8
	brk                                          // $28B9
	brk                                          // $28BA
	brk                                          // $28BB
	brk                                          // $28BC
	brk                                          // $28BD
	brk                                          // $28BE
	brk                                          // $28BF
	brk                                          // $28C0
	brk                                          // $28C1
	brk                                          // $28C2
	brk                                          // $28C3
	brk                                          // $28C4
	brk                                          // $28C5
	.byte $0F                                    // $28C6  ???
	brk                                          // $28C7
	brk                                          // $28C8
	.byte $BF                                    // $28C9  ???
	cpy #$00                                     // $28CA
	cmp $f0,x                                    // $28CC
	brk                                          // $28CE
	eor $5c,x                                    // $28CF
	brk                                          // $28D1
	adc #$57                                     // $28D2
	brk                                          // $28D4
	tax                                          // $28D5
	ora $c0,x                                    // $28D6
	ror                                          // $28D8
	ora ($70,x)                                  // $28D9
	nop                                          // $28DB
	brk                                          // $28DC
	brk                                          // $28DD
	tax                                          // $28DE
	dey                                          // $28DF
	brk                                          // $28E0
	tax                                          // $28E1
	.byte $82                                    // $28E2  ???
	.byte $80                                    // $28E3  ???
	rol                                          // $28E4
	ldy #$80                                     // $28E5
	asl                                          // $28E7
	ldy #$80                                     // $28E8
	.byte $02                                    // $28EA  ???
	tax                                          // $28EB
	.byte $80                                    // $28EC  ???
	brk                                          // $28ED
	tax                                          // $28EE
	brk                                          // $28EF
	brk                                          // $28F0
	plp                                          // $28F1
	brk                                          // $28F2
	brk                                          // $28F3
	brk                                          // $28F4
	brk                                          // $28F5
	brk                                          // $28F6
	brk                                          // $28F7
	brk                                          // $28F8
	brk                                          // $28F9
	brk                                          // $28FA
	brk                                          // $28FB
	brk                                          // $28FC
	brk                                          // $28FD
	brk                                          // $28FE
	brk                                          // $28FF
	brk                                          // $2900
	cpy #$0f                                     // $2901
	brk                                          // $2903
	.byte $F0, $35                               // $2904  beq $293B
	brk                                          // $2906
	.byte $FC                                    // $2907  ???
	cmp $00,x                                    // $2908
	.byte $FF                                    // $290A  ???
	eor $00,x                                    // $290B
	.byte $FD, $55, $00                          // $290D  sbc $0055,x
	sbc $55,x                                    // $2910
	.byte $10, $D5                               // $2912  bpl $28E9
	lsr $04,x                                    // $2914
	sbc #$6a                                     // $2916
	ora ($aa,x)                                  // $2918
	tax                                          // $291A
	.byte $02                                    // $291B  ???
	tax                                          // $291C
	tax                                          // $291D
	.byte $02                                    // $291E  ???
	tax                                          // $291F
	tax                                          // $2920
	.byte $0B                                    // $2921  ???
	tax                                          // $2922
	tax                                          // $2923
	asl                                          // $2924
	tay                                          // $2925
	rol                                          // $2926
	rol                                          // $2927
	ldy #$0a                                     // $2928
	rol                                          // $292A
	ldy #$02                                     // $292B
	ldy $a0                                      // $292D
	brk                                          // $292F
	.byte $90, $80                               // $2930  bcc $28B2
	brk                                          // $2932
	.byte $82                                    // $2933  ???
	brk                                          // $2934
	brk                                          // $2935
	.byte $02                                    // $2936  ???
	brk                                          // $2937
	brk                                          // $2938
	php                                          // $2939
	brk                                          // $293A
	brk                                          // $293B
	brk                                          // $293C
	brk                                          // $293D
	brk                                          // $293E
	.byte $FF                                    // $293F  ???
	.byte $FF                                    // $2940  ???
	.byte $FF                                    // $2941  ???
	cpy #$55                                     // $2942
	.byte $7F                                    // $2944  ???
	.byte $F0, $55                               // $2945  beq $299C
	.byte $57                                    // $2947  ???
	.byte $FC                                    // $2948  ???
	eor $00,x                                    // $2949
	.byte $3C                                    // $294B  ???
	.byte $50, $00                               // $294C  bvc $294E
	.byte $0F                                    // $294E  ???
	rts                                          // $294F
	.byte $02                                    // $2950  ???
	.byte $80                                    // $2951  ???
	ldy $00                                      // $2952
	ldy #$a4                                     // $2954
	brk                                          // $2956
	plp                                          // $2957
	lda #$00                                     // $2958
	clc                                          // $295A
	lda #$00                                     // $295B
	plp                                          // $295D
	tax                                          // $295E
	rti                                          // $295F
	pla                                          // $2960
	tax                                          // $2961
	.byte $90, $A8                               // $2962  bcc $290C
	tax                                          // $2964
	lda #$a0                                     // $2965
	tax                                          // $2967
	tax                                          // $2968
	ldy #$aa                                     // $2969
	tax                                          // $296B
	.byte $80                                    // $296C  ???
	tax                                          // $296D
	tax                                          // $296E
	.byte $80                                    // $296F  ???
	rol                                          // $2970
	tax                                          // $2971
	brk                                          // $2972
	asl                                          // $2973
	tay                                          // $2974
	brk                                          // $2975
	.byte $02                                    // $2976  ???
	ldy #$00                                     // $2977
	brk                                          // $2979
	brk                                          // $297A
	brk                                          // $297B
	brk                                          // $297C
	brk                                          // $297D
	brk                                          // $297E
	.byte $FF                                    // $297F  ???
	brk                                          // $2980
	brk                                          // $2981
	brk                                          // $2982
	brk                                          // $2983
	brk                                          // $2984
	brk                                          // $2985
	brk                                          // $2986
	brk                                          // $2987
	.byte $0F                                    // $2988  ???
	brk                                          // $2989
	rol                                          // $298A
	.byte $3F                                    // $298B  ???
	brk                                          // $298C
	.byte $AB                                    // $298D  ???
	sbc $ab02,x                                  // $298E
	sbc $af02,x                                  // $2991
	sbc $0a,x                                    // $2994
	.byte $AF                                    // $2996  ???
	sbc ($0a,x)                                  // $2997
	.byte $BF                                    // $2999  ???
	cpx #$0a                                     // $299A
	.byte $3F                                    // $299C  ???
	ldy #$0a                                     // $299D
	inc $08a2,x                                  // $299F
	inc $2baa,x                                  // $29A2
	.byte $FA                                    // $29A5  ???
	tax                                          // $29A6
	.byte $2B                                    // $29A7  ???
	.byte $C2                                    // $29A8  ???
	tax                                          // $29A9
	.byte $AF                                    // $29AA  ???
	.byte $C2                                    // $29AB  ???
	tax                                          // $29AC
	.byte $0F                                    // $29AD  ???
	.byte $02                                    // $29AE  ???
	tax                                          // $29AF
	.byte $3F                                    // $29B0  ???
	brk                                          // $29B1
	tax                                          // $29B2
	.byte $3C                                    // $29B3  ???
	brk                                          // $29B4
	tax                                          // $29B5
	.byte $F0, $00                               // $29B6  beq $29B8
	rol                                          // $29B8
	brk                                          // $29B9
	brk                                          // $29BA
	asl                                          // $29BB
	brk                                          // $29BC
	brk                                          // $29BD
	brk                                          // $29BE
	.byte $FF                                    // $29BF  ???
	brk                                          // $29C0
	.byte $3C                                    // $29C1  ???
	brk                                          // $29C2
	cpy #$f4                                     // $29C3
	brk                                          // $29C5
	.byte $F3                                    // $29C6  ???
	.byte $D7                                    // $29C7  ???
	brk                                          // $29C8
	.byte $7F                                    // $29C9  ???
	cmp $00,x                                    // $29CA
	lsr $c095,x                                  // $29CC
	lsr $40a5,x                                  // $29CF
	.byte $57                                    // $29D2  ???
	lda #$70                                     // $29D3
	.byte $57                                    // $29D5  ???
	lda #$50                                     // $29D6
	.byte $5A                                    // $29D8  ???
	tax                                          // $29D9
	.byte $5C                                    // $29DA  ???
	tax                                          // $29DB
	tax                                          // $29DC
	.byte $14                                    // $29DD  ???
	tax                                          // $29DE
	tax                                          // $29DF
	.byte $87                                    // $29E0  ???
	tax                                          // $29E1
	tax                                          // $29E2
	lda ($aa,x)                                  // $29E3
	txa                                          // $29E5
	clv                                          // $29E6
	tax                                          // $29E7
	asl                                          // $29E8
	tay                                          // $29E9
	tax                                          // $29EA
	.byte $02                                    // $29EB  ???
	tax                                          // $29EC
	tay                                          // $29ED
	.byte $02                                    // $29EE  ???
	tax                                          // $29EF
	tay                                          // $29F0
	.byte $02                                    // $29F1  ???
	.byte $82                                    // $29F2  ???
	ldy #$00                                     // $29F3
	.byte $80                                    // $29F5  ???
	ldy #$00                                     // $29F6
	.byte $20, $80, $00                          // $29F8  jsr $0080
	brk                                          // $29FB
	brk                                          // $29FC
	brk                                          // $29FD
	brk                                          // $29FE
	brk                                          // $29FF
	brk                                          // $2A00
	ror $0100,x                                  // $2A01
	.byte $FF                                    // $2A04  ???
	.byte $80                                    // $2A05  ???
	.byte $03                                    // $2A06  ???
	.byte $F7                                    // $2A07  ???
	cpy #$07                                     // $2A08
	.byte $BF                                    // $2A0A  ???
	cpx #$0f                                     // $2A0B
	.byte $FF                                    // $2A0D  ???
	.byte $F0, $1F                               // $2A0E  beq $2A2F
	.byte $B7                                    // $2A10  ???
	clv                                          // $2A11
	.byte $1B                                    // $2A12  ???
	ora ($fc,x)                                  // $2A13
	and ($8b),y                                  // $2A15
	.byte $FC                                    // $2A17  ???
	.byte $22                                    // $2A18  ???
	.byte $87                                    // $2A19  ???
	.byte $FC                                    // $2A1A  ???
	.byte $30, $6F                               // $2A1B  bmi $2A8C
	.byte $FC                                    // $2A1D  ???
	.byte $22                                    // $2A1E  ???
	ror $37fc,x                                  // $2A1F
	.byte $3F                                    // $2A22  ???
	.byte $DC                                    // $2A23  ???
	asl $fc9f,x                                  // $2A24
	.byte $1F                                    // $2A27  ???
	.byte $47                                    // $2A28  ???
	sed                                          // $2A29
	asl $f811                                    // $2A2A
	.byte $04                                    // $2A2D  ???
	sta $f0                                      // $2A2E
	.byte $02                                    // $2A30  ???
	.byte $0F                                    // $2A31  ???
	rts                                          // $2A32
	ora ($df,x)                                  // $2A33
	cpy #$00                                     // $2A35
	.byte $7F                                    // $2A37  ???
	.byte $80                                    // $2A38  ???
	brk                                          // $2A39
	brk                                          // $2A3A
	brk                                          // $2A3B
	brk                                          // $2A3C
	brk                                          // $2A3D
	brk                                          // $2A3E
	brk                                          // $2A3F
	brk                                          // $2A40
	.byte $80                                    // $2A41  ???
	brk                                          // $2A42
	.byte $02                                    // $2A43  ???
	rts                                          // $2A44
	jsr $a80a                                    // $2A45
	tay                                          // $2A48
	.byte $02                                    // $2A49  ???
	txs                                          // $2A4A
	.byte $90, $0A                               // $2A4B  bcc $2A57
	tax                                          // $2A4D
	tay                                          // $2A4E
	rol                                          // $2A4F
	lda #$a8                                     // $2A50
	asl                                          // $2A52
	tax                                          // $2A53
	ldy #$02                                     // $2A54
	ror                                          // $2A56
	.byte $80                                    // $2A57  ???
	ora ($aa,x)                                  // $2A58
	.byte $90, $0A                               // $2A5A  bcc $2A66
	.byte $BB                                    // $2A5C  ???
	tay                                          // $2A5D
	.byte $02                                    // $2A5E  ???
	.byte $EE, $48, $00                          // $2A5F  inc $0048
	tsx                                          // $2A62
	php                                          // $2A63
	brk                                          // $2A64
	.byte $3C                                    // $2A65  ???
	brk                                          // $2A66
	brk                                          // $2A67
	.byte $3C                                    // $2A68  ???
	brk                                          // $2A69
	brk                                          // $2A6A
	.byte $3C                                    // $2A6B  ???
	brk                                          // $2A6C
	brk                                          // $2A6D
	.byte $3F                                    // $2A6E  ???
	brk                                          // $2A6F
	brk                                          // $2A70
	.byte $3F                                    // $2A71  ???
	brk                                          // $2A72
	php                                          // $2A73
	.byte $3F                                    // $2A74  ???
	cpx #$2a                                     // $2A75
	.byte $EF                                    // $2A77  ???
	tay                                          // $2A78
	tax                                          // $2A79
	tax                                          // $2A7A
	tax                                          // $2A7B
	brk                                          // $2A7C
	brk                                          // $2A7D
	brk                                          // $2A7E
	brk                                          // $2A7F
	brk                                          // $2A80
	.byte $80                                    // $2A81  ???
	jsr $a002                                    // $2A82
	tay                                          // $2A85
	brk                                          // $2A86
	tay                                          // $2A87
	ldy #$02                                     // $2A88
	tax                                          // $2A8A
	tay                                          // $2A8B
	php                                          // $2A8C
	tax                                          // $2A8D
	tax                                          // $2A8E
	php                                          // $2A8F
	rol $aaaa                                    // $2A90
	tax                                          // $2A93
	ldx $aaaa                                    // $2A94
	tsx                                          // $2A97
	nop                                          // $2A98
	.byte $8B                                    // $2A99  ???
	tay                                          // $2A9A
	ldx $e02a                                    // $2A9B
	.byte $2B                                    // $2A9E  ???
	.byte $8B                                    // $2A9F  ???
	inx                                          // $2AA0
	rol $f003,x                                  // $2AA1
	ldy $f000                                    // $2AA4
	bit $3000                                    // $2AA7
	.byte $0C                                    // $2AAA  ???
	brk                                          // $2AAB
	.byte $30, $0C                               // $2AAC  bmi $2ABA
	brk                                          // $2AAE
	.byte $F0, $0C                               // $2AAF  beq $2ABD
	.byte $03                                    // $2AB1  ???
	cpy #$0c                                     // $2AB2
	.byte $8F                                    // $2AB4  ???
	.byte $F0, $3A                               // $2AB5  beq $2AF1
	.byte $AF                                    // $2AB7  ???
	cpx $aaaa                                    // $2AB8
	tax                                          // $2ABB
	brk                                          // $2ABC
	brk                                          // $2ABD
	brk                                          // $2ABE
	brk                                          // $2ABF
	asl                                          // $2AC0
	brk                                          // $2AC1
	brk                                          // $2AC2
	rol                                          // $2AC3
	dey                                          // $2AC4
	brk                                          // $2AC5
	asl                                          // $2AC6
	ror                                          // $2AC7
	brk                                          // $2AC8
	.byte $02                                    // $2AC9  ???
	lda #$80                                     // $2ACA
	asl                                          // $2ACC
	tax                                          // $2ACD
	ldx #$29                                     // $2ACE
	tax                                          // $2AD0
	tax                                          // $2AD1
	tax                                          // $2AD2
	txs                                          // $2AD3
	tya                                          // $2AD4
	rol                                          // $2AD5
	tax                                          // $2AD6
	ldy $a6                                      // $2AD7
	tax                                          // $2AD9
	tay                                          // $2ADA
	tax                                          // $2ADB
	tax                                          // $2ADC
	ror                                          // $2ADD
	rol                                          // $2ADE
	txs                                          // $2ADF
	tay                                          // $2AE0
	asl                                          // $2AE1
	tax                                          // $2AE2
	.byte $90, $0B                               // $2AE3  bcc $2AF0
	ldx $2aa8                                    // $2AE5
	.byte $EB                                    // $2AE8  ???
	nop                                          // $2AE9
	txs                                          // $2AEA
	.byte $BB                                    // $2AEB  ???
	tay                                          // $2AEC
	rol                                          // $2AED
	.byte $EF                                    // $2AEE  ???
	ldy #$a6                                     // $2AEF
	inc $aaa0,x                                  // $2AF1
	.byte $BF                                    // $2AF4  ???
	tya                                          // $2AF5
	and #$ff                                     // $2AF6
	ldy #$20                                     // $2AF8
	.byte $FE, $20, $00                          // $2AFA  inc $0020,x
	brk                                          // $2AFD
	brk                                          // $2AFE
	brk                                          // $2AFF
	brk                                          // $2B00
	brk                                          // $2B01
	brk                                          // $2B02
	brk                                          // $2B03
	brk                                          // $2B04
	.byte $23                                    // $2B05  ???
	brk                                          // $2B06
	brk                                          // $2B07
	.byte $0C                                    // $2B08  ???
	brk                                          // $2B09
	jsr $203c                                    // $2B0A
	.byte $0C                                    // $2B0D  ???
	.byte $0C                                    // $2B0E  ???
	php                                          // $2B0F
	.byte $33                                    // $2B10  ???
	.byte $03                                    // $2B11  ???
	cpy $ccc0                                    // $2B12
	.byte $FC                                    // $2B15  ???
	.byte $30, $F0                               // $2B16  bmi $2B08
	cpy $fcc0                                    // $2B18
	.byte $03                                    // $2B1B  ???
	.byte $02                                    // $2B1C  ???
	.byte $3F                                    // $2B1D  ???
	.byte $03                                    // $2B1E  ???
	brk                                          // $2B1F
	.byte $0C                                    // $2B20  ???
	.byte $2F                                    // $2B21  ???
	brk                                          // $2B22
	.byte $0C                                    // $2B23  ???
	.byte $3C                                    // $2B24  ???
	.byte $0C                                    // $2B25  ???
	.byte $3C                                    // $2B26  ???
	.byte $3F                                    // $2B27  ???
	.byte $30, $FC                               // $2B28  bmi $2B26
	.byte $0F                                    // $2B2A  ???
	.byte $C3                                    // $2B2B  ???
	.byte $FC                                    // $2B2C  ???
	.byte $02                                    // $2B2D  ???
	.byte $F0, $FA                               // $2B2E  beq $2B2A
	.byte $80                                    // $2B30  ???
	ldy $f0c2,x                                  // $2B31
	.byte $30, $F0                               // $2B34  bmi $2B26
	.byte $33                                    // $2B36  ???
	.byte $3C                                    // $2B37  ???
	.byte $3C                                    // $2B38  ???
	.byte $3C                                    // $2B39  ???
	.byte $30, $FC                               // $2B3A  bmi $2B38
	brk                                          // $2B3C
	brk                                          // $2B3D
	brk                                          // $2B3E
	brk                                          // $2B3F
	brk                                          // $2B40
	.byte $FC                                    // $2B41  ???
	plp                                          // $2B42
	brk                                          // $2B43
	.byte $F0, $00                               // $2B44  beq $2B46
	brk                                          // $2B46
	.byte $F0, $00                               // $2B47  beq $2B49
	brk                                          // $2B49
	.byte $F0, $00                               // $2B4A  beq $2B4C
	brk                                          // $2B4C
	.byte $FC                                    // $2B4D  ???
	brk                                          // $2B4E
	brk                                          // $2B4F
	.byte $3F                                    // $2B50  ???
	brk                                          // $2B51
	brk                                          // $2B52
	.byte $3F                                    // $2B53  ???
	brk                                          // $2B54
	brk                                          // $2B55
	.byte $0F                                    // $2B56  ???
	brk                                          // $2B57
	brk                                          // $2B58
	.byte $0F                                    // $2B59  ???
	brk                                          // $2B5A
	brk                                          // $2B5B
	.byte $3F                                    // $2B5C  ???
	brk                                          // $2B5D
	brk                                          // $2B5E
	.byte $FF                                    // $2B5F  ???
	brk                                          // $2B60
	brk                                          // $2B61
	.byte $FC                                    // $2B62  ???
	brk                                          // $2B63
	brk                                          // $2B64
	.byte $FF                                    // $2B65  ???
	brk                                          // $2B66
	brk                                          // $2B67
	.byte $EF                                    // $2B68  ???
	cpy #$03                                     // $2B69
	.byte $AB                                    // $2B6B  ???
	.byte $80                                    // $2B6C  ???
	asl $a0aa                                    // $2B6D
	asl                                          // $2B70
	tax                                          // $2B71
	ldy #$2a                                     // $2B72
	tax                                          // $2B74
	tay                                          // $2B75
	tax                                          // $2B76
	tax                                          // $2B77
	tax                                          // $2B78
	tax                                          // $2B79
	tax                                          // $2B7A
	tax                                          // $2B7B
	brk                                          // $2B7C
	brk                                          // $2B7D
	brk                                          // $2B7E
	brk                                          // $2B7F
	.byte $3C                                    // $2B80  ???
	.byte $33                                    // $2B81  ???
	.byte $F0, $0F                               // $2B82  beq $2B93
	.byte $3F                                    // $2B84  ???
	cpy #$0f                                     // $2B85
	.byte $FB                                    // $2B87  ???
	brk                                          // $2B88
	.byte $03                                    // $2B89  ???
	.byte $C3                                    // $2B8A  ???
	cpy #$00                                     // $2B8B
	.byte $F3                                    // $2B8D  ???
	.byte $30, $00                               // $2B8E  bmi $2B90
	.byte $F3                                    // $2B90  ???
	.byte $0C                                    // $2B91  ???
	.byte $02                                    // $2B92  ???
	.byte $FF                                    // $2B93  ???
	jsr $3f08                                    // $2B94
	php                                          // $2B97
	brk                                          // $2B98
	.byte $FC                                    // $2B99  ???
	brk                                          // $2B9A
	brk                                          // $2B9B
	.byte $F0, $00                               // $2B9C  beq $2B9E
	brk                                          // $2B9E
	.byte $3C                                    // $2B9F  ???
	brk                                          // $2BA0
	brk                                          // $2BA1
	.byte $3C                                    // $2BA2  ???
	brk                                          // $2BA3
	brk                                          // $2BA4
	.byte $3F                                    // $2BA5  ???
	brk                                          // $2BA6
	brk                                          // $2BA7
	.byte $FF                                    // $2BA8  ???
	brk                                          // $2BA9
	brk                                          // $2BAA
	.byte $FF                                    // $2BAB  ???
	brk                                          // $2BAC
	.byte $03                                    // $2BAD  ???
	.byte $FF                                    // $2BAE  ???
	cpy #$0f                                     // $2BAF
	.byte $FB                                    // $2BB1  ???
	.byte $F0, $0A                               // $2BB2  beq $2BBE
	nop                                          // $2BB4
	cpx $aa2a                                    // $2BB5
	tay                                          // $2BB8
	tax                                          // $2BB9
	tax                                          // $2BBA
	tax                                          // $2BBB
	brk                                          // $2BBC
	brk                                          // $2BBD
	brk                                          // $2BBE
	brk                                          // $2BBF
	brk                                          // $2BC0
	brk                                          // $2BC1
	brk                                          // $2BC2
	brk                                          // $2BC3
	brk                                          // $2BC4
	brk                                          // $2BC5
	brk                                          // $2BC6
	.byte $02                                    // $2BC7  ???
	ldy #$00                                     // $2BC8
	asl $a8                                      // $2BCA
	brk                                          // $2BCC
	.byte $1A                                    // $2BCD  ???
	pla                                          // $2BCE
	brk                                          // $2BCF
	rol                                          // $2BD0
	txs                                          // $2BD1
	brk                                          // $2BD2
	.byte $99, $A6, $00                          // $2BD3  sta $00A6,y
	ror                                          // $2BD6
	tsx                                          // $2BD7
	.byte $02                                    // $2BD8  ???
	ldx $69                                      // $2BD9
	.byte $02                                    // $2BDB  ???
	tax                                          // $2BDC
	tax                                          // $2BDD
	ora #$99                                     // $2BDE
	sta $a606,y                                  // $2BE0
	ldx #$0a                                     // $2BE3
	.byte $9B                                    // $2BE5  ???
	.byte $89                                    // $2BE6  ???
	asl                                          // $2BE7
	ldx $022a                                    // $2BE8
	sed                                          // $2BEB
	lda #$00                                     // $2BEC
	ldx #$aa                                     // $2BEE
	brk                                          // $2BF0
	.byte $02                                    // $2BF1  ???
	lda #$00                                     // $2BF2
	.byte $02                                    // $2BF4  ???
	tax                                          // $2BF5
	brk                                          // $2BF6
	asl                                          // $2BF7
	lda #$00                                     // $2BF8
	asl                                          // $2BFA
	tay                                          // $2BFB
	brk                                          // $2BFC
	brk                                          // $2BFD
	brk                                          // $2BFE
	brk                                          // $2BFF
	brk                                          // $2C00
	rol                                          // $2C01
	ldy $00                                      // $2C02
	rol                                          // $2C04
	tay                                          // $2C05
	brk                                          // $2C06
	tax                                          // $2C07
	ldy $02                                      // $2C08
	tax                                          // $2C0A
	ldy #$02                                     // $2C0B
	tax                                          // $2C0D
	.byte $90, $0A                               // $2C0E  bcc $2C1A
	tax                                          // $2C10
	.byte $80                                    // $2C11  ???
	asl                                          // $2C12
	tax                                          // $2C13
	rti                                          // $2C14
	rol                                          // $2C15
	tax                                          // $2C16
	brk                                          // $2C17
	rol                                          // $2C18
	lda #$00                                     // $2C19
	rol                                          // $2C1B
	tay                                          // $2C1C
	brk                                          // $2C1D
	tax                                          // $2C1E
	ldy $00                                      // $2C1F
	tax                                          // $2C21
	ldy #$00                                     // $2C22
	tax                                          // $2C24
	.byte $90, $00                               // $2C25  bcc $2C27
	tax                                          // $2C27
	.byte $80                                    // $2C28  ???
	brk                                          // $2C29
	tax                                          // $2C2A
	rti                                          // $2C2B
	brk                                          // $2C2C
	tax                                          // $2C2D
	.byte $80                                    // $2C2E  ???
	brk                                          // $2C2F
	tax                                          // $2C30
	rti                                          // $2C31
	brk                                          // $2C32
	tax                                          // $2C33
	ldy #$00                                     // $2C34
	tax                                          // $2C36
	tay                                          // $2C37
	brk                                          // $2C38
	tax                                          // $2C39
	tax                                          // $2C3A
	brk                                          // $2C3B
	brk                                          // $2C3C
	brk                                          // $2C3D
	brk                                          // $2C3E
	brk                                          // $2C3F
	brk                                          // $2C40
	brk                                          // $2C41
	sty $0400                                    // $2C42
	eor $0104,y                                  // $2C45
	sec                                          // $2C48
	.byte $02                                    // $2C49  ???
	rti                                          // $2C4A
	.byte $7A                                    // $2C4B  ???
	.byte $03                                    // $2C4C  ???
	sta ($b0,x)                                  // $2C4D
	brk                                          // $2C4F
	.byte $42                                    // $2C50  ???
	adc ($00,x)                                  // $2C51
	lsr $38                                      // $2C53
	.byte $04                                    // $2C55  ???
	tay                                          // $2C56
	.byte $44                                    // $2C57  ???
	.byte $03                                    // $2C58  ???
	.byte $10, $82                               // $2C59  bpl $2BDD
	.byte $04                                    // $2C5B  ???
	and ($81),y                                  // $2C5C
	php                                          // $2C5E
	.byte $42                                    // $2C5F  ???
	sta ($00,x)                                  // $2C60
	sty $41                                      // $2C62
	ora ($08,x)                                  // $2C64
	.byte $22                                    // $2C66  ???
	ora ($88,x)                                  // $2C67
	bit $01                                      // $2C69
	.byte $44                                    // $2C6B  ???
	.byte $62                                    // $2C6C  ???
	.byte $02                                    // $2C6D  ???
	rti                                          // $2C6E
	lda ($04,x)                                  // $2C6F
	rti                                          // $2C71
	lda ($08,x)                                  // $2C72
	and ($10,x)                                  // $2C74
	.byte $14                                    // $2C76  ???
	.byte $12                                    // $2C77  ???
	php                                          // $2C78
	.byte $14                                    // $2C79  ???
	asl                                          // $2C7A
	php                                          // $2C7B
	brk                                          // $2C7C
	brk                                          // $2C7D
	brk                                          // $2C7E
	brk                                          // $2C7F
	.byte $14                                    // $2C80  ???
	plp                                          // $2C81
	.byte $14                                    // $2C82  ???
	.byte $1C                                    // $2C83  ???
	tax                                          // $2C84
	.byte $34                                    // $2C85  ???
	asl $b4aa,x                                  // $2C86
	.byte $1A                                    // $2C89  ???
	tax                                          // $2C8A
	ldy $0a                                      // $2C8B
	tax                                          // $2C8D
	ldy #$0a                                     // $2C8E
	ldx $0aa0,y                                  // $2C90
	.byte $FF                                    // $2C93  ???
	ldy #$2b                                     // $2C94
	.byte $D7                                    // $2C96  ???
	inx                                          // $2C97
	.byte $2F                                    // $2C98  ???
	eor $f8,x                                    // $2C99
	.byte $2B                                    // $2C9B  ???
	.byte $D7                                    // $2C9C  ???
	inx                                          // $2C9D
	asl                                          // $2C9E
	.byte $D7                                    // $2C9F  ???
	ldy #$0a                                     // $2CA0
	ldx $2aa0,y                                  // $2CA2
	tax                                          // $2CA5
	tay                                          // $2CA6
	tax                                          // $2CA7
	plp                                          // $2CA8
	tax                                          // $2CA9
	tay                                          // $2CAA
	brk                                          // $2CAB
	rol                                          // $2CAC
	ldy #$00                                     // $2CAD
	asl                                          // $2CAF
	plp                                          // $2CB0
	brk                                          // $2CB1
	plp                                          // $2CB2
	php                                          // $2CB3
	brk                                          // $2CB4
	.byte $20, $28, $00                          // $2CB5  jsr $0028
	plp                                          // $2CB8
	.byte $82                                    // $2CB9  ???
	brk                                          // $2CBA
	.byte $82                                    // $2CBB  ???
	brk                                          // $2CBC
	brk                                          // $2CBD
	brk                                          // $2CBE
	brk                                          // $2CBF
	brk                                          // $2CC0
	brk                                          // $2CC1
	brk                                          // $2CC2
	brk                                          // $2CC3
	brk                                          // $2CC4
	brk                                          // $2CC5
	brk                                          // $2CC6
	brk                                          // $2CC7
	brk                                          // $2CC8
	brk                                          // $2CC9
	rti                                          // $2CCA
	brk                                          // $2CCB
	ora ($51,x)                                  // $2CCC
	brk                                          // $2CCE
	and #$55                                     // $2CCF
	pla                                          // $2CD1
	and $7855                                    // $2CD2
	and $7c55,x                                  // $2CD5
	and $55,x                                    // $2CD8
	.byte $5C                                    // $2CDA  ???
	ora $65                                      // $2CDB
	.byte $50, $15                               // $2CDD  bvc $2CF4
	lda #$50                                     // $2CDF
	asl $fe,x                                    // $2CE1
	.byte $54                                    // $2CE3  ???
	asl $76,x                                    // $2CE4
	sty $15,x                                    // $2CE6
	adc $94,x                                    // $2CE8
	.byte $14                                    // $2CEA  ???
	eor $55,x                                    // $2CEB
	.byte $54                                    // $2CED  ???
	ora $11,x                                    // $2CEE
	.byte $44                                    // $2CF0  ???
	.byte $04                                    // $2CF1  ???
	.byte $14                                    // $2CF2  ???
	.byte $44                                    // $2CF3  ???
	brk                                          // $2CF4
	.byte $04                                    // $2CF5  ???
	.byte $14                                    // $2CF6  ???
	brk                                          // $2CF7
	.byte $04                                    // $2CF8  ???
	brk                                          // $2CF9
	brk                                          // $2CFA
	brk                                          // $2CFB
	brk                                          // $2CFC
	brk                                          // $2CFD
	brk                                          // $2CFE
	brk                                          // $2CFF
	brk                                          // $2D00
	brk                                          // $2D01
	brk                                          // $2D02
	brk                                          // $2D03
	brk                                          // $2D04
	brk                                          // $2D05
	brk                                          // $2D06
	brk                                          // $2D07
	brk                                          // $2D08
	brk                                          // $2D09
	brk                                          // $2D0A
	brk                                          // $2D0B
	brk                                          // $2D0C
	bit $00                                      // $2D0D
	brk                                          // $2D0F
	.byte $5A                                    // $2D10  ???
	brk                                          // $2D11
	brk                                          // $2D12
	lda $0100,x                                  // $2D13
	ror $0280,x                                  // $2D16
	.byte $DB                                    // $2D19  ???
	rti                                          // $2D1A
	ora $bd                                      // $2D1B
	ldy #$05                                     // $2D1D
	.byte $FF                                    // $2D1F  ???
	ldy #$02                                     // $2D20
	.byte $E3                                    // $2D22  ???
	rti                                          // $2D23
	brk                                          // $2D24
	cmp $00,x                                    // $2D25
	ora ($dd,x)                                  // $2D27
	.byte $80                                    // $2D29  ???
	brk                                          // $2D2A
	.byte $EB                                    // $2D2B  ???
	brk                                          // $2D2C
	brk                                          // $2D2D
	.byte $3E, $00, $00                          // $2D2E  rol $0000,x
	brk                                          // $2D31
	brk                                          // $2D32
	brk                                          // $2D33
	brk                                          // $2D34
	brk                                          // $2D35
	brk                                          // $2D36
	brk                                          // $2D37
	brk                                          // $2D38
	brk                                          // $2D39
	brk                                          // $2D3A
	brk                                          // $2D3B
	brk                                          // $2D3C
	brk                                          // $2D3D
	brk                                          // $2D3E
	brk                                          // $2D3F
	brk                                          // $2D40
	brk                                          // $2D41
	brk                                          // $2D42
	brk                                          // $2D43
	brk                                          // $2D44
	brk                                          // $2D45
	brk                                          // $2D46
	brk                                          // $2D47
	brk                                          // $2D48
	sta ($81,x)                                  // $2D49
	sta ($e3,x)                                  // $2D4B
	.byte $DB                                    // $2D4D  ???
	.byte $C7                                    // $2D4E  ???
	.byte $73                                    // $2D4F  ???
	lda $ce                                      // $2D50
	ora $9842,y                                  // $2D52
	asl $7081                                    // $2D55
	ora $24                                      // $2D58
	ldy #$02                                     // $2D5A
	.byte $42                                    // $2D5C  ???
	rti                                          // $2D5D
	.byte $02                                    // $2D5E  ???
	brk                                          // $2D5F
	rti                                          // $2D60
	ora ($1c,x)                                  // $2D61
	.byte $80                                    // $2D63  ???
	ora ($2a,x)                                  // $2D64
	.byte $80                                    // $2D66  ???
	brk                                          // $2D67
	.byte $22                                    // $2D68  ???
	brk                                          // $2D69
	brk                                          // $2D6A
	.byte $14                                    // $2D6B  ???
	brk                                          // $2D6C
	brk                                          // $2D6D
	brk                                          // $2D6E
	brk                                          // $2D6F
	brk                                          // $2D70
	.byte $1C                                    // $2D71  ???
	brk                                          // $2D72
	brk                                          // $2D73
	php                                          // $2D74
	brk                                          // $2D75
	brk                                          // $2D76
	php                                          // $2D77
	brk                                          // $2D78
	brk                                          // $2D79
	php                                          // $2D7A
	brk                                          // $2D7B
	brk                                          // $2D7C
	brk                                          // $2D7D
	brk                                          // $2D7E
	brk                                          // $2D7F
	brk                                          // $2D80
	brk                                          // $2D81
	brk                                          // $2D82
	brk                                          // $2D83
	brk                                          // $2D84
	brk                                          // $2D85
	brk                                          // $2D86
	brk                                          // $2D87
	brk                                          // $2D88
	ora ($81,x)                                  // $2D89
	.byte $80                                    // $2D8B  ???
	.byte $03                                    // $2D8C  ???
	.byte $DB                                    // $2D8D  ???
	cpy #$03                                     // $2D8E
	lda $c0                                      // $2D90
	ora ($42,x)                                  // $2D92
	.byte $80                                    // $2D94  ???
	brk                                          // $2D95
	sta ($00,x)                                  // $2D96
	ora ($24,x)                                  // $2D98
	.byte $80                                    // $2D9A  ???
	asl                                          // $2D9B
	.byte $42                                    // $2D9C  ???
	.byte $50, $1A                               // $2D9D  bvc $2DB9
	brk                                          // $2D9F
	cli                                          // $2DA0
	and $9c1c,y                                  // $2DA1
	adc ($2a,x)                                  // $2DA4
	stx $c0                                      // $2DA6
	.byte $22                                    // $2DA8  ???
	.byte $03                                    // $2DA9  ???
	brk                                          // $2DAA
	.byte $14                                    // $2DAB  ???
	brk                                          // $2DAC
	brk                                          // $2DAD
	brk                                          // $2DAE
	brk                                          // $2DAF
	brk                                          // $2DB0
	.byte $1C                                    // $2DB1  ???
	brk                                          // $2DB2
	brk                                          // $2DB3
	.byte $10, $00                               // $2DB4  bpl $2DB6
	brk                                          // $2DB6
	.byte $10, $00                               // $2DB7  bpl $2DB9
	brk                                          // $2DB9
	.byte $10, $00                               // $2DBA  bpl $2DBC
	brk                                          // $2DBC
	brk                                          // $2DBD
	brk                                          // $2DBE
	brk                                          // $2DBF
	brk                                          // $2DC0
	brk                                          // $2DC1
	brk                                          // $2DC2
	brk                                          // $2DC3
	brk                                          // $2DC4
	cpx #$00                                     // $2DC5
	ora ($c0,x)                                  // $2DC7
	rti                                          // $2DC9
	.byte $03                                    // $2DCA  ???
	.byte $C2                                    // $2DCB  ???
	cpx #$0e                                     // $2DCC
	cmp $b0                                      // $2DCE
	php                                          // $2DD0
	cmp $18b8                                    // $2DD1
	.byte $89                                    // $2DD4  ???
	.byte $9C                                    // $2DD5  ???
	sec                                          // $2DD6
	sta $709e,y                                  // $2DD7
	sbc $f18f,y                                  // $2DDA
	sbc ($8f),y                                  // $2DDD
	.byte $F3                                    // $2DDF  ???
	sbc ($8f),y                                  // $2DE0
	.byte $FB                                    // $2DE2  ???
	sbc ($8f),y                                  // $2DE3
	.byte $FF                                    // $2DE5  ???
	sbc ($8f),y                                  // $2DE6
	.byte $FF                                    // $2DE8  ???
	sbc ($8f),y                                  // $2DE9
	.byte $FF                                    // $2DEB  ???
	sbc ($cf),y                                  // $2DEC
	.byte $FF                                    // $2DEE  ???
	.byte $F3                                    // $2DEF  ???
	.byte $CF                                    // $2DF0  ???
	.byte $FF                                    // $2DF1  ???
	.byte $DB                                    // $2DF2  ???
	cpx $cfff                                    // $2DF3
	.byte $FC                                    // $2DF6  ???
	.byte $FF                                    // $2DF7  ???
	.byte $CF                                    // $2DF8  ???
	sed                                          // $2DF9
	.byte $FF                                    // $2DFA  ???
	.byte $87                                    // $2DFB  ???
	sed                                          // $2DFC
	.byte $FF                                    // $2DFD  ???
	.byte $87                                    // $2DFE  ???
	brk                                          // $2DFF
	.byte $70, $FF                               // $2E00  bvs $2E01
	.byte $83                                    // $2E02  ???
	adc ($ff,x)                                  // $2E03
	.byte $82                                    // $2E05  ???
	and ($ff,x)                                  // $2E06
	.byte $80                                    // $2E08  ???
	.byte $03                                    // $2E09  ???
	.byte $FF                                    // $2E0A  ???
	cpy #$03                                     // $2E0B
	.byte $FF                                    // $2E0D  ???
	cpy #$03                                     // $2E0E
	.byte $FF                                    // $2E10  ???
	cpy #$07                                     // $2E11
	.byte $FF                                    // $2E13  ???
	cpy #$07                                     // $2E14
	.byte $FF                                    // $2E16  ???
	cpx #$07                                     // $2E17
	.byte $FF                                    // $2E19  ???
	cpx #$0f                                     // $2E1A
	.byte $FF                                    // $2E1C  ???
	.byte $F0, $0F                               // $2E1D  beq $2E2E
	.byte $FF                                    // $2E1F  ???
	.byte $F0, $0F                               // $2E20  beq $2E31
	.byte $FF                                    // $2E22  ???
	.byte $F0, $1F                               // $2E23  beq $2E44
	.byte $F7                                    // $2E25  ???
	.byte $F0, $1D                               // $2E26  beq $2E45
	.byte $E7                                    // $2E28  ???
	cpx #$39                                     // $2E29
	dec $e0                                      // $2E2B
	and ($8e),y                                  // $2E2D
	cpy #$62                                     // $2E2F
	.byte $0C                                    // $2E31  ???
	cpy #$c4                                     // $2E32
	.byte $19, $80, $00                          // $2E34  ora $0080,y
	ora ($00),y                                  // $2E37
	brk                                          // $2E39
	.byte $02                                    // $2E3A  ???
	brk                                          // $2E3B
	brk                                          // $2E3C
	brk                                          // $2E3D
	brk                                          // $2E3E
	.byte $FF                                    // $2E3F  ???
	.byte $03                                    // $2E40  ???
	.byte $80                                    // $2E41  ???
	brk                                          // $2E42
	.byte $07                                    // $2E43  ???
	cpy #$00                                     // $2E44
	ora $c0                                      // $2E46
	.byte $30, $03                               // $2E48  bmi $2E4D
	cmp ($c0,x)                                  // $2E4A
	brk                                          // $2E4C
	.byte $D7                                    // $2E4D  ???
	brk                                          // $2E4E
	ora ($ae,x)                                  // $2E4F
	brk                                          // $2E51
	brk                                          // $2E52
	.byte $7A                                    // $2E53  ???
	brk                                          // $2E54
	brk                                          // $2E55
	.byte $D7                                    // $2E56  ???
	brk                                          // $2E57
	.byte $03                                    // $2E58  ???
	adc #$80                                     // $2E59
	.byte $0C                                    // $2E5B  ???
	.byte $54                                    // $2E5C  ???
	brk                                          // $2E5D
	.byte $30, $AA                               // $2E5E  bmi $2E0A
	brk                                          // $2E60
	cpy #$96                                     // $2E61
	brk                                          // $2E63
	.byte $03                                    // $2E64  ???
	asl $0200,x                                  // $2E65
	sta $00                                      // $2E68
	.byte $02                                    // $2E6A  ???
	asl                                          // $2E6B
	brk                                          // $2E6C
	brk                                          // $2E6D
	asl                                          // $2E6E
	rti                                          // $2E6F
	brk                                          // $2E70
	.byte $0F                                    // $2E71  ???
	.byte $80                                    // $2E72  ???
	brk                                          // $2E73
	.byte $02                                    // $2E74  ???
	rti                                          // $2E75
	brk                                          // $2E76
	.byte $02                                    // $2E77  ???
	jsr $0500                                    // $2E78
	brk                                          // $2E7B
	brk                                          // $2E7C
	php                                          // $2E7D
	brk                                          // $2E7E
	brk                                          // $2E7F
	.byte $03                                    // $2E80  ???
	.byte $80                                    // $2E81  ???
	.byte $03                                    // $2E82  ???
	.byte $07                                    // $2E83  ???
	cpy #$0c                                     // $2E84
	ora $c0                                      // $2E86
	.byte $30, $03                               // $2E88  bmi $2E8D
	cmp ($c0,x)                                  // $2E8A
	.byte $03                                    // $2E8C  ???
	.byte $D3                                    // $2E8D  ???
	cpy #$00                                     // $2E8E
	.byte $AC, $80, $00                          // $2E90  ldy $0080
	.byte $7A                                    // $2E93  ???
	.byte $80                                    // $2E94  ???
	brk                                          // $2E95
	cmp $80,x                                    // $2E96
	.byte $03                                    // $2E98  ???
	pla                                          // $2E99
	.byte $80                                    // $2E9A  ???
	.byte $0C                                    // $2E9B  ???
	.byte $54                                    // $2E9C  ???
	brk                                          // $2E9D
	brk                                          // $2E9E
	tax                                          // $2E9F
	brk                                          // $2EA0
	.byte $07                                    // $2EA1  ???
	asl $00,x                                    // $2EA2
	asl                                          // $2EA4
	asl $0400,x                                  // $2EA5
	asl                                          // $2EA8
	.byte $04                                    // $2EA9  ???
	brk                                          // $2EAA
	ora ($08),y                                  // $2EAB
	brk                                          // $2EAD
	rts                                          // $2EAE
	sty $00,x                                    // $2EAF
	rti                                          // $2EB1
	.byte $62                                    // $2EB2  ???
	brk                                          // $2EB3
	rti                                          // $2EB4
	brk                                          // $2EB5
	brk                                          // $2EB6
	ldy #$00                                     // $2EB7
	ora ($00,x)                                  // $2EB9
	brk                                          // $2EBB
	brk                                          // $2EBC
	brk                                          // $2EBD
	brk                                          // $2EBE
	brk                                          // $2EBF
	brk                                          // $2EC0
	brk                                          // $2EC1
	rti                                          // $2EC2
	brk                                          // $2EC3
	and ($e4,x)                                  // $2EC4
	brk                                          // $2EC6
	.byte $73                                    // $2EC7  ???
	sed                                          // $2EC8
	brk                                          // $2EC9
	.byte $FA                                    // $2ECA  ???
	cld                                          // $2ECB
	ora $d8                                      // $2ECC
	.byte $74                                    // $2ECE  ???
	.byte $0B                                    // $2ECF  ???
	lda ($3c,x)                                  // $2ED0
	.byte $0F                                    // $2ED2  ???
	.byte $63                                    // $2ED3  ???
	.byte $74                                    // $2ED4  ???
	asl $f9,x                                    // $2ED5
	sei                                          // $2ED7
	.byte $1F                                    // $2ED8  ???
	.byte $73                                    // $2ED9  ???
	clv                                          // $2EDA
	.byte $0F                                    // $2EDB  ???
	.byte $17                                    // $2EDC  ???
	.byte $3C                                    // $2EDD  ???
	.byte $0F                                    // $2EDE  ???
	.byte $1F                                    // $2EDF  ???
	.byte $70, $37                               // $2EE0  bvs $2F19
	.byte $9E                                    // $2EE2  ???
	sei                                          // $2EE3
	.byte $27                                    // $2EE4  ???
	.byte $DC                                    // $2EE5  ???
	.byte $FC                                    // $2EE6  ???
	.byte $37                                    // $2EE7  ???
	.byte $5C                                    // $2EE8  ???
	.byte $FC                                    // $2EE9  ???
	ror $aa,x                                    // $2EEA
	ldy $ff25,x                                  // $2EEC
	lsr $ff23,x                                  // $2EEF
	inc $ff37                                    // $2EF2
	.byte $F4                                    // $2EF5  ???
	.byte $1B                                    // $2EF6  ???
	.byte $FF                                    // $2EF7  ???
	sed                                          // $2EF8
	.byte $17                                    // $2EF9  ???
	.byte $FF                                    // $2EFA  ???
	.byte $FC                                    // $2EFB  ???
	brk                                          // $2EFC
	brk                                          // $2EFD
	brk                                          // $2EFE
	brk                                          // $2EFF
	brk                                          // $2F00
	brk                                          // $2F01
	brk                                          // $2F02
	brk                                          // $2F03
	brk                                          // $2F04
	brk                                          // $2F05
	asl $00                                      // $2F06
	asl                                          // $2F08
	.byte $0C                                    // $2F09  ???
	.byte $02                                    // $2F0A  ???
	ora ($1c),y                                  // $2F0B
	stx $22                                      // $2F0D
	ora $660c,y                                  // $2F0F
	ora #$48                                     // $2F12
	.byte $74                                    // $2F14  ???
	.byte $1B                                    // $2F15  ???
	plp                                          // $2F16
	.byte $FC                                    // $2F17  ???
	.byte $32                                    // $2F18  ???
	eor ($f9,x)                                  // $2F19
	.byte $07                                    // $2F1B  ???
	pha                                          // $2F1C
	.byte $F0, $0E                               // $2F1D  beq $2F2D
	sta $1c78,y                                  // $2F1F
	and ($ba),y                                  // $2F22
	rol $d063,x                                  // $2F24
	.byte $7F                                    // $2F27  ???
	sbc ($fc),y                                  // $2F28
	rol $f9                                      // $2F2A
	iny                                          // $2F2C
	sbc $c0dd                                    // $2F2D
	clc                                          // $2F30
	.byte $EF                                    // $2F31  ???
	.byte $B0, $11                               // $2F32  bcs $2F45
	.byte $D7                                    // $2F34  ???
	.byte $7C                                    // $2F35  ???
	.byte $2B                                    // $2F36  ???
	lda ($40,x)                                  // $2F37
	.byte $02                                    // $2F39  ???
	.byte $80                                    // $2F3A  ???
	.byte $20, $00, $00                          // $2F3B  jsr $0000
	brk                                          // $2F3E
	brk                                          // $2F3F
	brk                                          // $2F40
	.byte $02                                    // $2F41  ???
	brk                                          // $2F42
	asl $16                                      // $2F43
	brk                                          // $2F45
	ora ($0c,x)                                  // $2F46
	php                                          // $2F48
	brk                                          // $2F49
	stx $04                                      // $2F4A
	.byte $10, $07                               // $2F4C  bpl $2F55
	.byte $02                                    // $2F4E  ???
	jsr $0916                                    // $2F4F
	ora ($14,x)                                  // $2F52
	.byte $02                                    // $2F54  ???
	jsr $86be                                    // $2F55
	ora ($30,x)                                  // $2F58
	.byte $02                                    // $2F5A  ???
	rol $6e                                      // $2F5B
	eor ($2f,x)                                  // $2F5D
	.byte $5C                                    // $2F5F  ???
	.byte $4B                                    // $2F60  ???
	ror $de,x                                    // $2F61
	ldx $c7                                      // $2F63
	.byte $9E                                    // $2F65  ???
	sty $e3,x                                    // $2F66
	.byte $CB                                    // $2F68  ???
	rol $dd5f                                    // $2F69
	.byte $BF                                    // $2F6C  ???
	.byte $FF                                    // $2F6D  ???
	clv                                          // $2F6E
	inc $fe3d,x                                  // $2F6F
	sbc ($38),y                                  // $2F72
	ldy $1c7c,x                                  // $2F74
	bit $3e                                      // $2F77
	php                                          // $2F79
	brk                                          // $2F7A
	.byte $07                                    // $2F7B  ???
	brk                                          // $2F7C
	brk                                          // $2F7D
	brk                                          // $2F7E
	brk                                          // $2F7F
	brk                                          // $2F80
	brk                                          // $2F81
	brk                                          // $2F82
	brk                                          // $2F83
	brk                                          // $2F84
	cpx #$00                                     // $2F85
	ora ($c0,x)                                  // $2F87
	rti                                          // $2F89
	.byte $03                                    // $2F8A  ???
	.byte $C2                                    // $2F8B  ???
	cpx #$0e                                     // $2F8C
	cmp $b0                                      // $2F8E
	php                                          // $2F90
	cmp $18b8                                    // $2F91
	.byte $89                                    // $2F94  ???
	.byte $9C                                    // $2F95  ???
	sec                                          // $2F96
	sta $709e,y                                  // $2F97
	sbc $f18f,y                                  // $2F9A
	sbc ($8f),y                                  // $2F9D
	.byte $F3                                    // $2F9F  ???
	sbc ($8f),y                                  // $2FA0
	.byte $FB                                    // $2FA2  ???
	sbc ($8f),y                                  // $2FA3
	.byte $FF                                    // $2FA5  ???
	sbc ($8f),y                                  // $2FA6
	.byte $FF                                    // $2FA8  ???
	sbc ($8f),y                                  // $2FA9
	.byte $FF                                    // $2FAB  ???
	sbc ($cf),y                                  // $2FAC
	.byte $FF                                    // $2FAE  ???
	.byte $F3                                    // $2FAF  ???
	.byte $CF                                    // $2FB0  ???
	.byte $FF                                    // $2FB1  ???
	.byte $DB                                    // $2FB2  ???
	cpx $cfff                                    // $2FB3
	.byte $FC                                    // $2FB6  ???
	.byte $FF                                    // $2FB7  ???
	.byte $CF                                    // $2FB8  ???
	sed                                          // $2FB9
	.byte $FF                                    // $2FBA  ???
	.byte $87                                    // $2FBB  ???
	sed                                          // $2FBC
	.byte $FF                                    // $2FBD  ???
	.byte $87                                    // $2FBE  ???
	brk                                          // $2FBF
	.byte $70, $FF                               // $2FC0  bvs $2FC1
	.byte $83                                    // $2FC2  ???
	adc ($ff,x)                                  // $2FC3
	.byte $82                                    // $2FC5  ???
	and ($ff,x)                                  // $2FC6
	.byte $80                                    // $2FC8  ???
	.byte $03                                    // $2FC9  ???
	.byte $FF                                    // $2FCA  ???
	cpy #$03                                     // $2FCB
	.byte $FF                                    // $2FCD  ???
	cpy #$03                                     // $2FCE
	.byte $FF                                    // $2FD0  ???
	cpy #$07                                     // $2FD1
	.byte $FF                                    // $2FD3  ???
	cpy #$07                                     // $2FD4
	.byte $FF                                    // $2FD6  ???
	cpx #$07                                     // $2FD7
	.byte $FF                                    // $2FD9  ???
	cpx #$0f                                     // $2FDA
	.byte $FF                                    // $2FDC  ???
	.byte $F0, $0F                               // $2FDD  beq $2FEE
	.byte $FF                                    // $2FDF  ???
	.byte $F0, $0F                               // $2FE0  beq $2FF1
	.byte $FF                                    // $2FE2  ???
	.byte $F0, $1F                               // $2FE3  beq $3004
	.byte $F7                                    // $2FE5  ???
	.byte $F0, $1D                               // $2FE6  beq $3005
	.byte $E7                                    // $2FE8  ???
	cpx #$39                                     // $2FE9
	dec $e0                                      // $2FEB
	and ($8e),y                                  // $2FED
	cpy #$62                                     // $2FEF
	.byte $0C                                    // $2FF1  ???
	cpy #$c4                                     // $2FF2
	.byte $19, $80, $00                          // $2FF4  ora $0080,y
	ora ($00),y                                  // $2FF7
	brk                                          // $2FF9
	.byte $02                                    // $2FFA  ???
	brk                                          // $2FFB
	brk                                          // $2FFC
	brk                                          // $2FFD
	brk                                          // $2FFE
	.byte $FF                                    // $2FFF  ???
	cpy #$01                                     // $3000
	cpy #$30                                     // $3002
	.byte $03                                    // $3004  ???
	cpx #$0d                                     // $3005
	.byte $03                                    // $3007  ???
	ldy #$0a                                     // $3008
	.byte $03                                    // $300A  ???
	cpy #$0a                                     // $300B
	.byte $CB                                    // $300D  ???
	cpy #$04                                     // $300E
	and $00,x                                    // $3010
	.byte $02                                    // $3012  ???
	rol $0100                                    // $3013
	.byte $4B                                    // $3016  ???
	brk                                          // $3017
	brk                                          // $3018
	stx $c0,y                                    // $3019
	brk                                          // $301B
	plp                                          // $301C
	.byte $B0, $00                               // $301D  bcs $301F
	.byte $54                                    // $301F  ???
	.byte $80                                    // $3020  ???
	brk                                          // $3021
	pla                                          // $3022
	.byte $80                                    // $3023  ???
	brk                                          // $3024
	sei                                          // $3025
	rti                                          // $3026
	rti                                          // $3027
	.byte $44                                    // $3028  ???
	jsr $82a0                                    // $3029
	asl $91,x                                    // $302C
	ora ($09,x)                                  // $302E
	asl                                          // $3030
	brk                                          // $3031
	sty $04                                      // $3032
	ora ($00,x)                                  // $3034
	brk                                          // $3036
	.byte $02                                    // $3037  ???
	brk                                          // $3038
	brk                                          // $3039
	asl $00                                      // $303A
	brk                                          // $303C
	.byte $03                                    // $303D  ???
	.byte $80                                    // $303E  ???
	brk                                          // $303F
	brk                                          // $3040
	ora ($c0,x)                                  // $3041
	brk                                          // $3043
	.byte $03                                    // $3044  ???
	cpx #$0c                                     // $3045
	.byte $03                                    // $3047  ???
	ldy #$03                                     // $3048
	.byte $43                                    // $304A  ???
	cpy #$00                                     // $304B
	.byte $EB                                    // $304D  ???
	brk                                          // $304E
	brk                                          // $304F
	adc $80,x                                    // $3050
	brk                                          // $3052
	.byte $9E                                    // $3053  ???
	brk                                          // $3054
	brk                                          // $3055
	.byte $AB                                    // $3056  ???
	brk                                          // $3057
	brk                                          // $3058
	lsr $c0,x                                    // $3059
	brk                                          // $305B
	rol                                          // $305C
	.byte $30, $00                               // $305D  bmi $305F
	eor $0c,x                                    // $305F
	brk                                          // $3061
	adc #$03                                     // $3062
	brk                                          // $3064
	sei                                          // $3065
	.byte $80                                    // $3066  ???
	brk                                          // $3067
	and #$40                                     // $3068
	brk                                          // $306A
	plp                                          // $306B
	rti                                          // $306C
	brk                                          // $306D
	plp                                          // $306E
	brk                                          // $306F
	brk                                          // $3070
	tay                                          // $3071
	brk                                          // $3072
	ora ($f0,x)                                  // $3073
	brk                                          // $3075
	brk                                          // $3076
	.byte $80                                    // $3077  ???
	brk                                          // $3078
	ora ($40,x)                                  // $3079
	brk                                          // $307B
	brk                                          // $307C
	brk                                          // $307D
	brk                                          // $307E
	brk                                          // $307F
	brk                                          // $3080
	brk                                          // $3081
	brk                                          // $3082
	ora ($0c,x)                                  // $3083
	rti                                          // $3085
	ora ($8e,x)                                  // $3086
	rts                                          // $3088
	.byte $03                                    // $3089  ???
	lsr                                          // $308A
	.byte $62                                    // $308B  ???
	.byte $02                                    // $308C  ???
	.byte $6B                                    // $308D  ???
	.byte $72                                    // $308E  ???
	.byte $22                                    // $308F  ???
	lda $7ad6                                    // $3090
	.byte $BB                                    // $3093  ???
	inc $7f4e,x                                  // $3094
	.byte $FA                                    // $3097  ???
	lsr $ff                                      // $3098
	.byte $FC                                    // $309A  ???
	.byte $4F                                    // $309B  ???
	.byte $FF                                    // $309C  ???
	.byte $FF                                    // $309D  ???
	.byte $D7                                    // $309E  ???
	.byte $FF                                    // $309F  ???
	.byte $FF                                    // $30A0  ???
	.byte $BF                                    // $30A1  ???
	.byte $FB                                    // $30A2  ???
	.byte $FC                                    // $30A3  ???
	ldx $fe69                                    // $30A4
	txa                                          // $30A7
	txa                                          // $30A8
	nop                                          // $30A9
	.byte $92                                    // $30AA  ???
	txa                                          // $30AB
	.byte $52                                    // $30AC  ???
	.byte $82                                    // $30AD  ???
	clc                                          // $30AE
	.byte $52                                    // $30AF  ???
	.byte $82                                    // $30B0  ???
	.byte $10, $40                               // $30B1  bpl $30F3
	.byte $82                                    // $30B3  ???
	.byte $10, $40                               // $30B4  bpl $30F6
	.byte $02                                    // $30B6  ???
	.byte $10, $40                               // $30B7  bpl $30F9
	brk                                          // $30B9
	.byte $10, $00                               // $30BA  bpl $30BC
	brk                                          // $30BC
	brk                                          // $30BD
	brk                                          // $30BE
	brk                                          // $30BF
	brk                                          // $30C0
	brk                                          // $30C1
	brk                                          // $30C2
	brk                                          // $30C3
	brk                                          // $30C4
	.byte $44                                    // $30C5  ???
	brk                                          // $30C6
	php                                          // $30C7
	jmp ($9e00)                                  // $30C8
	cpx $7501                                    // $30CB
	.byte $5C                                    // $30CE  ???
	.byte $22                                    // $30CF  ???
	lda $d4                                      // $30D0
	.byte $33                                    // $30D2  ???
	.byte $BF                                    // $30D3  ???
	.byte $F4                                    // $30D4  ???
	and #$ff                                     // $30D5
	.byte $FC                                    // $30D7  ???
	.byte $27                                    // $30D8  ???
	.byte $FF                                    // $30D9  ???
	inc $ff2f,x                                  // $30DA
	.byte $FF                                    // $30DD  ???
	.byte $17                                    // $30DE  ???
	.byte $FF                                    // $30DF  ???
	.byte $FF                                    // $30E0  ???
	.byte $3F                                    // $30E1  ???
	.byte $FF                                    // $30E2  ???
	inc $f57e,x                                  // $30E3
	.byte $FC                                    // $30E6  ???
	.byte $10, $94                               // $30E7  bpl $307D
	.byte $74                                    // $30E9  ???
	.byte $22                                    // $30EA  ???
	sty $c4,x                                    // $30EB
	.byte $22                                    // $30ED  ???
	stx $c4                                      // $30EE
	brk                                          // $30F0
	.byte $82                                    // $30F1  ???
	.byte $44                                    // $30F2  ???
	brk                                          // $30F3
	.byte $82                                    // $30F4  ???
	.byte $44                                    // $30F5  ???
	brk                                          // $30F6
	.byte $02                                    // $30F7  ???
	.byte $44                                    // $30F8  ???
	brk                                          // $30F9
	brk                                          // $30FA
	brk                                          // $30FB
	brk                                          // $30FC
	brk                                          // $30FD
	brk                                          // $30FE
	brk                                          // $30FF
	brk                                          // $3100
	brk                                          // $3101
	brk                                          // $3102
	.byte $02                                    // $3103  ???
	.byte $30, $40                               // $3104  bmi $3146
	asl $71                                      // $3106
	.byte $80                                    // $3108  ???
	lsr $52                                      // $3109
	cpy #$4e                                     // $310B
	dec $40,x                                    // $310D
	.byte $6B                                    // $310F  ???
	lda $44,x                                    // $3110
	.byte $7F                                    // $3112  ???
	.byte $FF                                    // $3113  ???
	lsr $ff5f,x                                  // $3114
	.byte $72                                    // $3117  ???
	.byte $3F                                    // $3118  ???
	.byte $FF                                    // $3119  ???
	.byte $62                                    // $311A  ???
	.byte $FF                                    // $311B  ???
	.byte $FF                                    // $311C  ???
	.byte $F2                                    // $311D  ???
	.byte $FF                                    // $311E  ???
	.byte $FF                                    // $311F  ???
	.byte $EB                                    // $3120  ???
	.byte $3F                                    // $3121  ???
	.byte $DF                                    // $3122  ???
	sbc $967f,x                                  // $3123
	adc $57,x                                    // $3126
	eor ($51),y                                  // $3128
	lsr                                          // $312A
	eor ($49),y                                  // $312B
	lsr                                          // $312D
	clc                                          // $312E
	eor ($02,x)                                  // $312F
	php                                          // $3131
	eor ($02,x)                                  // $3132
	php                                          // $3134
	eor ($02,x)                                  // $3135
	php                                          // $3137
	rti                                          // $3138
	brk                                          // $3139
	php                                          // $313A
	brk                                          // $313B
	brk                                          // $313C
	brk                                          // $313D
	brk                                          // $313E
	brk                                          // $313F
	brk                                          // $3140
	brk                                          // $3141
	brk                                          // $3142
	.byte $22                                    // $3143  ???
	brk                                          // $3144
	brk                                          // $3145
	rol $10,x                                    // $3146
	brk                                          // $3148
	.byte $37                                    // $3149  ???
	adc $3a00,y                                  // $314A
	ldx $3a80                                    // $314D
	lda $44                                      // $3150
	.byte $2F                                    // $3152  ???
	sbc $3fcc,x                                  // $3153
	.byte $FF                                    // $3156  ???
	sty $7f,x                                    // $3157
	.byte $FF                                    // $3159  ???
	cpx $ff                                      // $315A
	.byte $FF                                    // $315C  ???
	.byte $F4                                    // $315D  ???
	.byte $FF                                    // $315E  ???
	.byte $FF                                    // $315F  ???
	inx                                          // $3160
	.byte $7F                                    // $3161  ???
	.byte $F7                                    // $3162  ???
	.byte $FC                                    // $3163  ???
	.byte $3F                                    // $3164  ???
	.byte $AF                                    // $3165  ???
	ror $292e,x                                  // $3166
	php                                          // $3169
	.byte $23                                    // $316A  ???
	and #$44                                     // $316B
	.byte $23                                    // $316D  ???
	adc ($44,x)                                  // $316E
	.byte $22                                    // $3170  ???
	eor ($00,x)                                  // $3171
	.byte $22                                    // $3173  ???
	eor ($00,x)                                  // $3174
	.byte $22                                    // $3176  ???
	rti                                          // $3177
	brk                                          // $3178
	.byte $02                                    // $3179  ???
	brk                                          // $317A
	brk                                          // $317B
	brk                                          // $317C
	brk                                          // $317D
	brk                                          // $317E
	brk                                          // $317F
	brk                                          // $3180
	brk                                          // $3181
	brk                                          // $3182
	brk                                          // $3183
	brk                                          // $3184
	brk                                          // $3185
	brk                                          // $3186
	rti                                          // $3187
	brk                                          // $3188
	brk                                          // $3189
	rts                                          // $318A
	rti                                          // $318B
	brk                                          // $318C
	.byte $70, $80                               // $318D  bvs $310F
	brk                                          // $318F
	.byte $79, $80, $00                          // $3190  adc $0080,y
	.byte $1F                                    // $3193  ???
	brk                                          // $3194
	brk                                          // $3195
	.byte $1E, $00, $00                          // $3196  asl $0000,x
	.byte $7F                                    // $3199  ???
	.byte $80                                    // $319A  ???
	.byte $03                                    // $319B  ???
	.byte $83                                    // $319C  ???
	cpy #$04                                     // $319D
	brk                                          // $319F
	rts                                          // $31A0
	php                                          // $31A1
	brk                                          // $31A2
	brk                                          // $31A3
	brk                                          // $31A4
	brk                                          // $31A5
	brk                                          // $31A6
	brk                                          // $31A7
	brk                                          // $31A8
	brk                                          // $31A9
	brk                                          // $31AA
	brk                                          // $31AB
	brk                                          // $31AC
	brk                                          // $31AD
	brk                                          // $31AE
	brk                                          // $31AF
	brk                                          // $31B0
	brk                                          // $31B1
	brk                                          // $31B2
	brk                                          // $31B3
	brk                                          // $31B4
	brk                                          // $31B5
	brk                                          // $31B6
	brk                                          // $31B7
	brk                                          // $31B8
	brk                                          // $31B9
	brk                                          // $31BA
	brk                                          // $31BB
	brk                                          // $31BC
	brk                                          // $31BD
	brk                                          // $31BE
	brk                                          // $31BF
	brk                                          // $31C0
	brk                                          // $31C1
	brk                                          // $31C2
	brk                                          // $31C3
	brk                                          // $31C4
	brk                                          // $31C5
	brk                                          // $31C6
	brk                                          // $31C7
	brk                                          // $31C8
	brk                                          // $31C9
	brk                                          // $31CA
	brk                                          // $31CB
	brk                                          // $31CC
	brk                                          // $31CD
	brk                                          // $31CE
	brk                                          // $31CF
	brk                                          // $31D0
	brk                                          // $31D1
	brk                                          // $31D2
	brk                                          // $31D3
	brk                                          // $31D4
	brk                                          // $31D5
	.byte $1E, $00, $00                          // $31D6  asl $0000,x
	.byte $7F                                    // $31D9  ???
	.byte $80                                    // $31DA  ???
	.byte $13                                    // $31DB  ???
	.byte $BB                                    // $31DC  ???
	cpy #$0c                                     // $31DD
	and ($60),y                                  // $31DF
	brk                                          // $31E1
	.byte $20, $00, $00                          // $31E2  jsr $0000
	rti                                          // $31E5
	brk                                          // $31E6
	brk                                          // $31E7
	brk                                          // $31E8
	brk                                          // $31E9
	brk                                          // $31EA
	brk                                          // $31EB
	brk                                          // $31EC
	brk                                          // $31ED
	brk                                          // $31EE
	brk                                          // $31EF
	brk                                          // $31F0
	brk                                          // $31F1
	brk                                          // $31F2
	brk                                          // $31F3
	brk                                          // $31F4
	brk                                          // $31F5
	brk                                          // $31F6
	brk                                          // $31F7
	brk                                          // $31F8
	brk                                          // $31F9
	brk                                          // $31FA
	brk                                          // $31FB
	brk                                          // $31FC
	brk                                          // $31FD
	brk                                          // $31FE
	brk                                          // $31FF
	brk                                          // $3200
	brk                                          // $3201
	brk                                          // $3202
	brk                                          // $3203
	brk                                          // $3204
	brk                                          // $3205
	brk                                          // $3206
	.byte $02                                    // $3207  ???
	brk                                          // $3208
	.byte $02                                    // $3209  ???
	asl $00                                      // $320A
	ora ($0e,x)                                  // $320C
	brk                                          // $320E
	ora ($9e,x)                                  // $320F
	brk                                          // $3211
	brk                                          // $3212
	sed                                          // $3213
	brk                                          // $3214
	brk                                          // $3215
	sei                                          // $3216
	brk                                          // $3217
	ora ($fe,x)                                  // $3218
	brk                                          // $321A
	.byte $03                                    // $321B  ???
	cmp ($c0,x)                                  // $321C
	asl $00                                      // $321E
	.byte $20, $00, $00                          // $3220  jsr $0000
	.byte $10, $00                               // $3223  bpl $3225
	brk                                          // $3225
	brk                                          // $3226
	brk                                          // $3227
	brk                                          // $3228
	brk                                          // $3229
	brk                                          // $322A
	brk                                          // $322B
	brk                                          // $322C
	brk                                          // $322D
	brk                                          // $322E
	brk                                          // $322F
	brk                                          // $3230
	brk                                          // $3231
	brk                                          // $3232
	brk                                          // $3233
	brk                                          // $3234
	brk                                          // $3235
	brk                                          // $3236
	brk                                          // $3237
	brk                                          // $3238
	brk                                          // $3239
	brk                                          // $323A
	brk                                          // $323B
	brk                                          // $323C
	brk                                          // $323D
	brk                                          // $323E
	brk                                          // $323F
	brk                                          // $3240
	brk                                          // $3241
	brk                                          // $3242
	brk                                          // $3243
	brk                                          // $3244
	brk                                          // $3245
	brk                                          // $3246
	brk                                          // $3247
	brk                                          // $3248
	brk                                          // $3249
	brk                                          // $324A
	brk                                          // $324B
	brk                                          // $324C
	brk                                          // $324D
	brk                                          // $324E
	brk                                          // $324F
	brk                                          // $3250
	brk                                          // $3251
	brk                                          // $3252
	brk                                          // $3253
	brk                                          // $3254
	brk                                          // $3255
	sei                                          // $3256
	brk                                          // $3257
	ora ($fe,x)                                  // $3258
	brk                                          // $325A
	.byte $03                                    // $325B  ???
	cmp $06c8,x                                  // $325C
	.byte $8C, $30, $00                          // $325F  sty $0030
	.byte $04                                    // $3262  ???
	brk                                          // $3263
	brk                                          // $3264
	.byte $02                                    // $3265  ???
	brk                                          // $3266
	brk                                          // $3267
	brk                                          // $3268
	brk                                          // $3269
	brk                                          // $326A
	brk                                          // $326B
	brk                                          // $326C
	brk                                          // $326D
	brk                                          // $326E
	brk                                          // $326F
	brk                                          // $3270
	brk                                          // $3271
	brk                                          // $3272
	brk                                          // $3273
	brk                                          // $3274
	brk                                          // $3275
	brk                                          // $3276
	brk                                          // $3277
	brk                                          // $3278
	brk                                          // $3279
	brk                                          // $327A
	brk                                          // $327B
	brk                                          // $327C
	brk                                          // $327D
	brk                                          // $327E
	brk                                          // $327F
	brk                                          // $3280
	.byte $30, $0A                               // $3281  bmi $328D
	brk                                          // $3283
	.byte $FC                                    // $3284  ???
	asl                                          // $3285
	brk                                          // $3286
	.byte $FF                                    // $3287  ???
	rol                                          // $3288
	.byte $03                                    // $3289  ???
	.byte $7F                                    // $328A  ???
	nop                                          // $328B
	ora ($5f,x)                                  // $328C
	tax                                          // $328E
	ora ($56,x)                                  // $328F
	tax                                          // $3291
	ora ($55,x)                                  // $3292
	tax                                          // $3294
	ora $aa54                                    // $3295
	ora $50                                      // $3298
	rol                                          // $329A
	ora $40                                      // $329B
	nop                                          // $329D
	ora $00                                      // $329E
	.byte $3B                                    // $32A0  ???
	and $00,x                                    // $32A1
	.byte $3B                                    // $32A3  ???
	.byte $14                                    // $32A4  ???
	brk                                          // $32A5
	nop                                          // $32A6
	.byte $10, $00                               // $32A7  bpl $32A9
	ror                                          // $32A9
	.byte $10, $00                               // $32AA  bpl $32AC
	nop                                          // $32AC
	cpy #$00                                     // $32AD
	nop                                          // $32AF
	brk                                          // $32B0
	brk                                          // $32B1
	rol                                          // $32B2
	brk                                          // $32B3
	brk                                          // $32B4
	.byte $3B                                    // $32B5  ???
	brk                                          // $32B6
	brk                                          // $32B7
	php                                          // $32B8
	brk                                          // $32B9
	brk                                          // $32BA
	php                                          // $32BB
	brk                                          // $32BC
	brk                                          // $32BD
	brk                                          // $32BE
	brk                                          // $32BF
	.byte $83                                    // $32C0  ???
	.byte $FC                                    // $32C1  ???
	brk                                          // $32C2
	.byte $AF                                    // $32C3  ???
	.byte $F4                                    // $32C4  ???
	brk                                          // $32C5
	.byte $BF                                    // $32C6  ???
	.byte $D7                                    // $32C7  ???
	brk                                          // $32C8
	.byte $BF                                    // $32C9  ???
	eor $00,x                                    // $32CA
	.byte $FF                                    // $32CC  ???
	eor $c0,x                                    // $32CD
	sbc $4045,x                                  // $32CF
	sbc $01,x                                    // $32D2
	.byte $70, $EA                               // $32D4  bvs $32C0
	brk                                          // $32D6
	.byte $50, $AA                               // $32D7  bvc $3283
	brk                                          // $32D9
	.byte $1C                                    // $32DA  ???
	tax                                          // $32DB
	brk                                          // $32DC
	.byte $04                                    // $32DD  ???
	tax                                          // $32DE
	.byte $82                                    // $32DF  ???
	.byte $03                                    // $32E0  ???
	tax                                          // $32E1
	.byte $80                                    // $32E2  ???
	.byte $80                                    // $32E3  ???
	nop                                          // $32E4
	ldy #$a0                                     // $32E5
	ror                                          // $32E7
	ldy #$28                                     // $32E8
	nop                                          // $32EA
	tay                                          // $32EB
	tay                                          // $32EC
	dex                                          // $32ED
	tax                                          // $32EE
	tay                                          // $32EF
	asl                                          // $32F0
	tax                                          // $32F1
	ldy #$02                                     // $32F2
	tax                                          // $32F4
	.byte $80                                    // $32F5  ???
	.byte $02                                    // $32F6  ???
	tax                                          // $32F7
	brk                                          // $32F8
	brk                                          // $32F9
	tay                                          // $32FA
	brk                                          // $32FB
	brk                                          // $32FC
	brk                                          // $32FD
	brk                                          // $32FE
	brk                                          // $32FF
	brk                                          // $3300
	brk                                          // $3301
	brk                                          // $3302
	brk                                          // $3303
	brk                                          // $3304
	brk                                          // $3305
	brk                                          // $3306
	brk                                          // $3307
	brk                                          // $3308
	brk                                          // $3309
	brk                                          // $330A
	brk                                          // $330B
	brk                                          // $330C
	.byte $0C                                    // $330D  ???
	brk                                          // $330E
	brk                                          // $330F
	.byte $37                                    // $3310  ???
	asl                                          // $3311
	brk                                          // $3312
	ora ($eb,x)                                  // $3313
	brk                                          // $3315
	brk                                          // $3316
	rol                                          // $3317
	brk                                          // $3318
	brk                                          // $3319
	plp                                          // $331A
	brk                                          // $331B
	brk                                          // $331C
	php                                          // $331D
	brk                                          // $331E
	brk                                          // $331F
	brk                                          // $3320
	brk                                          // $3321
	brk                                          // $3322
	brk                                          // $3323
	brk                                          // $3324
	brk                                          // $3325
	brk                                          // $3326
	brk                                          // $3327
	brk                                          // $3328
	brk                                          // $3329
	brk                                          // $332A
	brk                                          // $332B
	brk                                          // $332C
	brk                                          // $332D
	brk                                          // $332E
	brk                                          // $332F
	brk                                          // $3330
	brk                                          // $3331
	brk                                          // $3332
	brk                                          // $3333
	brk                                          // $3334
	brk                                          // $3335
	brk                                          // $3336
	brk                                          // $3337
	brk                                          // $3338
	brk                                          // $3339
	brk                                          // $333A
	brk                                          // $333B
	brk                                          // $333C
	brk                                          // $333D
	brk                                          // $333E
	brk                                          // $333F
	brk                                          // $3340
	brk                                          // $3341
	brk                                          // $3342
	brk                                          // $3343
	brk                                          // $3344
	brk                                          // $3345
	brk                                          // $3346
	brk                                          // $3347
	brk                                          // $3348
	brk                                          // $3349
	brk                                          // $334A
	brk                                          // $334B
	.byte $3C                                    // $334C  ???
	brk                                          // $334D
	brk                                          // $334E
	.byte $D7                                    // $334F  ???
	cpy #$00                                     // $3350
	ldy #$00                                     // $3352
	brk                                          // $3354
	ldy #$00                                     // $3355
	brk                                          // $3357
	tay                                          // $3358
	brk                                          // $3359
	brk                                          // $335A
	plp                                          // $335B
	.byte $80                                    // $335C  ???
	brk                                          // $335D
	asl                                          // $335E
	brk                                          // $335F
	brk                                          // $3360
	brk                                          // $3361
	brk                                          // $3362
	brk                                          // $3363
	brk                                          // $3364
	brk                                          // $3365
	brk                                          // $3366
	brk                                          // $3367
	brk                                          // $3368
	brk                                          // $3369
	brk                                          // $336A
	brk                                          // $336B
	brk                                          // $336C
	brk                                          // $336D
	brk                                          // $336E
	brk                                          // $336F
	brk                                          // $3370
	brk                                          // $3371
	brk                                          // $3372
	brk                                          // $3373
	brk                                          // $3374
	brk                                          // $3375
	brk                                          // $3376
	brk                                          // $3377
	brk                                          // $3378
	brk                                          // $3379
	brk                                          // $337A
	brk                                          // $337B
	brk                                          // $337C
	brk                                          // $337D
	brk                                          // $337E
	brk                                          // $337F
	rti                                          // $3380
	brk                                          // $3381
	ora ($14,x)                                  // $3382
	.byte $3C                                    // $3384  ???
	.byte $14                                    // $3385  ???
	ora $db                                      // $3386
	.byte $50, $0F                               // $3388  bvc $3399
	.byte $DB                                    // $338A  ???
	.byte $F0, $3F                               // $338B  beq $33CC
	.byte $DB                                    // $338D  ???
	.byte $FC                                    // $338E  ???
	.byte $F7                                    // $338F  ???
	.byte $DB                                    // $3390  ???
	.byte $DF                                    // $3391  ???
	and $db,x                                    // $3392
	.byte $5C                                    // $3394  ???
	ora $70db                                    // $3395
	.byte $0F                                    // $3398  ???
	.byte $DB                                    // $3399  ???
	.byte $F0, $03                               // $339A  beq $339F
	tax                                          // $339C
	cpy #$02                                     // $339D
	adc #$80                                     // $339F
	.byte $03                                    // $33A1  ???
	tax                                          // $33A2
	cpy #$02                                     // $33A3
	.byte $FF                                    // $33A5  ???
	.byte $80                                    // $33A6  ???
	.byte $03                                    // $33A7  ???
	ldx $0fc0,y                                  // $33A8
	ldx $0ff0,y                                  // $33AB
	.byte $FF                                    // $33AE  ???
	.byte $F0, $3F                               // $33AF  beq $33F0
	.byte $FF                                    // $33B1  ???
	.byte $FC                                    // $33B2  ???
	.byte $3F                                    // $33B3  ???
	.byte $FF                                    // $33B4  ???
	.byte $FC                                    // $33B5  ???
	.byte $FF                                    // $33B6  ???
	.byte $FF                                    // $33B7  ???
	.byte $FF                                    // $33B8  ???
	.byte $BF                                    // $33B9  ???
	.byte $FF                                    // $33BA  ???
	inc $ffef,x                                  // $33BB
	.byte $FB                                    // $33BE  ???
	.byte $FF                                    // $33BF  ???
	.byte $FB                                    // $33C0  ???
	.byte $FF                                    // $33C1  ???
	.byte $EF                                    // $33C2  ???
	.byte $FB                                    // $33C3  ???
	.byte $FF                                    // $33C4  ???
	.byte $EF                                    // $33C5  ???
	.byte $FA                                    // $33C6  ???
	.byte $FF                                    // $33C7  ???
	.byte $AF                                    // $33C8  ???
	.byte $FB                                    // $33C9  ???
	.byte $FF                                    // $33CA  ???
	.byte $EF                                    // $33CB  ???
	.byte $FA                                    // $33CC  ???
	.byte $FF                                    // $33CD  ???
	.byte $AF                                    // $33CE  ???
	.byte $7B                                    // $33CF  ???
	.byte $FF                                    // $33D0  ???
	sbc $ff7a                                    // $33D1
	lda $ff7f                                    // $33D4
	sbc $ff7f,x                                  // $33D7
	sbc $ff7f,x                                  // $33DA
	sbc $ff7f,x                                  // $33DD
	sbc $ff7f,x                                  // $33E0
	sbc $ff7f,x                                  // $33E3
	sbc $ff5f,x                                  // $33E6
	sbc $5f,x                                    // $33E9
	.byte $FF                                    // $33EB  ???
	sbc $5f,x                                    // $33EC
	.byte $FF                                    // $33EE  ???
	sbc $5f,x                                    // $33EF
	.byte $FF                                    // $33F1  ???
	sbc $5f,x                                    // $33F2
	.byte $FF                                    // $33F4  ???
	sbc $5f,x                                    // $33F5
	.byte $FF                                    // $33F7  ???
	sbc $5a,x                                    // $33F8
	.byte $FF                                    // $33FA  ???
	lda $5a                                      // $33FB
	ldx $ffa5,y                                  // $33FD
	ror                                          // $3400
	.byte $FF                                    // $3401  ???
	lda #$a7                                     // $3402
	.byte $FF                                    // $3404  ???
	.byte $DA                                    // $3405  ???
	.byte $A3                                    // $3406  ???
	.byte $FF                                    // $3407  ???
	dex                                          // $3408
	pla                                          // $3409
	.byte $FF                                    // $340A  ???
	and #$68                                     // $340B
	.byte $FF                                    // $340D  ???
	and #$68                                     // $340E
	.byte $FF                                    // $3410  ???
	and #$0a                                     // $3411
	.byte $FF                                    // $3413  ???
	ldy #$0a                                     // $3414
	.byte $3C                                    // $3416  ???
	ldy #$02                                     // $3417
	.byte $BE, $80, $00                          // $3419  ldx $0080,y
	.byte $BE, $00, $00                          // $341C  ldx $0000,y
	.byte $82                                    // $341F  ???
	brk                                          // $3420
	brk                                          // $3421
	.byte $82                                    // $3422  ???
	brk                                          // $3423
	brk                                          // $3424
	.byte $82                                    // $3425  ???
	brk                                          // $3426
	.byte $02                                    // $3427  ???
	.byte $82                                    // $3428  ???
	.byte $80                                    // $3429  ???
	asl                                          // $342A
	brk                                          // $342B
	ldy #$0a                                     // $342C
	brk                                          // $342E
	ldy #$22                                     // $342F
	brk                                          // $3431
	dey                                          // $3432
	.byte $22                                    // $3433  ???
	brk                                          // $3434
	dey                                          // $3435
	dey                                          // $3436
	brk                                          // $3437
	.byte $22                                    // $3438  ???
	dey                                          // $3439
	brk                                          // $343A
	.byte $22                                    // $343B  ???
	dey                                          // $343C
	brk                                          // $343D
	.byte $22                                    // $343E  ???
	brk                                          // $343F
	brk                                          // $3440
	brk                                          // $3441
	brk                                          // $3442
	brk                                          // $3443
	brk                                          // $3444
	brk                                          // $3445
	brk                                          // $3446
	brk                                          // $3447
	brk                                          // $3448
	brk                                          // $3449
	brk                                          // $344A
	brk                                          // $344B
	brk                                          // $344C
	brk                                          // $344D
	brk                                          // $344E
	brk                                          // $344F
	brk                                          // $3450
	brk                                          // $3451
	.byte $3C                                    // $3452  ???
	brk                                          // $3453
	brk                                          // $3454
	clc                                          // $3455
	brk                                          // $3456
	brk                                          // $3457
	asl $00,x                                    // $3458
	brk                                          // $345A
	ora ($80,x)                                  // $345B
	brk                                          // $345D
	brk                                          // $345E
	rts                                          // $345F
	brk                                          // $3460
	brk                                          // $3461
	clc                                          // $3462
	brk                                          // $3463
	brk                                          // $3464
	asl $c0                                      // $3465
	brk                                          // $3467
	ora ($b0,x)                                  // $3468
	brk                                          // $346A
	ora ($68,x)                                  // $346B
	brk                                          // $346D
	brk                                          // $346E
	.byte $D0, $00                               // $346F  bne $3471
	brk                                          // $3471
	.byte $20, $00, $00                          // $3472  jsr $0000
	.byte $10, $00                               // $3475  bpl $3477
	brk                                          // $3477
	brk                                          // $3478
	brk                                          // $3479
	brk                                          // $347A
	brk                                          // $347B
	brk                                          // $347C
	brk                                          // $347D
	brk                                          // $347E
	brk                                          // $347F
	brk                                          // $3480
	brk                                          // $3481
	brk                                          // $3482
	.byte $30, $00                               // $3483  bmi $3485
	brk                                          // $3485
	.byte $2E, $18, $00                          // $3486  rol $0018
	ora ($e0,x)                                  // $3489
	brk                                          // $348B
	brk                                          // $348C
	.byte $50, $00                               // $348D  bvc $348F
	brk                                          // $348F
	.byte $20, $00, $00                          // $3490  jsr $0000
	brk                                          // $3493
	brk                                          // $3494
	brk                                          // $3495
	brk                                          // $3496
	brk                                          // $3497
	brk                                          // $3498
	brk                                          // $3499
	brk                                          // $349A
	brk                                          // $349B
	brk                                          // $349C
	brk                                          // $349D
	brk                                          // $349E
	brk                                          // $349F
	brk                                          // $34A0
	brk                                          // $34A1
	brk                                          // $34A2
	brk                                          // $34A3
	brk                                          // $34A4
	brk                                          // $34A5
	brk                                          // $34A6
	brk                                          // $34A7
	brk                                          // $34A8
	brk                                          // $34A9
	brk                                          // $34AA
	brk                                          // $34AB
	brk                                          // $34AC
	brk                                          // $34AD
	brk                                          // $34AE
	brk                                          // $34AF
	brk                                          // $34B0
	brk                                          // $34B1
	brk                                          // $34B2
	brk                                          // $34B3
	brk                                          // $34B4
	brk                                          // $34B5
	brk                                          // $34B6
	brk                                          // $34B7
	brk                                          // $34B8
	brk                                          // $34B9
	brk                                          // $34BA
	brk                                          // $34BB
	brk                                          // $34BC
	brk                                          // $34BD
	brk                                          // $34BE
	brk                                          // $34BF
	brk                                          // $34C0
	brk                                          // $34C1
	brk                                          // $34C2
	brk                                          // $34C3
	brk                                          // $34C4
	brk                                          // $34C5
	brk                                          // $34C6
	brk                                          // $34C7
	brk                                          // $34C8
	brk                                          // $34C9
	brk                                          // $34CA
	brk                                          // $34CB
	brk                                          // $34CC
	.byte $70, $00                               // $34CD  bvs $34CF
	brk                                          // $34CF
	rts                                          // $34D0
	brk                                          // $34D1
	brk                                          // $34D2
	.byte $50, $00                               // $34D3  bvc $34D5
	brk                                          // $34D5
	php                                          // $34D6
	brk                                          // $34D7
	brk                                          // $34D8
	.byte $04                                    // $34D9  ???
	brk                                          // $34DA
	brk                                          // $34DB
	.byte $02                                    // $34DC  ???
	brk                                          // $34DD
	brk                                          // $34DE
	ora ($00,x)                                  // $34DF
	brk                                          // $34E1
	brk                                          // $34E2
	.byte $80                                    // $34E3  ???
	brk                                          // $34E4
	brk                                          // $34E5
	rti                                          // $34E6
	brk                                          // $34E7
	brk                                          // $34E8
	.byte $3C                                    // $34E9  ???
	brk                                          // $34EA
	brk                                          // $34EB
	.byte $30, $00                               // $34EC  bmi $34EE
	brk                                          // $34EE
	.byte $2F                                    // $34EF  ???
	brk                                          // $34F0
	brk                                          // $34F1
	.byte $2C, $00, $00                          // $34F2  bit $0000
	php                                          // $34F5
	brk                                          // $34F6
	brk                                          // $34F7
	php                                          // $34F8
	brk                                          // $34F9
	brk                                          // $34FA
	brk                                          // $34FB
	brk                                          // $34FC
	brk                                          // $34FD
	brk                                          // $34FE
	brk                                          // $34FF
	brk                                          // $3500
	cpy #$00                                     // $3501
	brk                                          // $3503
	cpy #$00                                     // $3504
	brk                                          // $3506
	.byte $20, $00, $00                          // $3507  jsr $0000
	.byte $10, $00                               // $350A  bpl $350C
	brk                                          // $350C
	php                                          // $350D
	brk                                          // $350E
	brk                                          // $350F
	.byte $07                                    // $3510  ???
	brk                                          // $3511
	brk                                          // $3512
	ora $80                                      // $3513
	brk                                          // $3515
	.byte $03                                    // $3516  ???
	brk                                          // $3517
	brk                                          // $3518
	.byte $02                                    // $3519  ???
	brk                                          // $351A
	brk                                          // $351B
	brk                                          // $351C
	brk                                          // $351D
	brk                                          // $351E
	brk                                          // $351F
	brk                                          // $3520
	brk                                          // $3521
	brk                                          // $3522
	brk                                          // $3523
	brk                                          // $3524
	brk                                          // $3525
	brk                                          // $3526
	brk                                          // $3527
	brk                                          // $3528
	brk                                          // $3529
	brk                                          // $352A
	brk                                          // $352B
	brk                                          // $352C
	brk                                          // $352D
	brk                                          // $352E
	brk                                          // $352F
	brk                                          // $3530
	brk                                          // $3531
	brk                                          // $3532
	brk                                          // $3533
	brk                                          // $3534
	brk                                          // $3535
	brk                                          // $3536
	brk                                          // $3537
	brk                                          // $3538
	brk                                          // $3539
	brk                                          // $353A
	brk                                          // $353B
	brk                                          // $353C
	brk                                          // $353D
	brk                                          // $353E
	brk                                          // $353F
	brk                                          // $3540
	brk                                          // $3541
	brk                                          // $3542
	brk                                          // $3543
	.byte $04                                    // $3544  ???
	brk                                          // $3545
	brk                                          // $3546
	.byte $07                                    // $3547  ???
	brk                                          // $3548
	brk                                          // $3549
	asl $00                                      // $354A
	brk                                          // $354C
	ora $00                                      // $354D
	brk                                          // $354F
	ora ($00,x)                                  // $3550
	brk                                          // $3552
	brk                                          // $3553
	.byte $80                                    // $3554  ???
	brk                                          // $3555
	brk                                          // $3556
	.byte $80                                    // $3557  ???
	brk                                          // $3558
	brk                                          // $3559
	rti                                          // $355A
	brk                                          // $355B
	brk                                          // $355C
	rti                                          // $355D
	brk                                          // $355E
	brk                                          // $355F
	.byte $20, $00, $00                          // $3560  jsr $0000
	.byte $20, $00, $00                          // $3563  jsr $0000
	.byte $10, $00                               // $3566  bpl $3568
	brk                                          // $3568
	.byte $10, $00                               // $3569  bpl $356B
	brk                                          // $356B
	.byte $1E, $00, $00                          // $356C  asl $0000,x
	clc                                          // $356F
	brk                                          // $3570
	brk                                          // $3571
	.byte $17                                    // $3572  ???
	brk                                          // $3573
	brk                                          // $3574
	.byte $0C                                    // $3575  ???
	brk                                          // $3576
	brk                                          // $3577
	php                                          // $3578
	brk                                          // $3579
	brk                                          // $357A
	brk                                          // $357B
	brk                                          // $357C
	brk                                          // $357D
	brk                                          // $357E
	brk                                          // $357F
	brk                                          // $3580
	.byte $04                                    // $3581  ???
	brk                                          // $3582
	brk                                          // $3583
	.byte $04                                    // $3584  ???
	brk                                          // $3585
	brk                                          // $3586
	.byte $04                                    // $3587  ???
	brk                                          // $3588
	brk                                          // $3589
	.byte $04                                    // $358A  ???
	brk                                          // $358B
	brk                                          // $358C
	.byte $04                                    // $358D  ???
	brk                                          // $358E
	brk                                          // $358F
	.byte $04                                    // $3590  ???
	brk                                          // $3591
	brk                                          // $3592
	.byte $0E, $00, $00                          // $3593  asl $0000
	asl                                          // $3596
	brk                                          // $3597
	brk                                          // $3598
	brk                                          // $3599
	brk                                          // $359A
	brk                                          // $359B
	brk                                          // $359C
	brk                                          // $359D
	brk                                          // $359E
	brk                                          // $359F
	brk                                          // $35A0
	brk                                          // $35A1
	brk                                          // $35A2
	brk                                          // $35A3
	brk                                          // $35A4
	brk                                          // $35A5
	brk                                          // $35A6
	brk                                          // $35A7
	brk                                          // $35A8
	brk                                          // $35A9
	brk                                          // $35AA
	brk                                          // $35AB
	brk                                          // $35AC
	brk                                          // $35AD
	brk                                          // $35AE
	brk                                          // $35AF
	brk                                          // $35B0
	brk                                          // $35B1
	brk                                          // $35B2
	brk                                          // $35B3
	brk                                          // $35B4
	brk                                          // $35B5
	brk                                          // $35B6
	brk                                          // $35B7
	brk                                          // $35B8
	brk                                          // $35B9
	brk                                          // $35BA
	brk                                          // $35BB
	brk                                          // $35BC
	brk                                          // $35BD
	brk                                          // $35BE
	brk                                          // $35BF
	brk                                          // $35C0
	brk                                          // $35C1
	brk                                          // $35C2
	brk                                          // $35C3
	brk                                          // $35C4
	brk                                          // $35C5
	brk                                          // $35C6
	brk                                          // $35C7
	brk                                          // $35C8
	brk                                          // $35C9
	brk                                          // $35CA
	brk                                          // $35CB
	brk                                          // $35CC
	.byte $04                                    // $35CD  ???
	brk                                          // $35CE
	brk                                          // $35CF
	.byte $0E, $00, $00                          // $35D0  asl $0000
	.byte $04                                    // $35D3  ???
	brk                                          // $35D4
	brk                                          // $35D5
	.byte $04                                    // $35D6  ???
	brk                                          // $35D7
	brk                                          // $35D8
	.byte $04                                    // $35D9  ???
	brk                                          // $35DA
	brk                                          // $35DB
	.byte $04                                    // $35DC  ???
	brk                                          // $35DD
	brk                                          // $35DE
	.byte $04                                    // $35DF  ???
	brk                                          // $35E0
	brk                                          // $35E1
	.byte $04                                    // $35E2  ???
	brk                                          // $35E3
	brk                                          // $35E4
	.byte $04                                    // $35E5  ???
	brk                                          // $35E6
	brk                                          // $35E7
	.byte $04                                    // $35E8  ???
	brk                                          // $35E9
	brk                                          // $35EA
	.byte $04                                    // $35EB  ???
	brk                                          // $35EC
	brk                                          // $35ED
	.byte $04                                    // $35EE  ???
	brk                                          // $35EF
	brk                                          // $35F0
	.byte $0E, $00, $00                          // $35F1  asl $0000
	ora $00,x                                    // $35F4
	brk                                          // $35F6
	.byte $0E, $00, $00                          // $35F7  asl $0000
	ora ($00),y                                  // $35FA
	brk                                          // $35FC
	brk                                          // $35FD
	brk                                          // $35FE
	brk                                          // $35FF
	brk                                          // $3600
	.byte $03                                    // $3601  ???
	brk                                          // $3602
	brk                                          // $3603
	.byte $03                                    // $3604  ???
	brk                                          // $3605
	brk                                          // $3606
	.byte $04                                    // $3607  ???
	brk                                          // $3608
	brk                                          // $3609
	php                                          // $360A
	brk                                          // $360B
	brk                                          // $360C
	.byte $10, $00                               // $360D  bpl $360F
	brk                                          // $360F
	cpx #$00                                     // $3610
	ora ($a0,x)                                  // $3612
	brk                                          // $3614
	brk                                          // $3615
	rts                                          // $3616
	brk                                          // $3617
	brk                                          // $3618
	rti                                          // $3619
	brk                                          // $361A
	brk                                          // $361B
	brk                                          // $361C
	brk                                          // $361D
	brk                                          // $361E
	brk                                          // $361F
	brk                                          // $3620
	brk                                          // $3621
	brk                                          // $3622
	brk                                          // $3623
	brk                                          // $3624
	brk                                          // $3625
	brk                                          // $3626
	brk                                          // $3627
	brk                                          // $3628
	brk                                          // $3629
	brk                                          // $362A
	brk                                          // $362B
	brk                                          // $362C
	brk                                          // $362D
	brk                                          // $362E
	brk                                          // $362F
	brk                                          // $3630
	brk                                          // $3631
	brk                                          // $3632
	brk                                          // $3633
	brk                                          // $3634
	brk                                          // $3635
	brk                                          // $3636
	brk                                          // $3637
	brk                                          // $3638
	brk                                          // $3639
	brk                                          // $363A
	brk                                          // $363B
	brk                                          // $363C
	brk                                          // $363D
	brk                                          // $363E
	brk                                          // $363F
	brk                                          // $3640
	brk                                          // $3641
	brk                                          // $3642
	brk                                          // $3643
	.byte $20, $00, $00                          // $3644  jsr $0000
	cpx #$00                                     // $3647
	brk                                          // $3649
	rts                                          // $364A
	brk                                          // $364B
	brk                                          // $364C
	ldy #$00                                     // $364D
	brk                                          // $364F
	.byte $80                                    // $3650  ???
	brk                                          // $3651
	ora ($00,x)                                  // $3652
	brk                                          // $3654
	ora ($00,x)                                  // $3655
	brk                                          // $3657
	.byte $02                                    // $3658  ???
	brk                                          // $3659
	brk                                          // $365A
	.byte $02                                    // $365B  ???
	brk                                          // $365C
	brk                                          // $365D
	.byte $04                                    // $365E  ???
	brk                                          // $365F
	brk                                          // $3660
	.byte $04                                    // $3661  ???
	brk                                          // $3662
	brk                                          // $3663
	php                                          // $3664
	brk                                          // $3665
	brk                                          // $3666
	php                                          // $3667
	brk                                          // $3668
	brk                                          // $3669
	sei                                          // $366A
	brk                                          // $366B
	brk                                          // $366C
	clc                                          // $366D
	brk                                          // $366E
	brk                                          // $366F
	inx                                          // $3670
	brk                                          // $3671
	brk                                          // $3672
	.byte $30, $00                               // $3673  bmi $3675
	brk                                          // $3675
	.byte $10, $00                               // $3676  bpl $3678
	brk                                          // $3678
	brk                                          // $3679
	brk                                          // $367A
	brk                                          // $367B
	brk                                          // $367C
	brk                                          // $367D
	brk                                          // $367E
	brk                                          // $367F
	brk                                          // $3680
	brk                                          // $3681
	brk                                          // $3682
	brk                                          // $3683
	brk                                          // $3684
	.byte $0C                                    // $3685  ???
	brk                                          // $3686
	.byte $0C                                    // $3687  ???
	.byte $74                                    // $3688  ???
	brk                                          // $3689
	.byte $07                                    // $368A  ???
	.byte $80                                    // $368B  ???
	brk                                          // $368C
	asl                                          // $368D
	brk                                          // $368E
	brk                                          // $368F
	.byte $04                                    // $3690  ???
	brk                                          // $3691
	brk                                          // $3692
	brk                                          // $3693
	brk                                          // $3694
	brk                                          // $3695
	brk                                          // $3696
	brk                                          // $3697
	brk                                          // $3698
	brk                                          // $3699
	brk                                          // $369A
	brk                                          // $369B
	brk                                          // $369C
	brk                                          // $369D
	brk                                          // $369E
	brk                                          // $369F
	brk                                          // $36A0
	brk                                          // $36A1
	brk                                          // $36A2
	brk                                          // $36A3
	brk                                          // $36A4
	brk                                          // $36A5
	brk                                          // $36A6
	brk                                          // $36A7
	brk                                          // $36A8
	brk                                          // $36A9
	brk                                          // $36AA
	brk                                          // $36AB
	brk                                          // $36AC
	brk                                          // $36AD
	brk                                          // $36AE
	brk                                          // $36AF
	brk                                          // $36B0
	brk                                          // $36B1
	brk                                          // $36B2
	brk                                          // $36B3
	brk                                          // $36B4
	brk                                          // $36B5
	brk                                          // $36B6
	brk                                          // $36B7
	brk                                          // $36B8
	brk                                          // $36B9
	brk                                          // $36BA
	brk                                          // $36BB
	brk                                          // $36BC
	brk                                          // $36BD
	brk                                          // $36BE
	brk                                          // $36BF
	brk                                          // $36C0
	brk                                          // $36C1
	brk                                          // $36C2
	brk                                          // $36C3
	brk                                          // $36C4
	brk                                          // $36C5
	brk                                          // $36C6
	brk                                          // $36C7
	brk                                          // $36C8
	brk                                          // $36C9
	brk                                          // $36CA
	brk                                          // $36CB
	brk                                          // $36CC
	.byte $0E, $00, $00                          // $36CD  asl $0000
	asl $00                                      // $36D0
	brk                                          // $36D2
	asl                                          // $36D3
	brk                                          // $36D4
	brk                                          // $36D5
	.byte $10, $00                               // $36D6  bpl $36D8
	brk                                          // $36D8
	.byte $20, $00, $00                          // $36D9  jsr $0000
	rti                                          // $36DC
	brk                                          // $36DD
	brk                                          // $36DE
	.byte $80                                    // $36DF  ???
	brk                                          // $36E0
	ora ($00,x)                                  // $36E1
	brk                                          // $36E3
	.byte $02                                    // $36E4  ???
	brk                                          // $36E5
	brk                                          // $36E6
	.byte $3C                                    // $36E7  ???
	brk                                          // $36E8
	brk                                          // $36E9
	.byte $0C                                    // $36EA  ???
	brk                                          // $36EB
	brk                                          // $36EC
	.byte $F4                                    // $36ED  ???
	brk                                          // $36EE
	brk                                          // $36EF
	.byte $34                                    // $36F0  ???
	brk                                          // $36F1
	brk                                          // $36F2
	.byte $10, $00                               // $36F3  bpl $36F5
	brk                                          // $36F5
	.byte $10, $00                               // $36F6  bpl $36F8
	brk                                          // $36F8
	brk                                          // $36F9
	brk                                          // $36FA
	brk                                          // $36FB
	brk                                          // $36FC
	brk                                          // $36FD
	brk                                          // $36FE
	brk                                          // $36FF
	brk                                          // $3700
	brk                                          // $3701
	brk                                          // $3702
	brk                                          // $3703
	brk                                          // $3704
	brk                                          // $3705
	brk                                          // $3706
	brk                                          // $3707
	brk                                          // $3708
	brk                                          // $3709
	brk                                          // $370A
	brk                                          // $370B
	brk                                          // $370C
	brk                                          // $370D
	brk                                          // $370E
	brk                                          // $370F
	brk                                          // $3710
	brk                                          // $3711
	brk                                          // $3712
	brk                                          // $3713
	.byte $3C                                    // $3714  ???
	brk                                          // $3715
	brk                                          // $3716
	clc                                          // $3717
	brk                                          // $3718
	brk                                          // $3719
	pla                                          // $371A
	brk                                          // $371B
	ora ($80,x)                                  // $371C
	brk                                          // $371E
	asl $00                                      // $371F
	brk                                          // $3721
	clc                                          // $3722
	brk                                          // $3723
	.byte $02                                    // $3724  ???
	rts                                          // $3725
	brk                                          // $3726
	.byte $0D, $80, $00                          // $3727  ora $0080
	asl $00,x                                    // $372A
	brk                                          // $372C
	.byte $0B                                    // $372D  ???
	brk                                          // $372E
	brk                                          // $372F
	.byte $04                                    // $3730  ???
	brk                                          // $3731
	brk                                          // $3732
	php                                          // $3733
	brk                                          // $3734
	brk                                          // $3735
	brk                                          // $3736
	brk                                          // $3737
	brk                                          // $3738
	brk                                          // $3739
	brk                                          // $373A
	brk                                          // $373B
	brk                                          // $373C
	brk                                          // $373D
	brk                                          // $373E
	brk                                          // $373F
	brk                                          // $3740
	brk                                          // $3741
	brk                                          // $3742
	brk                                          // $3743
	brk                                          // $3744
	brk                                          // $3745
	brk                                          // $3746
	brk                                          // $3747
	brk                                          // $3748
	ora ($21,x)                                  // $3749
	brk                                          // $374B
	brk                                          // $374C
	tax                                          // $374D
	.byte $10, $00                               // $374E  bpl $3750
	brk                                          // $3750
	brk                                          // $3751
	.byte $0C                                    // $3752  ???
	pha                                          // $3753
	ldy #$02                                     // $3754
	.byte $2D, $00, $00                          // $3756  and $0000
	inc $1208,x                                  // $3759
	.byte $7C                                    // $375C  ???
	.byte $70, $00                               // $375D  bvs $375F
	rol $0608,x                                  // $375F
	.byte $7F                                    // $3762  ???
	brk                                          // $3763
	brk                                          // $3764
	sbc #$20                                     // $3765
	brk                                          // $3767
	jmp $1198                                    // $3768
	brk                                          // $376B
	brk                                          // $376C
	.byte $02                                    // $376D  ???
	and ($40,x)                                  // $376E
	.byte $04                                    // $3770  ???
	pha                                          // $3771
	.byte $80                                    // $3772  ???
	brk                                          // $3773
	php                                          // $3774
	brk                                          // $3775
	brk                                          // $3776
	brk                                          // $3777
	brk                                          // $3778
	brk                                          // $3779
	brk                                          // $377A
	brk                                          // $377B
	brk                                          // $377C
	brk                                          // $377D
	brk                                          // $377E
	brk                                          // $377F
	php                                          // $3780
	.byte $02                                    // $3781  ???
	brk                                          // $3782
	php                                          // $3783
	.byte $92                                    // $3784  ???
	.byte $04                                    // $3785  ???
	.byte $04                                    // $3786  ???
	rti                                          // $3787
	sta $1121,y                                  // $3788
	jsr $9213                                    // $378B
	.byte $02                                    // $378E  ???
	eor #$d7                                     // $378F
	.byte $0C                                    // $3791  ???
	brk                                          // $3792
	inc $2220,x                                  // $3793
	ror $08c0,x                                  // $3796
	.byte $FF                                    // $3799  ???
	stx $05                                      // $379A
	.byte $FF                                    // $379C  ???
	clc                                          // $379D
	.byte $F3                                    // $379E  ???
	inc $0604,x                                  // $379F
	.byte $FF                                    // $37A2  ???
	.byte $D2                                    // $37A3  ???
	brk                                          // $37A4
	.byte $7F                                    // $37A5  ???
	.byte $80                                    // $37A6  ???
	jmp $d0fc                                    // $37A7
	ora ($5e),y                                  // $37AA
	pha                                          // $37AC
	.byte $02                                    // $37AD  ???
	.byte $1C                                    // $37AE  ???
	asl $08                                      // $37AF
	.byte $34                                    // $37B1  ???
	.byte $80                                    // $37B2  ???
	ora ($62),y                                  // $37B3
	pha                                          // $37B5
	jsr $2228                                    // $37B6
	.byte $04                                    // $37B9  ???
	php                                          // $37BA
	brk                                          // $37BB
	brk                                          // $37BC
	brk                                          // $37BD
	brk                                          // $37BE
	brk                                          // $37BF
	brk                                          // $37C0
	.byte $30, $C3                               // $37C1  bmi $3786
	brk                                          // $37C3
	.byte $82                                    // $37C4  ???
	jsr $0c0c                                    // $37C5
	cpy $2023                                    // $37C8
	.byte $70, $0C                               // $37CB  bvs $37D9
	.byte $47                                    // $37CD  ???
	.byte $03                                    // $37CE  ???
	.byte $D0, $65                               // $37CF  bne $3836
	.byte $D0, $D5                               // $37D1  bne $37A8
	eor $51                                      // $37D3
	ora $45,x                                    // $37D5
	.byte $5C                                    // $37D7  ???
	ora $55,x                                    // $37D8
	.byte $50, $35                               // $37DA  bvc $3811
	eor $53,x                                    // $37DC
	ora $54                                      // $37DE
	.byte $5C                                    // $37E0  ???
	.byte $04                                    // $37E1  ???
	.byte $54                                    // $37E2  ???
	.byte $D4                                    // $37E3  ???
	.byte $03                                    // $37E4  ???
	.byte $57                                    // $37E5  ???
	.byte $33                                    // $37E6  ???
	ora ($54,x)                                  // $37E7
	.byte $0C                                    // $37E9  ???
	.byte $03                                    // $37EA  ???
	eor $10,x                                    // $37EB
	brk                                          // $37ED
	cmp $0c,x                                    // $37EE
	brk                                          // $37F0
	eor $71,x                                    // $37F1
	.byte $03                                    // $37F3  ???
	ora $53,x                                    // $37F4
	brk                                          // $37F6
	and $5c,x                                    // $37F7
	brk                                          // $37F9
	cmp $54                                      // $37FA
	brk                                          // $37FC
	brk                                          // $37FD
	brk                                          // $37FE
	brk                                          // $37FF
	.byte $FF                                    // $3800  ???
	.byte $FF                                    // $3801  ???
	.byte $FF                                    // $3802  ???
	.byte $FF                                    // $3803  ???
	.byte $FF                                    // $3804  ???
	.byte $FF                                    // $3805  ???
	.byte $FF                                    // $3806  ???
	.byte $FF                                    // $3807  ???
	tax                                          // $3808
	tax                                          // $3809
	tax                                          // $380A
	tax                                          // $380B
	tax                                          // $380C
	tax                                          // $380D
	tax                                          // $380E
	tax                                          // $380F
	.byte $0C                                    // $3810  ???
	.byte $3F                                    // $3811  ???
	.byte $3C                                    // $3812  ???
	.byte $FF                                    // $3813  ???
	.byte $3F                                    // $3814  ???
	.byte $FC                                    // $3815  ???
	.byte $FC                                    // $3816  ???
	.byte $30, $0F                               // $3817  bmi $3828
	.byte $3F                                    // $3819  ???
	.byte $3F                                    // $381A  ???
	.byte $0F                                    // $381B  ???
	.byte $3F                                    // $381C  ???
	.byte $0F                                    // $381D  ???
	.byte $0F                                    // $381E  ???
	.byte $3F                                    // $381F  ???
	.byte $AF                                    // $3820  ???
	.byte $BF                                    // $3821  ???
	.byte $AF                                    // $3822  ???
	.byte $BF                                    // $3823  ???
	.byte $BF                                    // $3824  ???
	.byte $AF                                    // $3825  ???
	.byte $BF                                    // $3826  ???
	.byte $AF                                    // $3827  ???
	.byte $F0, $FC                               // $3828  beq $3826
	.byte $F0, $FC                               // $382A  beq $3828
	.byte $F0, $FC                               // $382C  beq $382A
	.byte $FC                                    // $382E  ???
	.byte $F0, $FA                               // $382F  beq $382B
	.byte $FA                                    // $3831  ???
	inc $fafe,x                                  // $3832
	inc $fefa,x                                  // $3835
	tax                                          // $3838
	ldx $aeba                                    // $3839
	tsx                                          // $383C
	ldx $aeba                                    // $383D
	inc $fefe,x                                  // $3840
	inc $fefe,x                                  // $3843
	inc $a2fe,x                                  // $3846
	plp                                          // $3849
	tay                                          // $384A
	rol                                          // $384B
	tay                                          // $384C
	tax                                          // $384D
	plp                                          // $384E
	txa                                          // $384F
	sbc $f5,x                                    // $3850
	sbc $f5,x                                    // $3852
	sbc $f5,x                                    // $3854
	sbc $f5,x                                    // $3856
	.byte $FA                                    // $3858  ???
	.byte $FA                                    // $3859  ???
	.byte $FA                                    // $385A  ???
	.byte $FA                                    // $385B  ???
	.byte $FA                                    // $385C  ???
	.byte $FA                                    // $385D  ???
	.byte $FA                                    // $385E  ???
	.byte $FA                                    // $385F  ???
	.byte $AF                                    // $3860  ???
	.byte $AF                                    // $3861  ???
	.byte $AF                                    // $3862  ???
	.byte $AF                                    // $3863  ???
	.byte $AF                                    // $3864  ???
	.byte $AF                                    // $3865  ???
	.byte $AF                                    // $3866  ???
	.byte $AF                                    // $3867  ???
	.byte $5F                                    // $3868  ???
	.byte $5F                                    // $3869  ???
	.byte $5F                                    // $386A  ???
	.byte $5F                                    // $386B  ???
	.byte $5F                                    // $386C  ???
	.byte $5F                                    // $386D  ???
	.byte $5F                                    // $386E  ???
	.byte $5F                                    // $386F  ???
	.byte $BB                                    // $3870  ???
	.byte $BB                                    // $3871  ???
	.byte $BB                                    // $3872  ???
	.byte $BF                                    // $3873  ???
	.byte $BF                                    // $3874  ???
	.byte $BB                                    // $3875  ???
	.byte $BB                                    // $3876  ???
	tax                                          // $3877
	.byte $BF                                    // $3878  ???
	ldx $aeae                                    // $3879
	ldx $bfae                                    // $387C
	tax                                          // $387F
	ldx $bbbf                                    // $3880
	.byte $BB                                    // $3883  ???
	.byte $BB                                    // $3884  ???
	.byte $BB                                    // $3885  ???
	.byte $BF                                    // $3886  ???
	ldx $bebe                                    // $3887
	ldx $aeae                                    // $388A
	ldx $bfae                                    // $388D
	.byte $BF                                    // $3890  ???
	.byte $BF                                    // $3891  ???
	.byte $AB                                    // $3892  ???
	.byte $AF                                    // $3893  ???
	ldx $bfba,y                                  // $3894
	.byte $BF                                    // $3897  ???
	.byte $BF                                    // $3898  ???
	.byte $BF                                    // $3899  ???
	.byte $AB                                    // $389A  ???
	ldx $bbab                                    // $389B
	.byte $BF                                    // $389E  ???
	.byte $BF                                    // $389F  ???
	.byte $AB                                    // $38A0  ???
	.byte $AF                                    // $38A1  ???
	.byte $BB                                    // $38A2  ???
	.byte $BB                                    // $38A3  ???
	.byte $BF                                    // $38A4  ???
	.byte $BF                                    // $38A5  ???
	.byte $AB                                    // $38A6  ???
	.byte $AB                                    // $38A7  ???
	.byte $BF                                    // $38A8  ???
	.byte $BB                                    // $38A9  ???
	tsx                                          // $38AA
	.byte $BF                                    // $38AB  ???
	.byte $AF                                    // $38AC  ???
	.byte $AB                                    // $38AD  ???
	.byte $BB                                    // $38AE  ???
	.byte $BF                                    // $38AF  ???
	ldx $babe                                    // $38B0
	ldx $bbbb,y                                  // $38B3
	.byte $BF                                    // $38B6  ???
	ldx $bfbf                                    // $38B7
	.byte $BB                                    // $38BA  ???
	.byte $AB                                    // $38BB  ???
	.byte $AF                                    // $38BC  ???
	ldx $aeae                                    // $38BD
	ldx $bfbb                                    // $38C0
	ldx $bbbb                                    // $38C3
	.byte $BF                                    // $38C6  ???
	ldx $bbbf                                    // $38C7
	.byte $BB                                    // $38CA  ???
	.byte $BB                                    // $38CB  ???
	.byte $BF                                    // $38CC  ???
	.byte $AB                                    // $38CD  ???
	.byte $AB                                    // $38CE  ???
	.byte $AB                                    // $38CF  ???
	.byte $BF                                    // $38D0  ???
	tsx                                          // $38D1
	.byte $BF                                    // $38D2  ???
	.byte $BF                                    // $38D3  ???
	.byte $AB                                    // $38D4  ???
	.byte $AB                                    // $38D5  ???
	.byte $BF                                    // $38D6  ???
	tax                                          // $38D7
	.byte $BF                                    // $38D8  ???
	.byte $BF                                    // $38D9  ???
	tsx                                          // $38DA
	tsx                                          // $38DB
	tsx                                          // $38DC
	tsx                                          // $38DD
	.byte $BF                                    // $38DE  ???
	tax                                          // $38DF
	.byte $BF                                    // $38E0  ???
	.byte $BF                                    // $38E1  ???
	.byte $BB                                    // $38E2  ???
	.byte $BB                                    // $38E3  ???
	.byte $BB                                    // $38E4  ???
	.byte $BB                                    // $38E5  ???
	.byte $BF                                    // $38E6  ???
	tax                                          // $38E7
	.byte $BF                                    // $38E8  ???
	.byte $BB                                    // $38E9  ???
	.byte $BB                                    // $38EA  ???
	.byte $BF                                    // $38EB  ???
	ldx $bbbe,y                                  // $38EC
	tax                                          // $38EF
	.byte $BF                                    // $38F0  ???
	.byte $BF                                    // $38F1  ???
	tsx                                          // $38F2
	ldx $babe,y                                  // $38F3
	.byte $BF                                    // $38F6  ???
	tax                                          // $38F7
	eor $55,x                                    // $38F8
	eor $55,x                                    // $38FA
	eor $55,x                                    // $38FC
	eor $55,x                                    // $38FE
	brk                                          // $3900
	brk                                          // $3901
	brk                                          // $3902
	brk                                          // $3903
	brk                                          // $3904
	brk                                          // $3905
	brk                                          // $3906
	brk                                          // $3907
	stx $55,y                                    // $3908
	eor $ff,x                                    // $390A
	.byte $FF                                    // $390C  ???
	.byte $FF                                    // $390D  ???
	.byte $FF                                    // $390E  ???
	ldx $5559,y                                  // $390F
	eor $5f,x                                    // $3912
	.byte $5F                                    // $3914  ???
	.byte $5F                                    // $3915  ???
	.byte $57                                    // $3916  ???
	.byte $57                                    // $3917  ???
	ror                                          // $3918
	ror                                          // $3919
	.byte $5A                                    // $391A  ???
	.byte $FA                                    // $391B  ???
	inc $f6,x                                    // $391C
	cmp $d5,x                                    // $391E
	lda $95                                      // $3920
	sta $9f,x                                    // $3922
	.byte $5F                                    // $3924  ???
	.byte $5F                                    // $3925  ???
	.byte $57                                    // $3926  ???
	.byte $53                                    // $3927  ???
	lda #$a5                                     // $3928
	lda $9f                                      // $392A
	.byte $9F                                    // $392C  ???
	.byte $9F                                    // $392D  ???
	.byte $97                                    // $392E  ???
	.byte $97                                    // $392F  ???
	ror                                          // $3930
	ror                                          // $3931
	.byte $5A                                    // $3932  ???
	sbc $f5f9,y                                  // $3933
	cmp $d5,x                                    // $3936
	adc #$69                                     // $3938
	eor $f5,x                                    // $393A
	sbc $c5,x                                    // $393C
	sbc $af3d,x                                  // $393E
	.byte $AB                                    // $3941  ???
	.byte $AB                                    // $3942  ???
	.byte $AB                                    // $3943  ???
	.byte $AB                                    // $3944  ???
	tax                                          // $3945
	tax                                          // $3946
	tax                                          // $3947
	tax                                          // $3948
	tax                                          // $3949
	.byte $AB                                    // $394A  ???
	.byte $AB                                    // $394B  ???
	.byte $AB                                    // $394C  ???
	.byte $AF                                    // $394D  ???
	ldx $abae                                    // $394E
	.byte $AB                                    // $3951  ???
	.byte $AB                                    // $3952  ???
	.byte $AB                                    // $3953  ???
	.byte $AB                                    // $3954  ???
	.byte $AB                                    // $3955  ???
	.byte $AB                                    // $3956  ???
	.byte $AB                                    // $3957  ???
	nop                                          // $3958
	nop                                          // $3959
	.byte $FA                                    // $395A  ???
	.byte $FA                                    // $395B  ???
	tsx                                          // $395C
	tsx                                          // $395D
	tsx                                          // $395E
	tsx                                          // $395F
	ldx $aebe,y                                  // $3960
	ldx $abaf                                    // $3963
	.byte $AB                                    // $3966  ???
	tax                                          // $3967
	tax                                          // $3968
	tax                                          // $3969
	.byte $AB                                    // $396A  ???
	.byte $AB                                    // $396B  ???
	.byte $AF                                    // $396C  ???
	.byte $AF                                    // $396D  ???
	ldx $aabe,y                                  // $396E
	tax                                          // $3971
	tax                                          // $3972
	tax                                          // $3973
	tax                                          // $3974
	.byte $AF                                    // $3975  ???
	ldx $faba,y                                  // $3976
	nop                                          // $3979
	nop                                          // $397A
	tax                                          // $397B
	tax                                          // $397C
	tax                                          // $397D
	tax                                          // $397E
	tax                                          // $397F
	tax                                          // $3980
	tax                                          // $3981
	.byte $AB                                    // $3982  ???
	.byte $AF                                    // $3983  ???
	ldx $babe                                    // $3984
	.byte $FA                                    // $3987  ???
	.byte $FA                                    // $3988  ???
	.byte $FA                                    // $3989  ???
	.byte $FA                                    // $398A  ???
	nop                                          // $398B
	nop                                          // $398C
	nop                                          // $398D
	tax                                          // $398E
	tax                                          // $398F
	tax                                          // $3990
	tax                                          // $3991
	tax                                          // $3992
	tax                                          // $3993
	.byte $AB                                    // $3994  ???
	.byte $AB                                    // $3995  ???
	.byte $AB                                    // $3996  ???
	.byte $AB                                    // $3997  ???
	tax                                          // $3998
	tax                                          // $3999
	tax                                          // $399A
	tax                                          // $399B
	nop                                          // $399C
	nop                                          // $399D
	nop                                          // $399E
	tax                                          // $399F
	tax                                          // $39A0
	tax                                          // $39A1
	tax                                          // $39A2
	tax                                          // $39A3
	tax                                          // $39A4
	tax                                          // $39A5
	.byte $FA                                    // $39A6  ???
	ldx $abaf,y                                  // $39A7
	.byte $AB                                    // $39AA  ???
	tax                                          // $39AB
	tax                                          // $39AC
	tax                                          // $39AD
	tax                                          // $39AE
	tax                                          // $39AF
	tax                                          // $39B0
	tax                                          // $39B1
	nop                                          // $39B2
	.byte $FA                                    // $39B3  ???
	tsx                                          // $39B4
	ldx $afae,y                                  // $39B5
	.byte $AB                                    // $39B8  ???
	.byte $AB                                    // $39B9  ???
	.byte $AB                                    // $39BA  ???
	.byte $AB                                    // $39BB  ???
	.byte $AF                                    // $39BC  ???
	ldx $aeae                                    // $39BD
	tsx                                          // $39C0
	tsx                                          // $39C1
	tsx                                          // $39C2
	tsx                                          // $39C3
	tsx                                          // $39C4
	.byte $FA                                    // $39C5  ???
	nop                                          // $39C6
	nop                                          // $39C7
	nop                                          // $39C8
	nop                                          // $39C9
	nop                                          // $39CA
	tax                                          // $39CB
	tax                                          // $39CC
	tax                                          // $39CD
	tax                                          // $39CE
	tax                                          // $39CF
	tax                                          // $39D0
	tax                                          // $39D1
	nop                                          // $39D2
	nop                                          // $39D3
	nop                                          // $39D4
	nop                                          // $39D5
	.byte $FA                                    // $39D6  ???
	.byte $FA                                    // $39D7  ???
	tax                                          // $39D8
	tax                                          // $39D9
	tax                                          // $39DA
	tax                                          // $39DB
	tax                                          // $39DC
	tax                                          // $39DD
	.byte $AB                                    // $39DE  ???
	.byte $AF                                    // $39DF  ???
	tax                                          // $39E0
	tax                                          // $39E1
	tax                                          // $39E2
	tax                                          // $39E3
	.byte $AB                                    // $39E4  ???
	.byte $AB                                    // $39E5  ???
	.byte $AF                                    // $39E6  ???
	.byte $AF                                    // $39E7  ???
	ldx $fabe,y                                  // $39E8
	.byte $FA                                    // $39EB  ???
	nop                                          // $39EC
	nop                                          // $39ED
	tax                                          // $39EE
	tax                                          // $39EF
	nop                                          // $39F0
	nop                                          // $39F1
	nop                                          // $39F2
	nop                                          // $39F3
	nop                                          // $39F4
	nop                                          // $39F5
	nop                                          // $39F6
	nop                                          // $39F7
	.byte $FA                                    // $39F8  ???
	tsx                                          // $39F9
	ldx $afbe,y                                  // $39FA
	.byte $AF                                    // $39FD  ???
	.byte $AB                                    // $39FE  ???
	.byte $AB                                    // $39FF  ???
	tax                                          // $3A00
	tax                                          // $3A01
	tax                                          // $3A02
	tax                                          // $3A03
	tax                                          // $3A04
	tax                                          // $3A05
	nop                                          // $3A06
	.byte $FA                                    // $3A07  ???
	eor $45,x                                    // $3A08
	eor $44,x                                    // $3A0A
	eor $55,x                                    // $3A0C
	sbc $f5,x                                    // $3A0E
	ldx $a5                                      // $3A10
	lda $ad                                      // $3A12
	lda $adad                                    // $3A14
	lda $b5b5                                    // $3A17
	lda $a5                                      // $3A1A
	lda $a5                                      // $3A1C
	lda $a5                                      // $3A1E
	ldx $aeae                                    // $3A20
	ldx $babe,y                                  // $3A23
	tsx                                          // $3A26
	txs                                          // $3A27
	.byte $5A                                    // $3A28  ???
	.byte $5A                                    // $3A29  ???
	.byte $5B                                    // $3A2A  ???
	.byte $5B                                    // $3A2B  ???
	.byte $5B                                    // $3A2C  ???
	.byte $5B                                    // $3A2D  ???
	eor $55,x                                    // $3A2E
	ldx $babe,y                                  // $3A30
	.byte $FA                                    // $3A33  ???
	.byte $FA                                    // $3A34  ???
	nop                                          // $3A35
	ror                                          // $3A36
	.byte $5A                                    // $3A37  ???
	txs                                          // $3A38
	stx $95,y                                    // $3A39
	lda $b5,x                                    // $3A3B
	lda $b9,x                                    // $3A3D
	lda $e9e9,y                                  // $3A3F
	sbc $b9b9,y                                  // $3A42
	lda #$a9                                     // $3A45
	lda #$af                                     // $3A47
	ldx $bebe                                    // $3A49
	.byte $FA                                    // $3A4C  ???
	.byte $FA                                    // $3A4D  ???
	nop                                          // $3A4E
	ror                                          // $3A4F
	.byte $5A                                    // $3A50  ???
	.byte $5A                                    // $3A51  ???
	.byte $5A                                    // $3A52  ???
	lsr $d6,x                                    // $3A53
	cmp $d5,x                                    // $3A55
	cmp $d5,x                                    // $3A57
	cmp $d5,x                                    // $3A59
	cmp $f5                                      // $3A5B
	lda $b5,x                                    // $3A5D
	lda $af,x                                    // $3A5F
	lda $a4ad                                    // $3A61
	sta ($95),y                                  // $3A64
	eor $55,x                                    // $3A66
	.byte $57                                    // $3A68  ???
	.byte $5F                                    // $3A69  ???
	.byte $5F                                    // $3A6A  ???
	.byte $5F                                    // $3A6B  ???
	eor $51,x                                    // $3A6C
	eor $15                                      // $3A6E
	.byte $AB                                    // $3A70  ???
	lda #$95                                     // $3A71
	.byte $57                                    // $3A73  ???
	eor $5b,x                                    // $3A74
	.byte $6B                                    // $3A76  ???
	.byte $6B                                    // $3A77  ???
	lda $a5                                      // $3A78
	ldy $a5                                      // $3A7A
	lda $a5                                      // $3A7C
	lda $57ad                                    // $3A7E
	.byte $07                                    // $3A81  ???
	.byte $57                                    // $3A82  ???
	eor $54,x                                    // $3A83
	eor ($45),y                                  // $3A85
	ora $d6,x                                    // $3A87
	dec $d6                                      // $3A89
	ror                                          // $3A8B
	.byte $5A                                    // $3A8C  ???
	ror                                          // $3A8D
	.byte $5A                                    // $3A8E  ???
	.byte $5A                                    // $3A8F  ???
	.byte $5A                                    // $3A90  ???
	.byte $5A                                    // $3A91  ???
	.byte $5B                                    // $3A92  ???
	.byte $5B                                    // $3A93  ???
	.byte $5A                                    // $3A94  ???
	.byte $5A                                    // $3A95  ???
	.byte $5A                                    // $3A96  ???
	.byte $5A                                    // $3A97  ???
	tsx                                          // $3A98
	.byte $5A                                    // $3A99  ???
	.byte $5A                                    // $3A9A  ???
	.byte $7A                                    // $3A9B  ???
	.byte $7A                                    // $3A9C  ???
	tsx                                          // $3A9D
	tsx                                          // $3A9E
	tsx                                          // $3A9F
	.byte $5A                                    // $3AA0  ???
	.byte $7A                                    // $3AA1  ???
	.byte $7A                                    // $3AA2  ???
	.byte $7A                                    // $3AA3  ???
	tsx                                          // $3AA4
	tsx                                          // $3AA5
	.byte $5A                                    // $3AA6  ???
	.byte $5A                                    // $3AA7  ???
	nop                                          // $3AA8
	nop                                          // $3AA9
	.byte $FA                                    // $3AAA  ???
	tsx                                          // $3AAB
	tsx                                          // $3AAC
	tsx                                          // $3AAD
	txs                                          // $3AAE
	.byte $5A                                    // $3AAF  ???
	.byte $6B                                    // $3AB0  ???
	.byte $6B                                    // $3AB1  ???
	.byte $5B                                    // $3AB2  ???
	.byte $6B                                    // $3AB3  ???
	.byte $1F                                    // $3AB4  ???
	.byte $5F                                    // $3AB5  ???
	lsr $a51e                                    // $3AB6
	lda $17                                      // $3AB9
	.byte $17                                    // $3ABB  ???
	.byte $57                                    // $3ABC  ???
	.byte $57                                    // $3ABD  ???
	.byte $5B                                    // $3ABE  ???
	.byte $5B                                    // $3ABF  ???
	.byte $AF                                    // $3AC0  ???
	lda $a5ad                                    // $3AC1
	lda $a5                                      // $3AC4
	lda $a5                                      // $3AC6
	eor $55,x                                    // $3AC8
	eor $15,x                                    // $3ACA
	cmp $d5,x                                    // $3ACC
	cmp $f5                                      // $3ACE
	.byte $5A                                    // $3AD0  ???
	lsr $56,x                                    // $3AD1
	inc $fefe,x                                  // $3AD3
	sbc $bff5,x                                  // $3AD6
	.byte $BF                                    // $3AD9  ???
	.byte $BF                                    // $3ADA  ???
	.byte $BF                                    // $3ADB  ???
	.byte $BF                                    // $3ADC  ???
	.byte $BF                                    // $3ADD  ???
	.byte $BF                                    // $3ADE  ???
	.byte $BF                                    // $3ADF  ???
	inc $fefe,x                                  // $3AE0
	inc $fefe,x                                  // $3AE3
	inc $bffe,x                                  // $3AE6
	.byte $BF                                    // $3AE9  ???
	.byte $BF                                    // $3AEA  ???
	.byte $BF                                    // $3AEB  ???
	.byte $FF                                    // $3AEC  ???
	.byte $FF                                    // $3AED  ???
	inc $affe,x                                  // $3AEE
	.byte $AF                                    // $3AF1  ???
	.byte $AF                                    // $3AF2  ???
	.byte $AF                                    // $3AF3  ???
	.byte $AF                                    // $3AF4  ???
	.byte $BF                                    // $3AF5  ???
	.byte $BF                                    // $3AF6  ???
	.byte $BF                                    // $3AF7  ???
	.byte $3F                                    // $3AF8  ???
	.byte $FF                                    // $3AF9  ???
	.byte $3F                                    // $3AFA  ???
	.byte $EF                                    // $3AFB  ???
	.byte $EF                                    // $3AFC  ???
	.byte $EF                                    // $3AFD  ???
	.byte $AF                                    // $3AFE  ???
	.byte $AF                                    // $3AFF  ???
	nop                                          // $3B00
	nop                                          // $3B01
	nop                                          // $3B02
	nop                                          // $3B03
	.byte $FA                                    // $3B04  ???
	.byte $FA                                    // $3B05  ???
	.byte $FA                                    // $3B06  ???
	.byte $FA                                    // $3B07  ???
	.byte $FF                                    // $3B08  ???
	.byte $FF                                    // $3B09  ???
	.byte $FB                                    // $3B0A  ???
	.byte $FB                                    // $3B0B  ???
	.byte $FB                                    // $3B0C  ???
	.byte $EB                                    // $3B0D  ???
	.byte $EB                                    // $3B0E  ???
	.byte $EB                                    // $3B0F  ???
	.byte $FF                                    // $3B10  ???
	.byte $3F                                    // $3B11  ???
	.byte $FF                                    // $3B12  ???
	.byte $3F                                    // $3B13  ???
	.byte $FF                                    // $3B14  ???
	.byte $3F                                    // $3B15  ???
	.byte $FF                                    // $3B16  ???
	.byte $3F                                    // $3B17  ???
	nop                                          // $3B18
	nop                                          // $3B19
	.byte $FA                                    // $3B1A  ???
	.byte $FA                                    // $3B1B  ???
	.byte $FA                                    // $3B1C  ???
	.byte $3A                                    // $3B1D  ???
	inc $fefe,x                                  // $3B1E
	inc $fffe,x                                  // $3B21  ; IRQ_VEC_LO
	.byte $FF                                    // $3B24  ???
	.byte $BF                                    // $3B25  ???
	.byte $BF                                    // $3B26  ???
	.byte $BF                                    // $3B27  ???
	sta $95,x                                    // $3B28
	sta $95,x                                    // $3B2A
	sta $95,x                                    // $3B2C
	sta $95,x                                    // $3B2E
	lda #$a9                                     // $3B30
	lda #$a9                                     // $3B32
	lda #$a9                                     // $3B34
	lda #$a9                                     // $3B36
	tax                                          // $3B38
	tax                                          // $3B39
	tax                                          // $3B3A
	ror                                          // $3B3B
	ror                                          // $3B3C
	.byte $5A                                    // $3B3D  ???
	lsr $55,x                                    // $3B3E
	.byte $5A                                    // $3B40  ???
	.byte $5A                                    // $3B41  ???
	.byte $5A                                    // $3B42  ???
	.byte $5A                                    // $3B43  ???
	.byte $1A                                    // $3B44  ???
	.byte $5A                                    // $3B45  ???
	ror                                          // $3B46
	tax                                          // $3B47
	.byte $5A                                    // $3B48  ???
	.byte $5A                                    // $3B49  ???
	.byte $5A                                    // $3B4A  ???
	.byte $5A                                    // $3B4B  ???
	ror                                          // $3B4C
	ror                                          // $3B4D
	tax                                          // $3B4E
	tax                                          // $3B4F
	.byte $5A                                    // $3B50  ???
	eor $55,x                                    // $3B51
	eor $5a,x                                    // $3B53
	ror                                          // $3B55
	tax                                          // $3B56
	tax                                          // $3B57
	.byte $5A                                    // $3B58  ???
	.byte $5A                                    // $3B59  ???
	lsr $56,x                                    // $3B5A
	lsr $16                                      // $3B5C
	ror                                          // $3B5E
	ror                                          // $3B5F
	ror                                          // $3B60
	ror                                          // $3B61
	ror                                          // $3B62
	ror                                          // $3B63
	ror                                          // $3B64
	tax                                          // $3B65
	tax                                          // $3B66
	tax                                          // $3B67
	eor $55,x                                    // $3B68
	sta $95,x                                    // $3B6A
	lda $a5                                      // $3B6C
	lda #$a9                                     // $3B6E
	ror                                          // $3B70
	.byte $5A                                    // $3B71  ???
	.byte $5A                                    // $3B72  ???
	asl $56,x                                    // $3B73
	asl $56,x                                    // $3B75
	tax                                          // $3B77
	eor $55,x                                    // $3B78
	lsr $56,x                                    // $3B7A
	lsr $5a,x                                    // $3B7C
	.byte $5A                                    // $3B7E  ???
	.byte $5A                                    // $3B7F  ???
	tax                                          // $3B80
	tax                                          // $3B81
	tax                                          // $3B82
	tax                                          // $3B83
	lda #$a5                                     // $3B84
	sta $95,x                                    // $3B86
	lda $a5                                      // $3B88
	sta $55,x                                    // $3B8A
	lsr $56,x                                    // $3B8C
	.byte $5A                                    // $3B8E  ???
	ror                                          // $3B8F
	tax                                          // $3B90
	tax                                          // $3B91
	.byte $AF                                    // $3B92  ???
	.byte $AF                                    // $3B93  ???
	.byte $AF                                    // $3B94  ???
	.byte $AF                                    // $3B95  ???
	lda $a5                                      // $3B96
	tax                                          // $3B98
	tax                                          // $3B99
	.byte $AF                                    // $3B9A  ???
	.byte $5F                                    // $3B9B  ???
	.byte $AF                                    // $3B9C  ???
	.byte $AF                                    // $3B9D  ???
	lda $a5                                      // $3B9E
	tax                                          // $3BA0
	tax                                          // $3BA1
	txs                                          // $3BA2
	eor $9a,x                                    // $3BA3
	tax                                          // $3BA5
	tax                                          // $3BA6
	tax                                          // $3BA7
	.byte $BF                                    // $3BA8  ???
	.byte $BF                                    // $3BA9  ???
	.byte $AF                                    // $3BAA  ???
	.byte $AF                                    // $3BAB  ???
	.byte $AF                                    // $3BAC  ???
	.byte $AF                                    // $3BAD  ???
	.byte $AF                                    // $3BAE  ???
	.byte $AF                                    // $3BAF  ???
	.byte $FF                                    // $3BB0  ???
	inc $feff,x                                  // $3BB1
	inc $fafe,x                                  // $3BB4
	.byte $FA                                    // $3BB7  ???
	.byte $F3                                    // $3BB8  ???
	.byte $FF                                    // $3BB9  ???
	.byte $CF                                    // $3BBA  ???
	.byte $BF                                    // $3BBB  ???
	.byte $BF                                    // $3BBC  ???
	.byte $BF                                    // $3BBD  ???
	.byte $AF                                    // $3BBE  ???
	.byte $AF                                    // $3BBF  ???
	.byte $F3                                    // $3BC0  ???
	.byte $CF                                    // $3BC1  ???
	.byte $BF                                    // $3BC2  ???
	.byte $BF                                    // $3BC3  ???
	.byte $BF                                    // $3BC4  ???
	.byte $BF                                    // $3BC5  ???
	.byte $BF                                    // $3BC6  ???
	.byte $BF                                    // $3BC7  ???
	.byte $FF                                    // $3BC8  ???
	.byte $FF                                    // $3BC9  ???
	.byte $FF                                    // $3BCA  ???
	.byte $FF                                    // $3BCB  ???
	tax                                          // $3BCC
	tax                                          // $3BCD
	tax                                          // $3BCE
	tax                                          // $3BCF
	.byte $FF                                    // $3BD0  ???
	.byte $FF                                    // $3BD1  ???
	.byte $FF                                    // $3BD2  ???
	eor $55,x                                    // $3BD3
	.byte $FF                                    // $3BD5  ???
	.byte $FF                                    // $3BD6  ???
	.byte $FF                                    // $3BD7  ???
	brk                                          // $3BD8
	brk                                          // $3BD9
	brk                                          // $3BDA
	.byte $10, $00                               // $3BDB  bpl $3BDD
	brk                                          // $3BDD
	brk                                          // $3BDE
	brk                                          // $3BDF
	.byte $10, $10                               // $3BE0  bpl $3BF2
	sec                                          // $3BE2
	inc $1038,x                                  // $3BE3
	.byte $10, $10                               // $3BE6  bpl $3BF8
	.byte $3F                                    // $3BE8  ???
	.byte $FF                                    // $3BE9  ???
	.byte $CF                                    // $3BEA  ???
	.byte $FF                                    // $3BEB  ???
	.byte $F3                                    // $3BEC  ???
	.byte $FF                                    // $3BED  ???
	.byte $FC                                    // $3BEE  ???
	.byte $FF                                    // $3BEF  ???
	.byte $FF                                    // $3BF0  ???
	.byte $BF                                    // $3BF1  ???
	.byte $BF                                    // $3BF2  ???
	.byte $AF                                    // $3BF3  ???
	.byte $AF                                    // $3BF4  ???
	.byte $AB                                    // $3BF5  ???
	.byte $AB                                    // $3BF6  ???
	tax                                          // $3BF7
	cpy #$c0                                     // $3BF8
	.byte $F0, $F0                               // $3BFA  beq $3BEC
	.byte $FC                                    // $3BFC  ???
	.byte $FC                                    // $3BFD  ???
	.byte $FF                                    // $3BFE  ???
	.byte $FF                                    // $3BFF  ???
	ora ($2e,x)                                  // $3C00
	ora ($01,x)                                  // $3C02
	and $012f                                    // $3C04
	ora ($47,x)                                  // $3C07
	.byte $67                                    // $3C09  ???
	lda ($01,x)                                  // $3C0A
	bit $1f6d                                    // $3C0C
	.byte $0B                                    // $3C0F  ???
	ora ($48,x)                                  // $3C10
	.byte $1F                                    // $3C12  ???
	.byte $0B                                    // $3C13  ???
	ora ($0c,x)                                  // $3C14
	brk                                          // $3C16
	ora ($01,x)                                  // $3C17
	eor $015f,x                                  // $3C19
	.byte $0C                                    // $3C1C  ???
	.byte $0B                                    // $3C1D  ???
	.byte $0C                                    // $3C1E  ???
	rol $3b01,x                                  // $3C1F
	ora ($01,x)                                  // $3C22
	.byte $3C                                    // $3C24  ???
	and $0101,x                                  // $3C25
	.byte $42                                    // $3C28  ???
	.byte $67                                    // $3C29  ???
	lda ($01,x)                                  // $3C2A
	plp                                          // $3C2C
	eor $6e0d,y                                  // $3C2D
	ora ($43,x)                                  // $3C30
	ora $0101                                    // $3C32
	lsr $0100,x                                  // $3C35
	ora ($5d,x)                                  // $3C38
	.byte $77                                    // $3C3A  ???
	rol $0b2a,x                                  // $3C3B
	rol                                          // $3C3E
	.byte $0B                                    // $3C3F  ???
	ora ($3b,x)                                  // $3C40
	.byte $33                                    // $3C42  ???
	ora ($01,x)                                  // $3C43
	eor #$01                                     // $3C45
	ora ($01,x)                                  // $3C47
	lsr                                          // $3C49
	lda ($01,x)                                  // $3C4A
	ora ($4b,x)                                  // $3C4C
	ora $016b                                    // $3C4E
	.byte $43                                    // $3C51  ???
	ora $0101                                    // $3C52
	rol                                          // $3C55
	brk                                          // $3C56
	rol $0c01,x                                  // $3C57
	adc ($0b,x)                                  // $3C5A
	ora ($5b,x)                                  // $3C5C
	rol $015c,x                                  // $3C5E
	and #$01                                     // $3C61
	ora ($01,x)                                  // $3C63
	lsr $01                                      // $3C65
	ora ($01,x)                                  // $3C67
	cmp $da                                      // $3C69
	ora ($01,x)                                  // $3C6B
	.byte $4B                                    // $3C6D  ???
	ora $016b                                    // $3C6E
	.byte $43                                    // $3C71  ???
	ora $0101                                    // $3C72
	.byte $5B                                    // $3C75  ???
	brk                                          // $3C76
	ora ($01,x)                                  // $3C77
	.byte $5B                                    // $3C79  ???
	.byte $5F                                    // $3C7A  ???
	rts                                          // $3C7B
	ora ($5b,x)                                  // $3C7C
	rol                                          // $3C7E
	.byte $0B                                    // $3C7F  ???
	ora ($37,x)                                  // $3C80
	ora ($01,x)                                  // $3C82
	ora ($44,x)                                  // $3C84
	ora ($01,x)                                  // $3C86
	ora ($c5,x)                                  // $3C88
	.byte $DA                                    // $3C8A  ???
	ora ($01,x)                                  // $3C8B
	adc $0a                                      // $3C8D
	adc #$01                                     // $3C8F
	.byte $43                                    // $3C91  ???
	asl                                          // $3C92
	ora ($01,x)                                  // $3C93
	.byte $5B                                    // $3C95  ???
	brk                                          // $3C96
	ora ($01,x)                                  // $3C97
	.byte $5B                                    // $3C99  ???
	.byte $5F                                    // $3C9A  ???
	rts                                          // $3C9B
	ora ($5b,x)                                  // $3C9C
	rol                                          // $3C9E
	.byte $0B                                    // $3C9F  ???
	ora ($2a,x)                                  // $3CA0
	ora ($01,x)                                  // $3CA2
	ora ($2a,x)                                  // $3CA4
	ora ($01,x)                                  // $3CA6
	ora ($a4,x)                                  // $3CA8
	.byte $A3                                    // $3CAA  ???
	ora ($01,x)                                  // $3CAB
	.byte $1F                                    // $3CAD  ???
	asl                                          // $3CAE
	ror                                          // $3CAF
	ora ($65,x)                                  // $3CB0
	asl                                          // $3CB2
	ora ($01,x)                                  // $3CB3
	.byte $5B                                    // $3CB5  ???
	brk                                          // $3CB6
	ora ($01,x)                                  // $3CB7
	.byte $5B                                    // $3CB9  ???
	.byte $5F                                    // $3CBA  ???
	rts                                          // $3CBB
	ora ($5b,x)                                  // $3CBC
	rol                                          // $3CBE
	.byte $0B                                    // $3CBF  ???
	ora ($2a,x)                                  // $3CC0
	ora ($01,x)                                  // $3CC2
	ora ($01,x)                                  // $3CC4
	rol $0101,x                                  // $3CC6
	lda $a3                                      // $3CC9
	ora ($01,x)                                  // $3CCB
	asl                                          // $3CCD
	.byte $1F                                    // $3CCE  ???
	.byte $6B                                    // $3CCF  ???
	ora ($0a,x)                                  // $3CD0
	.byte $1F                                    // $3CD2  ???
	ora ($01,x)                                  // $3CD3
	.byte $5B                                    // $3CD5  ???
	.byte $5C                                    // $3CD6  ???
	ora ($01,x)                                  // $3CD7
	.byte $5B                                    // $3CD9  ???
	.byte $62                                    // $3CDA  ???
	ora ($01,x)                                  // $3CDB
	.byte $5B                                    // $3CDD  ???
	adc $3e,x                                    // $3CDE
	ora ($32,x)                                  // $3CE0
	ora ($01,x)                                  // $3CE2
	ora ($01,x)                                  // $3CE4
	eor $01,x                                    // $3CE6
	ora ($a1,x)                                  // $3CE8
	.byte $54                                    // $3CEA  ???
	ora ($0c,x)                                  // $3CEB
	.byte $1F                                    // $3CED  ???
	cmp ($01),y                                  // $3CEE
	.byte $0C                                    // $3CF0  ???
	.byte $1F                                    // $3CF1  ???
	pla                                          // $3CF2
	ora ($01,x)                                  // $3CF3
	brk                                          // $3CF5
	.byte $63                                    // $3CF6  ???
	ora ($01,x)                                  // $3CF7
	brk                                          // $3CF9
	.byte $64                                    // $3CFA  ???
	ora ($01,x)                                  // $3CFB
	brk                                          // $3CFD
	.byte $0C                                    // $3CFE  ???
	rol $3201,x                                  // $3CFF
	rti                                          // $3D02
	ora ($01,x)                                  // $3D03
	ora ($3f,x)                                  // $3D05
	ora ($01,x)                                  // $3D07
	lda ($57,x)                                  // $3D09
	ora ($0c,x)                                  // $3D0B
	.byte $1F                                    // $3D0D  ???
	.byte $50, $01                               // $3D0E  bvc $3D11
	.byte $0C                                    // $3D10  ???
	.byte $1F                                    // $3D11  ???
	pla                                          // $3D12
	ora ($2a,x)                                  // $3D13
	brk                                          // $3D15
	rol $0c01,x                                  // $3D16
	adc ($60,x)                                  // $3D19
	ora ($5b,x)                                  // $3D1B
	rol                                          // $3D1D
	.byte $0B                                    // $3D1E  ???
	ora ($01,x)                                  // $3D1F
	ora ($34,x)                                  // $3D21
	ora ($01,x)                                  // $3D23
	ora ($35,x)                                  // $3D25
	.byte $3A                                    // $3D27  ???
	ora ($a1,x)                                  // $3D28
	.byte $70, $53                               // $3D2A  bvs $3D7F
	.byte $4F                                    // $3D2C  ???
	.byte $D0, $D1                               // $3D2D  bne $3D00
	sec                                          // $3D2F
	.byte $0C                                    // $3D30  ???
	.byte $1F                                    // $3D31  ???
	.byte $52                                    // $3D32  ???
	.byte $39, $01, $00                          // $3D33  and $0001,y
	.byte $63                                    // $3D36  ???
	ora ($2a,x)                                  // $3D37
	ror $64,x                                    // $3D39
	ora ($2a,x)                                  // $3D3B
	.byte $5C                                    // $3D3D  ???
	adc $3e,x                                    // $3D3E
	ora ($01,x)                                  // $3D40
	.byte $34                                    // $3D42  ???
	ora ($01,x)                                  // $3D43
	ora ($35,x)                                  // $3D45
	rol $01,x                                    // $3D47
	lda ($70,x)                                  // $3D49
	lsr $cd4c                                    // $3D4B
	.byte $6F                                    // $3D4E  ???
	.byte $37                                    // $3D4F  ???
	.byte $0C                                    // $3D50  ???
	.byte $1F                                    // $3D51  ???
	.byte $52                                    // $3D52  ???
	.byte $3D, $01, $00                          // $3D53  and $0001,x
	.byte $63                                    // $3D56  ???
	ora ($01,x)                                  // $3D57
	brk                                          // $3D59
	.byte $64                                    // $3D5A  ???
	ora ($01,x)                                  // $3D5B
	brk                                          // $3D5D
	.byte $0C                                    // $3D5E  ???
	rts                                          // $3D5F
	ora ($2a,x)                                  // $3D60
	ora ($01,x)                                  // $3D62
	ora ($2a,x)                                  // $3D64
	ora ($f2,x)                                  // $3D66
	ora ($a4,x)                                  // $3D68
	ldx $71                                      // $3D6A
	ora ($1f,x)                                  // $3D6C
	asl                                          // $3D6E
	ora ($01,x)                                  // $3D6F
	adc $0a                                      // $3D71
	ora ($01,x)                                  // $3D73
	.byte $5B                                    // $3D75  ???
	brk                                          // $3D76
	ora ($01,x)                                  // $3D77
	.byte $5B                                    // $3D79  ???
	.byte $5F                                    // $3D7A  ???
	rts                                          // $3D7B
	ora ($5b,x)                                  // $3D7C
	rol                                          // $3D7E
	.byte $0B                                    // $3D7F  ???
	ora ($2a,x)                                  // $3D80
	ora ($01,x)                                  // $3D82
	ora ($2a,x)                                  // $3D84
	ora ($01,x)                                  // $3D86
	ora ($a4,x)                                  // $3D88
	.byte $A7                                    // $3D8A  ???
	pla                                          // $3D8B
	ora ($1f,x)                                  // $3D8C
	asl                                          // $3D8E
	ora ($01,x)                                  // $3D8F
	adc $0a                                      // $3D91
	ora ($01,x)                                  // $3D93
	.byte $5B                                    // $3D95  ???
	brk                                          // $3D96
	ora ($01,x)                                  // $3D97
	.byte $5B                                    // $3D99  ???
	.byte $5F                                    // $3D9A  ???
	rts                                          // $3D9B
	ora ($5b,x)                                  // $3D9C
	rol                                          // $3D9E
	.byte $0B                                    // $3D9F  ???
	ora ($2a,x)                                  // $3DA0
	ora ($01,x)                                  // $3DA2
	ora ($2a,x)                                  // $3DA4
	.byte $74                                    // $3DA6  ???
	.byte $F3                                    // $3DA7  ???
	ora ($a4,x)                                  // $3DA8
	ldx $71                                      // $3DAA
	ora ($1f,x)                                  // $3DAC
	asl                                          // $3DAE
	ora ($01,x)                                  // $3DAF
	adc $0a                                      // $3DB1
	ora ($01,x)                                  // $3DB3
	.byte $5B                                    // $3DB5  ???
	brk                                          // $3DB6
	ora ($01,x)                                  // $3DB7
	.byte $5B                                    // $3DB9  ???
	.byte $5F                                    // $3DBA  ???
	rts                                          // $3DBB
	ora ($5b,x)                                  // $3DBC
	rol                                          // $3DBE
	.byte $0B                                    // $3DBF  ???
	ora ($01,x)                                  // $3DC0
	ora ($01,x)                                  // $3DC2
	ora ($29,x)                                  // $3DC4
	ora ($01,x)                                  // $3DC6
	ora ($44,x)                                  // $3DC8
	lda ($01,x)                                  // $3DCA
	ora ($4a,x)                                  // $3DCC
	.byte $1F                                    // $3DCE  ???
	.byte $0B                                    // $3DCF  ???
	ora ($4b,x)                                  // $3DD0
	.byte $1F                                    // $3DD2  ???
	.byte $0B                                    // $3DD3  ???
	ora ($0c,x)                                  // $3DD4
	brk                                          // $3DD6
	ora ($01,x)                                  // $3DD7
	.byte $5B                                    // $3DD9  ???
	.byte $62                                    // $3DDA  ???
	ora ($01,x)                                  // $3DDB
	adc $64,x                                    // $3DDD
	ora ($01,x)                                  // $3DDF
	ora ($01,x)                                  // $3DE1
	ora ($29,x)                                  // $3DE3
	ora ($01,x)                                  // $3DE5
	ora ($44,x)                                  // $3DE7
	tax                                          // $3DE9
	.byte $DA                                    // $3DEA  ???
	ora ($47,x)                                  // $3DEB
	.byte $67                                    // $3DED  ???
	.byte $1F                                    // $3DEE  ???
	.byte $0B                                    // $3DEF  ???
	bit $1f6d                                    // $3DF0
	.byte $23                                    // $3DF3  ???
	ora ($0c,x)                                  // $3DF4
	brk                                          // $3DF6
	ora ($01,x)                                  // $3DF7
	eor $3a77,x                                  // $3DF9
	rol                                          // $3DFC
	.byte $0B                                    // $3DFD  ???
	plp                                          // $3DFE
	.byte $64                                    // $3DFF  ???
	ora ($01,x)                                  // $3E00
	ora ($01,x)                                  // $3E02
	and #$01                                     // $3E04
	ora ($01,x)                                  // $3E06
	.byte $44                                    // $3E08  ???
	tax                                          // $3E09
	.byte $DA                                    // $3E0A  ???
	ora ($47,x)                                  // $3E0B
	.byte $67                                    // $3E0D  ???
	.byte $1F                                    // $3E0E  ???
	.byte $0B                                    // $3E0F  ???
	bit $1f6d                                    // $3E10
	.byte $23                                    // $3E13  ???
	ora ($0c,x)                                  // $3E14
	brk                                          // $3E16
	rol $5b01,x                                  // $3E17
	.byte $62                                    // $3E1A  ???
	ora ($01,x)                                  // $3E1B
	adc $64,x                                    // $3E1D
	ora ($01,x)                                  // $3E1F
	ora ($01,x)                                  // $3E21
	ora ($01,x)                                  // $3E23
	and #$01                                     // $3E25
	ora ($01,x)                                  // $3E27
	.byte $44                                    // $3E29  ???
	lda ($01,x)                                  // $3E2A
	ora ($4a,x)                                  // $3E2C
	.byte $1F                                    // $3E2E  ???
	.byte $0B                                    // $3E2F  ???
	ora ($4b,x)                                  // $3E30
	.byte $1F                                    // $3E32  ???
	.byte $0B                                    // $3E33  ???
	ora ($2a,x)                                  // $3E34
	brk                                          // $3E36
	rol $5e01,x                                  // $3E37
	.byte $5F                                    // $3E3A  ???
	rts                                          // $3E3B
	ora ($5d,x)                                  // $3E3C
	and $64,x                                    // $3E3E
	ora ($01,x)                                  // $3E40
	ora ($01,x)                                  // $3E42
	ora ($01,x)                                  // $3E44
	ora ($01,x)                                  // $3E46
	ora ($a1,x)                                  // $3E48
	.byte $3F                                    // $3E4A  ???
	ora ($0c,x)                                  // $3E4B
	.byte $1F                                    // $3E4D  ???
	lsr $01,x                                    // $3E4E
	.byte $0C                                    // $3E50  ???
	.byte $1F                                    // $3E51  ???
	cmp $0101                                    // $3E52
	brk                                          // $3E55
	.byte $0B                                    // $3E56  ???
	ora ($01,x)                                  // $3E57
	.byte $77                                    // $3E59  ???
	.byte $0B                                    // $3E5A  ???
	ora ($01,x)                                  // $3E5B
	eor $010b,x                                  // $3E5D
	ora ($01,x)                                  // $3E60
	ora ($01,x)                                  // $3E62
	ora ($01,x)                                  // $3E64
	ora ($01,x)                                  // $3E66
	ora ($a1,x)                                  // $3E68
	.byte $3F                                    // $3E6A  ???
	ora ($0c,x)                                  // $3E6B
	.byte $1F                                    // $3E6D  ???
	lsr $01,x                                    // $3E6E
	.byte $0C                                    // $3E70  ???
	.byte $1F                                    // $3E71  ???
	cmp $2a01                                    // $3E72
	brk                                          // $3E75
	rol $5e01,x                                  // $3E76
	adc ($63,x)                                  // $3E79
	ora ($5d,x)                                  // $3E7B
	ora ($64,x)                                  // $3E7D
	ora ($01,x)                                  // $3E7F
	ora ($01,x)                                  // $3E81
	ora ($01,x)                                  // $3E83
	ora ($01,x)                                  // $3E85
	ora ($01,x)                                  // $3E87
	lda ($01,x)                                  // $3E89
	.byte $30, $58                               // $3E8B  bmi $3EE5
	.byte $1F                                    // $3E8D  ???
	lsr $39,x                                    // $3E8E
	.byte $4F                                    // $3E90  ???
	cmp $0168                                    // $3E91
	ora ($00,x)                                  // $3E94
	.byte $0B                                    // $3E96  ???
	ora ($01,x)                                  // $3E97
	.byte $77                                    // $3E99  ???
	.byte $0B                                    // $3E9A  ???
	ora ($01,x)                                  // $3E9B
	eor $010b,x                                  // $3E9D
	ora ($01,x)                                  // $3EA0
	ora ($01,x)                                  // $3EA2
	ora ($01,x)                                  // $3EA4
	ora ($01,x)                                  // $3EA6
	ora ($a1,x)                                  // $3EA8
	ora ($30,x)                                  // $3EAA
	cli                                          // $3EAC
	.byte $1F                                    // $3EAD  ???
	lsr $39,x                                    // $3EAE
	.byte $4F                                    // $3EB0  ???
	cmp $0168                                    // $3EB1
	ora ($00,x)                                  // $3EB4
	.byte $0B                                    // $3EB6  ???
	ora ($3b,x)                                  // $3EB7
	eor $0164,x                                  // $3EB9
	lsr $0c31,x                                  // $3EBC
	rts                                          // $3EBF
	brk                                          // $3EC0
	.byte $3C                                    // $3EC1  ???
	jsr $403c                                    // $3EC2
	.byte $3C                                    // $3EC5  ???
	rts                                          // $3EC6
	.byte $3C                                    // $3EC7  ???
	.byte $80                                    // $3EC8  ???
	.byte $3C                                    // $3EC9  ???
	ldy #$3c                                     // $3ECA
	cpy #$3c                                     // $3ECC
	cpx #$3c                                     // $3ECE
	brk                                          // $3ED0
	and $3d20,x                                  // $3ED1
	rti                                          // $3ED4
	and $3d60,x                                  // $3ED5
	.byte $80                                    // $3ED8  ???
	and $3da0,x                                  // $3ED9
	cpy #$3d                                     // $3EDC
	cpx #$3d                                     // $3EDE
	brk                                          // $3EE0
	rol $3e20,x                                  // $3EE1
	rti                                          // $3EE4
	rol $3e60,x                                  // $3EE5
	.byte $80                                    // $3EE8  ???
	rol $3ea0,x                                  // $3EE9
	brk                                          // $3EEC
	brk                                          // $3EED
	brk                                          // $3EEE
	brk                                          // $3EEF
	brk                                          // $3EF0
	brk                                          // $3EF1
	brk                                          // $3EF2
	brk                                          // $3EF3
	brk                                          // $3EF4
	brk                                          // $3EF5
	brk                                          // $3EF6
	brk                                          // $3EF7
	.byte $5A                                    // $3EF8  ???
	eor $52                                      // $3EF9
	.byte $4F                                    // $3EFB  ???
	.byte $50, $41                               // $3EFC  bvc $3F3F
	.byte $47                                    // $3EFE  ???
	eor $00                                      // $3EFF
	brk                                          // $3F01
	brk                                          // $3F02
	.byte $04                                    // $3F03  ???
	brk                                          // $3F04
	cld                                          // $3F05
	brk                                          // $3F06
	rti                                          // $3F07
	brk                                          // $3F08
	.byte $8F                                    // $3F09  ???
	ora $8f                                      // $3F0A
	cmp $7e00,y                                  // $3F0C
	.byte $02                                    // $3F0F  ???
	tsx                                          // $3F10
	asl $ba                                      // $3F11
	.byte $DA                                    // $3F13  ???
	ldy #$3c                                     // $3F14
	asl                                          // $3F16
	brk                                          // $3F17
	brk                                          // $3F18
	brk                                          // $3F19
	.byte $50, $28                               // $3F1A  bvc $3F44
	brk                                          // $3F1C
	brk                                          // $3F1D
	brk                                          // $3F1E
	brk                                          // $3F1F
	brk                                          // $3F20
	brk                                          // $3F21
	brk                                          // $3F22
	.byte $04                                    // $3F23  ???
	brk                                          // $3F24
	brk                                          // $3F25
	ora ($32,x)                                  // $3F26
	brk                                          // $3F28
	brk                                          // $3F29
	brk                                          // $3F2A
	brk                                          // $3F2B
	brk                                          // $3F2C
	brk                                          // $3F2D
	lda $07                                      // $3F2E
	cpx #$50                                     // $3F30
	ora $00,x                                    // $3F32
	brk                                          // $3F34
	lsr $15,x                                    // $3F35
	brk                                          // $3F37
	brk                                          // $3F38
	brk                                          // $3F39
	brk                                          // $3F3A
	brk                                          // $3F3B
	brk                                          // $3F3C
	brk                                          // $3F3D
	brk                                          // $3F3E
	brk                                          // $3F3F
	brk                                          // $3F40
	brk                                          // $3F41
	brk                                          // $3F42
	brk                                          // $3F43
	asl $0e                                      // $3F44
	.byte $04                                    // $3F46  ???
	brk                                          // $3F47
	brk                                          // $3F48
	brk                                          // $3F49
	php                                          // $3F4A
	.byte $6F                                    // $3F4B  ???
	brk                                          // $3F4C
	jsr $1801                                    // $3F4D
	brk                                          // $3F50
	brk                                          // $3F51
	brk                                          // $3F52
	brk                                          // $3F53
	brk                                          // $3F54
	brk                                          // $3F55
	brk                                          // $3F56
	brk                                          // $3F57
	pha                                          // $3F58
	ora $48                                      // $3F59
	cmp $135f,y                                  // $3F5B
	brk                                          // $3F5E
	.byte $03                                    // $3F5F  ???
	brk                                          // $3F60
	brk                                          // $3F61
	brk                                          // $3F62
	brk                                          // $3F63
	brk                                          // $3F64
	brk                                          // $3F65
	brk                                          // $3F66
	brk                                          // $3F67
	brk                                          // $3F68
	brk                                          // $3F69
	brk                                          // $3F6A
	brk                                          // $3F6B
	brk                                          // $3F6C
	brk                                          // $3F6D
	brk                                          // $3F6E
	brk                                          // $3F6F
	brk                                          // $3F70
	brk                                          // $3F71
	brk                                          // $3F72
	brk                                          // $3F73
	brk                                          // $3F74
	brk                                          // $3F75
	brk                                          // $3F76
	brk                                          // $3F77
	eor #$4e                                     // $3F78
	eor #$54                                     // $3F7A
	.byte $44                                    // $3F7C  ???
	eor ($54,x)                                  // $3F7D
	eor ($70,x)                                  // $3F7F
	.byte $82                                    // $3F81  ???
	.byte $70, $5A                               // $3F82  bvs $3FDE
	ldy $2882,x                                  // $3F84
	rol $00                                      // $3F87
	.byte $0C                                    // $3F89  ???
	asl $05                                      // $3F8A
	brk                                          // $3F8C
	.byte $07                                    // $3F8D  ???
	brk                                          // $3F8E
	ora ($08,x)                                  // $3F8F
	.byte $07                                    // $3F91  ???
	.byte $02                                    // $3F92  ???
	ora $05                                      // $3F93
	ora $01                                      // $3F95
	brk                                          // $3F97
	eor ($52,x)                                  // $3F98
	.byte $4F                                    // $3F9A  ???
	.byte $57                                    // $3F9B  ???
	.byte $44                                    // $3F9C  ???
	eor ($54,x)                                  // $3F9D
	eor ($01,x)                                  // $3F9F
	cmp ($d1),y                                  // $3FA1
	ldx #$bc                                     // $3FA3
	asl $02                                      // $3FA5
	brk                                          // $3FA7
	ora ($d1,x)                                  // $3FA8
	cmp ($a2),y                                  // $3FAA
	tsx                                          // $3FAC
	ora $02                                      // $3FAD
	brk                                          // $3FAF
	ora ($d3,x)                                  // $3FB0
	.byte $D2                                    // $3FB2  ???
	ldx #$b2                                     // $3FB3
	.byte $03                                    // $3FB5  ???
	.byte $03                                    // $3FB6  ???
	brk                                          // $3FB7
	ora ($d5,x)                                  // $3FB8
	.byte $D4                                    // $3FBA  ???
	ldx #$b2                                     // $3FBB
	.byte $02                                    // $3FBD  ???
	.byte $03                                    // $3FBE  ???
	brk                                          // $3FBF
	ora ($d5,x)                                  // $3FC0
	.byte $D4                                    // $3FC2  ???
	ldx $b5                                      // $3FC3
	ora ($03,x)                                  // $3FC5
	brk                                          // $3FC7
	brk                                          // $3FC8
	.byte $D7                                    // $3FC9  ???
	dec $aa,x                                    // $3FCA
	.byte $B2                                    // $3FCC  ???
	brk                                          // $3FCD
	.byte $03                                    // $3FCE  ???
	brk                                          // $3FCF
	brk                                          // $3FD0
	cmp $b0d8,y                                  // $3FD1
	tsx                                          // $3FD4
	ora ($03,x)                                  // $3FD5
	brk                                          // $3FD7
	brk                                          // $3FD8
	cmp $b1d8,y                                  // $3FD9
	ldx $02,y                                    // $3FDC
	.byte $03                                    // $3FDE  ???
	brk                                          // $3FDF
	brk                                          // $3FE0
	.byte $DB                                    // $3FE1  ???
	.byte $DA                                    // $3FE2  ???
	lda $ba,x                                    // $3FE3
	.byte $03                                    // $3FE5  ???
	.byte $03                                    // $3FE6  ???
	brk                                          // $3FE7
	brk                                          // $3FE8
	.byte $DC                                    // $3FE9  ???
	.byte $DC                                    // $3FEA  ???
	clv                                          // $3FEB
	lda $0205,x                                  // $3FEC
	brk                                          // $3FEF
	brk                                          // $3FF0
	.byte $DC                                    // $3FF1  ???
	.byte $DC                                    // $3FF2  ???
	tsx                                          // $3FF3
	ldx $0206,y                                  // $3FF4
	brk                                          // $3FF7
	.byte $53                                    // $3FF8  ???
	.byte $43                                    // $3FF9  ???
	.byte $52                                    // $3FFA  ???
	eor $45                                      // $3FFB
	lsr $4254                                    // $3FFD
	jsr $f2d2                                    // $4000
	ldx #$f2                                     // $4003
	jsr $09a2                                    // $4005
	ldx #$d2                                     // $4008
	ldx #$d2                                     // $400A
	.byte $F2                                    // $400C  ???
	ora #$09                                     // $400D
	ldx #$09                                     // $400F
	.byte $D2                                    // $4011  ???
	ora #$a2                                     // $4012
	.byte $D2                                    // $4014  ???
	ldx #$f2                                     // $4015
	jsr $2020                                    // $4017
	jsr $2020                                    // $401A
	.byte $D2                                    // $401D  ???
	jsr $a220                                    // $401E
	jsr $f220                                    // $4021
	jsr $2020                                    // $4024
	.byte $D2                                    // $4027  ???
	ldx #$20                                     // $4028
	jsr $2020                                    // $402A
	jsr $2020                                    // $402D
	jsr $2020                                    // $4030
	.byte $D2                                    // $4033  ???
	jsr $20a2                                    // $4034
	ldx #$d2                                     // $4037
	.byte $F2                                    // $4039  ???
	.byte $F2                                    // $403A  ???
	jsr $20d2                                    // $403B
	.byte $D2                                    // $403E  ???
	jsr $20f2                                    // $403F
	jsr $2020                                    // $4042
	jsr $2020                                    // $4045
	jsr $2020                                    // $4048
	jsr $2020                                    // $404B
	jsr $2020                                    // $404E
	jsr $2020                                    // $4051
	jsr $2020                                    // $4054
	jsr $2020                                    // $4057
	jsr $2020                                    // $405A
	jsr $2020                                    // $405D
	jsr $2020                                    // $4060
	jsr $2020                                    // $4063
	jsr $2020                                    // $4066
	jsr $2020                                    // $4069
	jsr $2020                                    // $406C
	jsr $2020                                    // $406F
	jsr $2020                                    // $4072
	jsr $2020                                    // $4075
	jsr $2020                                    // $4078
	jsr $2020                                    // $407B
	jsr $2020                                    // $407E
	jsr $2020                                    // $4081
	jsr $2020                                    // $4084
	jsr $2020                                    // $4087
	jsr $f2d2                                    // $408A
	ldx #$f2                                     // $408D
	jsr $09a2                                    // $408F
	ldx #$d2                                     // $4092
	ldx #$d2                                     // $4094
	.byte $F2                                    // $4096  ???
	ora #$09                                     // $4097
	ldx #$09                                     // $4099
	.byte $D2                                    // $409B  ???
	ora #$a2                                     // $409C
	.byte $D2                                    // $409E  ???
	ldx #$f2                                     // $409F
	jsr $2020                                    // $40A1
	jsr $2020                                    // $40A4
	.byte $D2                                    // $40A7  ???
	jsr $a220                                    // $40A8
	jsr $f220                                    // $40AB
	jsr $2020                                    // $40AE
	.byte $D2                                    // $40B1  ???
	.byte $F2                                    // $40B2  ???
	ldx #$20                                     // $40B3
	.byte $D2                                    // $40B5  ???
	.byte $F2                                    // $40B6  ???
	ora #$09                                     // $40B7
	ldx #$09                                     // $40B9
	.byte $F2                                    // $40BB  ???
	.byte $D2                                    // $40BC  ???
	.byte $F2                                    // $40BD  ???
	ora #$03                                     // $40BE
	ora $09                                      // $40C0
	ldx #$09                                     // $40C2
	.byte $F2                                    // $40C4  ???
	ora #$09                                     // $40C5
	.byte $D2                                    // $40C7  ???
	.byte $F2                                    // $40C8  ???
	jsr $2020                                    // $40C9
	jsr $d2a2                                    // $40CC
	.byte $F2                                    // $40CF  ???
	ldx #$20                                     // $40D0
	.byte $D2                                    // $40D2  ???
	.byte $F2                                    // $40D3  ???
	ldx #$20                                     // $40D4
	jsr $f2d2                                    // $40D6
	ldx #$d2                                     // $40D9
	.byte $F2                                    // $40DB  ???
	.byte $D2                                    // $40DC  ???
	jsr $2020                                    // $40DD
	jsr $2020                                    // $40E0
	jsr $a2f2                                    // $40E3
	.byte $D2                                    // $40E6  ???
	jsr $d2d2                                    // $40E7
	ldx #$20                                     // $40EA
	.byte $F2                                    // $40EC  ???
	.byte $D2                                    // $40ED  ???
	.byte $F2                                    // $40EE  ???
	ldx #$d2                                     // $40EF
	.byte $F2                                    // $40F1  ???
	.byte $D2                                    // $40F2  ???
	.byte $F2                                    // $40F3  ???
	jsr $2020                                    // $40F4
	jsr $2020                                    // $40F7
	jsr $2020                                    // $40FA
	jsr $2020                                    // $40FD
	jsr $2020                                    // $4100
	jsr $2020                                    // $4103
	jsr $2020                                    // $4106
	jsr $2020                                    // $4109
	jsr $2020                                    // $410C
	jsr $2020                                    // $410F
	jsr $2020                                    // $4112
	.byte $D2                                    // $4115  ???
	jsr $2020                                    // $4116
	jsr $2020                                    // $4119
	jsr $2020                                    // $411C
	jsr $2020                                    // $411F
	jsr $2020                                    // $4122
	jsr $2020                                    // $4125
	jsr $2020                                    // $4128
	jsr $2020                                    // $412B
	jsr $2020                                    // $412E
	jsr $2020                                    // $4131
	jsr $2020                                    // $4134
	jsr $2020                                    // $4137
	jsr $f220                                    // $413A
	ldx #$20                                     // $413D
	.byte $D2                                    // $413F  ???
	.byte $F2                                    // $4140  ???
	ora #$09                                     // $4141
	ldx #$09                                     // $4143
	.byte $F2                                    // $4145  ???
	.byte $D2                                    // $4146  ???
	.byte $F2                                    // $4147  ???
	ora #$03                                     // $4148
	ora $09                                      // $414A
	ldx #$09                                     // $414C
	.byte $F2                                    // $414E  ???
	ora #$09                                     // $414F
	.byte $D2                                    // $4151  ???
	.byte $F2                                    // $4152  ???
	jsr $2020                                    // $4153
	jsr $d2a2                                    // $4156
	.byte $F2                                    // $4159  ???
	ldx #$20                                     // $415A
	.byte $D2                                    // $415C  ???
	.byte $F2                                    // $415D  ???
	ldx #$20                                     // $415E
	jsr $f2d2                                    // $4160
	ldx #$20                                     // $4163
	jsr $f2a2                                    // $4165
	ora #$09                                     // $4168
	ora #$09                                     // $416A
	ora #$09                                     // $416C
	.byte $D2                                    // $416E  ???
	.byte $D2                                    // $416F  ???
	ora #$03                                     // $4170
	ora $a2                                      // $4172
	ora #$09                                     // $4174
	ora #$09                                     // $4176
	ora #$d2                                     // $4178
	ldx #$20                                     // $417A
	jsr $2020                                    // $417C
	jsr $20d2                                    // $417F
	jsr $f209                                    // $4182
	ldx #$d2                                     // $4185
	jsr $f209                                    // $4187
	.byte $D2                                    // $418A  ???
	jsr $2020                                    // $418B
	.byte $D2                                    // $418E  ???
	ldx #$20                                     // $418F
	jsr $2020                                    // $4191
	jsr $d2f2                                    // $4194
	jsr $d2a2                                    // $4197
	jsr $09a2                                    // $419A
	ora #$20                                     // $419D
	ora #$09                                     // $419F
	ora #$20                                     // $41A1
	jsr $20a2                                    // $41A3
	jsr $2020                                    // $41A6
	jsr $2020                                    // $41A9
	jsr $2020                                    // $41AC
	jsr $2020                                    // $41AF
	jsr $2020                                    // $41B2
	jsr $2020                                    // $41B5
	jsr $2020                                    // $41B8
	jsr $2020                                    // $41BB
	jsr $2020                                    // $41BE
	.byte $F2                                    // $41C1  ???
	jsr $20d2                                    // $41C2
	jsr $09f2                                    // $41C5
	ora #$a2                                     // $41C8
	jsr $2020                                    // $41CA
	jsr $2020                                    // $41CD
	jsr $2020                                    // $41D0
	jsr $2020                                    // $41D3
	jsr $2020                                    // $41D6
	jsr $2020                                    // $41D9
	jsr $2020                                    // $41DC
	jsr $2020                                    // $41DF
	jsr $2020                                    // $41E2
	jsr $2020                                    // $41E5
	jsr $2020                                    // $41E8
	jsr $2020                                    // $41EB
	jsr $a220                                    // $41EE
	.byte $F2                                    // $41F1  ???
	ora #$09                                     // $41F2
	ora #$09                                     // $41F4
	ora #$09                                     // $41F6
	.byte $D2                                    // $41F8  ???
	.byte $D2                                    // $41F9  ???
	ora #$03                                     // $41FA
	ora $a2                                      // $41FC
	ora #$09                                     // $41FE
	ora #$09                                     // $4200
	ora #$d2                                     // $4202
	ldx #$20                                     // $4204
	jsr $2020                                    // $4206
	jsr $20d2                                    // $4209
	jsr $f209                                    // $420C
	ldx #$d2                                     // $420F
	jsr $f209                                    // $4211
	.byte $D2                                    // $4214  ???
	jsr $2020                                    // $4215
	.byte $D2                                    // $4218  ???
	.byte $D2                                    // $4219  ???
	.byte $F2                                    // $421A  ???
	.byte $D2                                    // $421B  ???
	ora #$09                                     // $421C
	.byte $03                                    // $421E  ???
	ora #$09                                     // $421F
	ora #$03                                     // $4221
	brk                                          // $4223
	ora $d2                                      // $4224
	.byte $F2                                    // $4226  ???
	ldx #$d2                                     // $4227
	.byte $F2                                    // $4229  ???
	.byte $D2                                    // $422A  ???
	ldx #$d2                                     // $422B
	.byte $F2                                    // $422D  ???
	jsr $d220                                    // $422E
	.byte $F2                                    // $4231  ???
	.byte $D2                                    // $4232  ???
	ldx #$09                                     // $4233
	plp                                          // $4235
	ora #$d2                                     // $4236
	jsr $29d2                                    // $4238
	ora #$a2                                     // $423B
	.byte $F2                                    // $423D  ???
	.byte $D2                                    // $423E  ???
	jsr $2020                                    // $423F
	.byte $F2                                    // $4242  ???
	jsr $2020                                    // $4243
	.byte $F2                                    // $4246  ???
	jsr $2020                                    // $4247
	jsr $0909                                    // $424A
	.byte $F2                                    // $424D  ???
	ora #$09                                     // $424E
	ora #$09                                     // $4250
	and $d209                                    // $4252
	.byte $F2                                    // $4255  ???
	jsr $20d2                                    // $4256
	jsr $2020                                    // $4259
	jsr $2020                                    // $425C
	jsr $2020                                    // $425F
	jsr $2020                                    // $4262
	jsr $2020                                    // $4265
	jsr $2020                                    // $4268
	jsr $2020                                    // $426B
	jsr $2020                                    // $426E
	ldx #$d2                                     // $4271
	ora #$09                                     // $4273
	ldx #$f2                                     // $4275
	jsr $3009                                    // $4277
	ora #$d2                                     // $427A
	.byte $F2                                    // $427C  ???
	jsr $2020                                    // $427D
	jsr $2020                                    // $4280
	jsr $2020                                    // $4283
	jsr $2020                                    // $4286
	jsr $2020                                    // $4289
	jsr $2020                                    // $428C
	jsr $2020                                    // $428F
	jsr $2020                                    // $4292
	jsr $2020                                    // $4295
	jsr $2020                                    // $4298
	jsr $2020                                    // $429B
	jsr $2020                                    // $429E
	jsr $d2d2                                    // $42A1
	.byte $F2                                    // $42A4  ???
	.byte $D2                                    // $42A5  ???
	ora #$09                                     // $42A6
	.byte $03                                    // $42A8  ???
	ora #$09                                     // $42A9
	ora #$03                                     // $42AB
	brk                                          // $42AD
	ora $d2                                      // $42AE
	.byte $F2                                    // $42B0  ???
	ldx #$d2                                     // $42B1
	.byte $F2                                    // $42B3  ???
	.byte $D2                                    // $42B4  ???
	ldx #$d2                                     // $42B5
	.byte $F2                                    // $42B7  ???
	jsr $d220                                    // $42B8
	.byte $F2                                    // $42BB  ???
	.byte $D2                                    // $42BC  ???
	ldx #$09                                     // $42BD
	plp                                          // $42BF
	ora #$d2                                     // $42C0
	jsr $29d2                                    // $42C2
	ora #$a2                                     // $42C5
	.byte $F2                                    // $42C7  ???
	jsr $a2f2                                    // $42C8
	.byte $D2                                    // $42CB  ???
	jsr $f2a2                                    // $42CC
	jsr $0504                                    // $42CF
	.byte $03                                    // $42D2  ???
	.byte $03                                    // $42D3  ???
	brk                                          // $42D4
	brk                                          // $42D5
	ora #$a2                                     // $42D6
	jsr $a2d2                                    // $42D8
	.byte $D2                                    // $42DB  ???
	jsr $f220                                    // $42DC
	ldx #$20                                     // $42DF
	.byte $F2                                    // $42E1  ???
	.byte $D2                                    // $42E2  ???
	ldx #$d2                                     // $42E3
	jsr $09f2                                    // $42E5
	ora #$a2                                     // $42E8
	.byte $F2                                    // $42EA  ???
	ora #$09                                     // $42EB
	ldx #$d2                                     // $42ED
	jsr $a2d2                                    // $42EF
	jsr $2020                                    // $42F2
	jsr $2020                                    // $42F5
	jsr $2020                                    // $42F8
	.byte $F2                                    // $42FB  ???
	.byte $D2                                    // $42FC  ???
	ora #$3f                                     // $42FD
	ora #$30                                     // $42FF
	ora #$3f                                     // $4301
	ora #$09                                     // $4303
	ldx #$09                                     // $4305
	ora #$f2                                     // $4307
	jsr $20f2                                    // $4309
	jsr $2020                                    // $430C
	jsr $2020                                    // $430F
	jsr $2020                                    // $4312
	jsr $2020                                    // $4315
	jsr $2020                                    // $4318
	jsr $2020                                    // $431B
	jsr $2020                                    // $431E
	jsr $f220                                    // $4321
	ldx #$20                                     // $4324
	.byte $3F                                    // $4326  ???
	ora #$d2                                     // $4327
	jsr $0903                                    // $4329
	jsr $20d2                                    // $432C
	jsr $2020                                    // $432F
	jsr $2020                                    // $4332
	jsr $2020                                    // $4335
	jsr $2020                                    // $4338
	jsr $2020                                    // $433B
	jsr $2020                                    // $433E
	jsr $2020                                    // $4341
	jsr $2020                                    // $4344
	jsr $2020                                    // $4347
	jsr $2020                                    // $434A
	jsr $2020                                    // $434D
	jsr $2020                                    // $4350
	.byte $F2                                    // $4353  ???
	ldx #$d2                                     // $4354
	jsr $f2a2                                    // $4356
	jsr $0504                                    // $4359
	.byte $03                                    // $435C  ???
	.byte $03                                    // $435D  ???
	brk                                          // $435E
	brk                                          // $435F
	ora #$a2                                     // $4360
	jsr $a2d2                                    // $4362
	.byte $D2                                    // $4365  ???
	jsr $f220                                    // $4366
	ldx #$20                                     // $4369
	.byte $F2                                    // $436B  ???
	.byte $D2                                    // $436C  ???
	ldx #$d2                                     // $436D
	jsr $09f2                                    // $436F
	ora #$a2                                     // $4372
	.byte $F2                                    // $4374  ???
	ora #$09                                     // $4375
	ldx #$d2                                     // $4377
	jsr $a2d2                                    // $4379
	jsr $2020                                    // $437C
	jsr $0920                                    // $437F
	.byte $04                                    // $4382  ???
	brk                                          // $4383
	.byte $03                                    // $4384  ???
	brk                                          // $4385
	brk                                          // $4386
	asl $f2                                      // $4387
	jsr $2020                                    // $4389
	jsr $d2f2                                    // $438C
	jsr $2020                                    // $438F
	.byte $D2                                    // $4392  ???
	ldx #$20                                     // $4393
	ora #$09                                     // $4395
	.byte $D2                                    // $4397  ???
	.byte $F2                                    // $4398  ???
	ora #$36                                     // $4399
	ora #$09                                     // $439B
	and $0909                                    // $439D
	.byte $F2                                    // $43A0  ???
	.byte $D2                                    // $43A1  ???
	jsr $2020                                    // $43A2
	jsr $2020                                    // $43A5
	jsr $2020                                    // $43A8
	jsr $20f2                                    // $43AB
	ldx #$f2                                     // $43AE
	ora #$04                                     // $43B0
	ora $a2                                      // $43B2
	ora #$77                                     // $43B4
	.byte $63                                    // $43B6  ???
	ora #$30                                     // $43B7
	ora #$09                                     // $43B9
	ora #$a2                                     // $43BB
	jsr $2020                                    // $43BD
	jsr $2020                                    // $43C0
	jsr $2020                                    // $43C3
	jsr $2020                                    // $43C6
	jsr $2020                                    // $43C9
	jsr $2020                                    // $43CC
	jsr $2020                                    // $43CF
	jsr $a220                                    // $43D2
	.byte $D2                                    // $43D5  ???
	ora #$09                                     // $43D6
	ora #$09                                     // $43D8
	.byte $D2                                    // $43DA  ???
	.byte $F2                                    // $43DB  ???
	ora #$20                                     // $43DC
	.byte $D2                                    // $43DE  ???
	.byte $F2                                    // $43DF  ???
	jsr $2020                                    // $43E0
	jsr $2020                                    // $43E3
	jsr $2020                                    // $43E6
	jsr $2020                                    // $43E9
	jsr $2020                                    // $43EC
	jsr $2020                                    // $43EF
	jsr $2020                                    // $43F2
	jsr $2020                                    // $43F5
	jsr $2020                                    // $43F8
	jsr $2020                                    // $43FB
	jsr $2020                                    // $43FE
	jsr $2020                                    // $4401
	.byte $D2                                    // $4404  ???
	ldx #$20                                     // $4405
	jsr $2020                                    // $4407
	jsr $0409                                    // $440A
	brk                                          // $440D
	.byte $03                                    // $440E  ???
	brk                                          // $440F
	brk                                          // $4410
	asl $f2                                      // $4411
	jsr $2020                                    // $4413
	jsr $d2f2                                    // $4416
	jsr $2020                                    // $4419
	.byte $D2                                    // $441C  ???
	ldx #$20                                     // $441D
	ora #$09                                     // $441F
	.byte $D2                                    // $4421  ???
	.byte $F2                                    // $4422  ???
	ora #$36                                     // $4423
	ora #$09                                     // $4425
	and $0909                                    // $4427
	.byte $F2                                    // $442A  ???
	.byte $D2                                    // $442B  ???
	jsr $20f2                                    // $442C
	jsr $2020                                    // $442F
	ldx #$f2                                     // $4432
	ldx #$03                                     // $4434
	brk                                          // $4436
	brk                                          // $4437
	ora $d2                                      // $4438
	ldx #$d2                                     // $443A
	jsr $2020                                    // $443C
	jsr $2020                                    // $443F
	jsr $f220                                    // $4442
	jsr $a220                                    // $4445
	.byte $3F                                    // $4448  ???
	ora #$04                                     // $4449
	ora $f2                                      // $444B
	.byte $3F                                    // $444D  ???
	ora #$09                                     // $444E
	ora #$2c                                     // $4450
	ora #$a2                                     // $4452
	.byte $D2                                    // $4454  ???
	.byte $F2                                    // $4455  ???
	ldx #$20                                     // $4456
	jsr $2020                                    // $4458
	jsr $2020                                    // $445B
	jsr $f2d2                                    // $445E
	ldx #$20                                     // $4461
	ora #$00                                     // $4463
	ora #$f2                                     // $4465
	.byte $03                                    // $4467  ???
	ora #$09                                     // $4468
	ora #$09                                     // $446A
	ora #$f2                                     // $446C
	.byte $D2                                    // $446E  ???
	jsr $2020                                    // $446F
	jsr $2020                                    // $4472
	jsr $2020                                    // $4475
	jsr $2020                                    // $4478
	jsr $2020                                    // $447B
	jsr $2020                                    // $447E
	jsr $2020                                    // $4481
	jsr $d2a2                                    // $4484
	.byte $F2                                    // $4487  ???
	ldx #$09                                     // $4488
	ora #$f2                                     // $448A
	ora #$09                                     // $448C
	ora #$a2                                     // $448E
	jsr $f2d2                                    // $4490
	jsr $2020                                    // $4493
	jsr $2020                                    // $4496
	jsr $2020                                    // $4499
	jsr $2020                                    // $449C
	jsr $2020                                    // $449F
	jsr $2020                                    // $44A2
	jsr $2020                                    // $44A5
	jsr $d2d2                                    // $44A8
	.byte $D2                                    // $44AB  ???
	jsr $2020                                    // $44AC
	jsr $2020                                    // $44AF
	jsr $2020                                    // $44B2
	jsr $f220                                    // $44B5
	jsr $2020                                    // $44B8
	jsr $f2a2                                    // $44BB
	ldx #$03                                     // $44BE
	brk                                          // $44C0
	brk                                          // $44C1
	ora $d2                                      // $44C2
	ldx #$d2                                     // $44C4
	jsr $2020                                    // $44C6
	jsr $2020                                    // $44C9
	jsr $f220                                    // $44CC
	jsr $a220                                    // $44CF
	.byte $3F                                    // $44D2  ???
	ora #$04                                     // $44D3
	ora $f2                                      // $44D5
	.byte $3F                                    // $44D7  ???
	ora #$09                                     // $44D8
	ora #$2c                                     // $44DA
	ora #$a2                                     // $44DC
	jsr $2020                                    // $44DE
	jsr $2020                                    // $44E1
	jsr $2020                                    // $44E4
	.byte $03                                    // $44E7  ???
	brk                                          // $44E8
	brk                                          // $44E9
	ora $20                                      // $44EA
	jsr $2020                                    // $44EC
	jsr $2020                                    // $44EF
	jsr $2020                                    // $44F2
	jsr $2020                                    // $44F5
	.byte $F2                                    // $44F8  ???
	.byte $D2                                    // $44F9  ???
	ldx #$d2                                     // $44FA
	ora #$09                                     // $44FC
	jsr $0909                                    // $44FE
	ror $09,x                                    // $4501
	ora #$f2                                     // $4503
	jsr $2020                                    // $4505
	jsr $20d2                                    // $4508
	jsr $2020                                    // $450B
	jsr $f220                                    // $450E
	jsr $d2a2                                    // $4511
	ldx #$f2                                     // $4514
	.byte $03                                    // $4516  ???
	ora $20                                      // $4517
	.byte $03                                    // $4519  ???
	ror $09,x                                    // $451A
	ora #$30                                     // $451C
	ora #$20                                     // $451E
	ldx #$d2                                     // $4520
	jsr $2020                                    // $4522
	jsr $2020                                    // $4525
	jsr $2020                                    // $4528
	jsr $2020                                    // $452B
	jsr $2020                                    // $452E
	jsr $2020                                    // $4531
	jsr $2020                                    // $4534
	.byte $D2                                    // $4537  ???
	ldx #$20                                     // $4538
	.byte $F2                                    // $453A  ???
	.byte $03                                    // $453B  ???
	ora $09                                      // $453C
	ora #$09                                     // $453E
	ora #$d2                                     // $4540
	.byte $F2                                    // $4542  ???
	jsr $2020                                    // $4543
	jsr $2020                                    // $4546
	jsr $2020                                    // $4549
	jsr $2020                                    // $454C
	jsr $2020                                    // $454F
	jsr $2020                                    // $4552
	jsr $2020                                    // $4555
	jsr $d2d2                                    // $4558
	ora #$09                                     // $455B
	ora #$01                                     // $455D
	ora #$d2                                     // $455F
	jsr $2020                                    // $4561
	.byte $D2                                    // $4564  ???
	jsr $2020                                    // $4565
	jsr $2020                                    // $4568
	jsr $2020                                    // $456B
	jsr $2020                                    // $456E
	.byte $03                                    // $4571  ???
	brk                                          // $4572
	brk                                          // $4573
	ora $20                                      // $4574
	jsr $2020                                    // $4576
	jsr $2020                                    // $4579
	jsr $2020                                    // $457C
	jsr $2020                                    // $457F
	.byte $F2                                    // $4582  ???
	.byte $D2                                    // $4583  ???
	ldx #$d2                                     // $4584
	ora #$09                                     // $4586
	jsr $0909                                    // $4588
	ror $09,x                                    // $458B
	ora #$f2                                     // $458D
	jsr $20d2                                    // $458F
	jsr $2020                                    // $4592
	jsr $2020                                    // $4595
	.byte $20, $03, $00                          // $4598  jsr $0003
	brk                                          // $459B
	ora $20                                      // $459C
	jsr $2020                                    // $459E
	jsr $2020                                    // $45A1
	jsr $2020                                    // $45A4
	jsr $d220                                    // $45A7
	ldx #$20                                     // $45AA
	jsr $09f2                                    // $45AC
	ora #$63                                     // $45AF
	.byte $03                                    // $45B1  ???
	ora #$05                                     // $45B2
	ldx #$20                                     // $45B4
	jsr $20d2                                    // $45B6
	jsr $2020                                    // $45B9
	jsr $2020                                    // $45BC
	jsr $a220                                    // $45BF
	jsr $20d2                                    // $45C2
	.byte $F2                                    // $45C5  ???
	jsr $0320                                    // $45C6
	brk                                          // $45C9
	.byte $3A                                    // $45CA  ???
	.byte $04                                    // $45CB  ???
	ora #$09                                     // $45CC
	ror $20,x                                    // $45CE
	.byte $F2                                    // $45D0  ???
	jsr $f220                                    // $45D1
	jsr $2020                                    // $45D4
	jsr $0320                                    // $45D7
	ora $20                                      // $45DA
	jsr $2020                                    // $45DC
	jsr $2020                                    // $45DF
	jsr $2020                                    // $45E2
	jsr $2020                                    // $45E5
	jsr $2020                                    // $45E8
	.byte $D2                                    // $45EB  ???
	.byte $F2                                    // $45EC  ???
	jsr $0900                                    // $45ED
	ora #$a2                                     // $45F0
	ora #$09                                     // $45F2
	ldx #$d2                                     // $45F4
	jsr $2020                                    // $45F6
	jsr $2020                                    // $45F9
	jsr $2020                                    // $45FC
	jsr $2020                                    // $45FF
	jsr $2020                                    // $4602
	jsr $2020                                    // $4605
	jsr $d220                                    // $4608
	.byte $D2                                    // $460B  ???
	ora #$01                                     // $460C
	ora ($01,x)                                  // $460E
	ora ($01,x)                                  // $4610
	ora #$09                                     // $4612
	ora ($09,x)                                  // $4614
	ora ($09,x)                                  // $4616
	jsr $0220                                    // $4618
	jsr $2020                                    // $461B
	jsr $2020                                    // $461E
	jsr $0320                                    // $4621
	brk                                          // $4624
	brk                                          // $4625
	ora $20                                      // $4626
	jsr $2020                                    // $4628
	jsr $2020                                    // $462B
	jsr $2020                                    // $462E
	jsr $d220                                    // $4631
	ldx #$20                                     // $4634
	jsr $09f2                                    // $4636
	ora #$63                                     // $4639
	.byte $03                                    // $463B  ???
	ora #$05                                     // $463C
	ldx #$20                                     // $463E
	jsr $09d2                                    // $4640
	ora #$d2                                     // $4643
	jsr $2020                                    // $4645
	jsr $2020                                    // $4648
	.byte $03                                    // $464B  ???
	brk                                          // $464C
	brk                                          // $464D
	brk                                          // $464E
	jsr $2020                                    // $464F
	jsr $2020                                    // $4652
	jsr $2020                                    // $4655
	jsr $2020                                    // $4658
	jsr $2020                                    // $465B
	jsr $0320                                    // $465E
	brk                                          // $4661
	ora $00                                      // $4662
	brk                                          // $4664
	jsr $a220                                    // $4665
	jsr $f220                                    // $4668
	jsr $2020                                    // $466B
	jsr $2020                                    // $466E
	jsr $2020                                    // $4671
	jsr $2020                                    // $4674
	jsr $2020                                    // $4677
	.byte $20, $03, $00                          // $467A  jsr $0003
	ora #$04                                     // $467D
	brk                                          // $467F
	.byte $D2                                    // $4680  ???
	jsr $2020                                    // $4681
	jsr $2020                                    // $4684
	jsr $2020                                    // $4687
	.byte $20, $03, $00                          // $468A  jsr $0003
	ora $20                                      // $468D
	jsr $2020                                    // $468F
	jsr $2020                                    // $4692
	jsr $2020                                    // $4695
	jsr $2020                                    // $4698
	jsr $a220                                    // $469B
	jsr $03f2                                    // $469E
	ora $03                                      // $46A1
	.byte $03                                    // $46A3  ???
	ora $20                                      // $46A4
	.byte $D2                                    // $46A6  ???
	.byte $D2                                    // $46A7  ???
	jsr $2020                                    // $46A8
	lda $20                                      // $46AB
	jsr $20a3                                    // $46AD
	jsr $2020                                    // $46B0
	jsr $2020                                    // $46B3
	jsr $2020                                    // $46B6
	jsr $d220                                    // $46B9
	ora #$01                                     // $46BC
	ora ($01,x)                                  // $46BE
	ora #$2d                                     // $46C0
	.byte $04                                    // $46C2  ???
	brk                                          // $46C3
	brk                                          // $46C4
	asl $01                                      // $46C5
	ora ($09,x)                                  // $46C7
	ora #$d2                                     // $46C9
	.byte $D2                                    // $46CB  ???
	.byte $D2                                    // $46CC  ???
	.byte $D2                                    // $46CD  ???
	.byte $D2                                    // $46CE  ???
	jsr $2020                                    // $46CF
	jsr $2020                                    // $46D2
	.byte $03                                    // $46D5  ???
	brk                                          // $46D6
	brk                                          // $46D7
	brk                                          // $46D8
	jsr $2020                                    // $46D9
	jsr $2020                                    // $46DC
	jsr $2020                                    // $46DF
	jsr $2020                                    // $46E2
	jsr $2020                                    // $46E5
	jsr $0320                                    // $46E8
	brk                                          // $46EB
	ora $00                                      // $46EC
	brk                                          // $46EE
	jsr $a220                                    // $46EF
	jsr $0120                                    // $46F2
	ora #$09                                     // $46F5
	.byte $D2                                    // $46F7  ???
	jsr $2020                                    // $46F8
	jsr $0320                                    // $46FB
	brk                                          // $46FE
	brk                                          // $46FF
	brk                                          // $4700
	ora $20                                      // $4701
	jsr $2020                                    // $4703
	jsr $2020                                    // $4706
	jsr $2020                                    // $4709
	jsr $2020                                    // $470C
	.byte $D2                                    // $470F  ???
	jsr $2020                                    // $4710
	.byte $03                                    // $4713  ???
	brk                                          // $4714
	brk                                          // $4715
	ora $20                                      // $4716
	jsr $2020                                    // $4718
	jsr $2020                                    // $471B
	jsr $2020                                    // $471E
	jsr $2020                                    // $4721
	jsr $2020                                    // $4724
	jsr $2020                                    // $4727
	jsr $2020                                    // $472A
	.byte $20, $00, $00                          // $472D  jsr $0000
	brk                                          // $4730
	ora $a2                                      // $4731
	jsr $2020                                    // $4733
	jsr $2020                                    // $4736
	jsr $2020                                    // $4739
	.byte $20, $03, $00                          // $473C  jsr $0003
	jsr $2020                                    // $473F
	jsr $2020                                    // $4742
	jsr $2020                                    // $4745
	jsr $2020                                    // $4748
	jsr $2020                                    // $474B
	jsr $2020                                    // $474E
	.byte $20, $20, $00                          // $4751  jsr $0020
	brk                                          // $4754
	brk                                          // $4755
	jsr $f220                                    // $4756
	jsr $2020                                    // $4759
	jsr $20a5                                    // $475C
	jsr $20a3                                    // $475F
	jsr $2020                                    // $4762
	jsr $2020                                    // $4765
	jsr $2020                                    // $4768
	.byte $D2                                    // $476B  ???
	ora #$01                                     // $476C
	ora ($01,x)                                  // $476E
	ora #$5d                                     // $4770
	brk                                          // $4772
	brk                                          // $4773
	brk                                          // $4774
	brk                                          // $4775
	.byte $77                                    // $4776  ???
	adc $5f63,y                                  // $4777
	bit $0909                                    // $477A
	ora ($01,x)                                  // $477D
	ora #$09                                     // $477F
	.byte $D2                                    // $4781  ???
	jsr $2020                                    // $4782
	jsr $0320                                    // $4785
	brk                                          // $4788
	brk                                          // $4789
	brk                                          // $478A
	ora $20                                      // $478B
	jsr $2020                                    // $478D
	jsr $2020                                    // $4790
	jsr $2020                                    // $4793
	jsr $2020                                    // $4796
	.byte $D2                                    // $4799  ???
	jsr $2020                                    // $479A
	.byte $03                                    // $479D  ???
	brk                                          // $479E
	brk                                          // $479F
	ora $20                                      // $47A0
	jsr $2020                                    // $47A2
	jsr $0101                                    // $47A5
	ora #$d2                                     // $47A8
	jsr $2020                                    // $47AA
	jsr $0320                                    // $47AD
	brk                                          // $47B0
	brk                                          // $47B1
	brk                                          // $47B2
	ora $20                                      // $47B3
	.byte $D2                                    // $47B5  ???
	jsr $2020                                    // $47B6
	jsr $2020                                    // $47B9
	jsr $2020                                    // $47BC
	jsr $d2d2                                    // $47BF
	.byte $D2                                    // $47C2  ???
	.byte $D2                                    // $47C3  ???
	.byte $20, $20, $00                          // $47C4  jsr $0020
	brk                                          // $47C7
	ora $20                                      // $47C8
	.byte $D2                                    // $47CA  ???
	.byte $D2                                    // $47CB  ???
	jsr $2020                                    // $47CC
	jsr $2020                                    // $47CF
	jsr $2020                                    // $47D2
	jsr $2020                                    // $47D5
	jsr $2020                                    // $47D8
	jsr $2020                                    // $47DB
	jsr $0320                                    // $47DE
	brk                                          // $47E1
	brk                                          // $47E2
	jsr $2020                                    // $47E3
	jsr $d2d2                                    // $47E6
	jsr $2020                                    // $47E9
	jsr $2020                                    // $47EC
	brk                                          // $47EF
	brk                                          // $47F0
	ora $20                                      // $47F1
	jsr $d220                                    // $47F3
	jsr $20d2                                    // $47F6
	jsr $2020                                    // $47F9
	jsr $2020                                    // $47FC
	jsr $2020                                    // $47FF
	jsr $2020                                    // $4802
	.byte $03                                    // $4805  ???
	brk                                          // $4806
	ora $20                                      // $4807
	jsr $2020                                    // $4809
	.byte $A3                                    // $480C  ???
	jsr $a520                                    // $480D
	jsr $a320                                    // $4810
	jsr $20a5                                    // $4813
	jsr $2020                                    // $4816
	jsr $2020                                    // $4819
	.byte $D2                                    // $481C  ???
	ora ($01,x)                                  // $481D
	ora ($09,x)                                  // $481F
	ora #$5d                                     // $4821
	adc ($00,x)                                  // $4823
	brk                                          // $4825
	brk                                          // $4826
	ror $2f,x                                    // $4827
	ora #$09                                     // $4829
	ora #$09                                     // $482B
	ora #$09                                     // $482D
	ora #$01                                     // $482F
	ora ($09,x)                                  // $4831
	.byte $D2                                    // $4833  ???
	jsr $2020                                    // $4834
	jsr $0320                                    // $4837
	brk                                          // $483A
	brk                                          // $483B
	brk                                          // $483C
	ora $20                                      // $483D
	.byte $D2                                    // $483F  ???
	jsr $2020                                    // $4840
	jsr $2020                                    // $4843
	jsr $2020                                    // $4846
	jsr $d2d2                                    // $4849
	.byte $D2                                    // $484C  ???
	.byte $D2                                    // $484D  ???
	.byte $20, $20, $00                          // $484E  jsr $0020
	brk                                          // $4851
	ora $20                                      // $4852
	.byte $D2                                    // $4854  ???
	.byte $D2                                    // $4855  ???
	jsr $0120                                    // $4856
	ora ($01,x)                                  // $4859
	ora #$d2                                     // $485B
	jsr $2020                                    // $485D
	.byte $20, $03, $00                          // $4860  jsr $0003
	brk                                          // $4863
	brk                                          // $4864
	ora $d2                                      // $4865
	.byte $D2                                    // $4867  ???
	.byte $D2                                    // $4868  ???
	jsr $2020                                    // $4869
	jsr $2020                                    // $486C
	jsr $d220                                    // $486F
	ora #$09                                     // $4872
	ora #$09                                     // $4874
	jsr $0320                                    // $4876
	brk                                          // $4879
	asl $09                                      // $487A
	ora #$09                                     // $487C
	.byte $D2                                    // $487E  ???
	jsr $2020                                    // $487F
	jsr $2020                                    // $4882
	jsr $2020                                    // $4885
	jsr $d220                                    // $4888
	.byte $D2                                    // $488B  ???
	jsr $2020                                    // $488C
	jsr $d220                                    // $488F
	.byte $04                                    // $4892  ???
	brk                                          // $4893
	asl $d2                                      // $4894
	jsr $d220                                    // $4896
	ora #$d2                                     // $4899
	.byte $D2                                    // $489B  ???
	jsr $2020                                    // $489C
	.byte $20, $03, $00                          // $489F  jsr $0003
	brk                                          // $48A2
	ora $20                                      // $48A3
	jsr $0969                                    // $48A5
	ora ($01,x)                                  // $48A8
	ora #$3c                                     // $48AA
	.byte $D2                                    // $48AC  ???
	jsr $2020                                    // $48AD
	.byte $D2                                    // $48B0  ???
	.byte $D2                                    // $48B1  ???
	.byte $D2                                    // $48B2  ???
	jsr $2020                                    // $48B3
	.byte $20, $03, $00                          // $48B6  jsr $0003
	ora $20                                      // $48B9
	jsr $2020                                    // $48BB
	.byte $A3                                    // $48BE  ???
	.byte $20, $7D, $00                          // $48BF  jsr $007D
	brk                                          // $48C2
	brk                                          // $48C3
	brk                                          // $48C4
	.byte $7F                                    // $48C5  ???
	lda $20                                      // $48C6
	jsr $d220                                    // $48C8
	ora #$01                                     // $48CB
	ora ($01,x)                                  // $48CD
	ora ($01,x)                                  // $48CF
	ora ($09,x)                                  // $48D1
	ora #$09                                     // $48D3
	ora #$77                                     // $48D5
	ror $09,x                                    // $48D7
	ora #$01                                     // $48D9
	ora #$09                                     // $48DB
	ora ($01,x)                                  // $48DD
	ora #$01                                     // $48DF
	ora ($01,x)                                  // $48E1
	ora ($01,x)                                  // $48E3
	ora #$d2                                     // $48E5
	jsr $2020                                    // $48E7
	.byte $20, $03, $00                          // $48EA  jsr $0003
	brk                                          // $48ED
	brk                                          // $48EE
	ora $d2                                      // $48EF
	.byte $D2                                    // $48F1  ???
	.byte $D2                                    // $48F2  ???
	jsr $2020                                    // $48F3
	jsr $2020                                    // $48F6
	jsr $d220                                    // $48F9
	ora #$09                                     // $48FC
	ora #$09                                     // $48FE
	jsr $0320                                    // $4900
	brk                                          // $4903
	asl $09                                      // $4904
	ora #$09                                     // $4906
	.byte $D2                                    // $4908  ???
	jsr $0101                                    // $4909
	ora ($01,x)                                  // $490C
	ora #$d2                                     // $490E
	jsr $2020                                    // $4910
	.byte $04                                    // $4913  ???
	brk                                          // $4914
	brk                                          // $4915
	asl $09                                      // $4916
	ora #$d2                                     // $4918
	.byte $D2                                    // $491A  ???
	jsr $2020                                    // $491B
	jsr $2020                                    // $491E
	.byte $D2                                    // $4921  ???
	.byte $D2                                    // $4922  ???
	ora #$09                                     // $4923
	ora #$09                                     // $4925
	ora ($01,x)                                  // $4927
	ora #$04                                     // $4929
	brk                                          // $492B
	asl $01                                      // $492C
	ora ($09,x)                                  // $492E
	ora #$01                                     // $4930
	.byte $D2                                    // $4932  ???
	jsr $2020                                    // $4933
	jsr $2020                                    // $4936
	jsr $d220                                    // $4939
	ora #$09                                     // $493C
	.byte $D2                                    // $493E  ???
	.byte $D2                                    // $493F  ???
	.byte $D2                                    // $4940  ???
	ora ($09,x)                                  // $4941
	ora #$09                                     // $4943
	.byte $04                                    // $4945  ???
	asl $01                                      // $4946
	ora ($01,x)                                  // $4948
	ora #$09                                     // $494A
	ora #$d2                                     // $494C
	.byte $D2                                    // $494E  ???
	jsr $03d2                                    // $494F
	brk                                          // $4952
	brk                                          // $4953
	brk                                          // $4954
	.byte $64                                    // $4955  ???
	.byte $3A                                    // $4956  ???
	.byte $04                                    // $4957  ???
	.byte $64                                    // $4958  ???
	.byte $63                                    // $4959  ???
	.byte $34                                    // $495A  ???
	ora ($2d,x)                                  // $495B
	and $0130,x                                  // $495D
	ora ($09,x)                                  // $4960
	ora #$09                                     // $4962
	ora #$d2                                     // $4964
	jsr $2020                                    // $4966
	.byte $03                                    // $4969  ???
	brk                                          // $496A
	ora $20                                      // $496B
	jsr $2020                                    // $496D
	.byte $A3                                    // $4970  ???
	.byte $D2                                    // $4971  ???
	.byte $7D, $00, $00                          // $4972  adc $0000,x
	brk                                          // $4975
	brk                                          // $4976
	brk                                          // $4977
	lda $d2                                      // $4978
	jsr $09d2                                    // $497A
	ora ($01,x)                                  // $497D
	ora ($01,x)                                  // $497F
	ora #$01                                     // $4981
	ora ($09,x)                                  // $4983
	ora ($01,x)                                  // $4985
	ora #$01                                     // $4987
	ora #$09                                     // $4989
	ora ($01,x)                                  // $498B
	ora ($01,x)                                  // $498D
	ora ($01,x)                                  // $498F
	ora ($01,x)                                  // $4991
	ora ($01,x)                                  // $4993
	ora ($01,x)                                  // $4995
	ora ($09,x)                                  // $4997
	.byte $D2                                    // $4999  ???
	.byte $D2                                    // $499A  ???
	jsr $0420                                    // $499B
	brk                                          // $499E
	brk                                          // $499F
	asl $09                                      // $49A0
	ora #$d2                                     // $49A2
	.byte $D2                                    // $49A4  ???
	jsr $2020                                    // $49A5
	jsr $2020                                    // $49A8
	.byte $D2                                    // $49AB  ???
	.byte $D2                                    // $49AC  ???
	ora #$09                                     // $49AD
	ora #$09                                     // $49AF
	ora ($01,x)                                  // $49B1
	ora #$04                                     // $49B3
	brk                                          // $49B5
	asl $01                                      // $49B6
	ora ($09,x)                                  // $49B8
	ora #$01                                     // $49BA
	ora ($01,x)                                  // $49BC
	ora ($01,x)                                  // $49BE
	ora #$09                                     // $49C0
	.byte $D2                                    // $49C2  ???
	jsr $0409                                    // $49C3
	brk                                          // $49C6
	asl $09                                      // $49C7
	ora #$09                                     // $49C9
	.byte $D2                                    // $49CB  ???
	jsr $d220                                    // $49CC
	jsr $2020                                    // $49CF
	ora #$09                                     // $49D2
	ora #$01                                     // $49D4
	ora ($01,x)                                  // $49D6
	ora ($01,x)                                  // $49D8
	ora ($01,x)                                  // $49DA
	.byte $04                                    // $49DC  ???
	brk                                          // $49DD
	asl $01                                      // $49DE
	ora ($01,x)                                  // $49E0
	ora ($01,x)                                  // $49E2
	ora ($09,x)                                  // $49E4
	.byte $D2                                    // $49E6  ???
	jsr $2020                                    // $49E7
	jsr $d220                                    // $49EA
	ora #$09                                     // $49ED
	ora #$01                                     // $49EF
	ora ($01,x)                                  // $49F1
	ora #$09                                     // $49F3
	ora #$09                                     // $49F5
	brk                                          // $49F7
	asl $01                                      // $49F8
	ora ($09,x)                                  // $49FA
	ora ($01,x)                                  // $49FC
	ora ($09,x)                                  // $49FE
	ora #$09                                     // $4A00
	and $0600                                    // $4A02
	.byte $04                                    // $4A05  ???
	asl $04                                      // $4A06
	asl $2c                                      // $4A08
	adc ($00,x)                                  // $4A0A
	brk                                          // $4A0C
	brk                                          // $4A0D
	brk                                          // $4A0E
	ror $60,x                                    // $4A0F
	ora ($09,x)                                  // $4A11
	ora #$09                                     // $4A13
	ora #$09                                     // $4A15
	ora ($01,x)                                  // $4A17
	ora ($01,x)                                  // $4A19
	brk                                          // $4A1B
	brk                                          // $4A1C
	asl $01                                      // $4A1D
	ora ($01,x)                                  // $4A1F
	ora ($a4,x)                                  // $4A21
	ora #$00                                     // $4A23
	.byte $62                                    // $4A25  ???
	ora ($01,x)                                  // $4A26
	brk                                          // $4A28
	.byte $62                                    // $4A29  ???
	ldx $09                                      // $4A2A
	ora #$01                                     // $4A2C
	ora ($01,x)                                  // $4A2E
	ora ($01,x)                                  // $4A30
	ora #$09                                     // $4A32
	ora ($01,x)                                  // $4A34
	ora #$01                                     // $4A36
	ora ($01,x)                                  // $4A38
	ora ($09,x)                                  // $4A3A
	ora #$01                                     // $4A3C
	ora #$01                                     // $4A3E
	ora ($01,x)                                  // $4A40
	ora ($01,x)                                  // $4A42
	ora ($01,x)                                  // $4A44
	ora ($01,x)                                  // $4A46
	ora ($01,x)                                  // $4A48
	ora #$d2                                     // $4A4A
	jsr $09d2                                    // $4A4C
	.byte $04                                    // $4A4F  ???
	brk                                          // $4A50
	asl $09                                      // $4A51
	ora #$09                                     // $4A53
	.byte $D2                                    // $4A55  ???
	jsr $d220                                    // $4A56
	jsr $2020                                    // $4A59
	ora #$09                                     // $4A5C
	ora #$01                                     // $4A5E
	ora ($01,x)                                  // $4A60
	ora ($01,x)                                  // $4A62
	ora ($01,x)                                  // $4A64
	.byte $04                                    // $4A66  ???
	brk                                          // $4A67
	asl $01                                      // $4A68
	ora ($01,x)                                  // $4A6A
	ora ($01,x)                                  // $4A6C
	ora ($01,x)                                  // $4A6E
	ora ($01,x)                                  // $4A70
	ora #$09                                     // $4A72
	ora ($01,x)                                  // $4A74
	.byte $04                                    // $4A76  ???
	brk                                          // $4A77
	brk                                          // $4A78
	asl $09                                      // $4A79
	ora #$04                                     // $4A7B
	asl $01                                      // $4A7D
	ora #$09                                     // $4A7F
	ora #$01                                     // $4A81
	ora ($01,x)                                  // $4A83
	ora ($01,x)                                  // $4A85
	ora ($01,x)                                  // $4A87
	ora ($01,x)                                  // $4A89
	ora ($01,x)                                  // $4A8B
	ora ($04,x)                                  // $4A8D
	brk                                          // $4A8F
	asl $09                                      // $4A90
	ora ($01,x)                                  // $4A92
	ora ($01,x)                                  // $4A94
	ora #$09                                     // $4A96
	ora #$09                                     // $4A98
	ora ($01,x)                                  // $4A9A
	ora ($70,x)                                  // $4A9C
	adc ($6d),y                                  // $4A9E
	.byte $1F                                    // $4AA0  ???
	.byte $1F                                    // $4AA1  ???
	.byte $1F                                    // $4AA2  ???
	.byte $6B                                    // $4AA3  ???
	.byte $67                                    // $4AA4  ???
	ora ($09,x)                                  // $4AA5
	ora #$04                                     // $4AA7
	brk                                          // $4AA9
	asl $01                                      // $4AAA
	ora ($01,x)                                  // $4AAC
	ora ($01,x)                                  // $4AAE
	ora ($01,x)                                  // $4AB0
	ora ($01,x)                                  // $4AB2
	ora ($01,x)                                  // $4AB4
	ora ($01,x)                                  // $4AB6
	ora ($01,x)                                  // $4AB8
	ora ($01,x)                                  // $4ABA
	ora ($28,x)                                  // $4ABC
	.byte $79, $77, $00                          // $4ABE  adc $0077,y
	rts                                          // $4AC1
	.byte $3F                                    // $4AC2  ???
	ora ($01,x)                                  // $4AC3
	ora ($01,x)                                  // $4AC5
	ora ($01,x)                                  // $4AC7
	ora ($01,x)                                  // $4AC9
	ora ($04,x)                                  // $4ACB
	brk                                          // $4ACD
	brk                                          // $4ACE
	asl $01                                      // $4ACF
	ora ($01,x)                                  // $4AD1
	ora ($a4,x)                                  // $4AD3
	ora ($00,x)                                  // $4AD5
	.byte $62                                    // $4AD7  ???
	ora ($01,x)                                  // $4AD8
	brk                                          // $4ADA
	.byte $62                                    // $4ADB  ???
	ldx $01                                      // $4ADC
	ora ($09,x)                                  // $4ADE
	ora #$01                                     // $4AE0
	ora ($01,x)                                  // $4AE2
	ora ($01,x)                                  // $4AE4
	ora ($01,x)                                  // $4AE6
	ora ($01,x)                                  // $4AE8
	ora ($01,x)                                  // $4AEA
	ora ($01,x)                                  // $4AEC
	ora #$01                                     // $4AEE
	ora ($01,x)                                  // $4AF0
	ora ($01,x)                                  // $4AF2
	ora ($01,x)                                  // $4AF4
	ora ($01,x)                                  // $4AF6
	ora ($01,x)                                  // $4AF8
	ora ($01,x)                                  // $4AFA
	ora #$09                                     // $4AFC
	ora ($01,x)                                  // $4AFE
	.byte $04                                    // $4B00  ???
	brk                                          // $4B01
	brk                                          // $4B02
	asl $09                                      // $4B03
	ora #$04                                     // $4B05
	asl $01                                      // $4B07
	ora #$09                                     // $4B09
	ora #$01                                     // $4B0B
	ora ($01,x)                                  // $4B0D
	ora ($01,x)                                  // $4B0F
	ora ($01,x)                                  // $4B11
	ora ($01,x)                                  // $4B13
	ora ($01,x)                                  // $4B15
	ora ($04,x)                                  // $4B17
	brk                                          // $4B19
	asl $09                                      // $4B1A
	ora ($01,x)                                  // $4B1C
	ora ($01,x)                                  // $4B1E
	ora ($01,x)                                  // $4B20
	ora ($01,x)                                  // $4B22
	ora ($01,x)                                  // $4B24
	ora ($09,x)                                  // $4B26
	.byte $04                                    // $4B28  ???
	asl $04                                      // $4B29
	asl $09                                      // $4B2B
	ora #$04                                     // $4B2D
	brk                                          // $4B2F
	asl $09                                      // $4B30
	ora #$09                                     // $4B32
	ora #$01                                     // $4B34
	ora ($01,x)                                  // $4B36
	ora ($01,x)                                  // $4B38
	ora ($01,x)                                  // $4B3A
	ora ($01,x)                                  // $4B3C
	ora ($01,x)                                  // $4B3E
	brk                                          // $4B40
	asl $09                                      // $4B41
	ora #$01                                     // $4B43
	ora ($01,x)                                  // $4B45
	ora ($09,x)                                  // $4B47
	ora #$09                                     // $4B49
	ora #$09                                     // $4B4B
	ora ($6d,x)                                  // $4B4D
	.byte $1F                                    // $4B4F  ???
	.byte $1F                                    // $4B50  ???
	.byte $1F                                    // $4B51  ???
	.byte $1F                                    // $4B52  ???
	.byte $1F                                    // $4B53  ???
	.byte $1F                                    // $4B54  ???
	.byte $1F                                    // $4B55  ???
	ror                                          // $4B56
	ora #$09                                     // $4B57
	ora #$09                                     // $4B59
	brk                                          // $4B5B
	asl $01                                      // $4B5C
	ora ($01,x)                                  // $4B5E
	ora ($01,x)                                  // $4B60
	ora #$01                                     // $4B62
	ora ($01,x)                                  // $4B64
	ora ($01,x)                                  // $4B66
	ora ($01,x)                                  // $4B68
	ora ($01,x)                                  // $4B6A
	ora ($01,x)                                  // $4B6C
	ora ($01,x)                                  // $4B6E
	ora ($01,x)                                  // $4B70
	and ($3d),y                                  // $4B72
	ora ($01,x)                                  // $4B74
	ora ($01,x)                                  // $4B76
	ora ($01,x)                                  // $4B78
	ora ($01,x)                                  // $4B7A
	ora ($01,x)                                  // $4B7C
	brk                                          // $4B7E
	.byte $04                                    // $4B7F  ???
	brk                                          // $4B80
	brk                                          // $4B81
	asl $01                                      // $4B82
	ora ($01,x)                                  // $4B84
	ora ($09,x)                                  // $4B86
	ror $0162,x                                  // $4B88
	ora ($7e,x)                                  // $4B8B
	.byte $62                                    // $4B8D  ???
	ora #$01                                     // $4B8E
	ora ($09,x)                                  // $4B90
	ora #$01                                     // $4B92
	ora ($01,x)                                  // $4B94
	ora ($01,x)                                  // $4B96
	ora ($01,x)                                  // $4B98
	ora ($01,x)                                  // $4B9A
	ora ($01,x)                                  // $4B9C
	ora ($09,x)                                  // $4B9E
	ora #$01                                     // $4BA0
	ora ($01,x)                                  // $4BA2
	ora ($01,x)                                  // $4BA4
	ora ($01,x)                                  // $4BA6
	ora ($01,x)                                  // $4BA8
	ora ($01,x)                                  // $4BAA
	ora ($01,x)                                  // $4BAC
	ora ($01,x)                                  // $4BAE
	ora ($09,x)                                  // $4BB0
	.byte $04                                    // $4BB2  ???
	asl $04                                      // $4BB3
	asl $09                                      // $4BB5
	ora #$04                                     // $4BB7
	brk                                          // $4BB9
	asl $09                                      // $4BBA
	ora #$09                                     // $4BBC
	ora #$01                                     // $4BBE
	ora ($01,x)                                  // $4BC0
	ora ($01,x)                                  // $4BC2
	ora ($01,x)                                  // $4BC4
	ora ($01,x)                                  // $4BC6
	ora ($01,x)                                  // $4BC8
	brk                                          // $4BCA
	asl $09                                      // $4BCB
	ora #$01                                     // $4BCD
	ora ($01,x)                                  // $4BCF
	ora ($01,x)                                  // $4BD1
	ora ($01,x)                                  // $4BD3
	ora ($09,x)                                  // $4BD5
	ora ($01,x)                                  // $4BD7
	ora ($09,x)                                  // $4BD9
	ora #$04                                     // $4BDB
	.byte $04                                    // $4BDD  ???
	asl $09                                      // $4BDE
	.byte $04                                    // $4BE0  ???
	.byte $04                                    // $4BE1  ???
	brk                                          // $4BE2
	asl $09                                      // $4BE3
	ora #$09                                     // $4BE5
	ora #$01                                     // $4BE7
	ora ($01,x)                                  // $4BE9
	ora ($01,x)                                  // $4BEB
	ora ($01,x)                                  // $4BED
	ora ($01,x)                                  // $4BEF
	.byte $04                                    // $4BF1  ???
	brk                                          // $4BF2
	asl $09                                      // $4BF3
	asl $09                                      // $4BF5
	ora ($01,x)                                  // $4BF7
	ora ($09,x)                                  // $4BF9
	ora #$09                                     // $4BFB
	ora #$01                                     // $4BFD
	ora ($01,x)                                  // $4BFF
	ora ($6d,x)                                  // $4C01
	.byte $1F                                    // $4C03  ???
	.byte $1F                                    // $4C04  ???
	.byte $1F                                    // $4C05  ???
	ror                                          // $4C06
	ora ($09,x)                                  // $4C07
	ora #$09                                     // $4C09
	ora #$00                                     // $4C0B
	ora ($04,x)                                  // $4C0D
	asl $01                                      // $4C0F
	ora ($09,x)                                  // $4C11
	ora #$09                                     // $4C13
	ora #$01                                     // $4C15
	ora ($01,x)                                  // $4C17
	ora ($01,x)                                  // $4C19
	ora ($01,x)                                  // $4C1B
	ora ($01,x)                                  // $4C1D
	ora ($01,x)                                  // $4C1F
	ora ($01,x)                                  // $4C21
	ora ($01,x)                                  // $4C23
	ora ($01,x)                                  // $4C25
	ora ($01,x)                                  // $4C27
	ora ($01,x)                                  // $4C29
	ora ($01,x)                                  // $4C2B
	ora ($01,x)                                  // $4C2D
	.byte $04                                    // $4C2F  ???
	ora ($01,x)                                  // $4C30
	ora ($06,x)                                  // $4C32
	ora ($01,x)                                  // $4C34
	ora ($09,x)                                  // $4C36
	ora #$09                                     // $4C38
	ora #$09                                     // $4C3A
	ora ($01,x)                                  // $4C3C
	ora ($09,x)                                  // $4C3E
	ora #$09                                     // $4C40
	ora ($01,x)                                  // $4C42
	ora #$09                                     // $4C44
	ora ($01,x)                                  // $4C46
	ora ($01,x)                                  // $4C48
	ora ($01,x)                                  // $4C4A
	ora ($01,x)                                  // $4C4C
	ora ($01,x)                                  // $4C4E
	ora ($01,x)                                  // $4C50
	ora ($01,x)                                  // $4C52
	ora ($01,x)                                  // $4C54
	ora ($01,x)                                  // $4C56
	ora ($01,x)                                  // $4C58
	ora #$01                                     // $4C5A
	ora ($01,x)                                  // $4C5C
	ora ($01,x)                                  // $4C5E
	ora #$01                                     // $4C60
	ora ($01,x)                                  // $4C62
	ora #$09                                     // $4C64
	.byte $04                                    // $4C66  ???
	.byte $04                                    // $4C67  ???
	asl $09                                      // $4C68
	.byte $04                                    // $4C6A  ???
	.byte $04                                    // $4C6B  ???
	brk                                          // $4C6C
	asl $09                                      // $4C6D
	ora #$09                                     // $4C6F
	ora #$01                                     // $4C71
	ora ($01,x)                                  // $4C73
	ora ($01,x)                                  // $4C75
	ora ($01,x)                                  // $4C77
	ora ($01,x)                                  // $4C79
	.byte $04                                    // $4C7B  ???
	brk                                          // $4C7C
	asl $09                                      // $4C7D
	asl $09                                      // $4C7F
	ora ($01,x)                                  // $4C81
	ora ($01,x)                                  // $4C83
	ora ($01,x)                                  // $4C85
	ora #$09                                     // $4C87
	ora ($01,x)                                  // $4C89
	ora ($01,x)                                  // $4C8B
	ora ($01,x)                                  // $4C8D
	ora ($09,x)                                  // $4C8F
	ora #$09                                     // $4C91
	ora #$01                                     // $4C93
	asl $09                                      // $4C95
	ora #$09                                     // $4C97
	ora ($01,x)                                  // $4C99
	ora ($01,x)                                  // $4C9B
	ora ($09,x)                                  // $4C9D
	ora ($01,x)                                  // $4C9F
	ora ($01,x)                                  // $4CA1
	asl $04                                      // $4CA3
	ora #$09                                     // $4CA5
	.byte $04                                    // $4CA7  ???
	ora #$09                                     // $4CA8
	ora ($01,x)                                  // $4CAA
	ora ($09,x)                                  // $4CAC
	ora #$09                                     // $4CAE
	ora ($01,x)                                  // $4CB0
	ora ($01,x)                                  // $4CB2
	ora ($01,x)                                  // $4CB4
	ora ($01,x)                                  // $4CB6
	ora ($09,x)                                  // $4CB8
	ora #$09                                     // $4CBA
	ora #$09                                     // $4CBC
	ora #$06                                     // $4CBE
	ora ($01,x)                                  // $4CC0
	ora ($01,x)                                  // $4CC2
	ora #$09                                     // $4CC4
	ora #$09                                     // $4CC6
	ora ($01,x)                                  // $4CC8
	ora ($01,x)                                  // $4CCA
	ora ($01,x)                                  // $4CCC
	ora ($09,x)                                  // $4CCE
	ora #$01                                     // $4CD0
	ora ($01,x)                                  // $4CD2
	ora ($01,x)                                  // $4CD4
	ora ($01,x)                                  // $4CD6
	ora ($01,x)                                  // $4CD8
	ora ($01,x)                                  // $4CDA
	ora ($01,x)                                  // $4CDC
	ora ($01,x)                                  // $4CDE
	ora ($01,x)                                  // $4CE0
	ora ($01,x)                                  // $4CE2
	ora ($01,x)                                  // $4CE4
	ora ($01,x)                                  // $4CE6
	ora ($01,x)                                  // $4CE8
	ora ($01,x)                                  // $4CEA
	ora ($01,x)                                  // $4CEC
	ora ($01,x)                                  // $4CEE
	ora #$09                                     // $4CF0
	ora #$09                                     // $4CF2
	ora #$01                                     // $4CF4
	ora ($09,x)                                  // $4CF6
	ora ($01,x)                                  // $4CF8
	ora ($01,x)                                  // $4CFA
	ora ($01,x)                                  // $4CFC
	ora ($01,x)                                  // $4CFE
	ora ($01,x)                                  // $4D00
	ora #$01                                     // $4D02
	ora ($01,x)                                  // $4D04
	ora ($01,x)                                  // $4D06
	ora ($01,x)                                  // $4D08
	ora ($01,x)                                  // $4D0A
	ora ($09,x)                                  // $4D0C
	ora ($01,x)                                  // $4D0E
	ora ($09,x)                                  // $4D10
	ora #$01                                     // $4D12
	ora ($01,x)                                  // $4D14
	ora ($01,x)                                  // $4D16
	ora ($01,x)                                  // $4D18
	ora #$09                                     // $4D1A
	ora #$09                                     // $4D1C
	ora ($06,x)                                  // $4D1E
	ora #$09                                     // $4D20
	ora #$01                                     // $4D22
	ora ($01,x)                                  // $4D24
	ora ($01,x)                                  // $4D26
	ora #$01                                     // $4D28
	ora ($01,x)                                  // $4D2A
	ora ($06,x)                                  // $4D2C
	.byte $04                                    // $4D2E  ???
	ora #$09                                     // $4D2F
	.byte $04                                    // $4D31  ???
	ora #$09                                     // $4D32
	ora ($01,x)                                  // $4D34
	ora ($01,x)                                  // $4D36
	ora ($09,x)                                  // $4D38
	ora #$09                                     // $4D3A
	ora ($01,x)                                  // $4D3C
	ora ($01,x)                                  // $4D3E
	ora ($01,x)                                  // $4D40
	ora ($09,x)                                  // $4D42
	ora #$01                                     // $4D44
	ora ($01,x)                                  // $4D46
	ora ($01,x)                                  // $4D48
	ora ($01,x)                                  // $4D4A
	ora ($01,x)                                  // $4D4C
	ora ($09,x)                                  // $4D4E
	ora #$09                                     // $4D50
	ora ($01,x)                                  // $4D52
	ora ($01,x)                                  // $4D54
	ora #$06                                     // $4D56
	ora ($09,x)                                  // $4D58
	ora #$09                                     // $4D5A
	ora ($01,x)                                  // $4D5C
	ora ($01,x)                                  // $4D5E
	ora ($01,x)                                  // $4D60
	ora ($01,x)                                  // $4D62
	ora ($01,x)                                  // $4D64
	ora ($01,x)                                  // $4D66
	ora ($01,x)                                  // $4D68
	ora ($01,x)                                  // $4D6A
	ora ($09,x)                                  // $4D6C
	ora #$09                                     // $4D6E
	ora ($01,x)                                  // $4D70
	ora ($01,x)                                  // $4D72
	ora ($09,x)                                  // $4D74
	ora #$09                                     // $4D76
	ora #$09                                     // $4D78
	ora #$01                                     // $4D7A
	ora ($01,x)                                  // $4D7C
	ora ($01,x)                                  // $4D7E
	ora #$09                                     // $4D80
	ora #$01                                     // $4D82
	ora ($01,x)                                  // $4D84
	ora ($01,x)                                  // $4D86
	ora ($01,x)                                  // $4D88
	ora ($01,x)                                  // $4D8A
	ora ($01,x)                                  // $4D8C
	ora ($01,x)                                  // $4D8E
	ora ($01,x)                                  // $4D90
	ora ($01,x)                                  // $4D92
	ora ($01,x)                                  // $4D94
	ora ($01,x)                                  // $4D96
	ora ($01,x)                                  // $4D98
	ora ($01,x)                                  // $4D9A
	ora ($01,x)                                  // $4D9C
	ora ($01,x)                                  // $4D9E
	ora ($01,x)                                  // $4DA0
	ora ($01,x)                                  // $4DA2
	ora #$01                                     // $4DA4
	ora ($01,x)                                  // $4DA6
	cmp ($01),y                                  // $4DA8
	ora ($01,x)                                  // $4DAA
	ora ($01,x)                                  // $4DAC
	ora ($01,x)                                  // $4DAE
	ora ($01,x)                                  // $4DB0
	ora #$09                                     // $4DB2
	ora #$09                                     // $4DB4
	ora ($01,x)                                  // $4DB6
	ora ($01,x)                                  // $4DB8
	ora ($01,x)                                  // $4DBA
	ora ($01,x)                                  // $4DBC
	ora ($01,x)                                  // $4DBE
	ora ($01,x)                                  // $4DC0
	ora ($09,x)                                  // $4DC2
	ora #$09                                     // $4DC4
	ora ($01,x)                                  // $4DC6
	ora ($01,x)                                  // $4DC8
	ora ($01,x)                                  // $4DCA
	ora ($09,x)                                  // $4DCC
	ora #$01                                     // $4DCE
	ora ($01,x)                                  // $4DD0
	ora ($01,x)                                  // $4DD2
	ora ($01,x)                                  // $4DD4
	ora ($01,x)                                  // $4DD6
	ora ($09,x)                                  // $4DD8
	ora #$09                                     // $4DDA
	ora ($01,x)                                  // $4DDC
	ora ($01,x)                                  // $4DDE
	ora #$06                                     // $4DE0
	ora ($09,x)                                  // $4DE2
	ora #$09                                     // $4DE4
	ora ($01,x)                                  // $4DE6
	ora ($01,x)                                  // $4DE8
	ora ($01,x)                                  // $4DEA
	ora ($01,x)                                  // $4DEC
	ora ($01,x)                                  // $4DEE
	ora ($01,x)                                  // $4DF0
	ora ($01,x)                                  // $4DF2
	ora ($01,x)                                  // $4DF4
	ora ($01,x)                                  // $4DF6
	ora ($01,x)                                  // $4DF8
	ora ($01,x)                                  // $4DFA
	ora ($01,x)                                  // $4DFC
	ora ($01,x)                                  // $4DFE
	ora ($09,x)                                  // $4E00
	ora #$09                                     // $4E02
	ora ($01,x)                                  // $4E04
	ora ($01,x)                                  // $4E06
	ora ($01,x)                                  // $4E08
	ora ($01,x)                                  // $4E0A
	ora ($09,x)                                  // $4E0C
	ora ($01,x)                                  // $4E0E
	ora ($01,x)                                  // $4E10
	ora ($01,x)                                  // $4E12
	ora ($01,x)                                  // $4E14
	ora ($01,x)                                  // $4E16
	ora ($01,x)                                  // $4E18
	ora ($01,x)                                  // $4E1A
	ora ($01,x)                                  // $4E1C
	ora ($01,x)                                  // $4E1E
	ora ($01,x)                                  // $4E20
	ora ($01,x)                                  // $4E22
	ora ($01,x)                                  // $4E24
	ora #$09                                     // $4E26
	ora #$09                                     // $4E28
	ora ($09,x)                                  // $4E2A
	ora #$01                                     // $4E2C
	ora ($01,x)                                  // $4E2E
	ora ($01,x)                                  // $4E30
	ora #$09                                     // $4E32
	ora #$09                                     // $4E34
	ora ($01,x)                                  // $4E36
	ora ($01,x)                                  // $4E38
	ora ($01,x)                                  // $4E3A
	ora ($01,x)                                  // $4E3C
	ora ($01,x)                                  // $4E3E
	ora ($01,x)                                  // $4E40
	ora ($01,x)                                  // $4E42
	ora ($01,x)                                  // $4E44
	ora ($09,x)                                  // $4E46
	ora ($01,x)                                  // $4E48
	ora ($01,x)                                  // $4E4A
	ora ($01,x)                                  // $4E4C
	ora ($01,x)                                  // $4E4E
	ora ($01,x)                                  // $4E50
	ora ($01,x)                                  // $4E52
	ora ($01,x)                                  // $4E54
	ora ($09,x)                                  // $4E56
	ora #$01                                     // $4E58
	ora #$01                                     // $4E5A
	ora ($01,x)                                  // $4E5C
	ora ($01,x)                                  // $4E5E
	ora ($01,x)                                  // $4E60
	ora ($01,x)                                  // $4E62
	ora ($09,x)                                  // $4E64
	ora #$09                                     // $4E66
	ora ($01,x)                                  // $4E68
	ora ($01,x)                                  // $4E6A
	ora ($01,x)                                  // $4E6C
	ora ($01,x)                                  // $4E6E
	ora ($01,x)                                  // $4E70
	ora ($01,x)                                  // $4E72
	ora ($01,x)                                  // $4E74
	ora ($01,x)                                  // $4E76
	ora ($01,x)                                  // $4E78
	ora ($01,x)                                  // $4E7A
	ora ($01,x)                                  // $4E7C
	ora ($01,x)                                  // $4E7E
	ora ($01,x)                                  // $4E80
	ora ($01,x)                                  // $4E82
	ora ($01,x)                                  // $4E84
	ora ($01,x)                                  // $4E86
	ora ($01,x)                                  // $4E88
	ora ($09,x)                                  // $4E8A
	ora #$09                                     // $4E8C
	ora ($01,x)                                  // $4E8E
	ora ($01,x)                                  // $4E90
	ora ($01,x)                                  // $4E92
	ora ($01,x)                                  // $4E94
	ora ($01,x)                                  // $4E96
	ora ($01,x)                                  // $4E98
	ora ($01,x)                                  // $4E9A
	ora ($01,x)                                  // $4E9C
	ora ($01,x)                                  // $4E9E
	ora ($01,x)                                  // $4EA0
	ora ($01,x)                                  // $4EA2
	ora ($01,x)                                  // $4EA4
	ora ($01,x)                                  // $4EA6
	ora ($01,x)                                  // $4EA8
	ora ($01,x)                                  // $4EAA
	ora ($01,x)                                  // $4EAC
	ora ($01,x)                                  // $4EAE
	ora ($01,x)                                  // $4EB0
	ora ($01,x)                                  // $4EB2
	ora ($01,x)                                  // $4EB4
	ora ($01,x)                                  // $4EB6
	ora ($01,x)                                  // $4EB8
	ora ($01,x)                                  // $4EBA
	ora ($01,x)                                  // $4EBC
	ora ($01,x)                                  // $4EBE
	ora ($01,x)                                  // $4EC0
	ora ($01,x)                                  // $4EC2
	ora ($01,x)                                  // $4EC4
	ora ($01,x)                                  // $4EC6
	ora ($01,x)                                  // $4EC8
	ora ($01,x)                                  // $4ECA
	ora ($01,x)                                  // $4ECC
	ora ($01,x)                                  // $4ECE
	ora ($01,x)                                  // $4ED0
	ora ($01,x)                                  // $4ED2
	ora ($01,x)                                  // $4ED4
	ora ($01,x)                                  // $4ED6
	ora ($01,x)                                  // $4ED8
	ora ($01,x)                                  // $4EDA
	ora ($01,x)                                  // $4EDC
	ora ($01,x)                                  // $4EDE
	ora ($01,x)                                  // $4EE0
	ora ($01,x)                                  // $4EE2
	ora ($3f,x)                                  // $4EE4
	and $0101,x                                  // $4EE6
	ora ($01,x)                                  // $4EE9
	ora ($01,x)                                  // $4EEB
	ora ($01,x)                                  // $4EED
	ora ($01,x)                                  // $4EEF
	ora ($01,x)                                  // $4EF1
	ora ($01,x)                                  // $4EF3
	ora ($01,x)                                  // $4EF5
	ora ($09,x)                                  // $4EF7
	ora #$09                                     // $4EF9
	ora ($01,x)                                  // $4EFB
	ora ($01,x)                                  // $4EFD
	ora ($01,x)                                  // $4EFF
	ora ($01,x)                                  // $4F01
	ora ($01,x)                                  // $4F03
	ora ($01,x)                                  // $4F05
	ora ($09,x)                                  // $4F07
	ora #$09                                     // $4F09
	ora #$01                                     // $4F0B
	ora ($01,x)                                  // $4F0D
	ora ($01,x)                                  // $4F0F
	ora ($01,x)                                  // $4F11
	ora ($01,x)                                  // $4F13
	ora ($01,x)                                  // $4F15
	ora #$09                                     // $4F17
	ora ($01,x)                                  // $4F19
	ora ($01,x)                                  // $4F1B
	ora ($01,x)                                  // $4F1D
	ora ($01,x)                                  // $4F1F
	ora ($01,x)                                  // $4F21
	ora ($01,x)                                  // $4F23
	ora ($01,x)                                  // $4F25
	ora ($01,x)                                  // $4F27
	ora ($01,x)                                  // $4F29
	ora ($01,x)                                  // $4F2B
	ora ($01,x)                                  // $4F2D
	ora ($01,x)                                  // $4F2F
	ora ($01,x)                                  // $4F31
	ora ($01,x)                                  // $4F33
	ora ($01,x)                                  // $4F35
	ora ($01,x)                                  // $4F37
	ora ($01,x)                                  // $4F39
	ora ($01,x)                                  // $4F3B
	ora ($01,x)                                  // $4F3D
	ora ($01,x)                                  // $4F3F
	ora ($01,x)                                  // $4F41
	ora ($01,x)                                  // $4F43
	ora ($01,x)                                  // $4F45
	ora ($01,x)                                  // $4F47
	ora ($01,x)                                  // $4F49
	ora ($01,x)                                  // $4F4B
	ora ($01,x)                                  // $4F4D
	ora ($01,x)                                  // $4F4F
	ora ($01,x)                                  // $4F51
	ora ($01,x)                                  // $4F53
	ora ($01,x)                                  // $4F55
	ora ($01,x)                                  // $4F57
	ora #$09                                     // $4F59
	ora ($01,x)                                  // $4F5B
	ora ($01,x)                                  // $4F5D
	ora ($01,x)                                  // $4F5F
	ora ($01,x)                                  // $4F61
	ora ($01,x)                                  // $4F63
	ora ($01,x)                                  // $4F65
	ora ($01,x)                                  // $4F67
	ora ($01,x)                                  // $4F69
	ora ($01,x)                                  // $4F6B
	ora ($01,x)                                  // $4F6D
	ora ($01,x)                                  // $4F6F
	ora ($01,x)                                  // $4F71
	ora ($01,x)                                  // $4F73
	ora ($01,x)                                  // $4F75
	ora ($01,x)                                  // $4F77
	ora ($01,x)                                  // $4F79
	ora ($01,x)                                  // $4F7B
	ora ($01,x)                                  // $4F7D
	ora ($01,x)                                  // $4F7F
	ora ($01,x)                                  // $4F81
	ora ($01,x)                                  // $4F83
	ora ($01,x)                                  // $4F85
	ora ($01,x)                                  // $4F87
	ora ($01,x)                                  // $4F89
	ora ($01,x)                                  // $4F8B
	ora ($01,x)                                  // $4F8D
	ora ($01,x)                                  // $4F8F
	ora ($01,x)                                  // $4F91
	ora ($01,x)                                  // $4F93
	ora ($01,x)                                  // $4F95
	ora ($01,x)                                  // $4F97
	ora ($01,x)                                  // $4F99
	ora ($01,x)                                  // $4F9B
	ora ($01,x)                                  // $4F9D
	ora ($01,x)                                  // $4F9F
	ora ($01,x)                                  // $4FA1
	ora ($01,x)                                  // $4FA3
	ora ($01,x)                                  // $4FA5
	ora ($01,x)                                  // $4FA7
	ora ($01,x)                                  // $4FA9
	ora #$09                                     // $4FAB
	ora ($01,x)                                  // $4FAD
	ora ($01,x)                                  // $4FAF
	ora ($01,x)                                  // $4FB1
	ora ($01,x)                                  // $4FB3
	ora ($01,x)                                  // $4FB5
	ora ($01,x)                                  // $4FB7
	ora ($01,x)                                  // $4FB9
	ora #$09                                     // $4FBB
	ora #$01                                     // $4FBD
	ora ($01,x)                                  // $4FBF
	ora ($01,x)                                  // $4FC1
	ora ($01,x)                                  // $4FC3
	ora ($01,x)                                  // $4FC5
	ora ($01,x)                                  // $4FC7
	ora ($01,x)                                  // $4FC9
	ora ($01,x)                                  // $4FCB
	ora ($01,x)                                  // $4FCD
	ora ($01,x)                                  // $4FCF
	ora ($01,x)                                  // $4FD1
	ora ($01,x)                                  // $4FD3
	ora ($01,x)                                  // $4FD5
	ora ($01,x)                                  // $4FD7
	ora ($01,x)                                  // $4FD9
	ora ($01,x)                                  // $4FDB
	ora ($01,x)                                  // $4FDD
	ora ($01,x)                                  // $4FDF
	ora ($01,x)                                  // $4FE1
	ora #$09                                     // $4FE3
	ora ($01,x)                                  // $4FE5
	ora ($01,x)                                  // $4FE7
	ora ($01,x)                                  // $4FE9
	ora ($01,x)                                  // $4FEB
	ora ($01,x)                                  // $4FED
	ora ($01,x)                                  // $4FEF
	ora ($01,x)                                  // $4FF1
	ora ($01,x)                                  // $4FF3
	ora ($01,x)                                  // $4FF5
	ora #$01                                     // $4FF7
	ora ($01,x)                                  // $4FF9
	ora ($01,x)                                  // $4FFB
	ora ($01,x)                                  // $4FFD
	ora ($01,x)                                  // $4FFF
	ora ($01,x)                                  // $5001
	.byte $1A                                    // $5003  ???
	.byte $1B                                    // $5004  ???
	.byte $1C                                    // $5005  ???
	ora $011e,x                                  // $5006
	ora ($01,x)                                  // $5009
	ora ($01,x)                                  // $500B
	.byte $07                                    // $500D  ???
	ora ($07,x)                                  // $500E
	ora ($01,x)                                  // $5010
	ora ($01,x)                                  // $5012
	ora ($01,x)                                  // $5014
	ora ($01,x)                                  // $5016
	.byte $07                                    // $5018  ???
	ora ($07,x)                                  // $5019
	ora ($01,x)                                  // $501B
	asl $1a0f                                    // $501D
	.byte $1B                                    // $5020  ???
	.byte $1C                                    // $5021  ???
	ora $011e,x                                  // $5022
	ora ($01,x)                                  // $5025
	ora ($01,x)                                  // $5027
	ora ($01,x)                                  // $5029
	.byte $10, $10                               // $502B  bpl $503D
	.byte $10, $10                               // $502D  bpl $503F
	.byte $10, $10                               // $502F  bpl $5041
	.byte $10, $10                               // $5031  bpl $5043
	ora ($01,x)                                  // $5033
	php                                          // $5035
	ora ($08,x)                                  // $5036
	ora ($01,x)                                  // $5038
	ora ($01,x)                                  // $503A
	ora ($01,x)                                  // $503C
	ora ($01,x)                                  // $503E
	php                                          // $5040
	ora ($08,x)                                  // $5041
	ora ($01,x)                                  // $5043
	.byte $10, $10                               // $5045  bpl $5057
	.byte $10, $10                               // $5047  bpl $5059
	.byte $10, $10                               // $5049  bpl $505B
	.byte $10, $10                               // $504B  bpl $505D
	ora ($01,x)                                  // $504D
	ora ($02,x)                                  // $504F
	asl $07                                      // $5051
	php                                          // $5053
	.byte $0C                                    // $5054  ???
	.byte $13                                    // $5055  ???
	.byte $1A                                    // $5056  ???
	.byte $1C                                    // $5057  ???
	.byte $1F                                    // $5058  ???
	.byte $22                                    // $5059  ???
	and $2c                                      // $505A
	and $3836                                    // $505C
	.byte $3A                                    // $505F  ???
	.byte $3C                                    // $5060  ???
	and $4342,x                                  // $5061
	lsr $4c                                      // $5064
	eor $5753                                    // $5066
	.byte $5B                                    // $5069  ???
	ror $69                                      // $506A
	jmp ($8079)                                  // $506C
	.byte $3C                                    // $506F  ???
	cli                                          // $5070
	.byte $3C                                    // $5071  ???
	.byte $10, $9A                               // $5072  bpl $500E
	ldx #$a8                                     // $5074
	.byte $B0, $B6                               // $5076  bcs $502E
	clv                                          // $5078
	.byte $BF                                    // $5079  ???
	cpy #$c4                                     // $507A
	dec $ce                                      // $507C
	.byte $D0, $D3                               // $507E  bne $5053
	.byte $D7                                    // $5080  ???
	.byte $E2                                    // $5081  ???
	cpx $f7                                      // $5082
	sed                                          // $5084
	inc $02ff,x                                  // $5085
	asl                                          // $5088
	.byte $10, $12                               // $5089  bpl $509D
	.byte $1A                                    // $508B  ???
	.byte $23                                    // $508C  ???
	.byte $2B                                    // $508D  ???
	.byte $30, $3B                               // $508E  bmi $50CB
	and $4c4a,x                                  // $5090
	lsr $5851                                    // $5093
	adc $03                                      // $5096
	adc $1e33,x                                  // $5098
	.byte $93                                    // $509B  ???
	ldx $bab6                                    // $509C
	ldx $c9c7,y                                  // $509F
	.byte $CB                                    // $50A2  ???
	dec $d4d2                                    // $50A3
	.byte $DA                                    // $50A6  ???
	.byte $E7                                    // $50A7  ???
	sbc $fcf4                                    // $50A8
	inc $2020,x                                  // $50AB
	jsr $ffff                                    // $50AE  ; IRQ_VEC_HI
	.byte $FF                                    // $50B1  ???
	.byte $FF                                    // $50B2  ???
	.byte $FF                                    // $50B3  ???
	.byte $FF                                    // $50B4  ???
	.byte $FF                                    // $50B5  ???
	.byte $FF                                    // $50B6  ???
	.byte $FF                                    // $50B7  ???
	.byte $53                                    // $50B8  ???
	eor #$44                                     // $50B9
	.byte $54                                    // $50BB  ???
	eor ($42,x)                                  // $50BC
	.byte $4C, $45, $00                          // $50BE  jmp $0045
	brk                                          // $50C1
	brk                                          // $50C2
	brk                                          // $50C3
	and ($2a,x)                                  // $50C4
	.byte $80                                    // $50C6  ???
	brk                                          // $50C7
	brk                                          // $50C8
	.byte $F0, $01                               // $50C9  beq $50CC
	and ($22,x)                                  // $50CB
	.byte $80                                    // $50CD  ???
	brk                                          // $50CE
	brk                                          // $50CF
	.byte $FF                                    // $50D0  ???
	ora $2441                                    // $50D1
	.byte $80                                    // $50D4  ???
	brk                                          // $50D5
	brk                                          // $50D6
	brk                                          // $50D7
	.byte $0B                                    // $50D8  ???
	jsr $4d20                                    // $50D9
	eor $53,x                                    // $50DC
	eor #$43                                     // $50DE
	and $a2                                      // $50E0
	.byte $0B                                    // $50E2  ???
	.byte $30, $04                               // $50E3  bmi $50E9
	ldy $25,x                                    // $50E5
	ldx #$09                                     // $50E7
	ror                                          // $50E9
	.byte $04                                    // $50EA  ???
	ldy $25,x                                    // $50EB
	ldx #$0b                                     // $50ED
	.byte $30, $04                               // $50EF  bmi $50F5
	ldy $25,x                                    // $50F1
	ldx #$0b                                     // $50F3
	.byte $30, $03                               // $50F5  bmi $50FA
	.byte $BB                                    // $50F7  ???
	and $a2                                      // $50F8
	ora #$6a                                     // $50FA
	.byte $03                                    // $50FC  ???
	.byte $BB                                    // $50FD  ???
	and $a2                                      // $50FE
	.byte $0B                                    // $5100  ???
	.byte $30, $03                               // $5101  bmi $5106
	.byte $BB                                    // $5103  ???
	and $a2                                      // $5104
	.byte $0B                                    // $5106  ???
	.byte $30, $04                               // $5107  bmi $510D
	ldy $25,x                                    // $5109
	ldx #$09                                     // $510B
	ror                                          // $510D
	.byte $04                                    // $510E  ???
	ldy $00,x                                    // $510F
	brk                                          // $5111
	.byte $0B                                    // $5112  ???
	.byte $30, $04                               // $5113  bmi $5119
	ldy $00,x                                    // $5115
	brk                                          // $5117
	.byte $0B                                    // $5118  ???
	.byte $30, $03                               // $5119  bmi $511E
	.byte $BB                                    // $511B  ???
	brk                                          // $511C
	brk                                          // $511D
	php                                          // $511E
	sbc ($03,x)                                  // $511F
	.byte $BB                                    // $5121  ???
	brk                                          // $5122
	brk                                          // $5123
	.byte $0B                                    // $5124  ???
	.byte $30, $03                               // $5125  bmi $512A
	.byte $BB                                    // $5127  ???
	brk                                          // $5128
	brk                                          // $5129
	.byte $0B                                    // $512A  ???
	.byte $30, $04                               // $512B  bmi $5131
	ldy $00,x                                    // $512D
	brk                                          // $512F
	ora #$6a                                     // $5130
	.byte $04                                    // $5132  ???
	ldy $00,x                                    // $5133
	brk                                          // $5135
	.byte $0B                                    // $5136  ???
	.byte $30, $04                               // $5137  bmi $513D
	ldy $00,x                                    // $5139
	brk                                          // $513B
	.byte $0B                                    // $513C  ???
	.byte $30, $03                               // $513D  bmi $5142
	.byte $BB                                    // $513F  ???
	brk                                          // $5140
	brk                                          // $5141
	php                                          // $5142
	sbc ($03,x)                                  // $5143
	.byte $BB                                    // $5145  ???
	brk                                          // $5146
	brk                                          // $5147
	.byte $0B                                    // $5148  ???
	.byte $30, $03                               // $5149  bmi $514E
	.byte $BB                                    // $514B  ???
	brk                                          // $514C
	brk                                          // $514D
	.byte $0B                                    // $514E  ???
	.byte $30, $04                               // $514F  bmi $5155
	ldy $00,x                                    // $5151
	brk                                          // $5153
	ora #$6a                                     // $5154
	.byte $04                                    // $5156  ???
	ldy $00,x                                    // $5157
	brk                                          // $5159
	.byte $0B                                    // $515A  ???
	.byte $30, $04                               // $515B  bmi $5161
	ldy $00,x                                    // $515D
	brk                                          // $515F
	.byte $0B                                    // $5160  ???
	.byte $30, $03                               // $5161  bmi $5166
	.byte $BB                                    // $5163  ???
	brk                                          // $5164
	brk                                          // $5165
	php                                          // $5166
	sbc ($03,x)                                  // $5167
	.byte $BB                                    // $5169  ???
	brk                                          // $516A
	brk                                          // $516B
	.byte $0B                                    // $516C  ???
	.byte $30, $03                               // $516D  bmi $5172
	.byte $BB                                    // $516F  ???
	.byte $1C                                    // $5170  ???
	and ($0b),y                                  // $5171
	.byte $30, $04                               // $5173  bmi $5179
	ldy $1c,x                                    // $5175
	and ($09),y                                  // $5177
	ror                                          // $5179
	.byte $04                                    // $517A  ???
	ldy $1c,x                                    // $517B
	and ($0b),y                                  // $517D
	.byte $30, $04                               // $517F  bmi $5185
	ldy $19,x                                    // $5181
	asl $300b,x                                  // $5183
	.byte $03                                    // $5186  ???
	.byte $BB                                    // $5187  ???
	asl $60,x                                    // $5188
	php                                          // $518A
	sbc ($03,x)                                  // $518B
	.byte $BB                                    // $518D  ???
	ora $0b1e,y                                  // $518E
	.byte $30, $03                               // $5191  bmi $5196
	.byte $BB                                    // $5193  ???
	.byte $1C                                    // $5194  ???
	and ($0b),y                                  // $5195
	.byte $30, $04                               // $5197  bmi $519D
	ldy $1c,x                                    // $5199
	and ($09),y                                  // $519B
	ror                                          // $519D
	.byte $04                                    // $519E  ???
	ldy $1c,x                                    // $519F
	and ($0b),y                                  // $51A1
	.byte $30, $04                               // $51A3  bmi $51A9
	ldy $21,x                                    // $51A5
	.byte $87                                    // $51A7  ???
	.byte $0B                                    // $51A8  ???
	.byte $30, $03                               // $51A9  bmi $51AE
	.byte $BB                                    // $51AB  ???
	and ($87,x)                                  // $51AC
	php                                          // $51AE
	sbc ($03,x)                                  // $51AF
	.byte $BB                                    // $51B1  ???
	and ($87,x)                                  // $51B2
	.byte $0B                                    // $51B4  ???
	.byte $30, $03                               // $51B5  bmi $51BA
	.byte $BB                                    // $51B7  ???
	.byte $1C                                    // $51B8  ???
	and ($0b),y                                  // $51B9
	.byte $30, $04                               // $51BB  bmi $51C1
	ldy $1c,x                                    // $51BD
	and ($09),y                                  // $51BF
	ror                                          // $51C1
	.byte $04                                    // $51C2  ???
	ldy $1c,x                                    // $51C3
	and ($0b),y                                  // $51C5
	.byte $30, $04                               // $51C7  bmi $51CD
	ldy $19,x                                    // $51C9
	asl $300b,x                                  // $51CB
	.byte $03                                    // $51CE  ???
	.byte $BB                                    // $51CF  ???
	asl $60,x                                    // $51D0
	php                                          // $51D2
	sbc ($03,x)                                  // $51D3
	.byte $BB                                    // $51D5  ???
	ora $0b1e,y                                  // $51D6
	.byte $30, $03                               // $51D9  bmi $51DE
	.byte $BB                                    // $51DB  ???
	.byte $1C                                    // $51DC  ???
	and ($0b),y                                  // $51DD
	.byte $30, $04                               // $51DF  bmi $51E5
	ldy $1c,x                                    // $51E1
	and ($3b),y                                  // $51E3
	ldx $b404,y                                  // $51E5
	.byte $1C                                    // $51E8  ???
	and ($38),y                                  // $51E9
	.byte $63                                    // $51EB  ???
	.byte $04                                    // $51EC  ???
	ldy $1c,x                                    // $51ED
	and ($35),y                                  // $51EF
	and $bb03,y                                  // $51F1
	.byte $1C                                    // $51F4  ???
	and ($32),y                                  // $51F5
	.byte $3C                                    // $51F7  ???
	.byte $03                                    // $51F8  ???
	.byte $BB                                    // $51F9  ???
	brk                                          // $51FA
	brk                                          // $51FB
	.byte $2F                                    // $51FC  ???
	.byte $6B                                    // $51FD  ???
	.byte $03                                    // $51FE  ???
	.byte $BB                                    // $51FF  ???
	.byte $1C                                    // $5200  ???
	and ($0b),y                                  // $5201
	.byte $30, $04                               // $5203  bmi $5209
	ldy $1c,x                                    // $5205
	and ($09),y                                  // $5207
	ror                                          // $5209
	.byte $04                                    // $520A  ???
	ldy $1c,x                                    // $520B
	and ($0b),y                                  // $520D
	.byte $30, $04                               // $520F  bmi $5215
	ldy $19,x                                    // $5211
	asl $300b,x                                  // $5213
	.byte $03                                    // $5216  ???
	.byte $BB                                    // $5217  ???
	asl $60,x                                    // $5218
	php                                          // $521A
	sbc ($03,x)                                  // $521B
	.byte $BB                                    // $521D  ???
	ora $0b1e,y                                  // $521E
	.byte $30, $03                               // $5221  bmi $5226
	.byte $BB                                    // $5223  ???
	.byte $1C                                    // $5224  ???
	and ($0b),y                                  // $5225
	.byte $30, $04                               // $5227  bmi $522D
	ldy $1c,x                                    // $5229
	and ($09),y                                  // $522B
	ror                                          // $522D
	.byte $04                                    // $522E  ???
	ldy $1c,x                                    // $522F
	and ($0b),y                                  // $5231
	.byte $30, $04                               // $5233  bmi $5239
	ldy $21,x                                    // $5235
	.byte $87                                    // $5237  ???
	.byte $0B                                    // $5238  ???
	.byte $30, $03                               // $5239  bmi $523E
	.byte $BB                                    // $523B  ???
	and ($87,x)                                  // $523C
	php                                          // $523E
	sbc ($03,x)                                  // $523F
	.byte $BB                                    // $5241  ???
	and ($87,x)                                  // $5242
	.byte $0B                                    // $5244  ???
	.byte $30, $03                               // $5245  bmi $524A
	.byte $BB                                    // $5247  ???
	and $a2                                      // $5248
	.byte $0B                                    // $524A  ???
	.byte $30, $04                               // $524B  bmi $5251
	ldy $25,x                                    // $524D
	ldx #$09                                     // $524F
	ror                                          // $5251
	.byte $04                                    // $5252  ???
	ldy $25,x                                    // $5253
	ldx #$0b                                     // $5255
	.byte $30, $04                               // $5257  bmi $525D
	ldy $21,x                                    // $5259
	.byte $87                                    // $525B  ???
	.byte $0B                                    // $525C  ???
	.byte $30, $03                               // $525D  bmi $5262
	.byte $BB                                    // $525F  ???
	.byte $1C                                    // $5260  ???
	and ($08),y                                  // $5261
	sbc ($03,x)                                  // $5263
	.byte $BB                                    // $5265  ???
	and ($87,x)                                  // $5266
	.byte $0B                                    // $5268  ???
	.byte $30, $03                               // $5269  bmi $526E
	.byte $BB                                    // $526B  ???
	and $a2                                      // $526C
	.byte $0B                                    // $526E  ???
	.byte $30, $04                               // $526F  bmi $5275
	ldy $25,x                                    // $5271
	ldx #$0e                                     // $5273
	clc                                          // $5275
	.byte $04                                    // $5276  ???
	ldy $25,x                                    // $5277
	ldx #$0b                                     // $5279
	.byte $30, $04                               // $527B  bmi $5281
	ldy $25,x                                    // $527D
	ldx #$0e                                     // $527F
	clc                                          // $5281
	.byte $04                                    // $5282  ???
	ldy $25,x                                    // $5283
	ldx #$12                                     // $5285
	cmp ($04),y                                  // $5287
	ldy $25,x                                    // $5289
	ldx #$16                                     // $528B
	rts                                          // $528D
	.byte $04                                    // $528E  ???
	ldy $2a,x                                    // $528F
	rol $8721,x                                  // $5291
	.byte $03                                    // $5294  ???
	stx $27                                      // $5295
	sbc ($1f,x)                                  // $5297
	lda $03                                      // $5299
	stx $25                                      // $529B
	ldx #$1d                                     // $529D
	.byte $DF                                    // $529F  ???
	.byte $03                                    // $52A0  ???
	stx $21                                      // $52A1
	.byte $87                                    // $52A3  ???
	.byte $1C                                    // $52A4  ???
	and ($04),y                                  // $52A5
	ldy $25,x                                    // $52A7
	ldx #$1d                                     // $52A9
	.byte $DF                                    // $52AB  ???
	.byte $04                                    // $52AC  ???
	ldy $27,x                                    // $52AD
	sbc ($1f,x)                                  // $52AF
	lda $04                                      // $52B1
	ldy $2a,x                                    // $52B3
	rol $8721,x                                  // $52B5
	.byte $03                                    // $52B8  ???
	stx $27                                      // $52B9
	sbc ($1f,x)                                  // $52BB
	lda $03                                      // $52BD
	stx $25                                      // $52BF
	ldx #$1d                                     // $52C1
	.byte $DF                                    // $52C3  ???
	.byte $03                                    // $52C4  ???
	stx $21                                      // $52C5
	.byte $87                                    // $52C7  ???
	.byte $1C                                    // $52C8  ???
	and ($04),y                                  // $52C9
	ldy $25,x                                    // $52CB
	ldx #$1d                                     // $52CD
	.byte $DF                                    // $52CF  ???
	.byte $04                                    // $52D0  ???
	ldy $27,x                                    // $52D1
	sbc ($1f,x)                                  // $52D3
	lda $04                                      // $52D5
	ldy $2a,x                                    // $52D7
	rol $8721,x                                  // $52D9
	.byte $03                                    // $52DC  ???
	stx $27                                      // $52DD
	sbc ($1f,x)                                  // $52DF
	lda $03                                      // $52E1
	stx $25                                      // $52E3
	ldx #$1d                                     // $52E5
	.byte $DF                                    // $52E7  ???
	.byte $03                                    // $52E8  ???
	stx $21                                      // $52E9
	.byte $87                                    // $52EB  ???
	.byte $1C                                    // $52EC  ???
	and ($04),y                                  // $52ED
	ldy $25,x                                    // $52EF
	ldx #$1d                                     // $52F1
	.byte $DF                                    // $52F3  ???
	.byte $04                                    // $52F4  ???
	ldy $27,x                                    // $52F5
	sbc ($1f,x)                                  // $52F7
	lda $04                                      // $52F9
	ldy $2a,x                                    // $52FB
	rol $8f0a,x                                  // $52FD
	brk                                          // $5300
	brk                                          // $5301
	rol                                          // $5302
	rol $8f0a,x                                  // $5303
	ora $47                                      // $5306
	rol                                          // $5308
	rol $8f0a,x                                  // $5309
	ora $47                                      // $530C
	bit $0dc1                                    // $530E
	.byte $4E, $00, $00                          // $5311  lsr $0000
	bit $0dc1                                    // $5314
	lsr $4705                                    // $5317
	bit $0dc1                                    // $531A
	lsr $4705                                    // $531D
	rol                                          // $5320
	rol $d20f,x                                  // $5321
	brk                                          // $5324
	brk                                          // $5325
	rol                                          // $5326
	rol $d20f,x                                  // $5327
	ora $47                                      // $532A
	and $a2                                      // $532C
	.byte $0F                                    // $532E  ???
	.byte $D2                                    // $532F  ???
	ora $47                                      // $5330
	rol                                          // $5332
	rol $4e0d,x                                  // $5333
	brk                                          // $5336
	brk                                          // $5337
	rol                                          // $5338
	rol $180e,x                                  // $5339
	ora $47                                      // $533C
	rol                                          // $533E
	rol $4e0d,x                                  // $533F
	ora $47                                      // $5342
	.byte $FF                                    // $5344  ???
	jsr $2020                                    // $5345
	eor $5355                                    // $5348
	eor #$43                                     // $534B
	.byte $54                                    // $534D  ???
	.byte $57                                    // $534E  ???
	.byte $4F                                    // $534F  ???
	.byte $43                                    // $5350  ???
	.byte $0F                                    // $5351  ???
	brk                                          // $5352
	brk                                          // $5353
	brk                                          // $5354
	brk                                          // $5355
	.byte $3F                                    // $5356  ???
	.byte $4B                                    // $5357  ???
	brk                                          // $5358
	brk                                          // $5359
	brk                                          // $535A
	brk                                          // $535B
	.byte $3B                                    // $535C  ???
	.byte $BE, $00, $00                          // $535D  ldx $0000,y
	brk                                          // $5360
	brk                                          // $5361
	sec                                          // $5362
	.byte $63                                    // $5363  ???
	brk                                          // $5364
	brk                                          // $5365
	brk                                          // $5366
	brk                                          // $5367
	and $39,x                                    // $5368
	.byte $43                                    // $536A  ???
	.byte $0F                                    // $536B  ???
	brk                                          // $536C
	brk                                          // $536D
	.byte $32                                    // $536E  ???
	.byte $3C                                    // $536F  ???
	.byte $3F                                    // $5370  ???
	.byte $4B                                    // $5371  ???
	brk                                          // $5372
	brk                                          // $5373
	.byte $2F                                    // $5374  ???
	.byte $6B                                    // $5375  ???
	.byte $3B                                    // $5376  ???
	.byte $BE, $00, $00                          // $5377  ldx $0000,y
	bit $38c1                                    // $537A
	.byte $63                                    // $537D  ???
	brk                                          // $537E
	brk                                          // $537F
	rol                                          // $5380
	rol $3935,x                                  // $5381
	.byte $43                                    // $5384  ???
	.byte $0F                                    // $5385  ???
	.byte $27                                    // $5386  ???
	.byte $DF                                    // $5387  ???
	.byte $32                                    // $5388  ???
	.byte $3C                                    // $5389  ???
	.byte $3B                                    // $538A  ???
	ldx $a225,y                                  // $538B
	.byte $2F                                    // $538E  ???
	.byte $6B                                    // $538F  ???
	.byte $3B                                    // $5390  ???
	ldx $8623,y                                  // $5391
	bit $38c1                                    // $5394
	.byte $FF                                    // $5397  ???
	.byte $FF                                    // $5398  ???
	.byte $FF                                    // $5399  ???
	.byte $FF                                    // $539A  ???
	.byte $FF                                    // $539B  ???
	.byte $FF                                    // $539C  ???
	.byte $FF                                    // $539D  ???
	.byte $FF                                    // $539E  ???
	brk                                          // $539F
	.byte $0B                                    // $53A0  ???
	sbc $ed05                                    // $53A1
	and $39,x                                    // $53A4
	.byte $0C                                    // $53A6  ???
	.byte $8F                                    // $53A7  ???
	asl $47                                      // $53A8
	brk                                          // $53AA
	brk                                          // $53AB
	ora $064e                                    // $53AC
	.byte $A7                                    // $53AF  ???
	.byte $FF                                    // $53B0  ???
	.byte $FF                                    // $53B1  ???
	.byte $FF                                    // $53B2  ???
	.byte $FF                                    // $53B3  ???
	.byte $FF                                    // $53B4  ???
	.byte $FF                                    // $53B5  ???
	.byte $FF                                    // $53B6  ???
	.byte $FF                                    // $53B7  ???
	rol                                          // $53B8
	rol                                          // $53B9
	rol                                          // $53BA
	rol                                          // $53BB
	rol                                          // $53BC
	rol                                          // $53BD
	rol                                          // $53BE
	rol                                          // $53BF
	eor $1683,y                                  // $53C0
	rts                                          // $53C3
	ora $98                                      // $53C4
	.byte $43                                    // $53C6  ???
	.byte $0F                                    // $53C7  ???
	asl $60,x                                    // $53C8
	ora $98                                      // $53CA
	sec                                          // $53CC
	.byte $63                                    // $53CD  ???
	asl $60,x                                    // $53CE
	ora $98                                      // $53D0
	.byte $54                                    // $53D2  ???
	adc $6016,x                                  // $53D3
	ora $98                                      // $53D6
	.byte $43                                    // $53D8  ???
	.byte $0F                                    // $53D9  ???
	ora $1f,x                                    // $53DA
	.byte $04                                    // $53DC  ???
	.byte $30, $38                               // $53DD  bmi $5417
	.byte $63                                    // $53DF  ???
	ora $1f,x                                    // $53E0
	.byte $04                                    // $53E2  ???
	.byte $30, $4B                               // $53E3  bmi $5430
	eor $12                                      // $53E5
	cmp ($04),y                                  // $53E7
	.byte $30, $38                               // $53E9  bmi $5423
	.byte $63                                    // $53EB  ???
	.byte $12                                    // $53EC  ???
	cmp ($04),y                                  // $53ED
	.byte $30, $2C                               // $53EF  bmi $541D
	cmp ($12,x)                                  // $53F1
	cmp ($05),y                                  // $53F3
	tya                                          // $53F5
	.byte $54                                    // $53F6  ???
	adc $d112,x                                  // $53F7
	ora $98                                      // $53FA
	.byte $43                                    // $53FC  ???
	.byte $0F                                    // $53FD  ???
	.byte $10, $C3                               // $53FE  bpl $53C3
	ora $98                                      // $5400
	sec                                          // $5402
	.byte $63                                    // $5403  ???
	.byte $10, $C3                               // $5404  bpl $53C9
	ora $98                                      // $5406
	eor $0f83,y                                  // $5408
	.byte $D2                                    // $540B  ???
	.byte $04                                    // $540C  ???
	.byte $30, $43                               // $540D  bmi $5452
	.byte $0F                                    // $540F  ???
	.byte $0F                                    // $5410  ???
	.byte $D2                                    // $5411  ???
	.byte $04                                    // $5412  ???
	.byte $30, $38                               // $5413  bmi $544D
	.byte $63                                    // $5415  ???
	.byte $10, $C3                               // $5416  bpl $53DB
	.byte $04                                    // $5418  ???
	.byte $30, $59                               // $5419  bmi $5474
	.byte $83                                    // $541B  ???
	.byte $10, $C3                               // $541C  bpl $53E1
	.byte $04                                    // $541E  ???
	.byte $30, $54                               // $541F  bmi $5475
	adc $d112,x                                  // $5421
	ora $47                                      // $5424
	.byte $3F                                    // $5426  ???
	.byte $4B                                    // $5427  ???
	.byte $12                                    // $5428  ???
	cmp ($05),y                                  // $5429
	.byte $47                                    // $542B  ???
	.byte $32                                    // $542C  ???
	.byte $3C                                    // $542D  ???
	.byte $12                                    // $542E  ???
	cmp ($05),y                                  // $542F
	.byte $47                                    // $5431  ???
	.byte $4B                                    // $5432  ???
	eor $12                                      // $5433
	cmp ($05),y                                  // $5435
	.byte $47                                    // $5437  ???
	sec                                          // $5438
	.byte $4B                                    // $5439  ???
	.byte $10, $C3                               // $543A  bpl $53FF
	.byte $03                                    // $543C  ???
	.byte $F4                                    // $543D  ???
	.byte $32                                    // $543E  ???
	.byte $3C                                    // $543F  ???
	.byte $10, $C3                               // $5440  bpl $5405
	.byte $03                                    // $5442  ???
	.byte $F4                                    // $5443  ???
	.byte $43                                    // $5444  ???
	.byte $0F                                    // $5445  ???
	.byte $0F                                    // $5446  ???
	.byte $D2                                    // $5447  ???
	.byte $03                                    // $5448  ???
	.byte $F4                                    // $5449  ???
	.byte $32                                    // $544A  ???
	.byte $3C                                    // $544B  ???
	.byte $0F                                    // $544C  ???
	.byte $D2                                    // $544D  ???
	.byte $03                                    // $544E  ???
	.byte $F4                                    // $544F  ???
	rol                                          // $5450
	.byte $3C                                    // $5451  ???
	.byte $0F                                    // $5452  ???
	.byte $D2                                    // $5453  ???
	ora $47                                      // $5454
	.byte $4B                                    // $5456  ???
	eor $0f                                      // $5457
	.byte $D2                                    // $5459  ???
	ora $47                                      // $545A
	.byte $3F                                    // $545C  ???
	.byte $4B                                    // $545D  ???
	asl $0518                                    // $545E
	.byte $47                                    // $5461  ???
	.byte $32                                    // $5462  ???
	.byte $3C                                    // $5463  ???
	asl $0518                                    // $5464
	.byte $47                                    // $5467  ???
	.byte $54                                    // $5468  ???
	adc $d20f,x                                  // $5469
	.byte $03                                    // $546C  ???
	.byte $F4                                    // $546D  ???
	.byte $3F                                    // $546E  ???
	.byte $4B                                    // $546F  ???
	.byte $0F                                    // $5470  ???
	.byte $D2                                    // $5471  ???
	.byte $03                                    // $5472  ???
	.byte $F4                                    // $5473  ???
	.byte $32                                    // $5474  ???
	.byte $3C                                    // $5475  ???
	.byte $10, $C3                               // $5476  bpl $543B
	.byte $03                                    // $5478  ???
	.byte $F4                                    // $5479  ???
	.byte $54                                    // $547A  ???
	adc $c310,x                                  // $547B
	.byte $03                                    // $547E  ???
	.byte $F4                                    // $547F  ???
	.byte $43                                    // $5480  ???
	eor $12                                      // $5481
	cmp ($04),y                                  // $5483
	ldy $38,x                                    // $5485
	.byte $63                                    // $5487  ???
	.byte $12                                    // $5488  ???
	cmp ($04),y                                  // $5489
	ldy $2c,x                                    // $548B
	cmp ($12,x)                                  // $548D
	cmp ($04),y                                  // $548F
	ldy $43,x                                    // $5491
	.byte $0F                                    // $5493  ???
	.byte $12                                    // $5494  ???
	cmp ($04),y                                  // $5495
	ldy $38,x                                    // $5497
	.byte $63                                    // $5499  ???
	.byte $12                                    // $549A  ???
	cmp ($03),y                                  // $549B
	stx $2c                                      // $549D
	cmp ($12,x)                                  // $549F
	cmp ($03),y                                  // $54A1
	stx $3f                                      // $54A3
	.byte $4B                                    // $54A5  ???
	.byte $10, $C3                               // $54A6  bpl $546B
	.byte $03                                    // $54A8  ???
	stx $2c                                      // $54A9
	cmp ($10,x)                                  // $54AB
	.byte $C3                                    // $54AD  ???
	.byte $03                                    // $54AE  ???
	stx $25                                      // $54AF
	ldx #$0f                                     // $54B1
	.byte $D2                                    // $54B3  ???
	.byte $04                                    // $54B4  ???
	ldy $43,x                                    // $54B5
	.byte $0F                                    // $54B7  ???
	.byte $0F                                    // $54B8  ???
	.byte $D2                                    // $54B9  ???
	.byte $04                                    // $54BA  ???
	ldy $38,x                                    // $54BB
	.byte $63                                    // $54BD  ???
	asl $0418                                    // $54BE
	ldy $2c,x                                    // $54C1
	cmp ($0e,x)                                  // $54C3
	clc                                          // $54C5
	.byte $04                                    // $54C6  ???
	ldy $4b,x                                    // $54C7
	eor $0c                                      // $54C9
	.byte $8F                                    // $54CB  ???
	.byte $03                                    // $54CC  ???
	stx $38                                      // $54CD
	.byte $63                                    // $54CF  ???
	.byte $0C                                    // $54D0  ???
	.byte $8F                                    // $54D1  ???
	.byte $03                                    // $54D2  ???
	stx $2c                                      // $54D3
	cmp ($03,x)                                  // $54D5
	.byte $30, $03                               // $54D7  bmi $54DC
	stx $4b                                      // $54D9
	eor $0b                                      // $54DB
	.byte $30, $03                               // $54DD  bmi $54E2
	stx $2a                                      // $54DF
	rol $8f0a,x                                  // $54E1
	ora $47                                      // $54E4
	rol                                          // $54E6
	rol $8f0a,x                                  // $54E7
	ora $47                                      // $54EA
	brk                                          // $54EC
	brk                                          // $54ED
	brk                                          // $54EE
	brk                                          // $54EF
	brk                                          // $54F0
	brk                                          // $54F1
	rol                                          // $54F2
	rol $8f0a,x                                  // $54F3
	.byte $07                                    // $54F6  ???
	sbc #$2a                                     // $54F7
	rol $8f0a,x                                  // $54F9
	ora $47                                      // $54FC
	brk                                          // $54FE
	brk                                          // $54FF
	brk                                          // $5500
	brk                                          // $5501
	brk                                          // $5502
	brk                                          // $5503
	rol                                          // $5504
	rol $8f0a,x                                  // $5505
	ora $47                                      // $5508
	rol                                          // $550A
	rol $8f0a,x                                  // $550B
	ora $47                                      // $550E
	brk                                          // $5510
	brk                                          // $5511
	brk                                          // $5512
	brk                                          // $5513
	brk                                          // $5514
	brk                                          // $5515
	rol                                          // $5516
	rol $8f0a,x                                  // $5517
	.byte $07                                    // $551A  ???
	sbc #$2a                                     // $551B
	rol $8f0a,x                                  // $551D
	ora $47                                      // $5520
	brk                                          // $5522
	brk                                          // $5523
	brk                                          // $5524
	brk                                          // $5525
	brk                                          // $5526
	brk                                          // $5527
	rol                                          // $5528
	rol $8f0a,x                                  // $5529
	.byte $07                                    // $552C  ???
	sbc #$00                                     // $552D
	brk                                          // $552F
	brk                                          // $5530
	brk                                          // $5531
	brk                                          // $5532
	brk                                          // $5533
	rol                                          // $5534
	rol $8f0a,x                                  // $5535
	ora $47                                      // $5538
	rol                                          // $553A
	rol $8f0a,x                                  // $553B
	ora $ff                                      // $553E
	asl $47                                      // $5540
	asl $10                                      // $5542
	brk                                          // $5544
	brk                                          // $5545
	asl $47                                      // $5546
	asl $69                                      // $5548
	brk                                          // $554A
	brk                                          // $554B
	asl $47                                      // $554C
	asl $57                                      // $554E
	brk                                          // $5550
	brk                                          // $5551
	asl $47                                      // $5552
	asl $23                                      // $5554
	brk                                          // $5556
	brk                                          // $5557
	asl $47                                      // $5558
	asl $82                                      // $555A
	brk                                          // $555C
	brk                                          // $555D
	asl $47                                      // $555E
	asl $35                                      // $5560
	brk                                          // $5562
	brk                                          // $5563
	asl $47                                      // $5564
	asl $67                                      // $5566
	brk                                          // $5568
	brk                                          // $5569
	asl $47                                      // $556A
	asl $23                                      // $556C
	brk                                          // $556E
	brk                                          // $556F
	asl $47                                      // $5570
	asl $78                                      // $5572
	brk                                          // $5574
	brk                                          // $5575
	asl $47                                      // $5576
	asl $54                                      // $5578
	brk                                          // $557A
	brk                                          // $557B
	asl $47                                      // $557C
	asl $10                                      // $557E
	brk                                          // $5580
	brk                                          // $5581
	asl $47                                      // $5582
	asl $66                                      // $5584
	brk                                          // $5586
	.byte $FF                                    // $5587  ???
	rol                                          // $5588
	rol                                          // $5589
	rol                                          // $558A
	rol                                          // $558B
	rol                                          // $558C
	rol                                          // $558D
	rol                                          // $558E
	rol                                          // $558F
	ora #$6a                                     // $5590
	.byte $07                                    // $5592  ???
	.byte $0C                                    // $5593  ???
	.byte $04                                    // $5594  ???
	.byte $70, $00                               // $5595  bvs $5597
	brk                                          // $5597
	brk                                          // $5598
	brk                                          // $5599
	.byte $04                                    // $559A  ???
	ldy $09,x                                    // $559B
	ror                                          // $559D
	.byte $07                                    // $559E  ???
	.byte $0C                                    // $559F  ???
	.byte $04                                    // $55A0  ???
	.byte $70, $09                               // $55A1  bvs $55AC
	ror                                          // $55A3
	.byte $07                                    // $55A4  ???
	.byte $0C                                    // $55A5  ???
	.byte $04                                    // $55A6  ???
	ldy $00,x                                    // $55A7
	brk                                          // $55A9
	brk                                          // $55AA
	brk                                          // $55AB
	.byte $04                                    // $55AC  ???
	.byte $70, $00                               // $55AD  bvs $55AF
	brk                                          // $55AF
	brk                                          // $55B0
	brk                                          // $55B1
	.byte $04                                    // $55B2  ???
	ldy $0e,x                                    // $55B3
	clc                                          // $55B5
	.byte $0B                                    // $55B6  ???
	.byte $30, $04                               // $55B7  bmi $55BD
	.byte $70, $00                               // $55B9  bvs $55BB
	brk                                          // $55BB
	brk                                          // $55BC
	brk                                          // $55BD
	.byte $04                                    // $55BE  ???
	ldy $0c,x                                    // $55BF
	.byte $8F                                    // $55C1  ???
	.byte $07                                    // $55C2  ???
	sbc #$04                                     // $55C3
	.byte $70, $0C                               // $55C5  bvs $55D3
	.byte $8F                                    // $55C7  ???
	.byte $07                                    // $55C8  ???
	sbc #$04                                     // $55C9
	ldy $00,x                                    // $55CB
	brk                                          // $55CD
	brk                                          // $55CE
	brk                                          // $55CF
	.byte $04                                    // $55D0  ???
	.byte $70, $0B                               // $55D1  bvs $55DE
	.byte $30, $07                               // $55D3  bmi $55DC
	.byte $0C                                    // $55D5  ???
	.byte $04                                    // $55D6  ???
	ldy $00,x                                    // $55D7
	brk                                          // $55D9
	brk                                          // $55DA
	brk                                          // $55DB
	.byte $04                                    // $55DC  ???
	.byte $70, $00                               // $55DD  bvs $55DF
	brk                                          // $55DF
	brk                                          // $55E0
	brk                                          // $55E1
	.byte $04                                    // $55E2  ???
	ldy $0a,x                                    // $55E3
	.byte $8F                                    // $55E5  ???
	php                                          // $55E6
	adc ($04,x)                                  // $55E7
	.byte $70, $00                               // $55E9  bvs $55EB
	brk                                          // $55EB
	brk                                          // $55EC
	brk                                          // $55ED
	.byte $04                                    // $55EE  ???
	.byte $FF                                    // $55EF  ???
	rol                                          // $55F0
	rol                                          // $55F1
	rol                                          // $55F2
	rol                                          // $55F3
	rol                                          // $55F4
	rol                                          // $55F5
	rol                                          // $55F6
	ldy #$2a                                     // $55F7
	rol                                          // $55F9
	rol                                          // $55FA
	rol                                          // $55FB
	rol                                          // $55FC
	rol                                          // $55FD
	rol                                          // $55FE
	rol                                          // $55FF
	asl $07ef                                    // $5600
	.byte $77                                    // $5603  ???
	brk                                          // $5604
	brk                                          // $5605
	asl $07ef                                    // $5606
	.byte $77                                    // $5609  ???
	brk                                          // $560A
	brk                                          // $560B
	.byte $0F                                    // $560C  ???
	.byte $D2                                    // $560D  ???
	.byte $07                                    // $560E  ???
	sbc #$00                                     // $560F
	brk                                          // $5611
	.byte $0F                                    // $5612  ???
	.byte $D2                                    // $5613  ???
	.byte $07                                    // $5614  ???
	sbc #$00                                     // $5615
	brk                                          // $5617
	ora $1f,x                                    // $5618
	asl                                          // $561A
	.byte $8F                                    // $561B  ???
	brk                                          // $561C
	brk                                          // $561D
	ora $1f,x                                    // $561E
	asl                                          // $5620
	.byte $8F                                    // $5621  ???
	brk                                          // $5622
	brk                                          // $5623
	.byte $13                                    // $5624  ???
	.byte $EF                                    // $5625  ???
	.byte $0C                                    // $5626  ???
	.byte $8F                                    // $5627  ???
	.byte $04                                    // $5628  ???
	.byte $30, $13                               // $5629  bmi $563E
	.byte $EF                                    // $562B  ???
	.byte $0C                                    // $562C  ???
	.byte $8F                                    // $562D  ???
	.byte $03                                    // $562E  ???
	.byte $23                                    // $562F  ???
	.byte $13                                    // $5630  ???
	.byte $EF                                    // $5631  ???
	.byte $0C                                    // $5632  ???
	.byte $8F                                    // $5633  ???
	.byte $04                                    // $5634  ???
	.byte $30, $13                               // $5635  bmi $564A
	.byte $EF                                    // $5637  ???
	.byte $0C                                    // $5638  ???
	.byte $8F                                    // $5639  ???
	.byte $03                                    // $563A  ???
	.byte $23                                    // $563B  ???
	.byte $13                                    // $563C  ???
	.byte $EF                                    // $563D  ???
	.byte $0C                                    // $563E  ???
	.byte $8F                                    // $563F  ???
	.byte $04                                    // $5640  ???
	.byte $30, $13                               // $5641  bmi $5656
	.byte $EF                                    // $5643  ???
	.byte $0C                                    // $5644  ???
	.byte $8F                                    // $5645  ???
	.byte $03                                    // $5646  ???
	.byte $23                                    // $5647  ???
	.byte $13                                    // $5648  ???
	.byte $EF                                    // $5649  ???
	.byte $0C                                    // $564A  ???
	.byte $8F                                    // $564B  ???
	.byte $04                                    // $564C  ???
	.byte $30, $13                               // $564D  bmi $5662
	.byte $EF                                    // $564F  ???
	.byte $0B                                    // $5650  ???
	.byte $DA                                    // $5651  ???
	.byte $04                                    // $5652  ???
	.byte $FB                                    // $5653  ???
	.byte $13                                    // $5654  ???
	.byte $EF                                    // $5655  ???
	.byte $0B                                    // $5656  ???
	.byte $DA                                    // $5657  ???
	.byte $04                                    // $5658  ???
	.byte $FB                                    // $5659  ???
	.byte $13                                    // $565A  ???
	.byte $EF                                    // $565B  ???
	.byte $0B                                    // $565C  ???
	.byte $DA                                    // $565D  ???
	.byte $04                                    // $565E  ???
	.byte $FB                                    // $565F  ???
	ora $0edf,x                                  // $5660
	.byte $EF                                    // $5663  ???
	.byte $04                                    // $5664  ???
	.byte $FB                                    // $5665  ???
	ora $0edf,x                                  // $5666
	.byte $EF                                    // $5669  ???
	.byte $04                                    // $566A  ???
	.byte $FB                                    // $566B  ???
	.byte $1F                                    // $566C  ???
	lda $0f                                      // $566D
	.byte $D2                                    // $566F  ???
	.byte $04                                    // $5670  ???
	.byte $FB                                    // $5671  ???
	.byte $1F                                    // $5672  ???
	lda $0f                                      // $5673
	.byte $D2                                    // $5675  ???
	.byte $04                                    // $5676  ???
	.byte $FB                                    // $5677  ???
	rol                                          // $5678
	rol $1f15,x                                  // $5679
	brk                                          // $567C
	brk                                          // $567D
	rol                                          // $567E
	rol $1f15,x                                  // $567F
	brk                                          // $5682
	brk                                          // $5683
	.byte $27                                    // $5684  ???
	.byte $DF                                    // $5685  ???
	ora $041e,y                                  // $5686
	.byte $30, $27                               // $5689  bmi $56B2
	.byte $DF                                    // $568B  ???
	ora $031e,y                                  // $568C
	.byte $23                                    // $568F  ???
	.byte $27                                    // $5690  ???
	.byte $DF                                    // $5691  ???
	ora $041e,y                                  // $5692
	.byte $30, $27                               // $5695  bmi $56BE
	.byte $DF                                    // $5697  ???
	ora $031e,y                                  // $5698
	.byte $23                                    // $569B  ???
	.byte $27                                    // $569C  ???
	.byte $DF                                    // $569D  ???
	ora $041e,y                                  // $569E
	.byte $30, $27                               // $56A1  bmi $56CA
	.byte $DF                                    // $56A3  ???
	ora $031e,y                                  // $56A4
	.byte $23                                    // $56A7  ???
	.byte $27                                    // $56A8  ???
	.byte $DF                                    // $56A9  ???
	ora $041e,y                                  // $56AA
	.byte $30, $27                               // $56AD  bmi $56D6
	.byte $DF                                    // $56AF  ???
	.byte $17                                    // $56B0  ???
	lda $04,x                                    // $56B1
	.byte $FB                                    // $56B3  ???
	.byte $27                                    // $56B4  ???
	.byte $DF                                    // $56B5  ???
	.byte $17                                    // $56B6  ???
	lda $04,x                                    // $56B7
	.byte $FB                                    // $56B9  ???
	.byte $27                                    // $56BA  ???
	.byte $DF                                    // $56BB  ???
	.byte $17                                    // $56BC  ???
	lda $04,x                                    // $56BD
	.byte $FB                                    // $56BF  ???
	and $a2                                      // $56C0
	.byte $12                                    // $56C2  ???
	cmp ($04),y                                  // $56C3
	.byte $FB                                    // $56C5  ???
	and $a2                                      // $56C6
	.byte $12                                    // $56C8  ???
	cmp ($04),y                                  // $56C9
	.byte $FB                                    // $56CB  ???
	.byte $23                                    // $56CC  ???
	stx $11                                      // $56CD
	.byte $C3                                    // $56CF  ???
	.byte $04                                    // $56D0  ???
	.byte $FB                                    // $56D1  ???
	.byte $23                                    // $56D2  ???
	stx $11                                      // $56D3
	.byte $C3                                    // $56D5  ???
	.byte $04                                    // $56D6  ???
	.byte $FB                                    // $56D7  ???
	.byte $1F                                    // $56D8  ???
	lda $0f                                      // $56D9
	.byte $D2                                    // $56DB  ???
	brk                                          // $56DC
	brk                                          // $56DD
	.byte $1F                                    // $56DE  ???
	lda $0f                                      // $56DF
	.byte $D2                                    // $56E1  ???
	brk                                          // $56E2
	brk                                          // $56E3
	ora $12df,x                                  // $56E4
	cmp ($06),y                                  // $56E7
	.byte $47                                    // $56E9  ???
	ora $12df,x                                  // $56EA
	cmp ($04),y                                  // $56ED
	ldy $1d,x                                    // $56EF
	.byte $DF                                    // $56F1  ???
	.byte $12                                    // $56F2  ???
	cmp ($06),y                                  // $56F3
	.byte $47                                    // $56F5  ???
	ora $12df,x                                  // $56F6
	cmp ($04),y                                  // $56F9
	ldy $1d,x                                    // $56FB
	.byte $DF                                    // $56FD  ???
	.byte $12                                    // $56FE  ???
	cmp ($06),y                                  // $56FF
	.byte $47                                    // $5701  ???
	ora $12df,x                                  // $5702
	cmp ($04),y                                  // $5705
	ldy $1d,x                                    // $5707
	.byte $DF                                    // $5709  ???
	.byte $12                                    // $570A  ???
	cmp ($06),y                                  // $570B
	.byte $47                                    // $570D  ???
	ora $12df,x                                  // $570E
	cmp ($0c),y                                  // $5711
	.byte $8F                                    // $5713  ???
	ora $12df,x                                  // $5714
	cmp ($0c),y                                  // $5717
	.byte $8F                                    // $5719  ???
	ora $12df,x                                  // $571A
	cmp ($0c),y                                  // $571D
	.byte $8F                                    // $571F  ???
	bit $16c1                                    // $5720
	rts                                          // $5723
	.byte $0B                                    // $5724  ???
	.byte $30, $2C                               // $5725  bmi $5753
	cmp ($16,x)                                  // $5727
	rts                                          // $5729
	.byte $0B                                    // $572A  ???
	.byte $30, $2A                               // $572B  bmi $5757
	rol $1f15,x                                  // $572D
	asl                                          // $5730
	.byte $8F                                    // $5731  ???
	rol                                          // $5732
	rol $1f15,x                                  // $5733
	asl                                          // $5736
	.byte $8F                                    // $5737  ???
	.byte $27                                    // $5738  ???
	.byte $DF                                    // $5739  ???
	.byte $13                                    // $573A  ???
	.byte $EF                                    // $573B  ???
	ora #$f7                                     // $573C
	.byte $27                                    // $573E  ???
	.byte $DF                                    // $573F  ???
	.byte $13                                    // $5740  ???
	.byte $EF                                    // $5741  ???
	ora #$ff                                     // $5742
	.byte $FF                                    // $5744  ???
	.byte $FF                                    // $5745  ???
	.byte $FF                                    // $5746  ???
	.byte $FF                                    // $5747  ???
	rol                                          // $5748
	rol                                          // $5749
	rol                                          // $574A
	rol                                          // $574B
	rol                                          // $574C
	rol                                          // $574D
	rol                                          // $574E
	rol                                          // $574F
	.byte $07                                    // $5750  ???
	.byte $0C                                    // $5751  ???
	.byte $03                                    // $5752  ???
	stx $00                                      // $5753
	brk                                          // $5755
	php                                          // $5756
	adc ($04,x)                                  // $5757
	.byte $30, $00                               // $5759  bmi $575B
	brk                                          // $575B
	.byte $07                                    // $575C  ???
	sbc #$03                                     // $575D
	.byte $4F                                    // $575F  ???
	brk                                          // $5760
	brk                                          // $5761
	.byte $07                                    // $5762  ???
	.byte $0C                                    // $5763  ???
	.byte $03                                    // $5764  ???
	stx $00                                      // $5765
	brk                                          // $5767
	asl $a7                                      // $5768
	.byte $03                                    // $576A  ???
	.byte $53                                    // $576B  ???
	brk                                          // $576C
	brk                                          // $576D
	ora #$6a                                     // $576E
	.byte $04                                    // $5770  ???
	ldy $00,x                                    // $5771
	brk                                          // $5773
	.byte $07                                    // $5774  ???
	sbc #$03                                     // $5775
	.byte $4F                                    // $5777  ???
	brk                                          // $5778
	brk                                          // $5779
	php                                          // $577A
	adc ($04,x)                                  // $577B
	.byte $30, $FF                               // $577D  bmi $577E
	.byte $FF                                    // $577F  ???
	rol                                          // $5780
	rol                                          // $5781
	rol                                          // $5782
	rol                                          // $5783
	rol                                          // $5784
	rol                                          // $5785
	rol                                          // $5786
	rol                                          // $5787
	rol                                          // $5788
	rol                                          // $5789
	rol                                          // $578A
	rol                                          // $578B
	rol                                          // $578C
	rol                                          // $578D
	rol                                          // $578E
	rol                                          // $578F
	ora ($56,x)                                  // $5790
	eor $5427                                    // $5792
	ora ($21,x)                                  // $5795
	eor $5927,x                                  // $5797
	lsr $0154                                    // $579A
	ora ($01,x)                                  // $579D
	ora ($2a,x)                                  // $579F
	rol                                          // $57A1
	rol                                          // $57A2
	rol                                          // $57A3
	rol                                          // $57A4
	rol                                          // $57A5
	rol                                          // $57A6
	rol                                          // $57A7
	brk                                          // $57A8
	brk                                          // $57A9
	brk                                          // $57AA
	brk                                          // $57AB
	brk                                          // $57AC
	brk                                          // $57AD
	brk                                          // $57AE
	brk                                          // $57AF
	.byte $03                                    // $57B0  ???
	.byte $BB                                    // $57B1  ???
	.byte $03                                    // $57B2  ???
	.byte $83                                    // $57B3  ???
	.byte $03                                    // $57B4  ???
	lsr $03,x                                    // $57B5
	.byte $BB                                    // $57B7  ???
	.byte $03                                    // $57B8  ???
	.byte $83                                    // $57B9  ???
	.byte $03                                    // $57BA  ???
	lsr $00,x                                    // $57BB
	brk                                          // $57BD
	brk                                          // $57BE
	brk                                          // $57BF
	brk                                          // $57C0
	brk                                          // $57C1
	brk                                          // $57C2
	brk                                          // $57C3
	brk                                          // $57C4
	brk                                          // $57C5
	brk                                          // $57C6
	.byte $FF                                    // $57C7  ???
	brk                                          // $57C8
	brk                                          // $57C9
	brk                                          // $57CA
	brk                                          // $57CB
	brk                                          // $57CC
	brk                                          // $57CD
	brk                                          // $57CE
	brk                                          // $57CF
	brk                                          // $57D0
	brk                                          // $57D1
	brk                                          // $57D2
	brk                                          // $57D3
	brk                                          // $57D4
	brk                                          // $57D5
	brk                                          // $57D6
	brk                                          // $57D7
	brk                                          // $57D8
	brk                                          // $57D9
	brk                                          // $57DA
	brk                                          // $57DB
	brk                                          // $57DC
	brk                                          // $57DD
	brk                                          // $57DE
	brk                                          // $57DF
	brk                                          // $57E0
	brk                                          // $57E1
	brk                                          // $57E2
	brk                                          // $57E3
	brk                                          // $57E4
	brk                                          // $57E5
	brk                                          // $57E6
	.byte $FF                                    // $57E7  ???
	rol                                          // $57E8
	rol                                          // $57E9
	rol                                          // $57EA
	rol                                          // $57EB
	rol                                          // $57EC
	rol                                          // $57ED
	rol                                          // $57EE
	rol                                          // $57EF
	rol                                          // $57F0
	rol                                          // $57F1
	rol                                          // $57F2
	rol                                          // $57F3
	rol                                          // $57F4
	rol                                          // $57F5
	rol                                          // $57F6
	rol                                          // $57F7
	rol                                          // $57F8
	rol                                          // $57F9
	rol                                          // $57FA
	rol                                          // $57FB
	rol                                          // $57FC
	rol                                          // $57FD
	rol                                          // $57FE
	rol                                          // $57FF
	.byte $54                                    // $5800  ???
	adc $3c32,x                                  // $5801
	ora $47                                      // $5804
	.byte $64                                    // $5806  ???
	adc $4b3f,y                                  // $5807
	ora $47                                      // $580A
	.byte $4B                                    // $580C  ???
	eor $38                                      // $580D
	.byte $63                                    // $580F  ???
	asl $47                                      // $5810
	.byte $64                                    // $5812  ???
	adc $4b3f,y                                  // $5813
	asl $47                                      // $5816
	.byte $43                                    // $5818  ???
	.byte $0F                                    // $5819  ???
	.byte $2F                                    // $581A  ???
	.byte $6B                                    // $581B  ???
	ora $47                                      // $581C
	.byte $64                                    // $581E  ???
	adc $3e2a,y                                  // $581F
	ora $47                                      // $5822
	.byte $3F                                    // $5824  ???
	.byte $4B                                    // $5825  ???
	and $a2                                      // $5826
	.byte $04                                    // $5828  ???
	ldy $64,x                                    // $5829
	adc $4b3f,y                                  // $582B
	.byte $04                                    // $582E  ???
	ldy $38,x                                    // $582F
	.byte $63                                    // $5831  ???
	.byte $3F                                    // $5832  ???
	.byte $4B                                    // $5833  ???
	.byte $03                                    // $5834  ???
	stx $54                                      // $5835
	adc $0f43,x                                  // $5837
	.byte $03                                    // $583A  ???
	stx $3f                                      // $583B
	.byte $4B                                    // $583D  ???
	sec                                          // $583E
	.byte $63                                    // $583F  ???
	.byte $03                                    // $5840  ???
	.byte $F4                                    // $5841  ???
	.byte $54                                    // $5842  ???
	adc $3c32,x                                  // $5843
	.byte $03                                    // $5846  ???
	.byte $F4                                    // $5847  ???
	.byte $43                                    // $5848  ???
	.byte $0F                                    // $5849  ???
	sec                                          // $584A
	.byte $3C                                    // $584B  ???
	.byte $04                                    // $584C  ???
	.byte $30, $54                               // $584D  bmi $58A3
	adc $3c32,x                                  // $584F
	.byte $04                                    // $5852  ???
	.byte $30, $4B                               // $5853  bmi $58A0
	eor $3f                                      // $5855
	.byte $4B                                    // $5857  ???
	.byte $04                                    // $5858  ???
	ldy $5e,x                                    // $5859
	dec $38,x                                    // $585B
	.byte $63                                    // $585D  ???
	.byte $04                                    // $585E  ???
	.byte $FF                                    // $585F  ???
	sei                                          // $5860
	ror $77,x                                    // $5861
	brk                                          // $5863
	brk                                          // $5864
	brk                                          // $5865
	brk                                          // $5866
	brk                                          // $5867
	brk                                          // $5868
	brk                                          // $5869
	brk                                          // $586A
	brk                                          // $586B
	brk                                          // $586C
	brk                                          // $586D
	brk                                          // $586E
	brk                                          // $586F
	brk                                          // $5870
	brk                                          // $5871
	brk                                          // $5872
	.byte $5B                                    // $5873  ???
	and ($00),y                                  // $5874
	brk                                          // $5876
	brk                                          // $5877
	brk                                          // $5878
	brk                                          // $5879
	brk                                          // $587A
	brk                                          // $587B
	brk                                          // $587C
	brk                                          // $587D
	brk                                          // $587E
	brk                                          // $587F
	brk                                          // $5880
	brk                                          // $5881
	brk                                          // $5882
	brk                                          // $5883
	brk                                          // $5884
	brk                                          // $5885
	.byte $5B                                    // $5886  ???
	adc $645d,y                                  // $5887
	adc $77,x                                    // $588A
	adc $61,x                                    // $588C
	adc $31,x                                    // $588E
	adc $64,x                                    // $5890
	adc $64,x                                    // $5892
	adc $64,x                                    // $5894
	adc $60,x                                    // $5896
	.byte $0B                                    // $5898  ???
	.byte $5B                                    // $5899  ???
	ora ($0b,x)                                  // $589A
	.byte $0C                                    // $589C  ???
	.byte $0C                                    // $589D  ???
	.byte $64                                    // $589E  ???
	.byte $0C                                    // $589F  ???
	.byte $64                                    // $58A0  ???
	.byte $0C                                    // $58A1  ???
	ora ($0c,x)                                  // $58A2
	.byte $0C                                    // $58A4  ???
	.byte $0C                                    // $58A5  ???
	.byte $0C                                    // $58A6  ???
	.byte $0C                                    // $58A7  ???
	.byte $33                                    // $58A8  ???
	.byte $0C                                    // $58A9  ???
	adc $0b,x                                    // $58AA
	eor $6401,x                                  // $58AC
	eor $755e,x                                  // $58AF
	lsr $5e5d,x                                  // $58B2
	.byte $3A                                    // $58B5  ???
	lsr $5e5d,x                                  // $58B6
	eor $5d5e,x                                  // $58B9
	lsr $0b35,x                                  // $58BC
	sei                                          // $58BF
	ror $77,x                                    // $58C0
	brk                                          // $58C2
	brk                                          // $58C3
	brk                                          // $58C4
	brk                                          // $58C5
	brk                                          // $58C6
	brk                                          // $58C7
	ror $77,x                                    // $58C8
	.byte $62                                    // $58CA  ???
	.byte $62                                    // $58CB  ???
	ror $77,x                                    // $58CC
	.byte $5B                                    // $58CE  ???
	and ($00),y                                  // $58CF
	brk                                          // $58D1
	brk                                          // $58D2
	brk                                          // $58D3
	brk                                          // $58D4
	brk                                          // $58D5
	brk                                          // $58D6
	brk                                          // $58D7
	brk                                          // $58D8
	adc $76,x                                    // $58D9
	brk                                          // $58DB
	brk                                          // $58DC
	.byte $5B                                    // $58DD  ???
	adc $645d,y                                  // $58DE
	adc $77,x                                    // $58E1
	adc $64,x                                    // $58E3
	.byte $3B                                    // $58E5  ???
	eor $0c64,x                                  // $58E6
	.byte $0B                                    // $58E9  ???
	brk                                          // $58EA
	brk                                          // $58EB
	.byte $5B                                    // $58EC  ???
	ora ($0b,x)                                  // $58ED
	.byte $0C                                    // $58EF  ???
	.byte $0C                                    // $58F0  ???
	.byte $64                                    // $58F1  ???
	.byte $0C                                    // $58F2  ???
	.byte $33                                    // $58F3  ???
	and $79,x                                    // $58F4
	.byte $63                                    // $58F6  ???
	.byte $0C                                    // $58F7  ???
	.byte $0B                                    // $58F8  ???
	brk                                          // $58F9
	brk                                          // $58FA
	eor $6401,x                                  // $58FB
	eor $755e,x                                  // $58FE
	lsr $355d,x                                  // $5901
	.byte $64                                    // $5904  ???
	eor $645e,x                                  // $5905
	rol                                          // $5908
	brk                                          // $5909
	brk                                          // $590A
	brk                                          // $590B
	rol                                          // $590C
	.byte $5A                                    // $590D  ???
	.byte $3F                                    // $590E  ???
	.byte $3E, $00, $00                          // $590F  rol $0000,x
	.byte $37                                    // $5912  ???
	and $610c,y                                  // $5913
	.byte $0C                                    // $5916  ???
	adc ($0c,x)                                  // $5917
	.byte $0C                                    // $5919  ???
	.byte $0C                                    // $591A  ???
	ora ($0c,x)                                  // $591B
	.byte $7F                                    // $591D  ???
	.byte $0B                                    // $591E  ???
	eor $0c64,x                                  // $591F
	adc ($0c,x)                                  // $5922
	.byte $7F                                    // $5924  ???
	.byte $7F                                    // $5925  ???
	.byte $0C                                    // $5926  ???
	adc ($0c,x)                                  // $5927
	.byte $7F                                    // $5929  ???
	.byte $0B                                    // $592A  ???
	.byte $0C                                    // $592B  ???
	adc $610c,y                                  // $592C
	.byte $0C                                    // $592F  ???
	eor #$0c                                     // $5930
	.byte $3A                                    // $5932  ???
	.byte $0C                                    // $5933  ???
	ror $640b,x                                  // $5934
	eor $640c,x                                  // $5937
	.byte $0C                                    // $593A  ???
	and $0c,x                                    // $593B
	.byte $0C                                    // $593D  ???
	adc ($0c,x)                                  // $593E
	.byte $7E, $0B, $00                          // $5940  ror $000B,x
	brk                                          // $5943
	brk                                          // $5944
	brk                                          // $5945
	brk                                          // $5946
	brk                                          // $5947
	rol                                          // $5948
	rol                                          // $5949
	rol                                          // $594A
	rol                                          // $594B
	rol                                          // $594C
	rol                                          // $594D
	rol                                          // $594E
	rol                                          // $594F
	ora $9e0d                                    // $5950
	rol                                          // $5953
	.byte $43                                    // $5954  ???
	.byte $4F                                    // $5955  ???
	.byte $53                                    // $5956  ???
	eor $2a49                                    // $5957
	ora $500d                                    // $595A
	.byte $52                                    // $595D  ???
	eor $53                                      // $595E
	eor $4e                                      // $5960
	.byte $54                                    // $5962  ???
	.byte $53                                    // $5963  ???
	ora $0d0d                                    // $5964
	.byte $9C                                    // $5967  ???
	lsr $4f                                      // $5968
	.byte $52                                    // $596A  ???
	.byte $42                                    // $596B  ???
	eor #$44                                     // $596C
	.byte $44                                    // $596E  ???
	eor $4e                                      // $596F
	ora $460d                                    // $5971
	.byte $4F                                    // $5974  ???
	.byte $52                                    // $5975  ???
	eor $53                                      // $5976
	.byte $54                                    // $5978  ???
	ora $0d0d                                    // $5979
	.byte $9F                                    // $597C  ???
	.byte $42                                    // $597D  ???
	eor $5020,y                                  // $597E
	eor ($55,x)                                  // $5981
	jmp $4e20                                    // $5983
	.byte $4F                                    // $5986  ???
	.byte $52                                    // $5987  ???
	eor $4e41                                    // $5988
	ora $050d                                    // $598B
	.byte $50, $52                               // $598E  bvc $59E2
	eor $53                                      // $5990
	.byte $53                                    // $5992  ???
	jsr $4946                                    // $5993
	.byte $52                                    // $5996  ???
	eor $20                                      // $5997
	.byte $42                                    // $5999  ???
	eor $54,x                                    // $599A
	.byte $54                                    // $599C  ???
	.byte $4F                                    // $599D  ???
	lsr $2a0d                                    // $599E
	rol                                          // $59A1
	rol                                          // $59A2
	rol                                          // $59A3
	rol                                          // $59A4
	rol                                          // $59A5
	rol                                          // $59A6
	rol                                          // $59A7
	rol                                          // $59A8
	rol                                          // $59A9
	rol                                          // $59AA
	rol                                          // $59AB
	rol                                          // $59AC
	rol                                          // $59AD
	rol                                          // $59AE
	rol                                          // $59AF
	brk                                          // $59B0
	brk                                          // $59B1
	brk                                          // $59B2
	.byte $FF                                    // $59B3  ???
	brk                                          // $59B4
	brk                                          // $59B5
	brk                                          // $59B6
	.byte $FF                                    // $59B7  ???
	brk                                          // $59B8
	brk                                          // $59B9
	brk                                          // $59BA
	.byte $FF                                    // $59BB  ???
	brk                                          // $59BC
	brk                                          // $59BD
	.byte $FF                                    // $59BE  ???
	brk                                          // $59BF
	brk                                          // $59C0
	.byte $FF                                    // $59C1  ???
	brk                                          // $59C2
	brk                                          // $59C3
	brk                                          // $59C4
	brk                                          // $59C5
	.byte $FF                                    // $59C6  ???
	.byte $FF                                    // $59C7  ???
	.byte $FF                                    // $59C8  ???
	brk                                          // $59C9
	.byte $FF                                    // $59CA  ???
	brk                                          // $59CB
	.byte $FF                                    // $59CC  ???
	brk                                          // $59CD
	.byte $FF                                    // $59CE  ???
	.byte $FF                                    // $59CF  ???
	.byte $FF                                    // $59D0  ???
	brk                                          // $59D1
	brk                                          // $59D2
	brk                                          // $59D3
	brk                                          // $59D4
	brk                                          // $59D5
	.byte $FF                                    // $59D6  ???
	.byte $FF                                    // $59D7  ???
	brk                                          // $59D8
	.byte $FF                                    // $59D9  ???
	brk                                          // $59DA
	.byte $FF                                    // $59DB  ???
	.byte $FF                                    // $59DC  ???
	.byte $FF                                    // $59DD  ???
	brk                                          // $59DE
	.byte $FF                                    // $59DF  ???
	brk                                          // $59E0
	.byte $FF                                    // $59E1  ???
	brk                                          // $59E2
	brk                                          // $59E3
	brk                                          // $59E4
	.byte $FF                                    // $59E5  ???
	brk                                          // $59E6
	.byte $FF                                    // $59E7  ???
	brk                                          // $59E8
	.byte $FF                                    // $59E9  ???
	brk                                          // $59EA
	.byte $FF                                    // $59EB  ???
	.byte $FF                                    // $59EC  ???
	brk                                          // $59ED
	.byte $FF                                    // $59EE  ???
	brk                                          // $59EF
	.byte $FF                                    // $59F0  ???
	.byte $FF                                    // $59F1  ???
	.byte $FF                                    // $59F2  ???
	brk                                          // $59F3
	.byte $FF                                    // $59F4  ???
	brk                                          // $59F5
	.byte $FF                                    // $59F6  ???
	.byte $FF                                    // $59F7  ???
	.byte $FF                                    // $59F8  ???
	brk                                          // $59F9
	.byte $FF                                    // $59FA  ???
	brk                                          // $59FB
	.byte $FF                                    // $59FC  ???
	.byte $FF                                    // $59FD  ???
	.byte $FF                                    // $59FE  ???
	brk                                          // $59FF
	.byte $FF                                    // $5A00  ???
	.byte $FF                                    // $5A01  ???
	brk                                          // $5A02
	.byte $FF                                    // $5A03  ???
	brk                                          // $5A04
	brk                                          // $5A05
	brk                                          // $5A06
	.byte $FF                                    // $5A07  ???
	brk                                          // $5A08
	brk                                          // $5A09
	brk                                          // $5A0A
	.byte $FF                                    // $5A0B  ???
	brk                                          // $5A0C
	brk                                          // $5A0D
	brk                                          // $5A0E
	.byte $FF                                    // $5A0F  ???
	brk                                          // $5A10
	.byte $FF                                    // $5A11  ???
	.byte $FF                                    // $5A12  ???
	.byte $FF                                    // $5A13  ???
	brk                                          // $5A14
	.byte $FF                                    // $5A15  ???
	brk                                          // $5A16
	brk                                          // $5A17
	brk                                          // $5A18
	brk                                          // $5A19
	rol                                          // $5A1A
	rol                                          // $5A1B
	rol                                          // $5A1C
	rol                                          // $5A1D
	rol                                          // $5A1E
	rol                                          // $5A1F
	.byte $50, $4C                               // $5A20  bvc $5A6E
	eor $41                                      // $5A22
	.byte $53                                    // $5A24  ???
	eor $20                                      // $5A25
	.byte $52                                    // $5A27  ???
	eor $50                                      // $5A28
	.byte $4F                                    // $5A2A  ???
	.byte $52                                    // $5A2B  ???
	.byte $54                                    // $5A2C  ???
	jsr $4f59                                    // $5A2D
	eor $52,x                                    // $5A30
	ora $454c                                    // $5A32
	lsr $45,x                                    // $5A35
	jmp $4f20                                    // $5A37
	lsr $20                                      // $5A3A
	eor $58                                      // $5A3C
	.byte $50, $45                               // $5A3E  bvc $5A85
	.byte $52                                    // $5A40  ???
	eor #$45                                     // $5A41
	lsr $4543                                    // $5A43
	ora $4e41                                    // $5A46
	.byte $44                                    // $5A49  ???
	jsr $4550                                    // $5A4A
	.byte $52                                    // $5A4D  ???
	.byte $53                                    // $5A4E  ???
	.byte $4F                                    // $5A4F  ???
	lsr $4c41                                    // $5A50
	jsr $4b53                                    // $5A53
	eor #$4c                                     // $5A56
	jmp $420d                                    // $5A58
	eor $5020,y                                  // $5A5B
	.byte $52                                    // $5A5E  ???
	eor $53                                      // $5A5F
	.byte $53                                    // $5A61  ???
	eor #$4e                                     // $5A62
	.byte $47                                    // $5A64  ???
	jsr $4f44                                    // $5A65
	.byte $57                                    // $5A68  ???
	lsr $5420                                    // $5A69
	pha                                          // $5A6C
	eor $0d                                      // $5A6D
	eor ($50,x)                                  // $5A6F
	.byte $50, $52                               // $5A71  bvc $5AC5
	.byte $4F                                    // $5A73  ???
	.byte $50, $49                               // $5A74  bvc $5ABF
	eor ($54,x)                                  // $5A76
	eor $20                                      // $5A78
	.byte $4B                                    // $5A7A  ???
	eor $59                                      // $5A7B
	rol $2020                                    // $5A7D
	jsr $0d0d                                    // $5A80
	ora $9e9e                                    // $5A83
	.byte $9E                                    // $5A86  ???
	.byte $9E                                    // $5A87  ???
	jsr $2020                                    // $5A88
	jsr $2020                                    // $5A8B
	jsr $2020                                    // $5A8E
	jsr $a36f                                    // $5A91
	.byte $A3                                    // $5A94  ???
	.byte $70, $0D                               // $5A95  bvs $5AA4
	eor #$4e                                     // $5A97
	lsr $434f                                    // $5A99
	eor $4e                                      // $5A9C
	.byte $54                                    // $5A9E  ???
	jsr $a520                                    // $5A9F
	lsr $31                                      // $5AA2
	.byte $A7                                    // $5AA4  ???
	ora $2020                                    // $5AA5
	jsr $2020                                    // $5AA8
	jsr $2020                                    // $5AAB
	jsr $6c20                                    // $5AAE
	ldy $a4                                      // $5AB1
	tsx                                          // $5AB3
	ora $200d                                    // $5AB4
	jsr $2020                                    // $5AB7
	jsr $2020                                    // $5ABA
	jsr $2020                                    // $5ABD
	.byte $6F                                    // $5AC0  ???
	.byte $A3                                    // $5AC1  ???
	.byte $A3                                    // $5AC2  ???
	.byte $70, $0D                               // $5AC3  bvs $5AD2
	.byte $54                                    // $5AC5  ???
	.byte $52                                    // $5AC6  ???
	.byte $4F                                    // $5AC7  ???
	.byte $4F                                    // $5AC8  ???
	.byte $50, $45                               // $5AC9  bvc $5B10
	.byte $52                                    // $5ACB  ???
	jsr $2020                                    // $5ACC
	lda $46                                      // $5ACF
	.byte $33                                    // $5AD1  ???
	.byte $A7                                    // $5AD2  ???
	ora $2020                                    // $5AD3
	jsr $2020                                    // $5AD6
	jsr $2020                                    // $5AD9
	jsr $6c20                                    // $5ADC
	ldy $a4                                      // $5ADF
	tsx                                          // $5AE1
	ora $200d                                    // $5AE2
	jsr $2020                                    // $5AE5
	jsr $2020                                    // $5AE8
	jsr $2020                                    // $5AEB
	.byte $6F                                    // $5AEE  ???
	.byte $A3                                    // $5AEF  ???
	.byte $A3                                    // $5AF0  ???
	.byte $70, $0D                               // $5AF1  bvs $5B00
	.byte $44                                    // $5AF3  ???
	eor ($52,x)                                  // $5AF4
	eor $44                                      // $5AF6
	eor $56                                      // $5AF8
	eor #$4c                                     // $5AFA
	jsr $46a5                                    // $5AFC
	and $a7,x                                    // $5AFF
	ora $2020                                    // $5B01
	jsr $2020                                    // $5B04
	jsr $2020                                    // $5B07
	jsr $6c20                                    // $5B0A
	ldy $a4                                      // $5B0D
	tsx                                          // $5B0F
	ora $200d                                    // $5B10
	jsr $2020                                    // $5B13
	jsr $2020                                    // $5B16
	jsr $2020                                    // $5B19
	.byte $6F                                    // $5B1C  ???
	.byte $A3                                    // $5B1D  ???
	.byte $A3                                    // $5B1E  ???
	.byte $70, $0D                               // $5B1F  bvs $5B2E
	.byte $43                                    // $5B21  ???
	.byte $52                                    // $5B22  ???
	eor ($5a,x)                                  // $5B23
	eor $2020,y                                  // $5B25
	jsr $2020                                    // $5B28
	lda $46                                      // $5B2B
	.byte $37                                    // $5B2D  ???
	.byte $A7                                    // $5B2E  ???
	ora $2020                                    // $5B2F
	jsr $2020                                    // $5B32
	jsr $2020                                    // $5B35
	jsr $6c20                                    // $5B38
	ldy $a4                                      // $5B3B
	tsx                                          // $5B3D
	ora $7f05                                    // $5B3E
	.byte $04                                    // $5B41  ???
	asl $0d                                      // $5B42
	.byte $0F                                    // $5B44  ???
	ora ($13),y                                  // $5B45
	ora $6a,x                                    // $5B47
	php                                          // $5B49
	.byte $0B                                    // $5B4A  ???
	clc                                          // $5B4B
	.byte $1A                                    // $5B4C  ???
	.byte $1C                                    // $5B4D  ???
	asl $5420,x                                  // $5B4E
	.byte $0C                                    // $5B51  ???
	.byte $10, $21                               // $5B52  bpl $5B75
	bit $26                                      // $5B54
	and #$2b                                     // $5B56
	rti                                          // $5B58
	.byte $10, $15                               // $5B59  bpl $5B70
	rol                                          // $5B5B
	rol $3531                                    // $5B5C
	.byte $37                                    // $5B5F  ???
	ora $5250                                    // $5B60
	eor $53                                      // $5B63
	.byte $53                                    // $5B65  ???
	jsr $4946                                    // $5B66
	.byte $52                                    // $5B69  ???
	eor $20                                      // $5B6A
	.byte $42                                    // $5B6C  ???
	eor $54,x                                    // $5B6D
	.byte $54                                    // $5B6F  ???
	.byte $4F                                    // $5B70  ???
	lsr $2a20                                    // $5B71
	rol                                          // $5B74
	rol                                          // $5B75
	rol                                          // $5B76
	rol                                          // $5B77
	rol                                          // $5B78
	rol                                          // $5B79
	rol                                          // $5B7A
	rol                                          // $5B7B
	rol                                          // $5B7C
	rol                                          // $5B7D
	rol                                          // $5B7E
	rol                                          // $5B7F
	eor $5083,y                                  // $5B80
	.byte $83                                    // $5B83  ???
	ora $00                                      // $5B84
	cli                                          // $5B86
	.byte $83                                    // $5B87  ???
	eor ($83),y                                  // $5B88
	ora $00                                      // $5B8A
	.byte $57                                    // $5B8C  ???
	.byte $83                                    // $5B8D  ???
	.byte $52                                    // $5B8E  ???
	.byte $83                                    // $5B8F  ???
	ora $00                                      // $5B90
	lsr $83,x                                    // $5B92
	.byte $53                                    // $5B94  ???
	.byte $83                                    // $5B95  ???
	ora $00                                      // $5B96
	eor $83,x                                    // $5B98
	.byte $54                                    // $5B9A  ???
	.byte $83                                    // $5B9B  ???
	ora $00                                      // $5B9C
	.byte $54                                    // $5B9E  ???
	.byte $83                                    // $5B9F  ???
	eor $83,x                                    // $5BA0
	ora $00                                      // $5BA2
	.byte $53                                    // $5BA4  ???
	.byte $83                                    // $5BA5  ???
	lsr $83,x                                    // $5BA6
	ora $00                                      // $5BA8
	.byte $52                                    // $5BAA  ???
	.byte $83                                    // $5BAB  ???
	.byte $57                                    // $5BAC  ???
	.byte $83                                    // $5BAD  ???
	ora $00                                      // $5BAE
	eor ($83),y                                  // $5BB0
	cli                                          // $5BB2
	.byte $83                                    // $5BB3  ???
	ora $00                                      // $5BB4
	.byte $50, $83                               // $5BB6  bvc $5B3B
	eor $0583,y                                  // $5BB8
	.byte $FF                                    // $5BBB  ???
	.byte $FF                                    // $5BBC  ???
	.byte $FF                                    // $5BBD  ???
	.byte $FF                                    // $5BBE  ???
	.byte $FF                                    // $5BBF  ???
	asl                                          // $5BC0
	.byte $8F                                    // $5BC1  ???
	php                                          // $5BC2
	adc ($05,x)                                  // $5BC3
	.byte $47                                    // $5BC5  ???
	asl                                          // $5BC6
	.byte $8F                                    // $5BC7  ???
	php                                          // $5BC8
	adc ($05,x)                                  // $5BC9
	.byte $47                                    // $5BCB  ???
	asl                                          // $5BCC
	.byte $8F                                    // $5BCD  ???
	php                                          // $5BCE
	adc ($05,x)                                  // $5BCF
	.byte $47                                    // $5BD1  ???
	asl                                          // $5BD2
	.byte $8F                                    // $5BD3  ???
	.byte $07                                    // $5BD4  ???
	sbc #$05                                     // $5BD5
	.byte $47                                    // $5BD7  ???
	brk                                          // $5BD8
	brk                                          // $5BD9
	brk                                          // $5BDA
	brk                                          // $5BDB
	ora $47                                      // $5BDC
	brk                                          // $5BDE
	brk                                          // $5BDF
	ora $47                                      // $5BE0
	brk                                          // $5BE2
	brk                                          // $5BE3
	ora $47                                      // $5BE4
	brk                                          // $5BE6
	brk                                          // $5BE7
	brk                                          // $5BE8
	brk                                          // $5BE9
	brk                                          // $5BEA
	brk                                          // $5BEB
	brk                                          // $5BEC
	brk                                          // $5BED
	ora $47                                      // $5BEE
	brk                                          // $5BF0
	brk                                          // $5BF1
	ora $47                                      // $5BF2
	brk                                          // $5BF4
	brk                                          // $5BF5
	ora $47                                      // $5BF6
	brk                                          // $5BF8
	brk                                          // $5BF9
	brk                                          // $5BFA
	brk                                          // $5BFB
	brk                                          // $5BFC
	brk                                          // $5BFD
	brk                                          // $5BFE
	brk                                          // $5BFF
	ora $47                                      // $5C00
	brk                                          // $5C02
	brk                                          // $5C03
	ora $47                                      // $5C04
	brk                                          // $5C06
	brk                                          // $5C07
	ora $47                                      // $5C08
	brk                                          // $5C0A
	brk                                          // $5C0B
	brk                                          // $5C0C
	brk                                          // $5C0D
	brk                                          // $5C0E
	brk                                          // $5C0F
	brk                                          // $5C10
	brk                                          // $5C11
	ora $47                                      // $5C12
	brk                                          // $5C14
	brk                                          // $5C15
	ora $47                                      // $5C16
	brk                                          // $5C18
	brk                                          // $5C19
	ora $47                                      // $5C1A
	brk                                          // $5C1C
	brk                                          // $5C1D
	brk                                          // $5C1E
	.byte $FF                                    // $5C1F  ???
	rol                                          // $5C20
	rol                                          // $5C21
	rol                                          // $5C22
	rol                                          // $5C23
	rol                                          // $5C24
	rol                                          // $5C25
	rol                                          // $5C26
	rol                                          // $5C27
	rol                                          // $5C28
	rol                                          // $5C29
	rol                                          // $5C2A
	rol                                          // $5C2B
	rol                                          // $5C2C
	rol                                          // $5C2D
	rol                                          // $5C2E
	rol                                          // $5C2F
	brk                                          // $5C30
	brk                                          // $5C31
	.byte $04                                    // $5C32  ???
	.byte $30, $00                               // $5C33  bmi $5C35
	brk                                          // $5C35
	brk                                          // $5C36
	brk                                          // $5C37
	brk                                          // $5C38
	brk                                          // $5C39
	brk                                          // $5C3A
	brk                                          // $5C3B
	.byte $FF                                    // $5C3C  ???
	.byte $FF                                    // $5C3D  ???
	.byte $FF                                    // $5C3E  ???
	.byte $FF                                    // $5C3F  ???
	asl                                          // $5C40
	iny                                          // $5C41
	brk                                          // $5C42
	brk                                          // $5C43
	.byte $04                                    // $5C44  ???
	.byte $67                                    // $5C45  ???
	asl                                          // $5C46
	and ($00,x)                                  // $5C47
	brk                                          // $5C49
	.byte $04                                    // $5C4A  ???
	.byte $67                                    // $5C4B  ???
	php                                          // $5C4C
	lsr $00,x                                    // $5C4D
	brk                                          // $5C4F
	.byte $03                                    // $5C50  ???
	.byte $32                                    // $5C51  ???
	php                                          // $5C52
	.byte $13                                    // $5C53  ???
	brk                                          // $5C54
	brk                                          // $5C55
	.byte $03                                    // $5C56  ???
	and ($06),y                                  // $5C57
	cpy #$00                                     // $5C59
	brk                                          // $5C5B
	.byte $03                                    // $5C5C  ???
	inc $3006                                    // $5C5D
	brk                                          // $5C60
	brk                                          // $5C61
	.byte $03                                    // $5C62  ???
	cmp $bc05,x                                  // $5C63
	brk                                          // $5C66
	brk                                          // $5C67
	.byte $03                                    // $5C68  ???
	dey                                          // $5C69
	ora $67                                      // $5C6A
	brk                                          // $5C6C
	brk                                          // $5C6D
	.byte $03                                    // $5C6E  ???
	.byte $17                                    // $5C6F  ???
	brk                                          // $5C70
	brk                                          // $5C71
	brk                                          // $5C72
	brk                                          // $5C73
	.byte $03                                    // $5C74  ???
	eor $00                                      // $5C75
	brk                                          // $5C77
	brk                                          // $5C78
	brk                                          // $5C79
	.byte $03                                    // $5C7A  ???
	and ($00,x)                                  // $5C7B
	brk                                          // $5C7D
	brk                                          // $5C7E
	brk                                          // $5C7F
	.byte $02                                    // $5C80  ???
	.byte $ED, $00, $00                          // $5C81  sbc $0000
	brk                                          // $5C84
	brk                                          // $5C85
	.byte $02                                    // $5C86  ???
	.byte $9F                                    // $5C87  ???
	brk                                          // $5C88
	brk                                          // $5C89
	brk                                          // $5C8A
	brk                                          // $5C8B
	.byte $02                                    // $5C8C  ???
	lsr $00,x                                    // $5C8D
	brk                                          // $5C8F
	brk                                          // $5C90
	brk                                          // $5C91
	.byte $02                                    // $5C92  ???
	and ($00,x)                                  // $5C93
	brk                                          // $5C95
	brk                                          // $5C96
	.byte $FF                                    // $5C97  ???
	rol                                          // $5C98
	rol                                          // $5C99
	rol                                          // $5C9A
	rol                                          // $5C9B
	rol                                          // $5C9C
	rol                                          // $5C9D
	rol                                          // $5C9E
	rol                                          // $5C9F
	lsr $4fd6,x                                  // $5CA0
	ldy $43,x                                    // $5CA3
	.byte $0F                                    // $5CA5  ???
	lsr $4fd6,x                                  // $5CA6
	ldy $43,x                                    // $5CA9
	.byte $0F                                    // $5CAB  ???
	lsr $4fd6,x                                  // $5CAC
	ldy $43,x                                    // $5CAF
	.byte $0F                                    // $5CB1  ???
	lsr $4fd6,x                                  // $5CB2
	ldy $43,x                                    // $5CB5
	.byte $0F                                    // $5CB7  ???
	.byte $07                                    // $5CB8  ???
	.byte $0C                                    // $5CB9  ???
	.byte $03                                    // $5CBA  ???
	stx $03                                      // $5CBB
	stx $07                                      // $5CBD
	.byte $0C                                    // $5CBF  ???
	.byte $03                                    // $5CC0  ???
	stx $03                                      // $5CC1
	stx $07                                      // $5CC3
	.byte $0C                                    // $5CC5  ???
	.byte $03                                    // $5CC6  ???
	stx $03                                      // $5CC7
	stx $07                                      // $5CC9
	.byte $0C                                    // $5CCB  ???
	.byte $03                                    // $5CCC  ???
	stx $03                                      // $5CCD
	stx $07                                      // $5CCF
	.byte $0C                                    // $5CD1  ???
	.byte $03                                    // $5CD2  ???
	stx $03                                      // $5CD3
	stx $07                                      // $5CD5
	.byte $0C                                    // $5CD7  ???
	.byte $03                                    // $5CD8  ???
	stx $03                                      // $5CD9
	stx $07                                      // $5CDB
	.byte $0C                                    // $5CDD  ???
	.byte $03                                    // $5CDE  ???
	stx $03                                      // $5CDF
	stx $07                                      // $5CE1
	.byte $0C                                    // $5CE3  ???
	.byte $03                                    // $5CE4  ???
	stx $03                                      // $5CE5
	.byte $FF                                    // $5CE7  ???
	rol                                          // $5CE8
	rol                                          // $5CE9
	rol                                          // $5CEA
	rol                                          // $5CEB
	rol                                          // $5CEC
	rol                                          // $5CED
	rol                                          // $5CEE
	rol                                          // $5CEF
	eor $4b45,y                                  // $5CF0
	jsr $4f50                                    // $5CF3
	.byte $54                                    // $5CF6  ???
	.byte $53                                    // $5CF7  ???
	.byte $2F                                    // $5CF8  ???
	lsr $5255                                    // $5CF9
	jsr $5353                                    // $5CFC
	eor $52                                      // $5CFF
	.byte $50, $20                               // $5D01  bvc $5D23
	jsr $5254                                    // $5D03
	eor ($54,x)                                  // $5D06
	.byte $53                                    // $5D08  ???
	eor $52                                      // $5D09
	jsr $544f                                    // $5D0B
	ora $200d                                    // $5D0E
	jsr $4f4e                                    // $5D11
	.byte $54                                    // $5D14  ???
	.byte $54                                    // $5D15  ???
	eor $42,x                                    // $5D16
	jsr $5245                                    // $5D18
	eor #$46                                     // $5D1B
	jsr $5353                                    // $5D1D
	eor $52                                      // $5D20
	.byte $50, $20                               // $5D22  bvc $5D44
	jsr $5545                                    // $5D24
	lsr $5449                                    // $5D27
	lsr $434f                                    // $5D2A
	jsr $544f                                    // $5D2D
	brk                                          // $5D30
	brk                                          // $5D31
	brk                                          // $5D32
	brk                                          // $5D33
	brk                                          // $5D34
	brk                                          // $5D35
	brk                                          // $5D36
	brk                                          // $5D37
	brk                                          // $5D38
	brk                                          // $5D39
	brk                                          // $5D3A
	brk                                          // $5D3B
	brk                                          // $5D3C
	brk                                          // $5D3D
	brk                                          // $5D3E
	brk                                          // $5D3F
	.byte $50, $57                               // $5D40  bvc $5D99
	.byte $0F                                    // $5D42  ???
	brk                                          // $5D43
	.byte $50, $57                               // $5D44  bvc $5D9D
	.byte $0F                                    // $5D46  ???
	ora ($b2,x)                                  // $5D47
	ora #$b2                                     // $5D49
	ora #$08                                     // $5D4B
	asl $f0f1                                    // $5D4D
	.byte $F0, $50                               // $5D50  beq $5DA2
	.byte $53                                    // $5D52  ???
	php                                          // $5D53
	brk                                          // $5D54
	.byte $50, $53                               // $5D55  bvc $5DAA
	php                                          // $5D57
	.byte $03                                    // $5D58  ???
	ldy $bd07,x                                  // $5D59
	php                                          // $5D5C
	php                                          // $5D5D
	php                                          // $5D5E
	.byte $F7                                    // $5D5F  ???
	ora ($01,x)                                  // $5D60
	rti                                          // $5D62
	eor $0a,x                                    // $5D63
	brk                                          // $5D65
	rti                                          // $5D66
	eor $0a,x                                    // $5D67
	.byte $02                                    // $5D69  ???
	lda $07,x                                    // $5D6A
	ldx $07,y                                    // $5D6C
	.byte $04                                    // $5D6E  ???
	asl $f9                                      // $5D6F
	ora ($01,x)                                  // $5D71
	brk                                          // $5D73
	.byte $5E, $0A, $00                          // $5D74  lsr $000A,x
	brk                                          // $5D77
	lsr $020a,x                                  // $5D78
	stx $05,y                                    // $5D7B
	stx $05,y                                    // $5D7D
	php                                          // $5D7F
	php                                          // $5D80
	.byte $F7                                    // $5D81  ???
	.byte $02                                    // $5D82  ???
	.byte $02                                    // $5D83  ???
	cpy #$5d                                     // $5D84
	asl                                          // $5D86
	brk                                          // $5D87
	cpy #$5d                                     // $5D88
	asl                                          // $5D8A
	ora ($92,x)                                  // $5D8B
	ora $0d92                                    // $5D8D
	php                                          // $5D90
	brk                                          // $5D91
	brk                                          // $5D92
	.byte $FF                                    // $5D93  ???
	.byte $FF                                    // $5D94  ???
	brk                                          // $5D95
	brk                                          // $5D96
	brk                                          // $5D97
	rol                                          // $5D98
	rol                                          // $5D99
	rol                                          // $5D9A
	rol                                          // $5D9B
	rol                                          // $5D9C
	rol                                          // $5D9D
	rol                                          // $5D9E
	rol                                          // $5D9F
	sty $94,x                                    // $5DA0
	stx $96,y                                    // $5DA2
	.byte $AF                                    // $5DA4  ???
	.byte $AF                                    // $5DA5  ???
	.byte $AF                                    // $5DA6  ???
	stx $96,y                                    // $5DA7
	sty $95,x                                    // $5DA9
	sta $97,x                                    // $5DAB
	.byte $93                                    // $5DAD  ???
	.byte $B0, $B0                               // $5DAE  bcs $5D60
	.byte $B0, $93                               // $5DB0  bcs $5D45
	.byte $97                                    // $5DB2  ???
	sta $82,x                                    // $5DB3
	stx $a69a                                    // $5DB5
	.byte $B2                                    // $5DB8  ???
	ldx $a6b2,y                                  // $5DB9
	txs                                          // $5DBC
	.byte $8E, $00, $00                          // $5DBD  stx $0000
	.byte $07                                    // $5DC0  ???
	sbc #$05                                     // $5DC1
	.byte $47                                    // $5DC3  ???
	brk                                          // $5DC4
	brk                                          // $5DC5
	.byte $07                                    // $5DC6  ???
	.byte $0C                                    // $5DC7  ???
	.byte $04                                    // $5DC8  ???
	ldy $00,x                                    // $5DC9
	brk                                          // $5DCB
	.byte $07                                    // $5DCC  ???
	sbc #$05                                     // $5DCD
	.byte $47                                    // $5DCF  ???
	rts                                          // $5DD0
	rts                                          // $5DD1
	php                                          // $5DD2
	adc ($05,x)                                  // $5DD3
	tya                                          // $5DD5
	rts                                          // $5DD6
	rts                                          // $5DD7
	.byte $07                                    // $5DD8  ???
	sbc #$06                                     // $5DD9
	.byte $A7                                    // $5DDB  ???
	brk                                          // $5DDC
	brk                                          // $5DDD
	php                                          // $5DDE
	adc ($07,x)                                  // $5DDF
	.byte $0C                                    // $5DE1  ???
	brk                                          // $5DE2
	brk                                          // $5DE3
	ora #$6a                                     // $5DE4
	asl $a7                                      // $5DE6
	brk                                          // $5DE8
	brk                                          // $5DE9
	php                                          // $5DEA
	adc ($05,x)                                  // $5DEB
	tya                                          // $5DED
	brk                                          // $5DEE
	.byte $FF                                    // $5DEF  ???
	and ($87,x)                                  // $5DF0
	ora $1f,x                                    // $5DF2
	.byte $07                                    // $5DF4  ???
	.byte $0C                                    // $5DF5  ???
	and ($87,x)                                  // $5DF6
	ora $1f,x                                    // $5DF8
	.byte $07                                    // $5DFA  ???
	.byte $0C                                    // $5DFB  ???
	and ($87,x)                                  // $5DFC
	ora $1f,x                                    // $5DFE
	ora $47                                      // $5E00
	and ($87,x)                                  // $5E02
	ora $1f,x                                    // $5E04
	ora $ff                                      // $5E06
	.byte $F0, $5D                               // $5E08  beq $5E67
	php                                          // $5E0A
	brk                                          // $5E0B
	.byte $F0, $5D                               // $5E0C  beq $5E6B
	php                                          // $5E0E
	brk                                          // $5E0F
	.byte $07                                    // $5E10  ???
	.byte $0C                                    // $5E11  ???
	.byte $03                                    // $5E12  ???
	stx $80                                      // $5E13
	.byte $80                                    // $5E15  ???
	asl $a7                                      // $5E16
	.byte $03                                    // $5E18  ???
	.byte $F4                                    // $5E19  ???
	.byte $80                                    // $5E1A  ???
	.byte $80                                    // $5E1B  ???
	asl $47                                      // $5E1C
	.byte $04                                    // $5E1E  ???
	.byte $30, $80                               // $5E1F  bmi $5DA1
	.byte $80                                    // $5E21  ???
	ora $ed                                      // $5E22
	.byte $04                                    // $5E24  ???
	ldy $80,x                                    // $5E25
	.byte $FF                                    // $5E27  ???
	.byte $80                                    // $5E28  ???
	.byte $5B                                    // $5E29  ???
	asl                                          // $5E2A
	brk                                          // $5E2B
	.byte $80                                    // $5E2C  ???
	.byte $5B                                    // $5E2D  ???
	asl                                          // $5E2E
	brk                                          // $5E2F
	.byte $10, $5E                               // $5E30  bpl $5E90
	.byte $0C                                    // $5E32  ???
	brk                                          // $5E33
	.byte $10, $5E                               // $5E34  bpl $5E94
	.byte $0C                                    // $5E36  ???
	brk                                          // $5E37
	cpy #$53                                     // $5E38
	ora #$00                                     // $5E3A
	cpx #$54                                     // $5E3C
	ora #$00                                     // $5E3E
	.byte $90, $55                               // $5E40  bcc $5E97
	asl                                          // $5E42
	brk                                          // $5E43
	.byte $90, $55                               // $5E44  bcc $5E9B
	asl                                          // $5E46
	brk                                          // $5E47
	cpx #$50                                     // $5E48
	asl                                          // $5E4A
	brk                                          // $5E4B
	cpx #$50                                     // $5E4C
	asl                                          // $5E4E
	brk                                          // $5E4F
	brk                                          // $5E50
	brk                                          // $5E51
	brk                                          // $5E52
	brk                                          // $5E53
	brk                                          // $5E54
	brk                                          // $5E55
	brk                                          // $5E56
	brk                                          // $5E57
	brk                                          // $5E58
	brk                                          // $5E59
	brk                                          // $5E5A
	brk                                          // $5E5B
	brk                                          // $5E5C
	brk                                          // $5E5D
	brk                                          // $5E5E
	brk                                          // $5E5F
	brk                                          // $5E60
	brk                                          // $5E61
	brk                                          // $5E62
	brk                                          // $5E63
	brk                                          // $5E64
	brk                                          // $5E65
	brk                                          // $5E66
	brk                                          // $5E67
	brk                                          // $5E68
	brk                                          // $5E69
	brk                                          // $5E6A
	brk                                          // $5E6B
	brk                                          // $5E6C
	brk                                          // $5E6D
	brk                                          // $5E6E
	brk                                          // $5E6F
	brk                                          // $5E70
	brk                                          // $5E71
	brk                                          // $5E72
	brk                                          // $5E73
	brk                                          // $5E74
	brk                                          // $5E75
	brk                                          // $5E76
	brk                                          // $5E77
	brk                                          // $5E78
	brk                                          // $5E79
	brk                                          // $5E7A
	brk                                          // $5E7B
	brk                                          // $5E7C
	brk                                          // $5E7D
	brk                                          // $5E7E
	brk                                          // $5E7F
	brk                                          // $5E80
	brk                                          // $5E81
	brk                                          // $5E82
	brk                                          // $5E83
	brk                                          // $5E84
	brk                                          // $5E85
	brk                                          // $5E86
	brk                                          // $5E87
	brk                                          // $5E88
	brk                                          // $5E89
	brk                                          // $5E8A
	brk                                          // $5E8B
	brk                                          // $5E8C
	brk                                          // $5E8D
	brk                                          // $5E8E
	brk                                          // $5E8F
	brk                                          // $5E90
	brk                                          // $5E91
	brk                                          // $5E92
	brk                                          // $5E93
	brk                                          // $5E94
	brk                                          // $5E95
	brk                                          // $5E96
	brk                                          // $5E97
	brk                                          // $5E98
	brk                                          // $5E99
	brk                                          // $5E9A
	brk                                          // $5E9B
	brk                                          // $5E9C
	brk                                          // $5E9D
	brk                                          // $5E9E
	brk                                          // $5E9F
	brk                                          // $5EA0
	brk                                          // $5EA1
	brk                                          // $5EA2
	brk                                          // $5EA3
	brk                                          // $5EA4
	brk                                          // $5EA5
	brk                                          // $5EA6
	brk                                          // $5EA7
	brk                                          // $5EA8
	brk                                          // $5EA9
	brk                                          // $5EAA
	brk                                          // $5EAB
	brk                                          // $5EAC
	brk                                          // $5EAD
	brk                                          // $5EAE
	brk                                          // $5EAF
	brk                                          // $5EB0
	brk                                          // $5EB1
	brk                                          // $5EB2
	brk                                          // $5EB3
	brk                                          // $5EB4
	brk                                          // $5EB5
	brk                                          // $5EB6
	brk                                          // $5EB7
	brk                                          // $5EB8
	brk                                          // $5EB9
	brk                                          // $5EBA
	brk                                          // $5EBB
	brk                                          // $5EBC
	brk                                          // $5EBD
	brk                                          // $5EBE
	brk                                          // $5EBF
	brk                                          // $5EC0
	brk                                          // $5EC1
	brk                                          // $5EC2
	brk                                          // $5EC3
	brk                                          // $5EC4
	brk                                          // $5EC5
	brk                                          // $5EC6
	brk                                          // $5EC7
	brk                                          // $5EC8
	brk                                          // $5EC9
	brk                                          // $5ECA
	brk                                          // $5ECB
	brk                                          // $5ECC
	brk                                          // $5ECD
	brk                                          // $5ECE
	brk                                          // $5ECF
	brk                                          // $5ED0
	brk                                          // $5ED1
	brk                                          // $5ED2
	brk                                          // $5ED3
	brk                                          // $5ED4
	brk                                          // $5ED5
	brk                                          // $5ED6
	brk                                          // $5ED7
	brk                                          // $5ED8
	brk                                          // $5ED9
	brk                                          // $5EDA
	brk                                          // $5EDB
	brk                                          // $5EDC
	brk                                          // $5EDD
	brk                                          // $5EDE
	brk                                          // $5EDF
	brk                                          // $5EE0
	brk                                          // $5EE1
	brk                                          // $5EE2
	brk                                          // $5EE3
	brk                                          // $5EE4
	brk                                          // $5EE5
	brk                                          // $5EE6
	brk                                          // $5EE7
	brk                                          // $5EE8
	brk                                          // $5EE9
	brk                                          // $5EEA
	brk                                          // $5EEB
	brk                                          // $5EEC
	brk                                          // $5EED
	brk                                          // $5EEE
	brk                                          // $5EEF
	brk                                          // $5EF0
	brk                                          // $5EF1
	brk                                          // $5EF2
	brk                                          // $5EF3
	brk                                          // $5EF4
	brk                                          // $5EF5
	brk                                          // $5EF6
	brk                                          // $5EF7
	brk                                          // $5EF8
	brk                                          // $5EF9
	brk                                          // $5EFA
	brk                                          // $5EFB
	brk                                          // $5EFC
	brk                                          // $5EFD
	brk                                          // $5EFE
	brk                                          // $5EFF
	brk                                          // $5F00
	brk                                          // $5F01
	brk                                          // $5F02
	brk                                          // $5F03
	brk                                          // $5F04
	brk                                          // $5F05
	brk                                          // $5F06
	brk                                          // $5F07
	brk                                          // $5F08
	brk                                          // $5F09
	brk                                          // $5F0A
	brk                                          // $5F0B
	brk                                          // $5F0C
	brk                                          // $5F0D
	brk                                          // $5F0E
	brk                                          // $5F0F
	brk                                          // $5F10
	brk                                          // $5F11
	brk                                          // $5F12
	brk                                          // $5F13
	brk                                          // $5F14
	brk                                          // $5F15
	brk                                          // $5F16
	brk                                          // $5F17
	brk                                          // $5F18
	brk                                          // $5F19
	brk                                          // $5F1A
	brk                                          // $5F1B
	brk                                          // $5F1C
	brk                                          // $5F1D
	brk                                          // $5F1E
	brk                                          // $5F1F
	brk                                          // $5F20
	brk                                          // $5F21
	brk                                          // $5F22
	brk                                          // $5F23
	brk                                          // $5F24
	brk                                          // $5F25
	brk                                          // $5F26
	brk                                          // $5F27
	brk                                          // $5F28
	brk                                          // $5F29
	brk                                          // $5F2A
	brk                                          // $5F2B
	brk                                          // $5F2C
	brk                                          // $5F2D
	brk                                          // $5F2E
	brk                                          // $5F2F
	brk                                          // $5F30
	brk                                          // $5F31
	brk                                          // $5F32
	brk                                          // $5F33
	brk                                          // $5F34
	brk                                          // $5F35
	brk                                          // $5F36
	brk                                          // $5F37
	brk                                          // $5F38
	brk                                          // $5F39
	brk                                          // $5F3A
	brk                                          // $5F3B
	brk                                          // $5F3C
	brk                                          // $5F3D
	brk                                          // $5F3E
	brk                                          // $5F3F
	brk                                          // $5F40
	brk                                          // $5F41
	brk                                          // $5F42
	brk                                          // $5F43
	brk                                          // $5F44
	brk                                          // $5F45
	brk                                          // $5F46
	brk                                          // $5F47
	brk                                          // $5F48
	brk                                          // $5F49
	brk                                          // $5F4A
	brk                                          // $5F4B
	brk                                          // $5F4C
	brk                                          // $5F4D
	brk                                          // $5F4E
	brk                                          // $5F4F
	brk                                          // $5F50
	brk                                          // $5F51
	brk                                          // $5F52
	brk                                          // $5F53
	brk                                          // $5F54
	brk                                          // $5F55
	brk                                          // $5F56
	brk                                          // $5F57
	brk                                          // $5F58
	brk                                          // $5F59
	brk                                          // $5F5A
	brk                                          // $5F5B
	brk                                          // $5F5C
	brk                                          // $5F5D
	brk                                          // $5F5E
	brk                                          // $5F5F
	brk                                          // $5F60
	brk                                          // $5F61
	brk                                          // $5F62
	brk                                          // $5F63
	brk                                          // $5F64
	brk                                          // $5F65
	brk                                          // $5F66
	brk                                          // $5F67
	brk                                          // $5F68
	brk                                          // $5F69
	brk                                          // $5F6A
	brk                                          // $5F6B
	brk                                          // $5F6C
	brk                                          // $5F6D
	brk                                          // $5F6E
	brk                                          // $5F6F
	brk                                          // $5F70
	brk                                          // $5F71
	brk                                          // $5F72
	brk                                          // $5F73
	brk                                          // $5F74
	brk                                          // $5F75
	brk                                          // $5F76
	brk                                          // $5F77
	brk                                          // $5F78
	brk                                          // $5F79
	brk                                          // $5F7A
	brk                                          // $5F7B
	brk                                          // $5F7C
	brk                                          // $5F7D
	brk                                          // $5F7E
	brk                                          // $5F7F
	brk                                          // $5F80
	brk                                          // $5F81
	brk                                          // $5F82
	brk                                          // $5F83
	brk                                          // $5F84
	brk                                          // $5F85
	brk                                          // $5F86
	brk                                          // $5F87
	brk                                          // $5F88
	brk                                          // $5F89
	brk                                          // $5F8A
	brk                                          // $5F8B
	brk                                          // $5F8C
	brk                                          // $5F8D
	brk                                          // $5F8E
	brk                                          // $5F8F
	brk                                          // $5F90
	brk                                          // $5F91
	brk                                          // $5F92
	brk                                          // $5F93
	brk                                          // $5F94
	brk                                          // $5F95
	brk                                          // $5F96
	brk                                          // $5F97
	brk                                          // $5F98
	brk                                          // $5F99
	brk                                          // $5F9A
	brk                                          // $5F9B
	brk                                          // $5F9C
	brk                                          // $5F9D
	brk                                          // $5F9E
	brk                                          // $5F9F
	brk                                          // $5FA0
	brk                                          // $5FA1
	brk                                          // $5FA2
	brk                                          // $5FA3
	brk                                          // $5FA4
	brk                                          // $5FA5
	brk                                          // $5FA6
	brk                                          // $5FA7
	brk                                          // $5FA8
	brk                                          // $5FA9
	brk                                          // $5FAA
	brk                                          // $5FAB
	brk                                          // $5FAC
	brk                                          // $5FAD
	brk                                          // $5FAE
	brk                                          // $5FAF
	.byte $F0, $F0                               // $5FB0  beq $5FA2
	.byte $F0, $F6                               // $5FB2  beq $5FAA
	.byte $F0, $F7                               // $5FB4  beq $5FAD
	.byte $FB                                    // $5FB6  ???
	.byte $F2                                    // $5FB7  ???
	.byte $F2                                    // $5FB8  ???
	.byte $F2                                    // $5FB9  ???
	.byte $F2                                    // $5FBA  ???
	.byte $F2                                    // $5FBB  ???
	.byte $F2                                    // $5FBC  ???
	.byte $F2                                    // $5FBD  ???
	.byte $F2                                    // $5FBE  ???
	brk                                          // $5FBF
	brk                                          // $5FC0
	ora ($02,x)                                  // $5FC1
	.byte $03                                    // $5FC3  ???
	.byte $04                                    // $5FC4  ???
	ora $06                                      // $5FC5
	.byte $07                                    // $5FC7  ???
	php                                          // $5FC8
	ora #$10                                     // $5FC9
	ora ($12),y                                  // $5FCB
	.byte $13                                    // $5FCD  ???
	.byte $14                                    // $5FCE  ???
	ora $16,x                                    // $5FCF
	.byte $17                                    // $5FD1  ???
	clc                                          // $5FD2
	ora $2120,y                                  // $5FD3
	.byte $22                                    // $5FD6  ???
	.byte $23                                    // $5FD7  ???
	bit $25                                      // $5FD8
	rol $27                                      // $5FDA
	plp                                          // $5FDC
	and #$30                                     // $5FDD
	and ($32),y                                  // $5FDF
	.byte $33                                    // $5FE1  ???
	.byte $34                                    // $5FE2  ???
	and $36,x                                    // $5FE3
	.byte $37                                    // $5FE5  ???
	sec                                          // $5FE6
	and $4140,y                                  // $5FE7
	.byte $42                                    // $5FEA  ???
	.byte $43                                    // $5FEB  ???
	.byte $44                                    // $5FEC  ???
	eor $46                                      // $5FED
	.byte $47                                    // $5FEF  ???
	pha                                          // $5FF0
	eor #$50                                     // $5FF1
	brk                                          // $5FF3
	brk                                          // $5FF4
	brk                                          // $5FF5
	brk                                          // $5FF6
	brk                                          // $5FF7
	brk                                          // $5FF8
	brk                                          // $5FF9
	brk                                          // $5FFA
	brk                                          // $5FFB
	brk                                          // $5FFC
	brk                                          // $5FFD
	brk                                          // $5FFE
	brk                                          // $5FFF
	ldx #$5f                                     // $6000
	lda $3f00,x                                  // $6002
	sta $00,x                                    // $6005
	dex                                          // $6007
	.byte $10, $F8                               // $6008  bpl $6002
	ldx #$07                                     // $600A
	lda $3f80,x                                  // $600C
	sta $d008,x                                  // $600F
	dex                                          // $6012
	.byte $10, $F7                               // $6013  bpl $600C
	ldx #$0e                                     // $6015
	lda $3f88,x                                  // $6017
	sta $d020,x                                  // $601A  ; VIC_BORDER
	dex                                          // $601D
	.byte $10, $F7                               // $601E  bpl $6017
	lda #$a8                                     // $6020
	sta $07ff                                    // $6022
	lda #$a9                                     // $6025
	sta $07fe                                    // $6027
	lda #$ab                                     // $602A
	sta $07fd                                    // $602C
	lda #$ad                                     // $602F
	sta $07fc                                    // $6031
	lda $d016                                    // $6034  ; VIC_CR2
	ora #$10                                     // $6037
	sta $d016                                    // $6039  ; VIC_CR2
	lda $d018                                    // $603C  ; VIC_MEMCFG
	and #$f0                                     // $603F
	ora #$0e                                     // $6041
	sta $d018                                    // $6043  ; VIC_MEMCFG
	lda #$f0                                     // $6046
	sta $d015                                    // $6048  ; VIC_SPEN
	sta $d01b                                    // $604B  ; VIC_SPPRI
	lda #$70                                     // $604E
	sta $d017                                    // $6050  ; VIC_SPYEXP
	sta $d01d                                    // $6053  ; VIC_SPXEXP
	sta $d01c                                    // $6056  ; VIC_SPMCOL
	ldx #$4f                                     // $6059
	lda $5000,x                                  // $605B
	sta $0798,x                                  // $605E
	cmp #$10                                     // $6061
	.byte $F0, $0C                               // $6063  beq $6071
	cmp #$08                                     // $6065
	.byte $F0, $10                               // $6067  beq $6079
	lda #$09                                     // $6069
	sta $db98,x                                  // $606B
	jmp $607e                                    // $606E
	lda #$09                                     // $6071
	sta $db98,x                                  // $6073
	jmp $607e                                    // $6076
	lda #$0a                                     // $6079
	sta $db98,x                                  // $607B
	dex                                          // $607E
	.byte $10, $DA                               // $607F  bpl $605B
	lda #$00                                     // $6081
	sta $d010                                    // $6083  ; VIC_SPXMSB
	nop                                          // $6086
	nop                                          // $6087
	jmp $72fa                                    // $6088
	nop                                          // $608B
	nop                                          // $608C
	nop                                          // $608D
	nop                                          // $608E
	nop                                          // $608F
	ldx #$17                                     // $6090
	ldy #$27                                     // $6092
	lda ($02),y                                  // $6094
	cmp #$7b                                     // $6096
	.byte $D0, $06                               // $6098  bne $60A0
	lda ($06),y                                  // $609A
	cmp #$20                                     // $609C
	.byte $F0, $1F                               // $609E  beq $60BF
	lda $49                                      // $60A0
	.byte $D0, $04                               // $60A2  bne $60A8
	lda ($06),y                                  // $60A4
	.byte $30, $0B                               // $60A6  bmi $60B3
	lda ($06),y                                  // $60A8
	sta ($02),y                                  // $60AA
	lda #$08                                     // $60AC
	sta ($04),y                                  // $60AE
	jmp $60bf                                    // $60B0
	and #$0f                                     // $60B3
	sta ($02),y                                  // $60B5
	lda ($06),y                                  // $60B7
	lsr                                          // $60B9
	lsr                                          // $60BA
	lsr                                          // $60BB
	lsr                                          // $60BC
	sta ($04),y                                  // $60BD
	dey                                          // $60BF
	.byte $10, $D2                               // $60C0  bpl $6094
	dex                                          // $60C2
	.byte $F0, $1D                               // $60C3  beq $60E2
	clc                                          // $60C5
	lda $02                                      // $60C6
	adc #$28                                     // $60C8
	sta $02                                      // $60CA
	sta $04                                      // $60CC
	.byte $90, $04                               // $60CE  bcc $60D4
	inc $03                                      // $60D0
	inc $05                                      // $60D2
	clc                                          // $60D4
	lda $06                                      // $60D5
	adc #$b2                                     // $60D7
	sta $06                                      // $60D9
	.byte $90, $02                               // $60DB  bcc $60DF
	inc $07                                      // $60DD
	jmp $6092                                    // $60DF
	lda #$00                                     // $60E2
	sta $02                                      // $60E4
	sta $04                                      // $60E6
	lda #$04                                     // $60E8
	sta $03                                      // $60EA
	lda #$d8                                     // $60EC
	sta $05                                      // $60EE
	lda $08                                      // $60F0
	sta $06                                      // $60F2
	lda #$40                                     // $60F4
	sta $07                                      // $60F6
	lda $48                                      // $60F8
	.byte $D0, $04                               // $60FA  bne $6100
	rts                                          // $60FC
	nop                                          // $60FD
	nop                                          // $60FE
	nop                                          // $60FF
	ldy #$00                                     // $6100
	ldx $5050,y                                  // $6102
	lda $0400,x                                  // $6105
	cmp #$20                                     // $6108
	.byte $D0, $0A                               // $610A  bne $6116
	lda #$7b                                     // $610C
	sta $0400,x                                  // $610E
	lda #$01                                     // $6111
	sta $d800,x                                  // $6113
	iny                                          // $6116
	cpy #$37                                     // $6117
	.byte $D0, $E7                               // $6119  bne $6102
	ldx $5050,y                                  // $611B
	lda $0500,x                                  // $611E
	cmp #$20                                     // $6121
	.byte $D0, $0A                               // $6123  bne $612F
	lda #$7b                                     // $6125
	sta $0500,x                                  // $6127
	lda #$01                                     // $612A
	sta $d900,x                                  // $612C
	iny                                          // $612F
	cpy #$5a                                     // $6130
	.byte $D0, $E7                               // $6132  bne $611B
	rts                                          // $6134
	ldx #$05                                     // $6135
	lda $57                                      // $6137
	.byte $30, $06                               // $6139  bmi $6141
	inc $d002                                    // $613B  ; VIC_SP1X
	jmp $6144                                    // $613E
	dec $d002                                    // $6141  ; VIC_SP1X
	.byte $D0, $27                               // $6144  bne $616D
	lda $d010                                    // $6146  ; VIC_SPXMSB
	and #$02                                     // $6149
	.byte $F0, $0B                               // $614B  beq $6158
	lda $d010                                    // $614D  ; VIC_SPXMSB
	and #$fd                                     // $6150
	sta $d010                                    // $6152  ; VIC_SPXMSB
	jmp $6160                                    // $6155
	lda $d010                                    // $6158  ; VIC_SPXMSB
	ora #$02                                     // $615B
	sta $d010                                    // $615D  ; VIC_SPXMSB
	lda $57                                      // $6160
	.byte $30, $06                               // $6162  bmi $616A
	inc $d002                                    // $6164  ; VIC_SP1X
	jmp $616d                                    // $6167
	dec $d002                                    // $616A  ; VIC_SP1X
	dex                                          // $616D
	.byte $10, $C7                               // $616E  bpl $6137
	lda $d003                                    // $6170  ; VIC_SP1Y
	cmp #$c0                                     // $6173
	.byte $B0, $06                               // $6175  bcs $617D
	inc $d003                                    // $6177  ; VIC_SP1Y
	inc $d003                                    // $617A  ; VIC_SP1Y
	jsr $61a0                                    // $617D
	lda $d010                                    // $6180  ; VIC_SPXMSB
	and #$02                                     // $6183
	.byte $F0, $17                               // $6185  beq $619E
	lda $d002                                    // $6187  ; VIC_SP1X
	cmp #$60                                     // $618A
	.byte $90, $10                               // $618C  bcc $619E
	cmp #$d0                                     // $618E
	.byte $B0, $0C                               // $6190  bcs $619E
	lda $d015                                    // $6192  ; VIC_SPEN
	and #$fd                                     // $6195
	sta $d015                                    // $6197  ; VIC_SPEN
	lda $4e                                      // $619A
	sta $42                                      // $619C
	rts                                          // $619E
	nop                                          // $619F
	dec $40                                      // $61A0
	.byte $F0, $01                               // $61A2  beq $61A5
	rts                                          // $61A4
	lda $3f                                      // $61A5
	sta $40                                      // $61A7
	ldy $37                                      // $61A9
	lda $07f8,y                                  // $61AB
	cmp $38                                      // $61AE
	.byte $F0, $0B                               // $61B0  beq $61BD
	lda $38                                      // $61B2
	sta $07f8,y                                  // $61B4
	lda $39                                      // $61B7
	sta $d027,y                                  // $61B9
	rts                                          // $61BC
	lda $3a                                      // $61BD
	sta $07f8,y                                  // $61BF
	lda $3b                                      // $61C2
	sta $d027,y                                  // $61C4
	rts                                          // $61C7
	nop                                          // $61C8
	nop                                          // $61C9
	lda $16                                      // $61CA
	cmp #$2b                                     // $61CC
	.byte $90, $04                               // $61CE  bcc $61D4
	lda #$0a                                     // $61D0
	sta $16                                      // $61D2
	ldx $16                                      // $61D4
	lda $3ec0,x                                  // $61D6
	sta $14                                      // $61D9
	inx                                          // $61DB
	lda $3ec0,x                                  // $61DC
	sta $15                                      // $61DF
	ldx #$20                                     // $61E1
	ldy #$00                                     // $61E3
	lda ($14),y                                  // $61E5
	cmp #$01                                     // $61E7
	.byte $D0, $06                               // $61E9  bne $61F1
	lda ($10),y                                  // $61EB
	cmp #$0a                                     // $61ED
	.byte $90, $22                               // $61EF  bcc $6213
	lda ($14),y                                  // $61F1
	.byte $30, $16                               // $61F3  bmi $620B
	cpx #$0d                                     // $61F5
	.byte $90, $09                               // $61F7  bcc $6202
	sta ($10),y                                  // $61F9
	lda #$09                                     // $61FB
	sta ($12),y                                  // $61FD
	jmp $6213                                    // $61FF
	sta ($10),y                                  // $6202
	lda $4a                                      // $6204
	sta ($12),y                                  // $6206
	jmp $6213                                    // $6208
	and #$7f                                     // $620B
	sta ($10),y                                  // $620D
	lda #$0f                                     // $620F
	sta ($12),y                                  // $6211
	dex                                          // $6213
	.byte $F0, $1E                               // $6214  beq $6234
	iny                                          // $6216
	cpy #$04                                     // $6217
	.byte $90, $CA                               // $6219  bcc $61E5
	clc                                          // $621B
	lda $10                                      // $621C
	adc #$28                                     // $621E
	sta $10                                      // $6220
	sta $12                                      // $6222
	.byte $90, $04                               // $6224  bcc $622A
	inc $11                                      // $6226
	inc $13                                      // $6228
	clc                                          // $622A
	lda $14                                      // $622B
	adc #$04                                     // $622D
	sta $14                                      // $622F
	jmp $61e3                                    // $6231
	lda #$ba                                     // $6234
	sta $10                                      // $6236
	sta $12                                      // $6238
	lda #$06                                     // $623A
	sta $11                                      // $623C
	lda #$da                                     // $623E
	sta $13                                      // $6240
	rts                                          // $6242
	nop                                          // $6243
	nop                                          // $6244
	lda $0e                                      // $6245
	cmp #$3e                                     // $6247
	.byte $B0, $08                               // $6249  bcs $6253
	rts                                          // $624B
	lda $0e                                      // $624C
	cmp #$96                                     // $624E
	.byte $90, $01                               // $6250  bcc $6253
	rts                                          // $6252
	sec                                          // $6253
	lda $09                                      // $6254
	sbc #$26                                     // $6256
	sta $09                                      // $6258
	.byte $B0, $02                               // $625A  bcs $625E
	dec $0a                                      // $625C
	ldy #$00                                     // $625E
	lda ($09),y                                  // $6260
	pha                                          // $6262
	ldy #$25                                     // $6263
	lda ($09),y                                  // $6265
	pha                                          // $6267
	clc                                          // $6268
	lda $09                                      // $6269
	adc #$26                                     // $626B
	sta $09                                      // $626D
	.byte $90, $02                               // $626F  bcc $6273
	inc $0a                                      // $6271
	ldy #$00                                     // $6273
	pla                                          // $6275
	sta ($09),y                                  // $6276
	sec                                          // $6278
	lda $09                                      // $6279
	sbc #$27                                     // $627B
	sta $09                                      // $627D
	sta $0b                                      // $627F
	.byte $B0, $04                               // $6281  bcs $6287
	dec $0a                                      // $6283
	dec $0c                                      // $6285
	pla                                          // $6287
	sta ($09),y                                  // $6288
	lda $0d                                      // $628A
	.byte $D0, $19                               // $628C  bne $62A7
	clc                                          // $628E
	lda $09                                      // $628F
	adc #$28                                     // $6291
	sta $09                                      // $6293
	sta $0b                                      // $6295
	.byte $90, $04                               // $6297  bcc $629D
	inc $0a                                      // $6299
	inc $0c                                      // $629B
	clc                                          // $629D
	lda $0e                                      // $629E
	adc #$08                                     // $62A0
	sta $0e                                      // $62A2
	jmp $62bd                                    // $62A4
	sec                                          // $62A7
	lda $09                                      // $62A8
	sbc #$28                                     // $62AA
	sta $09                                      // $62AC
	sta $0b                                      // $62AE
	.byte $B0, $04                               // $62B0  bcs $62B6
	dec $0a                                      // $62B2
	dec $0c                                      // $62B4
	sec                                          // $62B6
	lda $0e                                      // $62B7
	sbc #$08                                     // $62B9
	sta $0e                                      // $62BB
	lda #$7a                                     // $62BD
	sta ($09),y                                  // $62BF
	clc                                          // $62C1
	lda $09                                      // $62C2
	adc #$27                                     // $62C4
	sta $09                                      // $62C6
	sta $0b                                      // $62C8
	.byte $90, $04                               // $62CA  bcc $62D0
	inc $0a                                      // $62CC
	inc $0c                                      // $62CE
	lda #$7a                                     // $62D0
	sta ($09),y                                  // $62D2
	rts                                          // $62D4
	lda #$81                                     // $62D5
	sta $d412                                    // $62D7
	ldy $1b                                      // $62DA
	ldx #$00                                     // $62DC
	lda $3fa0,y                                  // $62DE
	sta $1c,x                                    // $62E1
	inx                                          // $62E3
	iny                                          // $62E4
	cpx #$08                                     // $62E5
	.byte $D0, $F5                               // $62E7  bne $62DE
	lda $1d                                      // $62E9
	sta $07f8                                    // $62EB
	lda $1f                                      // $62EE
	sta $d000                                    // $62F0  ; VIC_SP0X
	lda $20                                      // $62F3
	sta $d001                                    // $62F5  ; VIC_SP0Y
	lda $d010                                    // $62F8  ; VIC_SPXMSB
	and #$fe                                     // $62FB
	sta $d010                                    // $62FD  ; VIC_SPXMSB
	lda $d01b                                    // $6300  ; VIC_SPPRI
	and #$fe                                     // $6303
	sta $d01b                                    // $6305  ; VIC_SPPRI
	lda $d015                                    // $6308  ; VIC_SPEN
	ora #$01                                     // $630B
	sta $d015                                    // $630D  ; VIC_SPEN
	lda $1a                                      // $6310
	sta $d40f                                    // $6312  ; SID_FLTHI
	ldx $21                                      // $6315
	.byte $F0, $30                               // $6317  beq $6349
	lda $1c                                      // $6319
	.byte $D0, $24                               // $631B  bne $6341
	inc $d000                                    // $631D  ; VIC_SP0X
	.byte $D0, $0B                               // $6320  bne $632D
	lda $d010                                    // $6322  ; VIC_SPXMSB
	ora #$01                                     // $6325
	sta $d010                                    // $6327  ; VIC_SPXMSB
	inc $d000                                    // $632A  ; VIC_SP0X
	lda $d000                                    // $632D  ; VIC_SP0X
	cmp #$60                                     // $6330
	.byte $90, $07                               // $6332  bcc $633B
	lda $d010                                    // $6334  ; VIC_SPXMSB
	and #$01                                     // $6337
	.byte $D0, $4C                               // $6339  bne $6387
	dex                                          // $633B
	.byte $D0, $DF                               // $633C  bne $631D
	jmp $6349                                    // $633E
	dec $d000                                    // $6341  ; VIC_SP0X
	.byte $F0, $41                               // $6344  beq $6387
	dex                                          // $6346
	.byte $D0, $F8                               // $6347  bne $6341
	ldy $22                                      // $6349
	lda $0e                                      // $634B
	sbc #$30                                     // $634D
	cmp $d001                                    // $634F  ; VIC_SP0Y
	.byte $90, $03                               // $6352  bcc $6357
	jmp $6387                                    // $6354
	lda $d001                                    // $6357  ; VIC_SP0Y
	cmp $0e                                      // $635A
	.byte $B0, $0F                               // $635C  bcs $636D
	jmp $6368                                    // $635E
	and #$01                                     // $6361
	.byte $D0, $03                               // $6363  bne $6368
	jmp $6387                                    // $6365
	lda $1e                                      // $6368
	sta $07f8                                    // $636A
	lda $d001                                    // $636D  ; VIC_SP0Y
	cmp #$8a                                     // $6370
	.byte $B0, $08                               // $6372  bcs $637C
	lda $d01b                                    // $6374  ; VIC_SPPRI
	ora #$01                                     // $6377
	sta $d01b                                    // $6379  ; VIC_SPPRI
	dec $d001                                    // $637C  ; VIC_SP0Y
	dey                                          // $637F
	.byte $D0, $C9                               // $6380  bne $634B
	dec $1a                                      // $6382
	inc $23                                      // $6384
	rts                                          // $6386
	lda $d015                                    // $6387  ; VIC_SPEN
	and #$fe                                     // $638A
	sta $d015                                    // $638C  ; VIC_SPEN
	lda #$01                                     // $638F
	sta $d027                                    // $6391
	lda $d010                                    // $6394  ; VIC_SPXMSB
	and #$fe                                     // $6397
	sta $d010                                    // $6399  ; VIC_SPXMSB
	inc $26                                      // $639C
	dec $27                                      // $639E
	lda #$41                                     // $63A0
	sta $d412                                    // $63A2
	lda #$50                                     // $63A5
	sta $1a                                      // $63A7
	lda #$00                                     // $63A9
	sta $24                                      // $63AB
	sta $d40f                                    // $63AD  ; SID_FLTHI
	rts                                          // $63B0
	nop                                          // $63B1
	nop                                          // $63B2
	nop                                          // $63B3
	nop                                          // $63B4
	lda #$16                                     // $63B5
	sta $16                                      // $63B7
	jsr $61ca                                    // $63B9
	lda $16                                      // $63BC
	cmp #$0a                                     // $63BE
	.byte $F0, $10                               // $63C0  beq $63D2
	inc $16                                      // $63C2
	inc $16                                      // $63C4
	lda $16                                      // $63C6
	cmp #$1c                                     // $63C8
	.byte $F0, $01                               // $63CA  beq $63CD
	rts                                          // $63CC
	lda #$0a                                     // $63CD
	sta $16                                      // $63CF
	rts                                          // $63D1
	lda #$28                                     // $63D2
	sta $1b                                      // $63D4
	lda #$00                                     // $63D6
	sta $25                                      // $63D8
	sta $26                                      // $63DA
	rts                                          // $63DC
	nop                                          // $63DD
	nop                                          // $63DE
	nop                                          // $63DF
	lda #$1c                                     // $63E0
	sta $16                                      // $63E2
	lda $08                                      // $63E4
	.byte $D0, $04                               // $63E6  bne $63EC
	lda #$8a                                     // $63E8
	sta $08                                      // $63EA
	dec $08                                      // $63EC
	lda $08                                      // $63EE
	sta $06                                      // $63F0
	dec $0f                                      // $63F2
	.byte $D0, $12                               // $63F4  bne $6408
	lda #$02                                     // $63F6
	sta $0f                                      // $63F8
	lda $16                                      // $63FA
	cmp #$22                                     // $63FC
	.byte $D0, $04                               // $63FE  bne $6404
	lda #$1a                                     // $6400
	sta $16                                      // $6402
	inc $16                                      // $6404
	inc $16                                      // $6406
	jsr $6090                                    // $6408
	jsr $61ca                                    // $640B
	ldx #$03                                     // $640E
	inc $d00c                                    // $6410
	.byte $D0, $08                               // $6413  bne $641D
	lda $d010                                    // $6415  ; VIC_SPXMSB
	ora #$40                                     // $6418
	sta $d010                                    // $641A  ; VIC_SPXMSB
	lda $d00c                                    // $641D
	cmp #$68                                     // $6420
	.byte $90, $24                               // $6422  bcc $6448
	lda $d010                                    // $6424  ; VIC_SPXMSB
	and #$40                                     // $6427
	.byte $F0, $1D                               // $6429  beq $6448
	lda $d010                                    // $642B  ; VIC_SPXMSB
	and #$bf                                     // $642E
	sta $d010                                    // $6430  ; VIC_SPXMSB
	lda #$00                                     // $6433
	sta $d00c                                    // $6435
	lda $07fe                                    // $6438
	cmp #$a9                                     // $643B
	.byte $F0, $06                               // $643D  beq $6445
	dec $07fe                                    // $643F
	jmp $6448                                    // $6442
	inc $07fe                                    // $6445
	dex                                          // $6448
	.byte $D0, $C5                               // $6449  bne $6410
	ldx #$05                                     // $644B
	inc $d008                                    // $644D
	inc $d00a                                    // $6450
	.byte $D0, $08                               // $6453  bne $645D
	lda $d010                                    // $6455  ; VIC_SPXMSB
	ora #$30                                     // $6458
	sta $d010                                    // $645A  ; VIC_SPXMSB
	lda $d008                                    // $645D
	cmp #$68                                     // $6460
	.byte $90, $2D                               // $6462  bcc $6491
	lda $d010                                    // $6464  ; VIC_SPXMSB
	and #$30                                     // $6467
	.byte $F0, $26                               // $6469  beq $6491
	lda $d010                                    // $646B  ; VIC_SPXMSB
	and #$cf                                     // $646E
	sta $d010                                    // $6470  ; VIC_SPXMSB
	lda #$00                                     // $6473
	sta $d008                                    // $6475
	sta $d00a                                    // $6478
	lda $07fd                                    // $647B
	cmp #$ab                                     // $647E
	.byte $F0, $09                               // $6480  beq $648B
	dec $07fd                                    // $6482
	dec $07fc                                    // $6485
	jmp $6491                                    // $6488
	inc $07fd                                    // $648B
	inc $07fc                                    // $648E
	dex                                          // $6491
	.byte $D0, $B9                               // $6492  bne $644D
	lda $37                                      // $6494
	.byte $D0, $03                               // $6496  bne $649B
	jmp $6527                                    // $6498
	ldx $3c                                      // $649B
	lda $d010                                    // $649D  ; VIC_SPXMSB
	and #$02                                     // $64A0
	.byte $F0, $0F                               // $64A2  beq $64B3
	lda $d002                                    // $64A4  ; VIC_SP1X
	cmp #$60                                     // $64A7
	.byte $90, $08                               // $64A9  bcc $64B3
	lda $d015                                    // $64AB  ; VIC_SPEN
	and #$fd                                     // $64AE
	sta $d015                                    // $64B0  ; VIC_SPEN
	inc $d002                                    // $64B3  ; VIC_SP1X
	.byte $D0, $0B                               // $64B6  bne $64C3
	lda $d010                                    // $64B8  ; VIC_SPXMSB
	ora #$02                                     // $64BB
	sta $d010                                    // $64BD  ; VIC_SPXMSB
	inc $d002                                    // $64C0  ; VIC_SP1X
	lda $d010                                    // $64C3  ; VIC_SPXMSB
	and #$04                                     // $64C6
	.byte $F0, $0F                               // $64C8  beq $64D9
	lda $d004                                    // $64CA
	cmp #$60                                     // $64CD
	.byte $90, $08                               // $64CF  bcc $64D9
	lda $d015                                    // $64D1  ; VIC_SPEN
	and #$fb                                     // $64D4
	sta $d015                                    // $64D6  ; VIC_SPEN
	inc $d004                                    // $64D9
	.byte $D0, $0B                               // $64DC  bne $64E9
	lda $d010                                    // $64DE  ; VIC_SPXMSB
	ora #$04                                     // $64E1
	sta $d010                                    // $64E3  ; VIC_SPXMSB
	inc $d004                                    // $64E6
	lda $d010                                    // $64E9  ; VIC_SPXMSB
	and #$08                                     // $64EC
	.byte $F0, $0F                               // $64EE  beq $64FF
	lda $d006                                    // $64F0
	cmp #$60                                     // $64F3
	.byte $90, $08                               // $64F5  bcc $64FF
	lda $d015                                    // $64F7  ; VIC_SPEN
	and #$f7                                     // $64FA
	sta $d015                                    // $64FC  ; VIC_SPEN
	inc $d006                                    // $64FF
	.byte $D0, $0B                               // $6502  bne $650F
	lda $d010                                    // $6504  ; VIC_SPXMSB
	ora #$08                                     // $6507
	sta $d010                                    // $6509  ; VIC_SPXMSB
	inc $d006                                    // $650C
	lda $42                                      // $650F
	cmp #$82                                     // $6511
	.byte $D0, $03                               // $6513  bne $6518
	jsr $61a0                                    // $6515
	lda $42                                      // $6518
	cmp #$84                                     // $651A
	.byte $D0, $03                               // $651C  bne $6521
	jsr $69ba                                    // $651E
	dex                                          // $6521
	.byte $F0, $03                               // $6522  beq $6527
	jmp $649d                                    // $6524
	lda $dc00                                    // $6527  ; CIA1_PRA
	and #$1f                                     // $652A
	eor #$1f                                     // $652C
	cmp #$04                                     // $652E
	.byte $90, $14                               // $6530  bcc $6546
	cmp #$07                                     // $6532
	.byte $B0, $10                               // $6534  bcs $6546
	jsr $61a0                                    // $6536
	jsr $73da                                    // $6539
	lda $43                                      // $653C
	.byte $D0, $06                               // $653E  bne $6546
	jsr $68b0                                    // $6540
	jmp $63e4                                    // $6543
	lda #$00                                     // $6546
	sta $18                                      // $6548
	sta $16                                      // $654A
	jsr $61ca                                    // $654C
	rts                                          // $654F
	nop                                          // $6550
	nop                                          // $6551
	nop                                          // $6552
	nop                                          // $6553
	nop                                          // $6554
	nop                                          // $6555
	nop                                          // $6556
	nop                                          // $6557
	nop                                          // $6558
	nop                                          // $6559
	nop                                          // $655A
	nop                                          // $655B
	nop                                          // $655C
	nop                                          // $655D
	nop                                          // $655E
	nop                                          // $655F
	lda #$24                                     // $6560
	sta $16                                      // $6562
	lda $08                                      // $6564
	cmp #$8a                                     // $6566
	.byte $90, $04                               // $6568  bcc $656E
	lda #$00                                     // $656A
	sta $08                                      // $656C
	inc $08                                      // $656E
	lda $08                                      // $6570
	sta $06                                      // $6572
	dec $0f                                      // $6574
	.byte $D0, $12                               // $6576  bne $658A
	lda #$02                                     // $6578
	sta $0f                                      // $657A
	lda $16                                      // $657C
	cmp #$2a                                     // $657E
	.byte $D0, $04                               // $6580  bne $6586
	lda #$22                                     // $6582
	sta $16                                      // $6584
	inc $16                                      // $6586
	inc $16                                      // $6588
	jsr $6090                                    // $658A
	jsr $61ca                                    // $658D
	ldx #$03                                     // $6590
	dec $d00c                                    // $6592
	.byte $D0, $32                               // $6595  bne $65C9
	lda $d010                                    // $6597  ; VIC_SPXMSB
	and #$40                                     // $659A
	.byte $F0, $0E                               // $659C  beq $65AC
	lda $d010                                    // $659E  ; VIC_SPXMSB
	and #$bf                                     // $65A1
	sta $d010                                    // $65A3  ; VIC_SPXMSB
	dec $d00c                                    // $65A6
	jmp $65c9                                    // $65A9
	lda $d010                                    // $65AC  ; VIC_SPXMSB
	ora #$40                                     // $65AF
	sta $d010                                    // $65B1  ; VIC_SPXMSB
	lda #$68                                     // $65B4
	sta $d00c                                    // $65B6
	lda $07fe                                    // $65B9
	cmp #$a9                                     // $65BC
	.byte $F0, $06                               // $65BE  beq $65C6
	dec $07fe                                    // $65C0
	jmp $65c9                                    // $65C3
	inc $07fe                                    // $65C6
	dex                                          // $65C9
	.byte $D0, $C6                               // $65CA  bne $6592
	ldx #$05                                     // $65CC
	dec $d008                                    // $65CE
	dec $d00a                                    // $65D1
	.byte $D0, $3E                               // $65D4  bne $6614
	lda $d010                                    // $65D6  ; VIC_SPXMSB
	and #$30                                     // $65D9
	.byte $F0, $11                               // $65DB  beq $65EE
	lda $d210                                    // $65DD
	and #$cf                                     // $65E0
	sta $d010                                    // $65E2  ; VIC_SPXMSB
	dec $d008                                    // $65E5
	dec $d00a                                    // $65E8
	jmp $6614                                    // $65EB
	lda $d010                                    // $65EE  ; VIC_SPXMSB
	ora #$30                                     // $65F1
	sta $d010                                    // $65F3  ; VIC_SPXMSB
	lda #$68                                     // $65F6
	sta $d008                                    // $65F8
	sta $d00a                                    // $65FB
	lda $07fd                                    // $65FE
	cmp #$ab                                     // $6601
	.byte $F0, $09                               // $6603  beq $660E
	dec $07fd                                    // $6605
	dec $07fc                                    // $6608
	jmp $6614                                    // $660B
	inc $07fd                                    // $660E
	inc $07fc                                    // $6611
	dex                                          // $6614
	.byte $D0, $B7                               // $6615  bne $65CE
	lda $37                                      // $6617
	.byte $D0, $03                               // $6619  bne $661E
	jmp $66e1                                    // $661B
	ldx $3c                                      // $661E
	lda $d010                                    // $6620  ; VIC_SPXMSB
	and #$02                                     // $6623
	.byte $F0, $20                               // $6625  beq $6647
	lda $d002                                    // $6627  ; VIC_SP1X
	cmp #$60                                     // $662A
	.byte $90, $0C                               // $662C  bcc $663A
	cmp #$d0                                     // $662E
	.byte $B0, $08                               // $6630  bcs $663A
	lda $d015                                    // $6632  ; VIC_SPEN
	and #$fd                                     // $6635
	sta $d015                                    // $6637  ; VIC_SPEN
	dec $d002                                    // $663A  ; VIC_SP1X
	.byte $D0, $18                               // $663D  bne $6657
	lda $d010                                    // $663F  ; VIC_SPXMSB
	and #$fd                                     // $6642
	sta $d010                                    // $6644  ; VIC_SPXMSB
	dec $d002                                    // $6647  ; VIC_SP1X
	.byte $D0, $0B                               // $664A  bne $6657
	lda $d010                                    // $664C  ; VIC_SPXMSB
	ora #$02                                     // $664F
	sta $d010                                    // $6651  ; VIC_SPXMSB
	dec $d002                                    // $6654  ; VIC_SP1X
	lda $d010                                    // $6657  ; VIC_SPXMSB
	and #$04                                     // $665A
	.byte $F0, $20                               // $665C  beq $667E
	lda $d004                                    // $665E
	cmp #$60                                     // $6661
	.byte $90, $0C                               // $6663  bcc $6671
	cmp #$d0                                     // $6665
	.byte $B0, $08                               // $6667  bcs $6671
	lda $d015                                    // $6669  ; VIC_SPEN
	and #$fb                                     // $666C
	sta $d015                                    // $666E  ; VIC_SPEN
	dec $d004                                    // $6671
	.byte $D0, $18                               // $6674  bne $668E
	lda $d010                                    // $6676  ; VIC_SPXMSB
	and #$fb                                     // $6679
	sta $d010                                    // $667B  ; VIC_SPXMSB
	dec $d004                                    // $667E
	.byte $D0, $0B                               // $6681  bne $668E
	lda $d010                                    // $6683  ; VIC_SPXMSB
	ora #$04                                     // $6686
	sta $d010                                    // $6688  ; VIC_SPXMSB
	dec $d004                                    // $668B
	lda $d010                                    // $668E  ; VIC_SPXMSB
	and #$08                                     // $6691
	.byte $F0, $20                               // $6693  beq $66B5
	lda $d006                                    // $6695
	cmp #$60                                     // $6698
	.byte $90, $0C                               // $669A  bcc $66A8
	cmp #$d0                                     // $669C
	.byte $B0, $08                               // $669E  bcs $66A8
	lda $d015                                    // $66A0  ; VIC_SPEN
	and #$f7                                     // $66A3
	sta $d015                                    // $66A5  ; VIC_SPEN
	dec $d006                                    // $66A8
	.byte $D0, $18                               // $66AB  bne $66C5
	lda $d010                                    // $66AD  ; VIC_SPXMSB
	and #$f7                                     // $66B0
	sta $d010                                    // $66B2  ; VIC_SPXMSB
	dec $d006                                    // $66B5
	.byte $D0, $0B                               // $66B8  bne $66C5
	lda $d010                                    // $66BA  ; VIC_SPXMSB
	ora #$08                                     // $66BD
	sta $d010                                    // $66BF  ; VIC_SPXMSB
	dec $d006                                    // $66C2
	lda $42                                      // $66C5
	cmp #$82                                     // $66C7
	.byte $D0, $03                               // $66C9  bne $66CE
	jsr $61a0                                    // $66CB
	lda $42                                      // $66CE
	cmp #$84                                     // $66D0
	.byte $D0, $07                               // $66D2  bne $66DB
	lda #$02                                     // $66D4
	sta $44                                      // $66D6
	jsr $69ba                                    // $66D8
	dex                                          // $66DB
	.byte $F0, $03                               // $66DC  beq $66E1
	jmp $6620                                    // $66DE
	lda $dc00                                    // $66E1  ; CIA1_PRA
	and #$1f                                     // $66E4
	eor #$1f                                     // $66E6
	cmp #$08                                     // $66E8
	.byte $90, $14                               // $66EA  bcc $6700
	cmp #$0b                                     // $66EC
	.byte $B0, $10                               // $66EE  bcs $6700
	jsr $61a0                                    // $66F0
	jsr $73da                                    // $66F3
	lda $43                                      // $66F6
	.byte $D0, $06                               // $66F8  bne $6700
	jsr $68b0                                    // $66FA
	jmp $6564                                    // $66FD
	lda #$00                                     // $6700
	sta $19                                      // $6702
	lda #$14                                     // $6704
	sta $16                                      // $6706
	jsr $61ca                                    // $6708
	rts                                          // $670B
	nop                                          // $670C
	nop                                          // $670D
	nop                                          // $670E
	nop                                          // $670F
	lda $46                                      // $6710
	cmp #$ff                                     // $6712
	.byte $D0, $01                               // $6714  bne $6717
	rts                                          // $6716
	dec $47                                      // $6717
	.byte $D0, $FB                               // $6719  bne $6716
	lda #$98                                     // $671B
	sta $47                                      // $671D
	inc $d00e                                    // $671F
	.byte $D0, $08                               // $6722  bne $672C
	lda $d010                                    // $6724  ; VIC_SPXMSB
	ora #$80                                     // $6727
	sta $d010                                    // $6729  ; VIC_SPXMSB
	dec $46                                      // $672C
	.byte $D0, $07                               // $672E  bne $6737
	lda #$04                                     // $6730
	sta $46                                      // $6732
	inc $d00f                                    // $6734
	lda $d00e                                    // $6737
	cmp #$54                                     // $673A
	.byte $D0, $06                               // $673C  bne $6744
	inc $48                                      // $673E
	jsr $6100                                    // $6740
	rts                                          // $6743
	cmp #$88                                     // $6744
	.byte $D0, $06                               // $6746  bne $674E
	lda #$0b                                     // $6748
	sta $d021                                    // $674A  ; VIC_BG0
	rts                                          // $674D
	cmp #$c0                                     // $674E
	.byte $D0, $30                               // $6750  bne $6782
	lda #$00                                     // $6752
	sta $d022                                    // $6754
	lda #$06                                     // $6757
	sta $d023                                    // $6759
	sta $d02b                                    // $675C
	sta $d02c                                    // $675F
	sta $d02d                                    // $6762
	sta $d025                                    // $6765  ; VIC_SPMCOL0
	lda #$08                                     // $6768
	sta $4a                                      // $676A
	jsr $61ca                                    // $676C
	ldx #$0b                                     // $676F
	lda #$09                                     // $6771
	sta $dbc0,x                                  // $6773
	dex                                          // $6776
	.byte $10, $FA                               // $6777  bpl $6773
	ldx #$0a                                     // $6779
	sta $dbdc,x                                  // $677B
	dex                                          // $677E
	.byte $10, $FA                               // $677F  bpl $677B
	rts                                          // $6781
	cmp #$f0                                     // $6782
	.byte $D0, $1E                               // $6784  bne $67A4
	lda #$09                                     // $6786
	sta $d02e                                    // $6788
	lda #$00                                     // $678B
	sta $d022                                    // $678D
	lda #$0b                                     // $6790
	sta $d023                                    // $6792
	sta $d02b                                    // $6795
	sta $d02c                                    // $6798
	sta $d02d                                    // $679B
	lda #$00                                     // $679E
	sta $d021                                    // $67A0  ; VIC_BG0
	rts                                          // $67A3
	cmp #$24                                     // $67A4
	.byte $D0, $32                               // $67A6  bne $67DA
	ldx #$00                                     // $67A8
	lda #$08                                     // $67AA
	sta $d800,x                                  // $67AC
	inx                                          // $67AF
	.byte $D0, $FA                               // $67B0  bne $67AC
	sta $d900,x                                  // $67B2
	inx                                          // $67B5
	.byte $D0, $FA                               // $67B6  bne $67B2
	sta $da00,x                                  // $67B8
	inx                                          // $67BB
	.byte $D0, $FA                               // $67BC  bne $67B8
	sta $db00,x                                  // $67BE
	inx                                          // $67C1
	cpx #$98                                     // $67C2
	.byte $D0, $F8                               // $67C4  bne $67BE
	inc $49                                      // $67C6
	jsr $6100                                    // $67C8
	jsr $61ca                                    // $67CB
	lda #$00                                     // $67CE
	sta $d02b                                    // $67D0
	sta $d02c                                    // $67D3
	sta $d025                                    // $67D6  ; VIC_SPMCOL0
	rts                                          // $67D9
	cmp #$58                                     // $67DA
	.byte $D0, $07                               // $67DC  bne $67E5
	lda $d010                                    // $67DE  ; VIC_SPXMSB
	and #$80                                     // $67E1
	.byte $D0, $01                               // $67E3  bne $67E6
	rts                                          // $67E5
	lda $d015                                    // $67E6  ; VIC_SPEN
	and #$0f                                     // $67E9
	sta $d015                                    // $67EB  ; VIC_SPEN
	lda #$ff                                     // $67EE
	sta $46                                      // $67F0
	lda #$00                                     // $67F2
	sta $d022                                    // $67F4
	rts                                          // $67F7
	nop                                          // $67F8
	nop                                          // $67F9
	nop                                          // $67FA
	nop                                          // $67FB
	nop                                          // $67FC
	nop                                          // $67FD
	nop                                          // $67FE
	nop                                          // $67FF
	clc                                          // $6800
	sed                                          // $6801
	lda $2a                                      // $6802
	adc $28                                      // $6804
	sta $2a                                      // $6806
	lda $2b                                      // $6808
	adc $29                                      // $680A
	sta $2b                                      // $680C
	lda $2c                                      // $680E
	adc #$00                                     // $6810
	sta $2c                                      // $6812
	.byte $90, $02                               // $6814  bcc $6818
	inc $2d                                      // $6816
	cld                                          // $6818
	lda #$00                                     // $6819
	sta $28                                      // $681B
	sta $29                                      // $681D
	clc                                          // $681F
	ldy #$07                                     // $6820
	ldx #$00                                     // $6822
	lda $2a,x                                    // $6824
	and #$0f                                     // $6826
	adc #$10                                     // $6828
	sta $07c3,y                                  // $682A
	dey                                          // $682D
	lda $2a,x                                    // $682E
	and #$f0                                     // $6830
	lsr                                          // $6832
	lsr                                          // $6833
	lsr                                          // $6834
	lsr                                          // $6835
	adc #$10                                     // $6836
	sta $07c3,y                                  // $6838
	dey                                          // $683B
	inx                                          // $683C
	cpx #$03                                     // $683D
	.byte $D0, $E3                               // $683F  bne $6824
	rts                                          // $6841
	nop                                          // $6842
	nop                                          // $6843
	nop                                          // $6844
	lda #$26                                     // $6845
	sta $d003                                    // $6847  ; VIC_SP1Y
	sta $d005                                    // $684A
	lda #$02                                     // $684D
	sta $d028                                    // $684F
	sta $d029                                    // $6852
	lda #$90                                     // $6855
	sta $d002                                    // $6857  ; VIC_SP1X
	lda #$a8                                     // $685A
	sta $d004                                    // $685C
	lda $d010                                    // $685F  ; VIC_SPXMSB
	and #$f0                                     // $6862
	sta $d010                                    // $6864  ; VIC_SPXMSB
	lda $d017                                    // $6867  ; VIC_SPYEXP
	and #$f9                                     // $686A
	sta $d017                                    // $686C  ; VIC_SPYEXP
	lda $d01d                                    // $686F  ; VIC_SPXEXP
	and #$f9                                     // $6872
	sta $d01d                                    // $6874  ; VIC_SPXEXP
	lda $d01b                                    // $6877  ; VIC_SPPRI
	ora #$06                                     // $687A
	sta $d01b                                    // $687C  ; VIC_SPPRI
	lda $d01c                                    // $687F  ; VIC_SPMCOL
	ora #$06                                     // $6882
	sta $d01c                                    // $6884  ; VIC_SPMCOL
	lda #$cc                                     // $6887
	sta $07f9                                    // $6889
	lda #$cd                                     // $688C
	sta $07fa                                    // $688E
	lda #$24                                     // $6891
	sta $53                                      // $6893
	sta $54                                      // $6895
	lda #$00                                     // $6897
	sta $50                                      // $6899
	sta $51                                      // $689B
	lda $d015                                    // $689D  ; VIC_SPEN
	ora #$06                                     // $68A0
	sta $d015                                    // $68A2  ; VIC_SPEN
	lda #$00                                     // $68A5
	sta $37                                      // $68A7
	lda #$06                                     // $68A9
	sta $3c                                      // $68AB
	rts                                          // $68AD
	nop                                          // $68AE
	nop                                          // $68AF
	lda $42                                      // $68B0
	cmp #$88                                     // $68B2
	.byte $F0, $01                               // $68B4  beq $68B7
	rts                                          // $68B6
	lda $52                                      // $68B7
	.byte $F0, $FB                               // $68B9  beq $68B6
	cmp #$03                                     // $68BB
	.byte $D0, $11                               // $68BD  bne $68D0
	jsr $76e9                                    // $68BF
	inc $d007                                    // $68C2
	inc $d007                                    // $68C5
	inc $d007                                    // $68C8
	nop                                          // $68CB
	nop                                          // $68CC
	jmp $68f9                                    // $68CD
	cmp #$07                                     // $68D0
	.byte $D0, $12                               // $68D2  bne $68E6
	jsr $756f                                    // $68D4
	inc $d006                                    // $68D7
	inc $d007                                    // $68DA
	inc $d006                                    // $68DD
	inc $d007                                    // $68E0
	jmp $68f9                                    // $68E3
	cmp #$0b                                     // $68E6
	.byte $D0, $0F                               // $68E8  bne $68F9
	jsr $75fc                                    // $68EA
	inc $d007                                    // $68ED
	dec $d006                                    // $68F0
	inc $d007                                    // $68F3
	dec $d006                                    // $68F6
	lda $d015                                    // $68F9  ; VIC_SPEN
	ora #$06                                     // $68FC
	sta $d015                                    // $68FE  ; VIC_SPEN
	lda $d010                                    // $6901  ; VIC_SPXMSB
	and #$06                                     // $6904
	.byte $D0, $03                               // $6906  bne $690B
	jmp $691d                                    // $6908
	lda $d002                                    // $690B  ; VIC_SP1X
	cmp #$60                                     // $690E
	.byte $90, $0B                               // $6910  bcc $691D
	cmp #$a0                                     // $6912
	.byte $B0, $07                               // $6914  bcs $691D
	lda $4e                                      // $6916
	sta $42                                      // $6918
	jmp $6939                                    // $691A
	lda $d010                                    // $691D  ; VIC_SPXMSB
	lda $d002                                    // $6920  ; VIC_SP1X
	.byte $10, $15                               // $6923  bpl $693A
	lda $d004                                    // $6925
	.byte $30, $0F                               // $6928  bmi $6939
	lda $d010                                    // $692A  ; VIC_SPXMSB
	and #$04                                     // $692D
	.byte $D0, $08                               // $692F  bne $6939
	lda $d010                                    // $6931  ; VIC_SPXMSB
	ora #$02                                     // $6934
	sta $d010                                    // $6936  ; VIC_SPXMSB
	rts                                          // $6939
	lda $d004                                    // $693A
	.byte $30, $FA                               // $693D  bmi $6939
	lda $d010                                    // $693F  ; VIC_SPXMSB
	and #$04                                     // $6942
	.byte $D0, $F3                               // $6944  bne $6939
	lda $d010                                    // $6946  ; VIC_SPXMSB
	and #$f9                                     // $6949
	sta $d010                                    // $694B  ; VIC_SPXMSB
	rts                                          // $694E
	nop                                          // $694F
	lda #$b2                                     // $6950
	sta $07f9                                    // $6952
	sta $07fa                                    // $6955
	sta $07fb                                    // $6958
	lda #$09                                     // $695B
	sta $d028                                    // $695D
	sta $d029                                    // $6960
	sta $d02a                                    // $6963
	lda $d01c                                    // $6966  ; VIC_SPMCOL
	ora #$0e                                     // $6969
	sta $d01c                                    // $696B  ; VIC_SPMCOL
	lda $d01b                                    // $696E  ; VIC_SPPRI
	ora #$0e                                     // $6971
	sta $d01b                                    // $6973  ; VIC_SPPRI
	lda $d017                                    // $6976  ; VIC_SPYEXP
	and #$f1                                     // $6979
	sta $d017                                    // $697B  ; VIC_SPYEXP
	lda $d01d                                    // $697E  ; VIC_SPXEXP
	and #$f1                                     // $6981
	sta $d01d                                    // $6983  ; VIC_SPXEXP
	lda $d010                                    // $6986  ; VIC_SPXMSB
	and #$f1                                     // $6989
	sta $d010                                    // $698B  ; VIC_SPXMSB
	lda $dc04                                    // $698E
	sta $d002                                    // $6991  ; VIC_SP1X
	sta $d004                                    // $6994
	sta $d006                                    // $6997
	lda #$80                                     // $699A
	sta $d003                                    // $699C  ; VIC_SP1Y
	sta $d005                                    // $699F
	sta $d007                                    // $69A2
	lda $d015                                    // $69A5  ; VIC_SPEN
	ora #$0e                                     // $69A8
	sta $d015                                    // $69AA  ; VIC_SPEN
	ldx #$10                                     // $69AD
	lda $5d40,x                                  // $69AF
	sta $30,x                                    // $69B2
	dex                                          // $69B4
	.byte $10, $F8                               // $69B5  bpl $69AF
	rts                                          // $69B7
	nop                                          // $69B8
	nop                                          // $69B9
	dec $4d                                      // $69BA
	.byte $F0, $01                               // $69BC  beq $69BF
	rts                                          // $69BE
	lda $44                                      // $69BF
	sta $4d                                      // $69C1
	lda $52                                      // $69C3
	and #$01                                     // $69C5
	.byte $D0, $2F                               // $69C7  bne $69F8
	dec $d003                                    // $69C9  ; VIC_SP1Y
	lda $d003                                    // $69CC  ; VIC_SP1Y
	.byte $D0, $24                               // $69CF  bne $69F5
	lda $d017                                    // $69D1  ; VIC_SPYEXP
	ora #$02                                     // $69D4
	sta $d017                                    // $69D6  ; VIC_SPYEXP
	lda $d01d                                    // $69D9  ; VIC_SPXEXP
	ora #$02                                     // $69DC
	sta $d01d                                    // $69DE  ; VIC_SPXEXP
	lda $d01b                                    // $69E1  ; VIC_SPPRI
	and #$fd                                     // $69E4
	sta $d01b                                    // $69E6  ; VIC_SPPRI
	lda $dc04                                    // $69E9
	sta $d002                                    // $69EC  ; VIC_SP1X
	lda $52                                      // $69EF
	ora #$01                                     // $69F1
	sta $52                                      // $69F3
	jmp $6a33                                    // $69F5
	inc $d003                                    // $69F8  ; VIC_SP1Y
	inc $d003                                    // $69FB  ; VIC_SP1Y
	lda $d003                                    // $69FE  ; VIC_SP1Y
	cmp #$f0                                     // $6A01
	.byte $90, $2E                               // $6A03  bcc $6A33
	lda $d017                                    // $6A05  ; VIC_SPYEXP
	and #$fd                                     // $6A08
	sta $d017                                    // $6A0A  ; VIC_SPYEXP
	lda $d01d                                    // $6A0D  ; VIC_SPXEXP
	and #$fd                                     // $6A10
	sta $d01d                                    // $6A12  ; VIC_SPXEXP
	lda $d01b                                    // $6A15  ; VIC_SPPRI
	ora #$02                                     // $6A18
	sta $d01b                                    // $6A1A  ; VIC_SPPRI
	lda #$90                                     // $6A1D
	sta $d003                                    // $6A1F  ; VIC_SP1Y
	lda $dc04                                    // $6A22
	sta $d002                                    // $6A25  ; VIC_SP1X
	lda #$b2                                     // $6A28
	sta $07f9                                    // $6A2A
	lda $52                                      // $6A2D
	and #$fe                                     // $6A2F
	sta $52                                      // $6A31
	lda $52                                      // $6A33
	and #$02                                     // $6A35
	.byte $D0, $34                               // $6A37  bne $6A6D
	dec $d005                                    // $6A39
	dec $d005                                    // $6A3C
	lda $d005                                    // $6A3F
	cmp #$06                                     // $6A42
	.byte $B0, $24                               // $6A44  bcs $6A6A
	lda $d017                                    // $6A46  ; VIC_SPYEXP
	ora #$04                                     // $6A49
	sta $d017                                    // $6A4B  ; VIC_SPYEXP
	lda $d01d                                    // $6A4E  ; VIC_SPXEXP
	ora #$04                                     // $6A51
	sta $d01d                                    // $6A53  ; VIC_SPXEXP
	lda $d01b                                    // $6A56  ; VIC_SPPRI
	and #$fb                                     // $6A59
	sta $d01b                                    // $6A5B  ; VIC_SPPRI
	lda $dc04                                    // $6A5E
	sta $d004                                    // $6A61
	lda $52                                      // $6A64
	ora #$02                                     // $6A66
	sta $52                                      // $6A68
	jmp $6aa8                                    // $6A6A
	inc $d005                                    // $6A6D
	inc $d005                                    // $6A70
	lda $d005                                    // $6A73
	cmp #$f0                                     // $6A76
	.byte $90, $2E                               // $6A78  bcc $6AA8
	lda $d017                                    // $6A7A  ; VIC_SPYEXP
	and #$fb                                     // $6A7D
	sta $d017                                    // $6A7F  ; VIC_SPYEXP
	lda $d01d                                    // $6A82  ; VIC_SPXEXP
	and #$fb                                     // $6A85
	sta $d01d                                    // $6A87  ; VIC_SPXEXP
	lda $d01b                                    // $6A8A  ; VIC_SPPRI
	ora #$04                                     // $6A8D
	sta $d01b                                    // $6A8F  ; VIC_SPPRI
	lda #$90                                     // $6A92
	sta $d005                                    // $6A94
	lda $dc04                                    // $6A97
	sta $d004                                    // $6A9A
	lda #$b2                                     // $6A9D
	sta $07fa                                    // $6A9F
	lda $52                                      // $6AA2
	and #$fd                                     // $6AA4
	sta $52                                      // $6AA6
	lda $52                                      // $6AA8
	and #$04                                     // $6AAA
	.byte $D0, $37                               // $6AAC  bne $6AE5
	dec $d007                                    // $6AAE
	dec $d007                                    // $6AB1
	dec $d007                                    // $6AB4
	lda $d007                                    // $6AB7
	cmp #$08                                     // $6ABA
	.byte $B0, $24                               // $6ABC  bcs $6AE2
	lda $d017                                    // $6ABE  ; VIC_SPYEXP
	ora #$08                                     // $6AC1
	sta $d017                                    // $6AC3  ; VIC_SPYEXP
	lda $d01d                                    // $6AC6  ; VIC_SPXEXP
	ora #$08                                     // $6AC9
	sta $d01d                                    // $6ACB  ; VIC_SPXEXP
	lda $d01b                                    // $6ACE  ; VIC_SPPRI
	and #$f7                                     // $6AD1
	sta $d01b                                    // $6AD3  ; VIC_SPPRI
	lda $dc04                                    // $6AD6
	sta $d006                                    // $6AD9
	lda $52                                      // $6ADC
	ora #$04                                     // $6ADE
	sta $52                                      // $6AE0
	jmp $6b20                                    // $6AE2
	inc $d007                                    // $6AE5
	inc $d007                                    // $6AE8
	lda $d007                                    // $6AEB
	cmp #$f0                                     // $6AEE
	.byte $90, $2E                               // $6AF0  bcc $6B20
	lda $d017                                    // $6AF2  ; VIC_SPYEXP
	and #$f7                                     // $6AF5
	sta $d017                                    // $6AF7  ; VIC_SPYEXP
	lda $d01d                                    // $6AFA  ; VIC_SPXEXP
	and #$f7                                     // $6AFD
	sta $d01d                                    // $6AFF  ; VIC_SPXEXP
	lda $d01b                                    // $6B02  ; VIC_SPPRI
	ora #$08                                     // $6B05
	sta $d01b                                    // $6B07  ; VIC_SPPRI
	lda #$90                                     // $6B0A
	sta $d007                                    // $6B0C
	lda $dc04                                    // $6B0F
	sta $d006                                    // $6B12
	lda #$b2                                     // $6B15
	sta $07fb                                    // $6B17
	lda $52                                      // $6B1A
	and #$fb                                     // $6B1C
	sta $52                                      // $6B1E
	lda $d015                                    // $6B20  ; VIC_SPEN
	ora #$0e                                     // $6B23
	sta $d015                                    // $6B25  ; VIC_SPEN
	lda $d010                                    // $6B28  ; VIC_SPXMSB
	and #$f1                                     // $6B2B
	sta $d010                                    // $6B2D  ; VIC_SPXMSB
	jmp $740a                                    // $6B30
	nop                                          // $6B33
	nop                                          // $6B34
	lda $dc04                                    // $6B35
	cmp #$30                                     // $6B38
	.byte $B0, $03                               // $6B3A  bcs $6B3F
	jmp $6b50                                    // $6B3C
	cmp #$80                                     // $6B3F
	.byte $B0, $03                               // $6B41  bcs $6B46
	jmp $6b71                                    // $6B43
	cmp #$d0                                     // $6B46
	.byte $B0, $03                               // $6B48  bcs $6B4D
	jmp $6b92                                    // $6B4A
	jmp $6bb3                                    // $6B4D
	ldx #$0f                                     // $6B50
	dec $d003                                    // $6B52  ; VIC_SP1Y
	dec $d005                                    // $6B55
	inc $d002                                    // $6B58  ; VIC_SP1X
	inc $d004                                    // $6B5B
	.byte $D0, $03                               // $6B5E  bne $6B63
	jmp $6b92                                    // $6B60
	lda $d003                                    // $6B63  ; VIC_SP1Y
	cmp #$30                                     // $6B66
	.byte $B0, $03                               // $6B68  bcs $6B6D
	jmp $6b71                                    // $6B6A
	dex                                          // $6B6D
	.byte $10, $E2                               // $6B6E  bpl $6B52
	rts                                          // $6B70
	ldx #$0f                                     // $6B71
	inc $d003                                    // $6B73  ; VIC_SP1Y
	inc $d005                                    // $6B76
	inc $d002                                    // $6B79  ; VIC_SP1X
	inc $d004                                    // $6B7C
	.byte $D0, $03                               // $6B7F  bne $6B84
	jmp $6bb3                                    // $6B81
	lda $d003                                    // $6B84  ; VIC_SP1Y
	cmp #$c0                                     // $6B87
	.byte $90, $03                               // $6B89  bcc $6B8E
	jmp $6b50                                    // $6B8B
	dex                                          // $6B8E
	.byte $10, $E2                               // $6B8F  bpl $6B73
	rts                                          // $6B91
	ldx #$0f                                     // $6B92
	dec $d003                                    // $6B94  ; VIC_SP1Y
	dec $d005                                    // $6B97
	dec $d002                                    // $6B9A  ; VIC_SP1X
	dec $d004                                    // $6B9D
	.byte $D0, $03                               // $6BA0  bne $6BA5
	jmp $6b50                                    // $6BA2
	lda $d003                                    // $6BA5  ; VIC_SP1Y
	cmp #$30                                     // $6BA8
	.byte $B0, $03                               // $6BAA  bcs $6BAF
	jmp $6bb3                                    // $6BAC
	dex                                          // $6BAF
	.byte $10, $E2                               // $6BB0  bpl $6B94
	rts                                          // $6BB2
	ldx #$0f                                     // $6BB3
	inc $d003                                    // $6BB5  ; VIC_SP1Y
	inc $d005                                    // $6BB8
	dec $d002                                    // $6BBB  ; VIC_SP1X
	dec $d004                                    // $6BBE
	.byte $D0, $03                               // $6BC1  bne $6BC6
	jmp $6b71                                    // $6BC3
	lda $d003                                    // $6BC6  ; VIC_SP1Y
	cmp #$c0                                     // $6BC9
	.byte $90, $03                               // $6BCB  bcc $6BD0
	jmp $6b92                                    // $6BCD
	dex                                          // $6BD0
	.byte $10, $E2                               // $6BD1  bpl $6BB5
	rts                                          // $6BD3
	nop                                          // $6BD4
	lda $dc05                                    // $6BD5
	and #$07                                     // $6BD8
	tay                                          // $6BDA
	clc                                          // $6BDB
	lda #$ff                                     // $6BDC
	ror                                          // $6BDE
	dey                                          // $6BDF
	.byte $10, $FC                               // $6BE0  bpl $6BDE
	sta $52                                      // $6BE2
	ldx $51                                      // $6BE4
	lda $2dc0,x                                  // $6BE6
	and $52                                      // $6BE9
	sta $2dc0,x                                  // $6BEB
	lda $2e00,x                                  // $6BEE
	and $52                                      // $6BF1
	sta $2e00,x                                  // $6BF3
	dec $51                                      // $6BF6
	.byte $10, $2B                               // $6BF8  bpl $6C25
	lda #$3f                                     // $6BFA
	sta $51                                      // $6BFC
	lda #$00                                     // $6BFE
	sta $52                                      // $6C00
	ldx #$3f                                     // $6C02
	lda $2dc0,x                                  // $6C04
	.byte $F0, $02                               // $6C07  beq $6C0B
	inc $52                                      // $6C09
	dex                                          // $6C0B
	.byte $10, $F6                               // $6C0C  bpl $6C04
	lda $52                                      // $6C0E
	cmp #$10                                     // $6C10
	.byte $B0, $11                               // $6C12  bcs $6C25
	lda #$ff                                     // $6C14
	sta $53                                      // $6C16
	ldx #$3f                                     // $6C18
	lda #$00                                     // $6C1A
	sta $2dc0,x                                  // $6C1C
	sta $2e00,x                                  // $6C1F
	dex                                          // $6C22
	.byte $10, $F7                               // $6C23  bpl $6C1C
	rts                                          // $6C25
	nop                                          // $6C26
	nop                                          // $6C27
	nop                                          // $6C28
	nop                                          // $6C29
	lda #$40                                     // $6C2A
	sta $51                                      // $6C2C
	lda #$d2                                     // $6C2E
	sta $d007                                    // $6C30
	ldx #$10                                     // $6C33
	lda $5d51,x                                  // $6C35
	sta $30,x                                    // $6C38
	dex                                          // $6C3A
	.byte $10, $F8                               // $6C3B  bpl $6C35
	rts                                          // $6C3D
	nop                                          // $6C3E
	nop                                          // $6C3F
	lda $51                                      // $6C40
	cmp #$08                                     // $6C42
	.byte $90, $03                               // $6C44  bcc $6C49
	jmp $6cf1                                    // $6C46
	lda $52                                      // $6C49
	cmp #$01                                     // $6C4B
	.byte $D0, $03                               // $6C4D  bne $6C52
	jmp $6c63                                    // $6C4F
	cmp #$02                                     // $6C52
	.byte $D0, $03                               // $6C54  bne $6C59
	jmp $6c9b                                    // $6C56
	cmp #$03                                     // $6C59
	.byte $D0, $03                               // $6C5B  bne $6C60
	jmp $6caa                                    // $6C5D
	jmp $6cdf                                    // $6C60
	lda $51                                      // $6C63
	.byte $F0, $15                               // $6C65  beq $6C7C
	lda $37                                      // $6C67
	clc                                          // $6C69
	asl                                          // $6C6A
	tay                                          // $6C6B
	lda $d000,y                                  // $6C6C  ; VIC_SP0X
	adc #$0c                                     // $6C6F
	sta $d000,y                                  // $6C71  ; VIC_SP0X
	lda $d001,y                                  // $6C74  ; VIC_SP0Y
	adc #$0a                                     // $6C77
	sta $d001,y                                  // $6C79  ; VIC_SP0Y
	lda $d017                                    // $6C7C  ; VIC_SPYEXP
	and $3e                                      // $6C7F
	sta $d017                                    // $6C81  ; VIC_SPYEXP
	lda $d01d                                    // $6C84  ; VIC_SPXEXP
	and $3e                                      // $6C87
	sta $d01d                                    // $6C89  ; VIC_SPXEXP
	ldy $37                                      // $6C8C
	lda #$dd                                     // $6C8E
	sta $07f8,y                                  // $6C90
	lda #$01                                     // $6C93
	sta $d027,y                                  // $6C95
	inc $52                                      // $6C98
	rts                                          // $6C9A
	ldy $37                                      // $6C9B
	lda #$de                                     // $6C9D
	sta $07f8,y                                  // $6C9F
	lda #$03                                     // $6CA2
	sta $d027,y                                  // $6CA4
	inc $52                                      // $6CA7
	rts                                          // $6CA9
	lda $d017                                    // $6CAA  ; VIC_SPYEXP
	ora $3d                                      // $6CAD
	sta $d017                                    // $6CAF  ; VIC_SPYEXP
	lda $d01d                                    // $6CB2  ; VIC_SPXEXP
	ora $3d                                      // $6CB5
	sta $d01d                                    // $6CB7  ; VIC_SPXEXP
	lda $37                                      // $6CBA
	clc                                          // $6CBC
	asl                                          // $6CBD
	tay                                          // $6CBE
	sec                                          // $6CBF
	lda $d000,y                                  // $6CC0  ; VIC_SP0X
	sbc #$0c                                     // $6CC3
	sta $d000,y                                  // $6CC5  ; VIC_SP0X
	lda $d001,y                                  // $6CC8  ; VIC_SP0Y
	sbc #$0a                                     // $6CCB
	sta $d001,y                                  // $6CCD  ; VIC_SP0Y
	ldy $37                                      // $6CD0
	lda #$dd                                     // $6CD2
	sta $07f8,y                                  // $6CD4
	lda #$07                                     // $6CD7
	sta $d027,y                                  // $6CD9
	inc $52                                      // $6CDC
	rts                                          // $6CDE
	ldy $37                                      // $6CDF
	lda #$de                                     // $6CE1
	sta $07f8,y                                  // $6CE3
	lda #$0a                                     // $6CE6
	sta $d027,y                                  // $6CE8
	lda #$01                                     // $6CEB
	sta $52                                      // $6CED
	inc $51                                      // $6CEF
	rts                                          // $6CF1
	nop                                          // $6CF2
	nop                                          // $6CF3
	nop                                          // $6CF4
	lda $d012                                    // $6CF5  ; VIC_RASTER
	.byte $D0, $2D                               // $6CF8  bne $6D27
	lda $dc04                                    // $6CFA
	and #$0f                                     // $6CFD
	cmp #$04                                     // $6CFF
	.byte $D0, $25                               // $6D01  bne $6D28
	jsr $7f1a                                    // $6D03
	lda #$01                                     // $6D06
	sta $d021                                    // $6D08  ; VIC_BG0
	lda #$01                                     // $6D0B
	sta $d02e                                    // $6D0D
	lda #$07                                     // $6D10
	sta $d025                                    // $6D12  ; VIC_SPMCOL0
	lda #$00                                     // $6D15
	sta $d026                                    // $6D17  ; VIC_SPMCOL1
	lda #$02                                     // $6D1A
	sta $d028                                    // $6D1C
	sta $d029                                    // $6D1F
	lda #$02                                     // $6D22
	sta $d02a                                    // $6D24
	rts                                          // $6D27
	lda $d012                                    // $6D28  ; VIC_RASTER
	.byte $D0, $FB                               // $6D2B  bne $6D28
	lda #$00                                     // $6D2D
	sta $d021                                    // $6D2F  ; VIC_BG0
	sta $d025                                    // $6D32  ; VIC_SPMCOL0
	sta $d026                                    // $6D35  ; VIC_SPMCOL1
	sta $d028                                    // $6D38
	sta $d029                                    // $6D3B
	sta $d02a                                    // $6D3E
	jmp $7f2f                                    // $6D41
	nop                                          // $6D44
	lda #$b4                                     // $6D45
	sta $07f9                                    // $6D47
	lda #$00                                     // $6D4A
	sta $d028                                    // $6D4C
	lda #$b5                                     // $6D4F
	sta $07fa                                    // $6D51
	lda #$07                                     // $6D54
	sta $d029                                    // $6D56
	lda $d017                                    // $6D59  ; VIC_SPYEXP
	ora #$06                                     // $6D5C
	sta $d017                                    // $6D5E  ; VIC_SPYEXP
	lda $d01d                                    // $6D61  ; VIC_SPXEXP
	ora #$06                                     // $6D64
	sta $d01d                                    // $6D66  ; VIC_SPXEXP
	lda $d01b                                    // $6D69  ; VIC_SPPRI
	and #$f9                                     // $6D6C
	sta $d01b                                    // $6D6E  ; VIC_SPPRI
	lda #$20                                     // $6D71
	sta $d003                                    // $6D73  ; VIC_SP1Y
	sta $d005                                    // $6D76
	lda #$a0                                     // $6D79
	sta $d002                                    // $6D7B  ; VIC_SP1X
	sta $d004                                    // $6D7E
	lda $d010                                    // $6D81  ; VIC_SPXMSB
	and #$f9                                     // $6D84
	sta $d010                                    // $6D86  ; VIC_SPXMSB
	lda $d015                                    // $6D89  ; VIC_SPEN
	ora #$06                                     // $6D8C
	sta $d015                                    // $6D8E  ; VIC_SPEN
	lda $d01c                                    // $6D91  ; VIC_SPMCOL
	and #$f9                                     // $6D94
	sta $d01c                                    // $6D96  ; VIC_SPMCOL
	ldx #$10                                     // $6D99
	lda $5d62,x                                  // $6D9B
	sta $30,x                                    // $6D9E
	dex                                          // $6DA0
	.byte $10, $F8                               // $6DA1  bpl $6D9B
	rts                                          // $6DA3
	nop                                          // $6DA4
	lda $57                                      // $6DA5
	and #$0f                                     // $6DA7
	.byte $D0, $1B                               // $6DA9  bne $6DC6
	lda #$c2                                     // $6DAB
	sta $07f9                                    // $6DAD
	sta $38                                      // $6DB0
	lda #$c3                                     // $6DB2
	sta $3a                                      // $6DB4
	lda $d010                                    // $6DB6  ; VIC_SPXMSB
	ora #$02                                     // $6DB9
	sta $d010                                    // $6DBB  ; VIC_SPXMSB
	lda #$60                                     // $6DBE
	sta $d002                                    // $6DC0  ; VIC_SP1X
	jmp $6dde                                    // $6DC3
	lda #$c4                                     // $6DC6
	sta $07f9                                    // $6DC8
	sta $38                                      // $6DCB
	lda #$c5                                     // $6DCD
	sta $3a                                      // $6DCF
	lda $d010                                    // $6DD1  ; VIC_SPXMSB
	and #$fd                                     // $6DD4
	sta $d010                                    // $6DD6  ; VIC_SPXMSB
	lda #$00                                     // $6DD9
	sta $d002                                    // $6DDB  ; VIC_SP1X
	lda #$00                                     // $6DDE
	sta $d028                                    // $6DE0
	sta $39                                      // $6DE3
	sta $3b                                      // $6DE5
	lda #$01                                     // $6DE7
	sta $37                                      // $6DE9
	sta $3f                                      // $6DEB
	sta $40                                      // $6DED
	lda #$02                                     // $6DEF
	sta $3c                                      // $6DF1
	sta $3d                                      // $6DF3
	lda #$fd                                     // $6DF5
	sta $3e                                      // $6DF7
	lda #$80                                     // $6DF9
	sta $d003                                    // $6DFB  ; VIC_SP1Y
	lda $d017                                    // $6DFE  ; VIC_SPYEXP
	ora #$02                                     // $6E01
	sta $d017                                    // $6E03  ; VIC_SPYEXP
	lda $d01d                                    // $6E06  ; VIC_SPXEXP
	ora #$02                                     // $6E09
	sta $d01d                                    // $6E0B  ; VIC_SPXEXP
	lda $d01b                                    // $6E0E  ; VIC_SPPRI
	and #$fd                                     // $6E11
	sta $d01b                                    // $6E13  ; VIC_SPPRI
	lda $d01c                                    // $6E16  ; VIC_SPMCOL
	and #$fd                                     // $6E19
	sta $d01c                                    // $6E1B  ; VIC_SPMCOL
	lda $d015                                    // $6E1E  ; VIC_SPEN
	ora #$02                                     // $6E21
	sta $d015                                    // $6E23  ; VIC_SPEN
	rts                                          // $6E26
	nop                                          // $6E27
	nop                                          // $6E28
	nop                                          // $6E29
	lda $dc04                                    // $6E2A
	and #$01                                     // $6E2D
	.byte $F0, $04                               // $6E2F  beq $6E35
	jmp $6e55                                    // $6E31
	nop                                          // $6E34
	lda $4e                                      // $6E35
	cmp #$10                                     // $6E37
	.byte $D0, $0B                               // $6E39  bne $6E46
	lda #$b9                                     // $6E3B
	sta $38                                      // $6E3D
	lda #$ba                                     // $6E3F
	sta $3a                                      // $6E41
	jmp $6e4e                                    // $6E43
	lda #$c2                                     // $6E46
	sta $38                                      // $6E48
	lda #$c3                                     // $6E4A
	sta $3a                                      // $6E4C
	lda #$f0                                     // $6E4E
	sta $57                                      // $6E50
	rts                                          // $6E52
	nop                                          // $6E53
	nop                                          // $6E54
	lda $4e                                      // $6E55
	cmp #$10                                     // $6E57
	.byte $D0, $0B                               // $6E59  bne $6E66
	lda #$c0                                     // $6E5B
	sta $38                                      // $6E5D
	lda #$c1                                     // $6E5F
	sta $3a                                      // $6E61
	jmp $6e6e                                    // $6E63
	lda #$c4                                     // $6E66
	sta $38                                      // $6E68
	lda #$c5                                     // $6E6A
	sta $3a                                      // $6E6C
	lda #$0f                                     // $6E6E
	sta $57                                      // $6E70
	rts                                          // $6E72
	nop                                          // $6E73
	nop                                          // $6E74
	lda $50                                      // $6E75
	and #$01                                     // $6E77
	.byte $F0, $1B                               // $6E79  beq $6E96
	lda #$c8                                     // $6E7B
	sta $07f9                                    // $6E7D
	sta $38                                      // $6E80
	lda #$c9                                     // $6E82
	sta $3a                                      // $6E84
	lda $d010                                    // $6E86  ; VIC_SPXMSB
	ora #$02                                     // $6E89
	sta $d010                                    // $6E8B  ; VIC_SPXMSB
	lda #$70                                     // $6E8E
	sta $d002                                    // $6E90  ; VIC_SP1X
	jmp $6eae                                    // $6E93
	lda #$c6                                     // $6E96
	sta $07f9                                    // $6E98
	sta $38                                      // $6E9B
	lda #$c7                                     // $6E9D
	sta $3a                                      // $6E9F
	lda $d010                                    // $6EA1  ; VIC_SPXMSB
	and #$fd                                     // $6EA4
	sta $d010                                    // $6EA6  ; VIC_SPXMSB
	lda #$00                                     // $6EA9
	sta $d002                                    // $6EAB  ; VIC_SP1X
	lda #$02                                     // $6EAE
	sta $d028                                    // $6EB0
	sta $3c                                      // $6EB3
	sta $3d                                      // $6EB5
	sta $39                                      // $6EB7
	sta $3b                                      // $6EB9
	lda #$01                                     // $6EBB
	sta $37                                      // $6EBD
	lda #$fd                                     // $6EBF
	sta $3e                                      // $6EC1
	lda #$08                                     // $6EC3
	sta $3f                                      // $6EC5
	sta $40                                      // $6EC7
	lda $d017                                    // $6EC9  ; VIC_SPYEXP
	ora #$02                                     // $6ECC
	sta $d017                                    // $6ECE  ; VIC_SPYEXP
	lda $d01d                                    // $6ED1  ; VIC_SPXEXP
	ora #$02                                     // $6ED4
	sta $d01d                                    // $6ED6  ; VIC_SPXEXP
	lda $d01c                                    // $6ED9  ; VIC_SPMCOL
	and #$fd                                     // $6EDC
	sta $d01c                                    // $6EDE  ; VIC_SPMCOL
	lda $d01b                                    // $6EE1  ; VIC_SPPRI
	ora #$02                                     // $6EE4
	sta $d01b                                    // $6EE6  ; VIC_SPPRI
	lda #$10                                     // $6EE9
	sta $d003                                    // $6EEB  ; VIC_SP1Y
	lda $d015                                    // $6EEE  ; VIC_SPEN
	ora #$02                                     // $6EF1
	sta $d015                                    // $6EF3  ; VIC_SPEN
	rts                                          // $6EF6
	nop                                          // $6EF7
	nop                                          // $6EF8
	nop                                          // $6EF9
	lda #$03                                     // $6EFA
	sta $37                                      // $6EFC
	lda #$ca                                     // $6EFE
	sta $07f9                                    // $6F00
	sta $38                                      // $6F03
	sta $3a                                      // $6F05
	lda #$cb                                     // $6F07
	sta $07fa                                    // $6F09
	lda #$02                                     // $6F0C
	sta $d028                                    // $6F0E
	sta $d029                                    // $6F11
	sta $39                                      // $6F14
	sta $3b                                      // $6F16
	lda $d01c                                    // $6F18  ; VIC_SPMCOL
	ora #$06                                     // $6F1B
	sta $d01c                                    // $6F1D  ; VIC_SPMCOL
	lda $d017                                    // $6F20  ; VIC_SPYEXP
	and #$f9                                     // $6F23
	sta $d017                                    // $6F25  ; VIC_SPYEXP
	lda $d01d                                    // $6F28  ; VIC_SPXEXP
	and #$f9                                     // $6F2B
	sta $d01d                                    // $6F2D  ; VIC_SPXEXP
	lda $d010                                    // $6F30  ; VIC_SPXMSB
	ora #$06                                     // $6F33
	sta $d010                                    // $6F35  ; VIC_SPXMSB
	lda $d01b                                    // $6F38  ; VIC_SPPRI
	ora #$06                                     // $6F3B
	sta $d01b                                    // $6F3D  ; VIC_SPPRI
	lda #$30                                     // $6F40
	sta $d003                                    // $6F42  ; VIC_SP1Y
	sta $d005                                    // $6F45
	lda #$60                                     // $6F48
	sta $d002                                    // $6F4A  ; VIC_SP1X
	lda #$78                                     // $6F4D
	sta $d004                                    // $6F4F
	lda $d015                                    // $6F52  ; VIC_SPEN
	ora #$06                                     // $6F55
	sta $d015                                    // $6F57  ; VIC_SPEN
	rts                                          // $6F5A
	nop                                          // $6F5B
	lda $50                                      // $6F5C
	cmp #$07                                     // $6F5E
	.byte $D0, $03                               // $6F60  bne $6F65
	jmp $7054                                    // $6F62
	cmp #$06                                     // $6F65
	.byte $D0, $03                               // $6F67  bne $6F6C
	jmp $703c                                    // $6F69
	cmp #$05                                     // $6F6C
	.byte $D0, $03                               // $6F6E  bne $6F73
	jmp $6feb                                    // $6F70
	and #$01                                     // $6F73
	.byte $F0, $34                               // $6F75  beq $6FAB
	ldx #$02                                     // $6F77
	dec $d002                                    // $6F79  ; VIC_SP1X
	.byte $D0, $03                               // $6F7C  bne $6F81
	jsr $6f87                                    // $6F7E
	dex                                          // $6F81
	.byte $10, $F5                               // $6F82  bpl $6F79
	jmp $6f93                                    // $6F84
	lda $d010                                    // $6F87  ; VIC_SPXMSB
	and #$fd                                     // $6F8A
	sta $d010                                    // $6F8C  ; VIC_SPXMSB
	dec $d002                                    // $6F8F  ; VIC_SP1X
	rts                                          // $6F92
	lda $d002                                    // $6F93  ; VIC_SP1X
	cmp #$05                                     // $6F96
	.byte $B0, $0D                               // $6F98  bcs $6FA7
	lda $d010                                    // $6F9A  ; VIC_SPXMSB
	and #$02                                     // $6F9D
	.byte $D0, $06                               // $6F9F  bne $6FA7
	inc $50                                      // $6FA1
	jsr $6e75                                    // $6FA3
	rts                                          // $6FA6
	inc $d003                                    // $6FA7  ; VIC_SP1Y
	rts                                          // $6FAA
	ldx #$02                                     // $6FAB
	inc $d002                                    // $6FAD  ; VIC_SP1X
	.byte $D0, $03                               // $6FB0  bne $6FB5
	jsr $6fbb                                    // $6FB2
	dex                                          // $6FB5
	.byte $10, $F5                               // $6FB6  bpl $6FAD
	jmp $6fc7                                    // $6FB8
	lda $d010                                    // $6FBB  ; VIC_SPXMSB
	ora #$02                                     // $6FBE
	sta $d010                                    // $6FC0  ; VIC_SPXMSB
	inc $d002                                    // $6FC3  ; VIC_SP1X
	rts                                          // $6FC6
	lda $d002                                    // $6FC7  ; VIC_SP1X
	cmp #$60                                     // $6FCA
	.byte $90, $19                               // $6FCC  bcc $6FE7
	lda $d010                                    // $6FCE  ; VIC_SPXMSB
	and #$02                                     // $6FD1
	.byte $F0, $12                               // $6FD3  beq $6FE7
	inc $50                                      // $6FD5
	lda $50                                      // $6FD7
	cmp #$05                                     // $6FD9
	.byte $D0, $06                               // $6FDB  bne $6FE3
	jsr $6efe                                    // $6FDD
	jmp $6fe6                                    // $6FE0
	jsr $6e75                                    // $6FE3
	rts                                          // $6FE6
	inc $d003                                    // $6FE7  ; VIC_SP1Y
	rts                                          // $6FEA
	ldx #$04                                     // $6FEB
	dec $d002                                    // $6FED  ; VIC_SP1X
	.byte $D0, $03                               // $6FF0  bne $6FF5
	jsr $7003                                    // $6FF2
	dec $d004                                    // $6FF5
	.byte $D0, $03                               // $6FF8  bne $6FFD
	jsr $7012                                    // $6FFA
	dex                                          // $6FFD
	.byte $10, $ED                               // $6FFE  bpl $6FED
	jmp $7021                                    // $7000
	lda $d010                                    // $7003  ; VIC_SPXMSB
	and #$fd                                     // $7006
	sta $d010                                    // $7008  ; VIC_SPXMSB
	dec $d002                                    // $700B  ; VIC_SP1X
	dec $d004                                    // $700E
	rts                                          // $7011
	lda $d010                                    // $7012  ; VIC_SPXMSB
	and #$fb                                     // $7015
	sta $d010                                    // $7017  ; VIC_SPXMSB
	dec $d002                                    // $701A  ; VIC_SP1X
	dec $d004                                    // $701D
	rts                                          // $7020
	lda $d002                                    // $7021  ; VIC_SP1X
	cmp #$40                                     // $7024
	.byte $B0, $0D                               // $7026  bcs $7035
	lda $d010                                    // $7028  ; VIC_SPXMSB
	and #$02                                     // $702B
	.byte $D0, $06                               // $702D  bne $7035
	inc $50                                      // $702F
	jsr $7fa0                                    // $7031
	rts                                          // $7034
	inc $d003                                    // $7035  ; VIC_SP1Y
	inc $d005                                    // $7038
	rts                                          // $703B
	ldx #$03                                     // $703C
	inc $d002                                    // $703E  ; VIC_SP1X
	inc $d004                                    // $7041
	dex                                          // $7044
	.byte $10, $F7                               // $7045  bpl $703E
	lda $d002                                    // $7047  ; VIC_SP1X
	cmp #$c8                                     // $704A
	.byte $90, $05                               // $704C  bcc $7053
	inc $50                                      // $704E
	jsr $7fba                                    // $7050
	rts                                          // $7053
	ldx #$03                                     // $7054
	dec $d002                                    // $7056  ; VIC_SP1X
	dec $d003                                    // $7059  ; VIC_SP1Y
	dec $d004                                    // $705C
	dec $d005                                    // $705F
	dex                                          // $7062
	.byte $10, $F1                               // $7063  bpl $7056
	lda $d003                                    // $7065  ; VIC_SP1Y
	cmp #$0a                                     // $7068
	.byte $B0, $04                               // $706A  bcs $7070
	lda #$00                                     // $706C
	sta $50                                      // $706E
	rts                                          // $7070
	nop                                          // $7071
	nop                                          // $7072
	nop                                          // $7073
	nop                                          // $7074
	lda #$00                                     // $7075
	sta $33                                      // $7077
	lda #$50                                     // $7079
	sta $30                                      // $707B
	sta $34                                      // $707D
	lda #$53                                     // $707F
	sta $31                                      // $7081
	sta $35                                      // $7083
	lda #$08                                     // $7085
	sta $36                                      // $7087
	sta $32                                      // $7089
	lda #$38                                     // $708B
	sta $50                                      // $708D
	lda #$dd                                     // $708F
	sta $07fb                                    // $7091
	lda #$02                                     // $7094
	sta $d02a                                    // $7096
	lda $d010                                    // $7099  ; VIC_SPXMSB
	and #$f7                                     // $709C
	sta $d010                                    // $709E  ; VIC_SPXMSB
	lda #$a8                                     // $70A1
	sta $d006                                    // $70A3
	lda #$c4                                     // $70A6
	sta $d007                                    // $70A8
	lda $d015                                    // $70AB  ; VIC_SPEN
	and #$fe                                     // $70AE
	ora #$08                                     // $70B0
	sta $d015                                    // $70B2  ; VIC_SPEN
	lda #$21                                     // $70B5
	sta $d404                                    // $70B7  ; SID_CR1
	lda $16                                      // $70BA
	cmp #$28                                     // $70BC
	.byte $90, $04                               // $70BE  bcc $70C4
	lda #$00                                     // $70C0
	sta $16                                      // $70C2
	inc $16                                      // $70C4
	inc $16                                      // $70C6
	jsr $61ca                                    // $70C8
	jsr $61a0                                    // $70CB
	lda $07fb                                    // $70CE
	cmp #$dd                                     // $70D1
	.byte $D0, $08                               // $70D3  bne $70DD
	lda #$de                                     // $70D5
	sta $07fb                                    // $70D7
	jmp $70e2                                    // $70DA
	lda #$dd                                     // $70DD
	sta $07fb                                    // $70DF
	ldx #$48                                     // $70E2
	ldy #$ff                                     // $70E4
	dey                                          // $70E6
	.byte $D0, $FD                               // $70E7  bne $70E6
	dex                                          // $70E9
	.byte $D0, $F8                               // $70EA  bne $70E4
	lda $50                                      // $70EC
	cmp #$20                                     // $70EE
	.byte $D0, $08                               // $70F0  bne $70FA
	lda $d017                                    // $70F2  ; VIC_SPYEXP
	ora #$08                                     // $70F5
	sta $d017                                    // $70F7  ; VIC_SPYEXP
	dec $50                                      // $70FA
	.byte $D0, $BC                               // $70FC  bne $70BA
	ldx #$00                                     // $70FE
	lda $07c3,x                                  // $7100
	sta $60,x                                    // $7103
	inx                                          // $7105
	cpx #$08                                     // $7106
	.byte $D0, $F6                               // $7108  bne $7100
	jmp $1660                                    // $710A
	nop                                          // $710D
	nop                                          // $710E
	nop                                          // $710F
	ldx #$00                                     // $7110
	ldy #$00                                     // $7112
	lda $5860,x                                  // $7114
	.byte $F0, $06                               // $7117  beq $711F
	sta ($58),y                                  // $7119
	lda #$0a                                     // $711B
	sta ($5a),y                                  // $711D
	inx                                          // $711F
	cpx $5c                                      // $7120
	.byte $F0, $0B                               // $7122  beq $712F
	iny                                          // $7124
	cpy $5d                                      // $7125
	.byte $D0, $EB                               // $7127  bne $7114
	jsr $714d                                    // $7129
	jmp $7112                                    // $712C
	cpx #$a8                                     // $712F
	.byte $F0, $2D                               // $7131  beq $7160
	lda #$4c                                     // $7133
	sta $58                                      // $7135
	sta $5a                                      // $7137
	lda #$05                                     // $7139
	sta $59                                      // $713B
	lda #$d9                                     // $713D
	sta $5b                                      // $713F
	lda #$a8                                     // $7141
	sta $5c                                      // $7143
	lda #$0f                                     // $7145
	sta $5d                                      // $7147
	jmp $7112                                    // $7149
	rts                                          // $714C
	clc                                          // $714D
	lda $58                                      // $714E
	adc #$28                                     // $7150
	sta $58                                      // $7152
	sta $5a                                      // $7154
	.byte $90, $04                               // $7156  bcc $715C
	inc $59                                      // $7158
	inc $5b                                      // $715A
	rts                                          // $715C
	nop                                          // $715D
	nop                                          // $715E
	nop                                          // $715F
	lda #$91                                     // $7160
	sta $58                                      // $7162
	sta $5a                                      // $7164
	lda #$06                                     // $7166
	sta $59                                      // $7168
	lda #$da                                     // $716A
	sta $5b                                      // $716C
	lda #$0c                                     // $716E
	sta $5c                                      // $7170
	lda #$04                                     // $7172
	sta $5d                                      // $7174
	ldx #$00                                     // $7176
	ldy #$00                                     // $7178
	lda $5908,x                                  // $717A
	.byte $F0, $06                               // $717D  beq $7185
	sta ($58),y                                  // $717F
	lda $45                                      // $7181
	sta ($5a),y                                  // $7183
	inx                                          // $7185
	cpx $5c                                      // $7186
	.byte $F0, $0B                               // $7188  beq $7195
	iny                                          // $718A
	cpy $5d                                      // $718B
	.byte $D0, $EB                               // $718D  bne $717A
	jsr $714d                                    // $718F
	jmp $7178                                    // $7192
	cpx #$40                                     // $7195
	.byte $F0, $19                               // $7197  beq $71B2
	lda #$28                                     // $7199
	sta $58                                      // $719B
	sta $5a                                      // $719D
	lda #$07                                     // $719F
	sta $59                                      // $71A1
	lda #$db                                     // $71A3
	sta $5b                                      // $71A5
	lda #$40                                     // $71A7
	sta $5c                                      // $71A9
	lda #$17                                     // $71AB
	sta $5d                                      // $71AD
	jmp $7178                                    // $71AF
	rts                                          // $71B2
	nop                                          // $71B3
	nop                                          // $71B4
	ldx #$00                                     // $71B5
	ldy #$00                                     // $71B7
	lda $59b0,x                                  // $71B9
	cmp #$ff                                     // $71BC
	.byte $F0, $06                               // $71BE  beq $71C6
	sta ($58),y                                  // $71C0
	lda #$0a                                     // $71C2
	sta ($5a),y                                  // $71C4
	inx                                          // $71C6
	cpx #$69                                     // $71C7
	.byte $F0, $17                               // $71C9  beq $71E2
	iny                                          // $71CB
	cpy #$15                                     // $71CC
	.byte $D0, $E9                               // $71CE  bne $71B9
	clc                                          // $71D0
	lda $58                                      // $71D1
	adc #$28                                     // $71D3
	sta $58                                      // $71D5
	sta $5a                                      // $71D7
	.byte $90, $04                               // $71D9  bcc $71DF
	inc $59                                      // $71DB
	inc $5b                                      // $71DD
	jmp $71b7                                    // $71DF
	lda #$5a                                     // $71E2
	sta $58                                      // $71E4
	sta $5a                                      // $71E6
	lda #$04                                     // $71E8
	sta $59                                      // $71EA
	lda #$d8                                     // $71EC
	sta $5b                                      // $71EE
	rts                                          // $71F0
	nop                                          // $71F1
	nop                                          // $71F2
	nop                                          // $71F3
	nop                                          // $71F4
	lda #$01                                     // $71F5
	sta $50                                      // $71F7
	jsr $6e75                                    // $71F9
	lda #$04                                     // $71FC
	sta $55                                      // $71FE
	jsr $6f5c                                    // $7200
	jsr $61a0                                    // $7203
	lda $55                                      // $7206
	cmp #$04                                     // $7208
	.byte $90, $0B                               // $720A  bcc $7217
	lda $33                                      // $720C
	cmp #$2a                                     // $720E
	.byte $D0, $05                               // $7210  bne $7217
	jsr $71b5                                    // $7212
	dec $55                                      // $7215
	lda $55                                      // $7217
	cmp #$03                                     // $7219
	.byte $90, $0E                               // $721B  bcc $722B
	lda $33                                      // $721D
	cmp #$8a                                     // $721F
	.byte $90, $08                               // $7221  bcc $722B
	jsr $6090                                    // $7223
	jsr $7110                                    // $7226
	dec $55                                      // $7229
	lda $50                                      // $722B
	.byte $D0, $06                               // $722D  bne $7235
	jsr $61ca                                    // $722F
	jmp $724e                                    // $7232
	cmp #$05                                     // $7235
	.byte $D0, $0B                               // $7237  bne $7244
	lda $55                                      // $7239
	cmp #$02                                     // $723B
	.byte $90, $05                               // $723D  bcc $7244
	jsr $6090                                    // $723F
	dec $55                                      // $7242
	ldx #$18                                     // $7244
	ldy #$ff                                     // $7246
	dey                                          // $7248
	.byte $D0, $FD                               // $7249  bne $7248
	dex                                          // $724B
	.byte $D0, $F8                               // $724C  bne $7246
	lda $50                                      // $724E
	.byte $D0, $AE                               // $7250  bne $7200
	lda #$0c                                     // $7252
	sta $36                                      // $7254
	rts                                          // $7256
	nop                                          // $7257
	nop                                          // $7258
	nop                                          // $7259
	dec $32                                      // $725A
	.byte $F0, $03                               // $725C  beq $7261
	jmp $72d9                                    // $725E
	lda $36                                      // $7261
	sta $32                                      // $7263
	ldy $33                                      // $7265
	lda ($34),y                                  // $7267
	cmp #$ff                                     // $7269
	.byte $D0, $03                               // $726B  bne $7270
	jmp $72e1                                    // $726D
	sta $d401                                    // $7270  ; SID_FR1HI
	inc $33                                      // $7273
	iny                                          // $7275
	.byte $D0, $02                               // $7276  bne $727A
	inc $35                                      // $7278
	lda ($34),y                                  // $727A
	cmp #$ff                                     // $727C
	.byte $D0, $03                               // $727E  bne $7283
	jmp $72e1                                    // $7280
	sta $d400                                    // $7283  ; SID_FR1LO
	inc $33                                      // $7286
	iny                                          // $7288
	.byte $D0, $02                               // $7289  bne $728D
	inc $35                                      // $728B
	lda ($34),y                                  // $728D
	cmp #$ff                                     // $728F
	.byte $D0, $03                               // $7291  bne $7296
	jmp $72e1                                    // $7293
	sta $d408                                    // $7296
	inc $33                                      // $7299
	iny                                          // $729B
	.byte $D0, $02                               // $729C  bne $72A0
	inc $35                                      // $729E
	lda ($34),y                                  // $72A0
	cmp #$ff                                     // $72A2
	.byte $D0, $03                               // $72A4  bne $72A9
	jmp $72e1                                    // $72A6
	sta $d407                                    // $72A9
	inc $33                                      // $72AC
	iny                                          // $72AE
	.byte $D0, $02                               // $72AF  bne $72B3
	inc $35                                      // $72B1
	lda ($34),y                                  // $72B3
	cmp #$ff                                     // $72B5
	.byte $D0, $03                               // $72B7  bne $72BC
	jmp $72e1                                    // $72B9
	sta $d40f                                    // $72BC  ; SID_FLTHI
	inc $33                                      // $72BF
	iny                                          // $72C1
	.byte $D0, $02                               // $72C2  bne $72C6
	inc $35                                      // $72C4
	lda ($34),y                                  // $72C6
	cmp #$ff                                     // $72C8
	.byte $D0, $03                               // $72CA  bne $72CF
	jmp $72e1                                    // $72CC
	sta $d40e                                    // $72CF  ; SID_FLTLO
	inc $33                                      // $72D2
	iny                                          // $72D4
	.byte $D0, $02                               // $72D5  bne $72D9
	inc $35                                      // $72D7
	lda #$10                                     // $72D9
	sta $d01a                                    // $72DB  ; VIC_IRQEN
	jmp $72f2                                    // $72DE
	lda #$00                                     // $72E1
	sta $33                                      // $72E3
	lda $30                                      // $72E5
	sta $34                                      // $72E7
	lda $31                                      // $72E9
	sta $35                                      // $72EB
	lda #$10                                     // $72ED
	sta $d01a                                    // $72EF  ; VIC_IRQEN
	jsr $6710                                    // $72F2
	jmp $ea31                                    // $72F5
	nop                                          // $72F8
	nop                                          // $72F9
	lda #$00                                     // $72FA
	sta $d01a                                    // $72FC  ; VIC_IRQEN
	lda #$5a                                     // $72FF
	sta $0314                                    // $7301
	lda #$72                                     // $7304
	sta $0315                                    // $7306
	lda #$10                                     // $7309
	sta $d01a                                    // $730B  ; VIC_IRQEN
	rts                                          // $730E
	nop                                          // $730F
	lda $d003                                    // $7310  ; VIC_SP1Y
	cmp #$70                                     // $7313
	.byte $B0, $20                               // $7315  bcs $7337
	lda $d017                                    // $7317  ; VIC_SPYEXP
	and #$f9                                     // $731A
	sta $d017                                    // $731C  ; VIC_SPYEXP
	lda $d01d                                    // $731F  ; VIC_SPXEXP
	and #$f9                                     // $7322
	sta $d01d                                    // $7324  ; VIC_SPXEXP
	lda $d01b                                    // $7327  ; VIC_SPPRI
	ora #$06                                     // $732A
	sta $d01b                                    // $732C  ; VIC_SPPRI
	lda #$08                                     // $732F
	sta $d418                                    // $7331  ; SID_FMODE
	jmp $7360                                    // $7334
	lda $d017                                    // $7337  ; VIC_SPYEXP
	ora #$06                                     // $733A
	sta $d017                                    // $733C  ; VIC_SPYEXP
	lda $d01d                                    // $733F  ; VIC_SPXEXP
	ora #$06                                     // $7342
	sta $d01d                                    // $7344  ; VIC_SPXEXP
	lda $d01b                                    // $7347  ; VIC_SPPRI
	and #$f9                                     // $734A
	sta $d01b                                    // $734C  ; VIC_SPPRI
	lda $d002                                    // $734F  ; VIC_SP1X
	sta $d004                                    // $7352
	lda $d003                                    // $7355  ; VIC_SP1Y
	sta $d005                                    // $7358
	lda #$0f                                     // $735B
	sta $d418                                    // $735D  ; SID_FMODE
	lda $d010                                    // $7360  ; VIC_SPXMSB
	and #$06                                     // $7363
	.byte $F0, $0F                               // $7365  beq $7376
	lda $d002                                    // $7367  ; VIC_SP1X
	cmp #$60                                     // $736A
	.byte $90, $08                               // $736C  bcc $7376
	cmp #$d0                                     // $736E
	.byte $B0, $04                               // $7370  bcs $7376
	lda $4e                                      // $7372
	sta $42                                      // $7374
	rts                                          // $7376
	nop                                          // $7377
	nop                                          // $7378
	nop                                          // $7379
	lda #$00                                     // $737A
	sta $24                                      // $737C
	sta $50                                      // $737E
	lda #$21                                     // $7380
	sta $d412                                    // $7382
	lda #$01                                     // $7385
	sta $26                                      // $7387
	sta $25                                      // $7389
	lda #$dd                                     // $738B
	sta $07f8                                    // $738D
	lda #$02                                     // $7390
	sta $d027                                    // $7392
	ldx #$ff                                     // $7395
	ldy #$ff                                     // $7397
	dey                                          // $7399
	.byte $D0, $FD                               // $739A  bne $7399
	dex                                          // $739C
	.byte $D0, $F8                               // $739D  bne $7397
	lda #$06                                     // $739F
	sta $39                                      // $73A1
	lda #$01                                     // $73A3
	sta $3b                                      // $73A5
	lda #$00                                     // $73A7
	sta $55                                      // $73A9
	jsr $61a0                                    // $73AB
	ldy #$ff                                     // $73AE
	dey                                          // $73B0
	.byte $D0, $FD                               // $73B1  bne $73B0
	dec $55                                      // $73B3
	.byte $D0, $F4                               // $73B5  bne $73AB
	lda $d015                                    // $73B7  ; VIC_SPEN
	and #$f0                                     // $73BA
	sta $d015                                    // $73BC  ; VIC_SPEN
	lda #$01                                     // $73BF
	sta $d027                                    // $73C1
	sta $26                                      // $73C4
	lda #$00                                     // $73C6
	sta $25                                      // $73C8
	sta $43                                      // $73CA
	sta $42                                      // $73CC
	sta $28                                      // $73CE
	lda #$10                                     // $73D0
	sta $29                                      // $73D2
	jmp $6387                                    // $73D4
	nop                                          // $73D7
	nop                                          // $73D8
	nop                                          // $73D9
	lda $d002                                    // $73DA  ; VIC_SP1X
	cmp #$98                                     // $73DD
	.byte $90, $25                               // $73DF  bcc $7406
	cmp #$a8                                     // $73E1
	.byte $B0, $21                               // $73E3  bcs $7406
	lda $d003                                    // $73E5  ; VIC_SP1Y
	cmp #$b0                                     // $73E8
	.byte $90, $1A                               // $73EA  bcc $7406
	lda $d010                                    // $73EC  ; VIC_SPXMSB
	and #$02                                     // $73EF
	.byte $D0, $13                               // $73F1  bne $7406
	lda $d015                                    // $73F3  ; VIC_SPEN
	and #$02                                     // $73F6
	.byte $F0, $0C                               // $73F8  beq $7406
	lda $42                                      // $73FA
	cmp #$84                                     // $73FC
	.byte $F0, $06                               // $73FE  beq $7406
	lda $42                                      // $7400
	and #$7f                                     // $7402
	sta $43                                      // $7404
	jmp $7fe8                                    // $7406
	nop                                          // $7409
	lda $d002                                    // $740A  ; VIC_SP1X
	cmp #$94                                     // $740D
	.byte $90, $26                               // $740F  bcc $7437
	cmp #$ac                                     // $7411
	.byte $B0, $22                               // $7413  bcs $7437
	lda $d003                                    // $7415  ; VIC_SP1Y
	cmp #$d2                                     // $7418
	.byte $90, $1B                               // $741A  bcc $7437
	cmp #$e2                                     // $741C
	.byte $B0, $17                               // $741E  bcs $7437
	lda #$01                                     // $7420
	sta $37                                      // $7422
	lda #$02                                     // $7424
	sta $3d                                      // $7426
	lda #$fd                                     // $7428
	sta $3e                                      // $742A
	lda $42                                      // $742C
	and #$7f                                     // $742E
	sta $43                                      // $7430
	lda #$00                                     // $7432
	sta $42                                      // $7434
	rts                                          // $7436
	lda $d004                                    // $7437
	cmp #$94                                     // $743A
	.byte $90, $26                               // $743C  bcc $7464
	cmp #$ac                                     // $743E
	.byte $B0, $22                               // $7440  bcs $7464
	lda $d005                                    // $7442
	cmp #$d2                                     // $7445
	.byte $90, $1B                               // $7447  bcc $7464
	cmp #$e2                                     // $7449
	.byte $B0, $17                               // $744B  bcs $7464
	lda #$02                                     // $744D
	sta $37                                      // $744F
	lda #$04                                     // $7451
	sta $3d                                      // $7453
	lda #$fb                                     // $7455
	sta $3e                                      // $7457
	lda $42                                      // $7459
	and #$7f                                     // $745B
	sta $43                                      // $745D
	lda #$00                                     // $745F
	sta $42                                      // $7461
	rts                                          // $7463
	lda $d006                                    // $7464
	cmp #$94                                     // $7467
	.byte $90, $25                               // $7469  bcc $7490
	cmp #$ac                                     // $746B
	.byte $B0, $21                               // $746D  bcs $7490
	lda $d007                                    // $746F
	cmp #$d2                                     // $7472
	.byte $90, $1A                               // $7474  bcc $7490
	cmp #$e2                                     // $7476
	.byte $B0, $16                               // $7478  bcs $7490
	lda #$03                                     // $747A
	sta $37                                      // $747C
	lda #$08                                     // $747E
	sta $3d                                      // $7480
	lda #$f7                                     // $7482
	sta $3e                                      // $7484
	lda $42                                      // $7486
	and #$7f                                     // $7488
	sta $43                                      // $748A
	lda #$00                                     // $748C
	sta $42                                      // $748E
	rts                                          // $7490
	nop                                          // $7491
	nop                                          // $7492
	nop                                          // $7493
	nop                                          // $7494
	lda $50                                      // $7495
	.byte $D0, $17                               // $7497  bne $74B0
	lda #$a6                                     // $7499
	sta $07f9                                    // $749B
	lda #$a7                                     // $749E
	sta $07fa                                    // $74A0
	lda #$b7                                     // $74A3
	sta $d002                                    // $74A5  ; VIC_SP1X
	lda #$e6                                     // $74A8
	sta $d004                                    // $74AA
	jmp $74c4                                    // $74AD
	lda #$a4                                     // $74B0
	sta $07f9                                    // $74B2
	lda #$a5                                     // $74B5
	sta $07fa                                    // $74B7
	lda #$58                                     // $74BA
	sta $d002                                    // $74BC  ; VIC_SP1X
	lda #$87                                     // $74BF
	sta $d004                                    // $74C1
	lda #$56                                     // $74C4
	sta $d003                                    // $74C6  ; VIC_SP1Y
	sta $d005                                    // $74C9
	lda #$02                                     // $74CC
	sta $d028                                    // $74CE
	sta $d029                                    // $74D1
	lda #$03                                     // $74D4
	sta $37                                      // $74D6
	lda #$02                                     // $74D8
	sta $3c                                      // $74DA
	lda $d010                                    // $74DC  ; VIC_SPXMSB
	ora #$06                                     // $74DF
	sta $d010                                    // $74E1  ; VIC_SPXMSB
	lda $d015                                    // $74E4  ; VIC_SPEN
	ora #$06                                     // $74E7
	and #$f7                                     // $74E9
	sta $d015                                    // $74EB  ; VIC_SPEN
	lda $d017                                    // $74EE  ; VIC_SPYEXP
	ora #$06                                     // $74F1
	sta $d017                                    // $74F3  ; VIC_SPYEXP
	lda $d01d                                    // $74F6  ; VIC_SPXEXP
	ora #$06                                     // $74F9
	sta $d01d                                    // $74FB  ; VIC_SPXEXP
	lda $d01b                                    // $74FE  ; VIC_SPPRI
	and #$f0                                     // $7501
	sta $d01b                                    // $7503  ; VIC_SPPRI
	lda $d01c                                    // $7506  ; VIC_SPMCOL
	ora #$06                                     // $7509
	sta $d01c                                    // $750B  ; VIC_SPMCOL
	rts                                          // $750E
	nop                                          // $750F
	lda $50                                      // $7510
	.byte $D0, $08                               // $7512  bne $751C
	lda #$4c                                     // $7514
	sta $d006                                    // $7516
	jmp $7521                                    // $7519
	lda #$ff                                     // $751C
	sta $d006                                    // $751E
	lda #$76                                     // $7521
	sta $d007                                    // $7523
	lda #$dd                                     // $7526
	sta $07fb                                    // $7528
	sta $38                                      // $752B
	lda #$de                                     // $752D
	sta $3a                                      // $752F
	lda #$07                                     // $7531
	sta $d02a                                    // $7533
	sta $39                                      // $7536
	lda #$08                                     // $7538
	sta $3b                                      // $753A
	lda #$20                                     // $753C
	sta $3f                                      // $753E
	sta $40                                      // $7540
	lda #$08                                     // $7542
	sta $3d                                      // $7544
	lda #$f7                                     // $7546
	sta $3e                                      // $7548
	lda $d015                                    // $754A  ; VIC_SPEN
	ora #$08                                     // $754D
	sta $d015                                    // $754F  ; VIC_SPEN
	lda $d01c                                    // $7552  ; VIC_SPMCOL
	and #$f7                                     // $7555
	sta $d01c                                    // $7557  ; VIC_SPMCOL
	lda $d010                                    // $755A  ; VIC_SPXMSB
	and #$f7                                     // $755D
	sta $d010                                    // $755F  ; VIC_SPXMSB
	lda #$03                                     // $7562
	sta $37                                      // $7564
	rts                                          // $7566
	jsr $61a0                                    // $7567
	dec $53                                      // $756A
	.byte $F0, $01                               // $756C  beq $756F
	rts                                          // $756E
	lda #$03                                     // $756F
	sta $53                                      // $7571
	ldx #$01                                     // $7573
	inc $d002                                    // $7575  ; VIC_SP1X
	.byte $D0, $1D                               // $7578  bne $7597
	lda $d010                                    // $757A  ; VIC_SPXMSB
	and #$02                                     // $757D
	.byte $F0, $0B                               // $757F  beq $758C
	lda $d010                                    // $7581  ; VIC_SPXMSB
	and #$fd                                     // $7584
	sta $d010                                    // $7586  ; VIC_SPXMSB
	jmp $7594                                    // $7589
	lda $d010                                    // $758C  ; VIC_SPXMSB
	ora #$02                                     // $758F
	sta $d010                                    // $7591  ; VIC_SPXMSB
	inc $d002                                    // $7594  ; VIC_SP1X
	inc $d004                                    // $7597
	.byte $D0, $1D                               // $759A  bne $75B9
	lda $d010                                    // $759C  ; VIC_SPXMSB
	and #$04                                     // $759F
	.byte $F0, $0B                               // $75A1  beq $75AE
	lda $d010                                    // $75A3  ; VIC_SPXMSB
	and #$fb                                     // $75A6
	sta $d010                                    // $75A8  ; VIC_SPXMSB
	jmp $75b6                                    // $75AB
	lda $d010                                    // $75AE  ; VIC_SPXMSB
	ora #$04                                     // $75B1
	sta $d010                                    // $75B3  ; VIC_SPXMSB
	inc $d004                                    // $75B6
	lda $d004                                    // $75B9
	cmp #$2a                                     // $75BC
	.byte $D0, $0C                               // $75BE  bne $75CC
	lda $d010                                    // $75C0  ; VIC_SPXMSB
	and #$04                                     // $75C3
	.byte $D0, $05                               // $75C5  bne $75CC
	inc $51                                      // $75C7
	jsr $7510                                    // $75C9
	lda $51                                      // $75CC
	.byte $F0, $1F                               // $75CE  beq $75EF
	inc $d006                                    // $75D0
	inc $d007                                    // $75D3
	lda $d007                                    // $75D6
	cmp #$ea                                     // $75D9
	.byte $90, $0F                               // $75DB  bcc $75EC
	lda #$00                                     // $75DD
	sta $51                                      // $75DF
	lda $d015                                    // $75E1  ; VIC_SPEN
	and #$f7                                     // $75E4
	sta $d015                                    // $75E6  ; VIC_SPEN
	jmp $75ef                                    // $75E9
	jsr $76c3                                    // $75EC
	dex                                          // $75EF
	.byte $D0, $83                               // $75F0  bne $7575
	rts                                          // $75F2
	nop                                          // $75F3
	jsr $61a0                                    // $75F4
	dec $53                                      // $75F7
	.byte $F0, $01                               // $75F9  beq $75FC
	rts                                          // $75FB
	lda #$03                                     // $75FC
	sta $53                                      // $75FE
	ldx #$01                                     // $7600
	dec $d004                                    // $7602
	.byte $D0, $1D                               // $7605  bne $7624
	lda $d010                                    // $7607  ; VIC_SPXMSB
	and #$04                                     // $760A
	.byte $F0, $0B                               // $760C  beq $7619
	lda $d010                                    // $760E  ; VIC_SPXMSB
	and #$fb                                     // $7611
	sta $d010                                    // $7613  ; VIC_SPXMSB
	jmp $7621                                    // $7616
	lda $d010                                    // $7619  ; VIC_SPXMSB
	ora #$04                                     // $761C
	sta $d010                                    // $761E  ; VIC_SPXMSB
	dec $d004                                    // $7621
	dec $d002                                    // $7624  ; VIC_SP1X
	.byte $D0, $1D                               // $7627  bne $7646
	lda $d010                                    // $7629  ; VIC_SPXMSB
	and #$02                                     // $762C
	.byte $F0, $0B                               // $762E  beq $763B
	lda $d010                                    // $7630  ; VIC_SPXMSB
	and #$fd                                     // $7633
	sta $d010                                    // $7635  ; VIC_SPXMSB
	jmp $7643                                    // $7638
	lda $d010                                    // $763B  ; VIC_SPXMSB
	ora #$02                                     // $763E
	sta $d010                                    // $7640  ; VIC_SPXMSB
	dec $d002                                    // $7643  ; VIC_SP1X
	lda $d002                                    // $7646  ; VIC_SP1X
	cmp #$0a                                     // $7649
	.byte $D0, $0C                               // $764B  bne $7659
	lda $d010                                    // $764D  ; VIC_SPXMSB
	and #$02                                     // $7650
	.byte $F0, $05                               // $7652  beq $7659
	inc $51                                      // $7654
	jsr $7510                                    // $7656
	lda $51                                      // $7659
	.byte $F0, $1F                               // $765B  beq $767C
	dec $d006                                    // $765D
	inc $d007                                    // $7660
	lda $d007                                    // $7663
	cmp #$ea                                     // $7666
	.byte $90, $0F                               // $7668  bcc $7679
	lda #$00                                     // $766A
	sta $51                                      // $766C
	lda $d015                                    // $766E  ; VIC_SPEN
	and #$f7                                     // $7671
	sta $d015                                    // $7673  ; VIC_SPEN
	jmp $767c                                    // $7676
	jsr $76c3                                    // $7679
	dex                                          // $767C
	.byte $D0, $83                               // $767D  bne $7602
	rts                                          // $767F
	lda #$a8                                     // $7680
	sta $d006                                    // $7682
	lda #$80                                     // $7685
	sta $d007                                    // $7687
	lda #$01                                     // $768A
	sta $55                                      // $768C
	lda $d01b                                    // $768E  ; VIC_SPPRI
	and #$f7                                     // $7691
	sta $d01b                                    // $7693  ; VIC_SPPRI
	jmp $7526                                    // $7696
	nop                                          // $7699
	nop                                          // $769A
	nop                                          // $769B
	nop                                          // $769C
	nop                                          // $769D
	nop                                          // $769E
	nop                                          // $769F
	jsr $61a0                                    // $76A0
	dec $55                                      // $76A3
	.byte $F0, $01                               // $76A5  beq $76A8
	rts                                          // $76A7
	lda #$05                                     // $76A8
	sta $55                                      // $76AA
	inc $d007                                    // $76AC
	lda $d007                                    // $76AF
	cmp #$ea                                     // $76B2
	.byte $90, $0D                               // $76B4  bcc $76C3
	lda $d015                                    // $76B6  ; VIC_SPEN
	and #$f7                                     // $76B9
	sta $d015                                    // $76BB  ; VIC_SPEN
	lda #$08                                     // $76BE
	sta $42                                      // $76C0
	rts                                          // $76C2
	cmp #$b8                                     // $76C3
	.byte $90, $FB                               // $76C5  bcc $76C2
	lda $d006                                    // $76C7
	cmp #$a8                                     // $76CA
	.byte $90, $F4                               // $76CC  bcc $76C2
	cmp #$b0                                     // $76CE
	.byte $B0, $F0                               // $76D0  bcs $76C2
	lda $d010                                    // $76D2  ; VIC_SPXMSB
	and #$08                                     // $76D5
	.byte $D0, $04                               // $76D7  bne $76DD
	lda #$08                                     // $76D9
	sta $43                                      // $76DB
	rts                                          // $76DD
	nop                                          // $76DE
	nop                                          // $76DF
	dec $53                                      // $76E0
	.byte $F0, $01                               // $76E2  beq $76E5
	rts                                          // $76E4
	lda $54                                      // $76E5
	sta $53                                      // $76E7
	lda $50                                      // $76E9
	.byte $D0, $03                               // $76EB  bne $76F0
	jmp $7708                                    // $76ED
	cmp #$07                                     // $76F0
	.byte $D0, $03                               // $76F2  bne $76F7
	jmp $7724                                    // $76F4
	cmp #$08                                     // $76F7
	.byte $D0, $03                               // $76F9  bne $76FE
	jmp $773c                                    // $76FB
	and #$01                                     // $76FE
	.byte $D0, $03                               // $7700  bne $7705
	jmp $774c                                    // $7702
	jmp $7762                                    // $7705
	ldx #$04                                     // $7708
	dec $d002                                    // $770A  ; VIC_SP1X
	dec $d004                                    // $770D
	inc $d003                                    // $7710  ; VIC_SP1Y
	inc $d005                                    // $7713
	lda $d002                                    // $7716  ; VIC_SP1X
	cmp #$60                                     // $7719
	.byte $D0, $03                               // $771B  bne $7720
	jmp $7778                                    // $771D
	dex                                          // $7720
	.byte $D0, $E7                               // $7721  bne $770A
	rts                                          // $7723
	ldx #$05                                     // $7724
	inc $d002                                    // $7726  ; VIC_SP1X
	inc $d004                                    // $7729
	lda $d002                                    // $772C  ; VIC_SP1X
	cmp #$98                                     // $772F
	.byte $D0, $05                               // $7731  bne $7738
	inc $51                                      // $7733
	jmp $7778                                    // $7735
	dex                                          // $7738
	.byte $D0, $EB                               // $7739  bne $7726
	rts                                          // $773B
	ldx #$06                                     // $773C
	dec $d003                                    // $773E  ; VIC_SP1Y
	dec $d005                                    // $7741
	lda $d003                                    // $7744  ; VIC_SP1Y
	.byte $D0, $02                               // $7747  bne $774B
	inc $50                                      // $7749
	rts                                          // $774B
	ldx #$04                                     // $774C
	dec $d002                                    // $774E  ; VIC_SP1X
	dec $d004                                    // $7751
	lda $d002                                    // $7754  ; VIC_SP1X
	cmp #$60                                     // $7757
	.byte $D0, $03                               // $7759  bne $775E
	jmp $7778                                    // $775B
	dex                                          // $775E
	.byte $D0, $ED                               // $775F  bne $774E
	rts                                          // $7761
	ldx #$04                                     // $7762
	inc $d002                                    // $7764  ; VIC_SP1X
	inc $d004                                    // $7767
	lda $d002                                    // $776A  ; VIC_SP1X
	cmp #$c0                                     // $776D
	.byte $D0, $03                               // $776F  bne $7774
	jmp $7778                                    // $7771
	dex                                          // $7774
	.byte $D0, $ED                               // $7775  bne $7764
	rts                                          // $7777
	inc $50                                      // $7778
	lda $50                                      // $777A
	cmp #$01                                     // $777C
	.byte $D0, $0D                               // $777E  bne $778D
	lda #$a0                                     // $7780
	sta $07f9                                    // $7782
	lda #$a1                                     // $7785
	sta $07fa                                    // $7787
	jmp $782a                                    // $778A
	cmp #$02                                     // $778D
	.byte $D0, $0D                               // $778F  bne $779E
	lda #$a2                                     // $7791
	sta $07f9                                    // $7793
	lda #$a3                                     // $7796
	sta $07fa                                    // $7798
	jmp $782a                                    // $779B
	cmp #$03                                     // $779E
	.byte $D0, $0D                               // $77A0  bne $77AF
	lda #$a2                                     // $77A2
	sta $07f9                                    // $77A4
	lda #$a3                                     // $77A7
	sta $07fa                                    // $77A9
	jmp $782a                                    // $77AC
	cmp #$04                                     // $77AF
	.byte $D0, $26                               // $77B1  bne $77D9
	lda #$a0                                     // $77B3
	sta $07f9                                    // $77B5
	lda #$a1                                     // $77B8
	sta $07fa                                    // $77BA
	lda $d017                                    // $77BD  ; VIC_SPYEXP
	ora #$06                                     // $77C0
	sta $d017                                    // $77C2  ; VIC_SPYEXP
	lda $d01d                                    // $77C5  ; VIC_SPXEXP
	ora #$06                                     // $77C8
	sta $d01d                                    // $77CA  ; VIC_SPXEXP
	sec                                          // $77CD
	lda $d002                                    // $77CE  ; VIC_SP1X
	sbc #$18                                     // $77D1
	sta $d002                                    // $77D3  ; VIC_SP1X
	jmp $782a                                    // $77D6
	cmp #$05                                     // $77D9
	.byte $D0, $15                               // $77DB  bne $77F2
	lda $d017                                    // $77DD  ; VIC_SPYEXP
	and #$f9                                     // $77E0
	sta $d017                                    // $77E2  ; VIC_SPYEXP
	lda #$a2                                     // $77E5
	sta $07f9                                    // $77E7
	lda #$a3                                     // $77EA
	sta $07fa                                    // $77EC
	jmp $782a                                    // $77EF
	cmp #$06                                     // $77F2
	.byte $D0, $0D                               // $77F4  bne $7803
	lda #$ca                                     // $77F6
	sta $07f9                                    // $77F8
	lda #$cb                                     // $77FB
	sta $07fa                                    // $77FD
	jmp $782a                                    // $7800
	cmp #$07                                     // $7803
	.byte $D0, $15                               // $7805  bne $781C
	lda $d017                                    // $7807  ; VIC_SPYEXP
	ora #$06                                     // $780A
	sta $d017                                    // $780C  ; VIC_SPYEXP
	lda #$a2                                     // $780F
	sta $07f9                                    // $7811
	lda #$a3                                     // $7814
	sta $07fa                                    // $7816
	jmp $782a                                    // $7819
	cmp #$08                                     // $781C
	.byte $D0, $10                               // $781E  bne $7830
	lda #$ca                                     // $7820
	sta $07f9                                    // $7822
	lda #$cb                                     // $7825
	sta $07fa                                    // $7827
	lda $54                                      // $782A
	sbc #$04                                     // $782C
	sta $54                                      // $782E
	inc $d003                                    // $7830  ; VIC_SP1Y
	inc $d005                                    // $7833
	lda $51                                      // $7836
	.byte $F0, $03                               // $7838  beq $783D
	jsr $7680                                    // $783A
	lda $50                                      // $783D
	cmp #$06                                     // $783F
	.byte $D0, $08                               // $7841  bne $784B
	lda $d01b                                    // $7843  ; VIC_SPPRI
	and #$f9                                     // $7846
	sta $d01b                                    // $7848  ; VIC_SPPRI
	cmp #$08                                     // $784B
	.byte $D0, $04                               // $784D  bne $7853
	lda #$03                                     // $784F
	sta $37                                      // $7851
	rts                                          // $7853
	.byte $F0, $BE                               // $7854  beq $7814
	inc $41                                      // $7856
	lda #$b3                                     // $7858
	sta $07fb                                    // $785A
	lda $d015                                    // $785D  ; VIC_SPEN
	and #$fe                                     // $7860
	sta $d015                                    // $7862  ; VIC_SPEN
	lda #$08                                     // $7865
	sta $29                                      // $7867
	jmp $7814                                    // $7869
	nop                                          // $786C
	nop                                          // $786D
	nop                                          // $786E
	nop                                          // $786F
	lda #$b7                                     // $7870
	sta $07fa                                    // $7872
	lda #$b8                                     // $7875
	sta $07fb                                    // $7877
	lda #$03                                     // $787A
	sta $d029                                    // $787C
	sta $d02a                                    // $787F
	lda #$50                                     // $7882
	sta $d005                                    // $7884
	lda #$78                                     // $7887
	sta $d007                                    // $7889
	lda $d010                                    // $788C  ; VIC_SPXMSB
	and #$f3                                     // $788F
	sta $d010                                    // $7891  ; VIC_SPXMSB
	lda $d017                                    // $7894  ; VIC_SPYEXP
	ora #$0c                                     // $7897
	sta $d017                                    // $7899  ; VIC_SPYEXP
	lda $d01d                                    // $789C  ; VIC_SPXEXP
	ora #$0c                                     // $789F
	sta $d01d                                    // $78A1  ; VIC_SPXEXP
	lda $d01c                                    // $78A4  ; VIC_SPMCOL
	and #$f3                                     // $78A7
	sta $d01c                                    // $78A9  ; VIC_SPMCOL
	lda $d01b                                    // $78AC  ; VIC_SPPRI
	ora #$0c                                     // $78AF
	sta $d01b                                    // $78B1  ; VIC_SPPRI
	lda $d015                                    // $78B4  ; VIC_SPEN
	ora #$0c                                     // $78B7
	sta $d015                                    // $78B9  ; VIC_SPEN
	rts                                          // $78BC
	nop                                          // $78BD
	nop                                          // $78BE
	nop                                          // $78BF
	lda $57                                      // $78C0
	and #$0f                                     // $78C2
	.byte $D0, $20                               // $78C4  bne $78E6
	lda #$b9                                     // $78C6
	sta $07f9                                    // $78C8
	sta $38                                      // $78CB
	lda #$ba                                     // $78CD
	sta $3a                                      // $78CF
	lda $d010                                    // $78D1  ; VIC_SPXMSB
	ora #$02                                     // $78D4
	sta $d010                                    // $78D6  ; VIC_SPXMSB
	lda #$60                                     // $78D9
	sta $d002                                    // $78DB  ; VIC_SP1X
	lda #$80                                     // $78DE
	sta $d003                                    // $78E0  ; VIC_SP1Y
	jmp $7903                                    // $78E3
	lda #$c0                                     // $78E6
	sta $07f9                                    // $78E8
	sta $38                                      // $78EB
	lda #$c1                                     // $78ED
	sta $3a                                      // $78EF
	lda $d010                                    // $78F1  ; VIC_SPXMSB
	and #$fd                                     // $78F4
	sta $d010                                    // $78F6  ; VIC_SPXMSB
	lda #$00                                     // $78F9
	sta $d002                                    // $78FB  ; VIC_SP1X
	lda #$88                                     // $78FE
	sta $d003                                    // $7900  ; VIC_SP1Y
	lda #$01                                     // $7903
	sta $d028                                    // $7905
	sta $39                                      // $7908
	sta $3b                                      // $790A
	sta $37                                      // $790C
	lda #$02                                     // $790E
	sta $3f                                      // $7910
	sta $40                                      // $7912
	sta $3c                                      // $7914
	sta $3d                                      // $7916
	lda #$fd                                     // $7918
	sta $3e                                      // $791A
	lda $d017                                    // $791C  ; VIC_SPYEXP
	ora #$02                                     // $791F
	sta $d017                                    // $7921  ; VIC_SPYEXP
	lda $d01d                                    // $7924  ; VIC_SPXEXP
	ora #$02                                     // $7927
	sta $d01d                                    // $7929  ; VIC_SPXEXP
	lda $d01b                                    // $792C  ; VIC_SPPRI
	and #$fd                                     // $792F
	sta $d01b                                    // $7931  ; VIC_SPPRI
	lda $d01c                                    // $7934  ; VIC_SPMCOL
	and #$fd                                     // $7937
	sta $d01c                                    // $7939  ; VIC_SPMCOL
	lda $d015                                    // $793C  ; VIC_SPEN
	ora #$02                                     // $793F
	sta $d015                                    // $7941  ; VIC_SPEN
	rts                                          // $7944
	nop                                          // $7945
	nop                                          // $7946
	nop                                          // $7947
	nop                                          // $7948
	nop                                          // $7949
	lda $57                                      // $794A
	.byte $30, $1D                               // $794C  bmi $796B
	lda $d002                                    // $794E  ; VIC_SP1X
	cmp #$8a                                     // $7951
	.byte $90, $4E                               // $7953  bcc $79A3
	cmp #$a0                                     // $7955
	.byte $B0, $4A                               // $7957  bcs $79A3
	lda $d003                                    // $7959  ; VIC_SP1Y
	cmp #$b0                                     // $795C
	.byte $90, $43                               // $795E  bcc $79A3
	lda $d003                                    // $7960  ; VIC_SP1Y
	adc #$08                                     // $7963
	sta $d003                                    // $7965  ; VIC_SP1Y
	jmp $7985                                    // $7968
	lda $d002                                    // $796B  ; VIC_SP1X
	cmp #$b8                                     // $796E
	.byte $B0, $31                               // $7970  bcs $79A3
	cmp #$a8                                     // $7972
	.byte $90, $2D                               // $7974  bcc $79A3
	lda $d003                                    // $7976  ; VIC_SP1Y
	cmp #$b8                                     // $7979
	.byte $90, $26                               // $797B  bcc $79A3
	lda $d003                                    // $797D  ; VIC_SP1Y
	adc #$02                                     // $7980
	sta $d003                                    // $7982  ; VIC_SP1Y
	lda $d015                                    // $7985  ; VIC_SPEN
	and #$02                                     // $7988
	.byte $F0, $17                               // $798A  beq $79A3
	nop                                          // $798C
	lda $42                                      // $798D
	and #$7f                                     // $798F
	sta $43                                      // $7991
	lda $d015                                    // $7993  ; VIC_SPEN
	and #$f3                                     // $7996
	sta $d015                                    // $7998  ; VIC_SPEN
	lda $d01b                                    // $799B  ; VIC_SPPRI
	and #$f0                                     // $799E
	sta $d01b                                    // $79A0  ; VIC_SPPRI
	rts                                          // $79A3
	nop                                          // $79A4
	lda $d01e                                    // $79A5  ; VIC_SPCOL
	sta $56                                      // $79A8
	and #$03                                     // $79AA
	cmp #$03                                     // $79AC
	.byte $D0, $29                               // $79AE  bne $79D9
	lda $d002                                    // $79B0  ; VIC_SP1X
	nop                                          // $79B3
	nop                                          // $79B4
	cmp $d000                                    // $79B5  ; VIC_SP0X
	.byte $B0, $1F                               // $79B8  bcs $79D9
	adc #$18                                     // $79BA
	cmp $d000                                    // $79BC  ; VIC_SP0X
	.byte $90, $18                               // $79BF  bcc $79D9
	lda $d003                                    // $79C1  ; VIC_SP1Y
	sbc #$08                                     // $79C4
	cmp $d001                                    // $79C6  ; VIC_SP0Y
	.byte $B0, $0E                               // $79C9  bcs $79D9
	adc #$20                                     // $79CB
	cmp $d001                                    // $79CD  ; VIC_SP0Y
	.byte $90, $07                               // $79D0  bcc $79D9
	jsr $737a                                    // $79D2
	lda $4e                                      // $79D5
	sta $42                                      // $79D7
	rts                                          // $79D9
	nop                                          // $79DA
	nop                                          // $79DB
	nop                                          // $79DC
	nop                                          // $79DD
	nop                                          // $79DE
	nop                                          // $79DF
	lda $53                                      // $79E0
	.byte $D0, $0D                               // $79E2  bne $79F1
	inc $d004                                    // $79E4
	inc $d006                                    // $79E7
	lda #$01                                     // $79EA
	sta $53                                      // $79EC
	jmp $79fb                                    // $79EE
	dec $d004                                    // $79F1
	dec $d006                                    // $79F4
	lda #$00                                     // $79F7
	sta $53                                      // $79F9
	lda $56                                      // $79FB
	nop                                          // $79FD
	and #$05                                     // $79FE
	cmp #$05                                     // $7A00
	.byte $D0, $38                               // $7A02  bne $7A3C
	lda $d004                                    // $7A04
	adc #$08                                     // $7A07
	cmp $d000                                    // $7A09  ; VIC_SP0X
	.byte $B0, $25                               // $7A0C  bcs $7A33
	adc #$10                                     // $7A0E
	cmp $d000                                    // $7A10  ; VIC_SP0X
	.byte $90, $1E                               // $7A13  bcc $7A33
	lda $d005                                    // $7A15
	cmp $d001                                    // $7A18  ; VIC_SP0Y
	.byte $B0, $16                               // $7A1B  bcs $7A33
	adc #$10                                     // $7A1D
	cmp $d001                                    // $7A1F  ; VIC_SP0Y
	.byte $90, $0F                               // $7A22  bcc $7A33
	lda $42                                      // $7A24
	sta $43                                      // $7A26
	lda #$00                                     // $7A28
	sta $42                                      // $7A2A
	jsr $6387                                    // $7A2C
	lda #$60                                     // $7A2F
	sta $29                                      // $7A31
	rts                                          // $7A33
	nop                                          // $7A34
	nop                                          // $7A35
	nop                                          // $7A36
	nop                                          // $7A37
	nop                                          // $7A38
	nop                                          // $7A39
	nop                                          // $7A3A
	nop                                          // $7A3B
	nop                                          // $7A3C
	nop                                          // $7A3D
	nop                                          // $7A3E
	nop                                          // $7A3F
	nop                                          // $7A40
	nop                                          // $7A41
	nop                                          // $7A42
	nop                                          // $7A43
	nop                                          // $7A44
	lda $d01e                                    // $7A45  ; VIC_SPCOL
	and #$03                                     // $7A48
	cmp #$03                                     // $7A4A
	.byte $F0, $01                               // $7A4C  beq $7A4F
	rts                                          // $7A4E
	lda $d002                                    // $7A4F  ; VIC_SP1X
	adc #$08                                     // $7A52
	cmp $d000                                    // $7A54  ; VIC_SP0X
	.byte $B0, $29                               // $7A57  bcs $7A82
	adc #$06                                     // $7A59
	cmp $d000                                    // $7A5B  ; VIC_SP0X
	.byte $90, $22                               // $7A5E  bcc $7A82
	lda $d003                                    // $7A60  ; VIC_SP1Y
	adc #$0c                                     // $7A63
	cmp $d001                                    // $7A65  ; VIC_SP0Y
	.byte $B0, $18                               // $7A68  bcs $7A82
	adc #$0c                                     // $7A6A
	cmp $d001                                    // $7A6C  ; VIC_SP0Y
	.byte $90, $11                               // $7A6F  bcc $7A82
	lda $42                                      // $7A71
	sta $43                                      // $7A73
	lda #$00                                     // $7A75
	sta $42                                      // $7A77
	lda #$99                                     // $7A79
	sta $28                                      // $7A7B
	sta $29                                      // $7A7D
	jmp $6387                                    // $7A7F
	rts                                          // $7A82
	nop                                          // $7A83
	nop                                          // $7A84
	lda $d01e                                    // $7A85  ; VIC_SPCOL
	and #$03                                     // $7A88
	cmp #$03                                     // $7A8A
	.byte $F0, $01                               // $7A8C  beq $7A8F
	rts                                          // $7A8E
	lda $d002                                    // $7A8F  ; VIC_SP1X
	cmp $d000                                    // $7A92  ; VIC_SP0X
	.byte $B0, $F7                               // $7A95  bcs $7A8E
	adc #$10                                     // $7A97
	cmp $d000                                    // $7A99  ; VIC_SP0X
	.byte $90, $F0                               // $7A9C  bcc $7A8E
	lda $d003                                    // $7A9E  ; VIC_SP1Y
	cmp $d001                                    // $7AA1  ; VIC_SP0Y
	.byte $B0, $E8                               // $7AA4  bcs $7A8E
	adc #$18                                     // $7AA6
	cmp $d001                                    // $7AA8  ; VIC_SP0Y
	.byte $90, $E1                               // $7AAB  bcc $7A8E
	lda $42                                      // $7AAD
	sta $43                                      // $7AAF
	lda #$00                                     // $7AB1
	sta $42                                      // $7AB3
	rts                                          // $7AB5
	nop                                          // $7AB6
	nop                                          // $7AB7
	nop                                          // $7AB8
	nop                                          // $7AB9
	nop                                          // $7ABA
	nop                                          // $7ABB
	nop                                          // $7ABC
	nop                                          // $7ABD
	nop                                          // $7ABE
	nop                                          // $7ABF
	lda $d01e                                    // $7AC0  ; VIC_SPCOL
	and #$07                                     // $7AC3
	cmp #$03                                     // $7AC5
	.byte $F0, $05                               // $7AC7  beq $7ACE
	cmp #$07                                     // $7AC9
	.byte $F0, $01                               // $7ACB  beq $7ACE
	rts                                          // $7ACD
	lda $52                                      // $7ACE
	cmp #$0b                                     // $7AD0
	.byte $D0, $0D                               // $7AD2  bne $7AE1
	lda $d002                                    // $7AD4  ; VIC_SP1X
	sbc #$08                                     // $7AD7
	cmp $d000                                    // $7AD9  ; VIC_SP0X
	.byte $B0, $5A                               // $7ADC  bcs $7B38
	jmp $7b00                                    // $7ADE
	cmp #$03                                     // $7AE1
	.byte $D0, $0D                               // $7AE3  bne $7AF2
	lda $d002                                    // $7AE5  ; VIC_SP1X
	adc #$18                                     // $7AE8
	cmp $d000                                    // $7AEA  ; VIC_SP0X
	.byte $B0, $49                               // $7AED  bcs $7B38
	jmp $7b00                                    // $7AEF
	cmp #$07                                     // $7AF2
	.byte $D0, $42                               // $7AF4  bne $7B38
	lda $d002                                    // $7AF6  ; VIC_SP1X
	adc #$40                                     // $7AF9
	cmp $d000                                    // $7AFB  ; VIC_SP0X
	.byte $B0, $38                               // $7AFE  bcs $7B38
	adc #$10                                     // $7B00
	cmp $d000                                    // $7B02  ; VIC_SP0X
	.byte $90, $31                               // $7B05  bcc $7B38
	lda $d003                                    // $7B07  ; VIC_SP1Y
	adc #$08                                     // $7B0A
	cmp $d001                                    // $7B0C  ; VIC_SP0Y
	.byte $B0, $27                               // $7B0F  bcs $7B38
	adc #$10                                     // $7B11
	cmp $d001                                    // $7B13  ; VIC_SP0Y
	.byte $90, $20                               // $7B16  bcc $7B38
	lda $42                                      // $7B18
	sta $43                                      // $7B1A
	jsr $6387                                    // $7B1C
	nop                                          // $7B1F
	lda #$00                                     // $7B20
	sta $33                                      // $7B22
	lda #$01                                     // $7B24
	sta $26                                      // $7B26
	lda #$40                                     // $7B28
	sta $30                                      // $7B2A
	sta $34                                      // $7B2C
	lda #$55                                     // $7B2E
	sta $31                                      // $7B30
	sta $35                                      // $7B32
	lda #$40                                     // $7B34
	sta $29                                      // $7B36
	lda #$10                                     // $7B38
	sta $28                                      // $7B3A
	rts                                          // $7B3C
	nop                                          // $7B3D
	nop                                          // $7B3E
	nop                                          // $7B3F
	lda #$ce                                     // $7B40
	sta $07f9                                    // $7B42
	lda #$cf                                     // $7B45
	sta $07fa                                    // $7B47
	lda #$d0                                     // $7B4A
	sta $07fb                                    // $7B4C
	lda #$b1                                     // $7B4F
	sta $07ff                                    // $7B51
	lda #$58                                     // $7B54
	sta $d003                                    // $7B56  ; VIC_SP1Y
	sta $53                                      // $7B59
	lda #$6c                                     // $7B5B
	sta $d005                                    // $7B5D
	lda #$80                                     // $7B60
	sta $d007                                    // $7B62
	lda #$30                                     // $7B65
	sta $d00f                                    // $7B67
	lda #$a0                                     // $7B6A
	sta $d00e                                    // $7B6C
	lda $d010                                    // $7B6F  ; VIC_SPXMSB
	and #$00                                     // $7B72
	sta $d010                                    // $7B74  ; VIC_SPXMSB
	lda #$00                                     // $7B77
	sta $37                                      // $7B79
	lda #$00                                     // $7B7B
	sta $d028                                    // $7B7D
	sta $d029                                    // $7B80
	sta $d02a                                    // $7B83
	lda #$00                                     // $7B86
	sta $d02e                                    // $7B88
	lda $d017                                    // $7B8B  ; VIC_SPYEXP
	and #$f0                                     // $7B8E
	ora #$80                                     // $7B90
	sta $d017                                    // $7B92  ; VIC_SPYEXP
	lda $d01d                                    // $7B95  ; VIC_SPXEXP
	and #$f0                                     // $7B98
	ora #$80                                     // $7B9A
	sta $d01d                                    // $7B9C  ; VIC_SPXEXP
	lda $d01b                                    // $7B9F  ; VIC_SPPRI
	ora #$8e                                     // $7BA2
	sta $d01b                                    // $7BA4  ; VIC_SPPRI
	lda $d01c                                    // $7BA7  ; VIC_SPMCOL
	ora #$0e                                     // $7BAA
	sta $d01c                                    // $7BAC  ; VIC_SPMCOL
	lda $d015                                    // $7BAF  ; VIC_SPEN
	ora #$8e                                     // $7BB2
	sta $d015                                    // $7BB4  ; VIC_SPEN
	lda #$50                                     // $7BB7
	sta $d002                                    // $7BB9  ; VIC_SP1X
	sta $d004                                    // $7BBC
	sta $d006                                    // $7BBF
	lda #$00                                     // $7BC2
	sta $50                                      // $7BC4
	sta $54                                      // $7BC6
	sta $51                                      // $7BC8
	lda #$05                                     // $7BCA
	sta $56                                      // $7BCC
	rts                                          // $7BCE
	nop                                          // $7BCF
	lda #$30                                     // $7BD0
	sta $d003                                    // $7BD2  ; VIC_SP1Y
	lda #$80                                     // $7BD5
	sta $d007                                    // $7BD7
	lda $d017                                    // $7BDA  ; VIC_SPYEXP
	ora #$0e                                     // $7BDD
	sta $d017                                    // $7BDF  ; VIC_SPYEXP
	lda $d01d                                    // $7BE2  ; VIC_SPXEXP
	ora #$0e                                     // $7BE5
	sta $d017                                    // $7BE7  ; VIC_SPYEXP
	ora #$0e                                     // $7BEA
	sta $d01d                                    // $7BEC  ; VIC_SPXEXP
	lda $d01b                                    // $7BEF  ; VIC_SPPRI
	ora #$8e                                     // $7BF2
	sta $d01b                                    // $7BF4  ; VIC_SPPRI
	lda #$58                                     // $7BF7
	sta $d005                                    // $7BF9
	rts                                          // $7BFC
	nop                                          // $7BFD
	nop                                          // $7BFE
	nop                                          // $7BFF
	lda #$00                                     // $7C00
	sta $d015                                    // $7C02  ; VIC_SPEN
	sta $d01b                                    // $7C05  ; VIC_SPPRI
	sta $d001                                    // $7C08  ; VIC_SP0Y
	sta $d003                                    // $7C0B  ; VIC_SP1Y
	sta $d005                                    // $7C0E
	sta $d007                                    // $7C11
	sta $d009                                    // $7C14
	sta $d00b                                    // $7C17
	sta $d00d                                    // $7C1A
	sta $d00f                                    // $7C1D
	lda #$98                                     // $7C20
	sta $07f8                                    // $7C22
	lda #$99                                     // $7C25
	sta $07f9                                    // $7C27
	lda #$9a                                     // $7C2A
	sta $07fa                                    // $7C2C
	lda #$9b                                     // $7C2F
	sta $07fb                                    // $7C31
	lda #$9c                                     // $7C34
	sta $07fc                                    // $7C36
	lda #$9d                                     // $7C39
	sta $07fd                                    // $7C3B
	lda #$9e                                     // $7C3E
	sta $07fe                                    // $7C40
	lda #$9f                                     // $7C43
	sta $07ff                                    // $7C45
	lda #$60                                     // $7C48
	sta $d000                                    // $7C4A  ; VIC_SP0X
	sta $d006                                    // $7C4D
	lda #$90                                     // $7C50
	sta $d002                                    // $7C52  ; VIC_SP1X
	sta $d008                                    // $7C55
	lda #$c0                                     // $7C58
	sta $d004                                    // $7C5A
	sta $d00a                                    // $7C5D
	lda #$78                                     // $7C60
	sta $d00c                                    // $7C62
	lda #$a8                                     // $7C65
	sta $d00e                                    // $7C67
	lda #$0b                                     // $7C6A
	sta $d026                                    // $7C6C  ; VIC_SPMCOL1
	lda #$07                                     // $7C6F
	sta $d025                                    // $7C71  ; VIC_SPMCOL0
	ldx #$07                                     // $7C74
	lda #$02                                     // $7C76
	sta $d027,x                                  // $7C78
	dex                                          // $7C7B
	.byte $10, $FA                               // $7C7C  bpl $7C78
	lda #$ff                                     // $7C7E
	sta $d017                                    // $7C80  ; VIC_SPYEXP
	sta $d01d                                    // $7C83  ; VIC_SPXEXP
	sta $d01c                                    // $7C86  ; VIC_SPMCOL
	lda #$00                                     // $7C89
	sta $d010                                    // $7C8B  ; VIC_SPXMSB
	rts                                          // $7C8E
	nop                                          // $7C8F
	lda #$c0                                     // $7C90
	sta $d015                                    // $7C92  ; VIC_SPEN
	inc $d00d                                    // $7C95
	inc $d00f                                    // $7C98
	lda $d00d                                    // $7C9B
	cmp #$2b                                     // $7C9E
	.byte $D0, $02                               // $7CA0  bne $7CA4
	inc $50                                      // $7CA2
	lda $50                                      // $7CA4
	.byte $F0, $32                               // $7CA6  beq $7CDA
	lda #$f8                                     // $7CA8
	sta $d015                                    // $7CAA  ; VIC_SPEN
	inc $d007                                    // $7CAD
	inc $d009                                    // $7CB0
	inc $d00b                                    // $7CB3
	lda $d007                                    // $7CB6
	cmp #$29                                     // $7CB9
	.byte $D0, $02                               // $7CBB  bne $7CBF
	inc $51                                      // $7CBD
	lda $51                                      // $7CBF
	.byte $F0, $17                               // $7CC1  beq $7CDA
	lda #$ff                                     // $7CC3
	sta $d015                                    // $7CC5  ; VIC_SPEN
	inc $d001                                    // $7CC8  ; VIC_SP0Y
	inc $d003                                    // $7CCB  ; VIC_SP1Y
	inc $d005                                    // $7CCE
	lda $d00d                                    // $7CD1
	cmp #$88                                     // $7CD4
	.byte $90, $02                               // $7CD6  bcc $7CDA
	inc $52                                      // $7CD8
	rts                                          // $7CDA
	nop                                          // $7CDB
	nop                                          // $7CDC
	nop                                          // $7CDD
	nop                                          // $7CDE
	nop                                          // $7CDF
	lda $d01e                                    // $7CE0  ; VIC_SPCOL
	sta $4c                                      // $7CE3
	and #$03                                     // $7CE5
	cmp #$03                                     // $7CE7
	.byte $D0, $03                               // $7CE9  bne $7CEE
	jmp $7d05                                    // $7CEB
	lda $4c                                      // $7CEE
	and #$05                                     // $7CF0
	cmp #$05                                     // $7CF2
	.byte $D0, $03                               // $7CF4  bne $7CF9
	jmp $7d1d                                    // $7CF6
	lda $4c                                      // $7CF9
	and #$09                                     // $7CFB
	cmp #$09                                     // $7CFD
	.byte $D0, $03                               // $7CFF  bne $7D04
	jmp $7d35                                    // $7D01
	rts                                          // $7D04
	lda $d017                                    // $7D05  ; VIC_SPYEXP
	and #$02                                     // $7D08
	.byte $F0, $F8                               // $7D0A  beq $7D04
	inc $41                                      // $7D0C
	lda #$b3                                     // $7D0E
	sta $07f9                                    // $7D10
	jsr $7d4d                                    // $7D13
	lda #$05                                     // $7D16
	sta $29                                      // $7D18
	jmp $7d04                                    // $7D1A
	lda $d017                                    // $7D1D  ; VIC_SPYEXP
	and #$04                                     // $7D20
	.byte $F0, $E0                               // $7D22  beq $7D04
	inc $41                                      // $7D24
	lda #$b3                                     // $7D26
	sta $07fa                                    // $7D28
	jsr $7d4d                                    // $7D2B
	lda #$05                                     // $7D2E
	sta $29                                      // $7D30
	jmp $7d04                                    // $7D32
	lda $d017                                    // $7D35  ; VIC_SPYEXP
	and #$08                                     // $7D38
	.byte $F0, $C8                               // $7D3A  beq $7D04
	inc $41                                      // $7D3C
	lda #$b3                                     // $7D3E
	sta $07fb                                    // $7D40
	jsr $7d4d                                    // $7D43
	lda #$05                                     // $7D46
	sta $29                                      // $7D48
	jmp $7d04                                    // $7D4A
	lda $d015                                    // $7D4D  ; VIC_SPEN
	and #$fe                                     // $7D50
	sta $d015                                    // $7D52  ; VIC_SPEN
	rts                                          // $7D55
	lda #$90                                     // $7D56
	sta $d005                                    // $7D58
	lda #$b8                                     // $7D5B
	sta $d007                                    // $7D5D
	lda #$0e                                     // $7D60
	sta $d029                                    // $7D62
	sta $d02a                                    // $7D65
	lda $d017                                    // $7D68  ; VIC_SPYEXP
	ora #$0c                                     // $7D6B
	sta $d017                                    // $7D6D  ; VIC_SPYEXP
	lda $d01d                                    // $7D70  ; VIC_SPXEXP
	ora #$0c                                     // $7D73
	sta $d01d                                    // $7D75  ; VIC_SPXEXP
	lda $d01c                                    // $7D78  ; VIC_SPMCOL
	ora #$0c                                     // $7D7B
	sta $d01c                                    // $7D7D  ; VIC_SPMCOL
	lda $d01b                                    // $7D80  ; VIC_SPPRI
	ora #$0c                                     // $7D83
	sta $d01b                                    // $7D85  ; VIC_SPPRI
	lda $d010                                    // $7D88  ; VIC_SPXMSB
	and #$f3                                     // $7D8B
	sta $d010                                    // $7D8D  ; VIC_SPXMSB
	lda $d015                                    // $7D90  ; VIC_SPEN
	ora #$0c                                     // $7D93
	sta $d015                                    // $7D95  ; VIC_SPEN
	ldx #$10                                     // $7D98
	lda $5d84,x                                  // $7D9A
	sta $30,x                                    // $7D9D
	dex                                          // $7D9F
	.byte $10, $F8                               // $7DA0  bpl $7D9A
	lda #$81                                     // $7DA2
	sta $d412                                    // $7DA4
	lda #$94                                     // $7DA7
	sta $07fa                                    // $7DA9
	lda #$95                                     // $7DAC
	sta $07fb                                    // $7DAE
	lda #$92                                     // $7DB1
	sta $07f9                                    // $7DB3
	lda $d004                                    // $7DB6
	sta $d006                                    // $7DB9
	rts                                          // $7DBC
	nop                                          // $7DBD
	nop                                          // $7DBE
	nop                                          // $7DBF
	dec $54                                      // $7DC0
	.byte $F0, $01                               // $7DC2  beq $7DC5
	rts                                          // $7DC4
	lda $dc04                                    // $7DC5
	and #$3f                                     // $7DC8
	sta $54                                      // $7DCA
	inc $54                                      // $7DCC
	ldx $53                                      // $7DCE
	lda $5da0,x                                  // $7DD0
	sta $07fa                                    // $7DD3
	lda $5daa,x                                  // $7DD6
	sta $07fb                                    // $7DD9
	lda $5db4,x                                  // $7DDC
	sta $d004                                    // $7DDF
	sta $d006                                    // $7DE2
	dec $53                                      // $7DE5
	.byte $10, $04                               // $7DE7  bpl $7DED
	lda #$09                                     // $7DE9
	sta $53                                      // $7DEB
	lda $d015                                    // $7DED  ; VIC_SPEN
	and #$0c                                     // $7DF0
	.byte $D0, $09                               // $7DF2  bne $7DFD
	lda $42                                      // $7DF4
	and #$7f                                     // $7DF6
	sta $42                                      // $7DF8
	rts                                          // $7DFA
	nop                                          // $7DFB
	nop                                          // $7DFC
	lda $dc04                                    // $7DFD
	and #$03                                     // $7E00
	.byte $D0, $04                               // $7E02  bne $7E08
	lda #$00                                     // $7E04
	sta $33                                      // $7E06
	lda #$81                                     // $7E08
	sta $d412                                    // $7E0A
	rts                                          // $7E0D
	nop                                          // $7E0E
	nop                                          // $7E0F
	dec $51                                      // $7E10
	.byte $F0, $01                               // $7E12  beq $7E15
	rts                                          // $7E14
	lda #$06                                     // $7E15
	sta $51                                      // $7E17
	dec $d005                                    // $7E19
	dec $d007                                    // $7E1C
	lda $d005                                    // $7E1F
	cmp #$5c                                     // $7E22
	.byte $B0, $04                               // $7E24  bcs $7E2A
	lda #$00                                     // $7E26
	sta $52                                      // $7E28
	rts                                          // $7E2A
	nop                                          // $7E2B
	dec $55                                      // $7E2C
	.byte $D0, $39                               // $7E2E  bne $7E69
	lda #$92                                     // $7E30
	sta $07f9                                    // $7E32
	lda #$07                                     // $7E35
	sta $d028                                    // $7E37
	lda #$a2                                     // $7E3A
	sta $d002                                    // $7E3C  ; VIC_SP1X
	lda #$70                                     // $7E3F
	sta $d003                                    // $7E41  ; VIC_SP1Y
	lda $d017                                    // $7E44  ; VIC_SPYEXP
	ora #$02                                     // $7E47
	sta $d017                                    // $7E49  ; VIC_SPYEXP
	sta $d01d                                    // $7E4C  ; VIC_SPXEXP
	lda $d01c                                    // $7E4F  ; VIC_SPMCOL
	and #$fd                                     // $7E52
	sta $d01c                                    // $7E54  ; VIC_SPMCOL
	lda $d01b                                    // $7E57  ; VIC_SPPRI
	and #$fd                                     // $7E5A
	sta $d01b                                    // $7E5C  ; VIC_SPPRI
	ldx #$10                                     // $7E5F
	lda $5d84,x                                  // $7E61
	sta $30,x                                    // $7E64
	dex                                          // $7E66
	.byte $10, $F8                               // $7E67  bpl $7E61
	lda $d010                                    // $7E69  ; VIC_SPXMSB
	and #$fd                                     // $7E6C
	sta $d010                                    // $7E6E  ; VIC_SPXMSB
	rts                                          // $7E71
	lda $d015                                    // $7E72  ; VIC_SPEN
	and #$0c                                     // $7E75
	.byte $D0, $01                               // $7E77  bne $7E7A
	rts                                          // $7E79
	dec $51                                      // $7E7A
	.byte $D0, $FB                               // $7E7C  bne $7E79
	lda #$0a                                     // $7E7E
	sta $51                                      // $7E80
	lda $d015                                    // $7E82  ; VIC_SPEN
	ora #$02                                     // $7E85
	sta $d015                                    // $7E87  ; VIC_SPEN
	inc $d003                                    // $7E8A  ; VIC_SP1Y
	inc $d003                                    // $7E8D  ; VIC_SP1Y
	lda $d003                                    // $7E90  ; VIC_SP1Y
	cmp #$f0                                     // $7E93
	.byte $B0, $1F                               // $7E95  bcs $7EB6
	cmp #$c0                                     // $7E97
	.byte $90, $27                               // $7E99  bcc $7EC2
	lda $d002                                    // $7E9B  ; VIC_SP1X
	cmp #$98                                     // $7E9E
	.byte $90, $20                               // $7EA0  bcc $7EC2
	cmp #$a8                                     // $7EA2
	.byte $B0, $1C                               // $7EA4  bcs $7EC2
	lda $d010                                    // $7EA6  ; VIC_SPXMSB
	and #$02                                     // $7EA9
	.byte $D0, $15                               // $7EAB  bne $7EC2
	lda $42                                      // $7EAD
	and #$7f                                     // $7EAF
	sta $43                                      // $7EB1
	jmp $6387                                    // $7EB3
	lda $d015                                    // $7EB6  ; VIC_SPEN
	and #$fd                                     // $7EB9
	sta $d015                                    // $7EBB  ; VIC_SPEN
	lda #$02                                     // $7EBE
	sta $55                                      // $7EC0
	rts                                          // $7EC2
	nop                                          // $7EC3
	nop                                          // $7EC4
	lda $d01e                                    // $7EC5  ; VIC_SPCOL
	and #$05                                     // $7EC8
	cmp #$05                                     // $7ECA
	.byte $D0, $31                               // $7ECC  bne $7EFF
	lda $d004                                    // $7ECE
	adc #$09                                     // $7ED1
	cmp $d000                                    // $7ED3  ; VIC_SP0X
	.byte $B0, $27                               // $7ED6  bcs $7EFF
	adc #$08                                     // $7ED8
	cmp $d000                                    // $7EDA  ; VIC_SP0X
	.byte $90, $20                               // $7EDD  bcc $7EFF
	lda $d005                                    // $7EDF
	cmp $d001                                    // $7EE2  ; VIC_SP0Y
	.byte $B0, $18                               // $7EE5  bcs $7EFF
	adc #$10                                     // $7EE7
	cmp $d001                                    // $7EE9  ; VIC_SP0Y
	.byte $90, $11                               // $7EEC  bcc $7EFF
	lda $42                                      // $7EEE
	sta $43                                      // $7EF0
	jsr $6387                                    // $7EF2
	lda #$80                                     // $7EF5
	sta $29                                      // $7EF7
	lda #$00                                     // $7EF9
	sta $42                                      // $7EFB
	sta $42                                      // $7EFD
	rts                                          // $7EFF
	ldx #$28                                     // $7F00
	lda #$00                                     // $7F02
	sta $d400,x                                  // $7F04  ; SID_FR1LO
	dex                                          // $7F07
	.byte $10, $F8                               // $7F08  bpl $7F02
	ldx #$18                                     // $7F0A
	lda $50c0,x                                  // $7F0C
	sta $d400,x                                  // $7F0F  ; SID_FR1LO
	dex                                          // $7F12
	.byte $10, $F7                               // $7F13  bpl $7F0C
	rts                                          // $7F15
	nop                                          // $7F16
	nop                                          // $7F17
	nop                                          // $7F18
	nop                                          // $7F19
	lda #$00                                     // $7F1A
	sta $33                                      // $7F1C
	lda #$40                                     // $7F1E
	sta $34                                      // $7F20
	lda #$30                                     // $7F22
	sta $30                                      // $7F24
	lda #$5c                                     // $7F26
	sta $31                                      // $7F28
	sta $35                                      // $7F2A
	dec $52                                      // $7F2C
	rts                                          // $7F2E
	dec $56                                      // $7F2F
	.byte $D0, $10                               // $7F31  bne $7F43
	lda $dc04                                    // $7F33
	sta $d002                                    // $7F36  ; VIC_SP1X
	sta $d004                                    // $7F39
	sta $d006                                    // $7F3C
	lda #$10                                     // $7F3F
	sta $56                                      // $7F41
	rts                                          // $7F43
	nop                                          // $7F44
	lda $d010                                    // $7F45  ; VIC_SPXMSB
	and #$06                                     // $7F48
	.byte $D0, $01                               // $7F4A  bne $7F4D
	rts                                          // $7F4C
	lda $d002                                    // $7F4D  ; VIC_SP1X
	cmp #$60                                     // $7F50
	.byte $90, $F8                               // $7F52  bcc $7F4C
	cmp #$a0                                     // $7F54
	.byte $B0, $F4                               // $7F56  bcs $7F4C
	lda $4e                                      // $7F58
	sta $42                                      // $7F5A
	rts                                          // $7F5C
	brk                                          // $7F5D
	brk                                          // $7F5E
	brk                                          // $7F5F
	ldx #$00                                     // $7F60
	lda $5790,x                                  // $7F62
	sta $07a9,x                                  // $7F65
	lda #$0a                                     // $7F68
	sta $dba9,x                                  // $7F6A
	inx                                          // $7F6D
	cpx #$06                                     // $7F6E
	.byte $D0, $F0                               // $7F70  bne $7F62
	lda $5790,x                                  // $7F72
	sta $07cb,x                                  // $7F75
	lda #$0a                                     // $7F78
	sta $dbcb,x                                  // $7F7A
	inx                                          // $7F7D
	cpx #$0d                                     // $7F7E
	.byte $D0, $F0                               // $7F80  bne $7F72
	rts                                          // $7F82
	nop                                          // $7F83
	nop                                          // $7F84
	lda $16                                      // $7F85
	cmp #$18                                     // $7F87
	.byte $90, $04                               // $7F89  bcc $7F8F
	lda #$00                                     // $7F8B
	sta $16                                      // $7F8D
	inc $16                                      // $7F8F
	inc $16                                      // $7F91
	inc $16                                      // $7F93
	inc $16                                      // $7F95
	jmp $61ca                                    // $7F97
	nop                                          // $7F9A
	nop                                          // $7F9B
	nop                                          // $7F9C
	nop                                          // $7F9D
	nop                                          // $7F9E
	nop                                          // $7F9F
	lda $d01d                                    // $7FA0  ; VIC_SPXEXP
	ora #$06                                     // $7FA3
	sta $d01d                                    // $7FA5  ; VIC_SPXEXP
	clc                                          // $7FA8
	lda $d002                                    // $7FA9  ; VIC_SP1X
	adc #$30                                     // $7FAC
	sta $d004                                    // $7FAE
	lda $d01b                                    // $7FB1  ; VIC_SPPRI
	and #$f9                                     // $7FB4
	sta $d01b                                    // $7FB6  ; VIC_SPPRI
	rts                                          // $7FB9
	lda $d017                                    // $7FBA  ; VIC_SPYEXP
	ora #$06                                     // $7FBD
	sta $d017                                    // $7FBF  ; VIC_SPYEXP
	rts                                          // $7FC2
	nop                                          // $7FC3
	nop                                          // $7FC4
	ldy $dc05                                    // $7FC5
	ldx $5050,y                                  // $7FC8
	lda $0400,x                                  // $7FCB
	cmp #$7b                                     // $7FCE
	.byte $F0, $01                               // $7FD0  beq $7FD3
	rts                                          // $7FD2
	lda #$7c                                     // $7FD3
	sta $0400,x                                  // $7FD5
	lda #$01                                     // $7FD8
	sta $d800,x                                  // $7FDA
	ldy #$00                                     // $7FDD
	dey                                          // $7FDF
	.byte $D0, $FD                               // $7FE0  bne $7FDF
	lda #$7b                                     // $7FE2
	sta $0400,x                                  // $7FE4
	rts                                          // $7FE7
	lda $42                                      // $7FE8
	cmp #$a0                                     // $7FEA
	.byte $D0, $07                               // $7FEC  bne $7FF5
	lda $55                                      // $7FEE
	.byte $D0, $03                               // $7FF0  bne $7FF5
	jmp $7e82                                    // $7FF2
	rts                                          // $7FF5
	nop                                          // $7FF6
	nop                                          // $7FF7
	nop                                          // $7FF8
	nop                                          // $7FF9
