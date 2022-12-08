
_arrosage:

;MyProject.c,32 :: 		void arrosage(){
;MyProject.c,33 :: 		testArrosage=0;
	CLRF       _testArrosage+0
	CLRF       _testArrosage+1
;MyProject.c,34 :: 		finArrosageClrCount=0;
	CLRF       _finArrosageClrCount+0
	CLRF       _finArrosageClrCount+1
;MyProject.c,36 :: 		if(arrosageClrCount==0){
	MOVLW      0
	XORWF      _arrosageClrCount+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__arrosage53
	MOVLW      0
	XORWF      _arrosageClrCount+0, 0
L__arrosage53:
	BTFSS      STATUS+0, 2
	GOTO       L_arrosage0
;MyProject.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,38 :: 		}
L_arrosage0:
;MyProject.c,39 :: 		Lcd_out(1,2,"Arrosage gazon");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,40 :: 		portd.rd6=1;
	BSF        PORTD+0, 6
;MyProject.c,41 :: 		arrosageClrCount++;
	INCF       _arrosageClrCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _arrosageClrCount+1, 1
;MyProject.c,42 :: 		}
L_end_arrosage:
	RETURN
; end of _arrosage

_finArrosage:

;MyProject.c,44 :: 		void finArrosage(){
;MyProject.c,45 :: 		arrosageClrCount=0;
	CLRF       _arrosageClrCount+0
	CLRF       _arrosageClrCount+1
;MyProject.c,47 :: 		if(finArrosageClrCount==0){
	MOVLW      0
	XORWF      _finArrosageClrCount+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__finArrosage55
	MOVLW      0
	XORWF      _finArrosageClrCount+0, 0
L__finArrosage55:
	BTFSS      STATUS+0, 2
	GOTO       L_finArrosage1
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,49 :: 		}
L_finArrosage1:
;MyProject.c,50 :: 		Lcd_out(1,3,"Fin arrosage");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,51 :: 		Lcd_out(2,6,"gazon");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,52 :: 		portd.rd6=0;
	BCF        PORTD+0, 6
;MyProject.c,53 :: 		finArrosageClrCount++;
	INCF       _finArrosageClrCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _finArrosageClrCount+1, 1
;MyProject.c,54 :: 		}
L_end_finArrosage:
	RETURN
; end of _finArrosage

_panne:

;MyProject.c,56 :: 		void panne(){
;MyProject.c,57 :: 		Lcd_out(1,1,"Systeme en panne");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,58 :: 		portd.rd7=1;
	BSF        PORTD+0, 7
;MyProject.c,59 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_panne2:
	DECFSZ     R13+0, 1
	GOTO       L_panne2
	DECFSZ     R12+0, 1
	GOTO       L_panne2
	DECFSZ     R11+0, 1
	GOTO       L_panne2
	NOP
	NOP
;MyProject.c,60 :: 		portd.rd7=0;
	BCF        PORTD+0, 7
;MyProject.c,61 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_panne3:
	DECFSZ     R13+0, 1
	GOTO       L_panne3
	DECFSZ     R12+0, 1
	GOTO       L_panne3
	DECFSZ     R11+0, 1
	GOTO       L_panne3
	NOP
	NOP
;MyProject.c,62 :: 		portd.rd6=0;
	BCF        PORTD+0, 6
;MyProject.c,64 :: 		}
L_end_panne:
	RETURN
; end of _panne

_pluieFn:

;MyProject.c,66 :: 		void pluieFn(){
;MyProject.c,67 :: 		if(pluieClrCount==0){
	MOVLW      0
	XORWF      _pluieClrCount+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pluieFn58
	MOVLW      0
	XORWF      _pluieClrCount+0, 0
L__pluieFn58:
	BTFSS      STATUS+0, 2
	GOTO       L_pluieFn4
;MyProject.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,69 :: 		}
L_pluieFn4:
;MyProject.c,70 :: 		Lcd_out(1,5,"PLUIE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,71 :: 		portd.rd6=0;
	BCF        PORTD+0, 6
;MyProject.c,72 :: 		pluieClrCount++;
	INCF       _pluieClrCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _pluieClrCount+1, 1
;MyProject.c,73 :: 		}
L_end_pluieFn:
	RETURN
; end of _pluieFn

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,75 :: 		void interrupt()
;MyProject.c,77 :: 		if((INTCON.RBIF)&&(INTCON.RBIE)){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt7
	BTFSS      INTCON+0, 3
	GOTO       L_interrupt7
L__interrupt48:
;MyProject.c,78 :: 		if(portb.RB4==1){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt8
;MyProject.c,79 :: 		testArrosage=1;
	MOVLW      1
	MOVWF      _testArrosage+0
	MOVLW      0
	MOVWF      _testArrosage+1
;MyProject.c,81 :: 		}
L_interrupt8:
;MyProject.c,82 :: 		if(portb.rb4==0){
	BTFSC      PORTB+0, 4
	GOTO       L_interrupt9
;MyProject.c,83 :: 		testArrosage=0;
	CLRF       _testArrosage+0
	CLRF       _testArrosage+1
;MyProject.c,84 :: 		intcon.RBIF=0;
	BCF        INTCON+0, 0
;MyProject.c,86 :: 		}    if(portb.RB5==1){
L_interrupt9:
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt10
;MyProject.c,87 :: 		consulter=1;
	MOVLW      1
	MOVWF      _consulter+0
	MOVLW      0
	MOVWF      _consulter+1
;MyProject.c,89 :: 		}if(portb.RB5==0){
L_interrupt10:
	BTFSC      PORTB+0, 5
	GOTO       L_interrupt11
;MyProject.c,90 :: 		consulter=0;
	CLRF       _consulter+0
	CLRF       _consulter+1
;MyProject.c,92 :: 		}
L_interrupt11:
;MyProject.c,93 :: 		if(testArrosage2==0){
	MOVLW      0
	XORWF      _testArrosage2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt61
	MOVLW      0
	XORWF      _testArrosage2+0, 0
L__interrupt61:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
;MyProject.c,94 :: 		intcon.RBIF=0;
	BCF        INTCON+0, 0
;MyProject.c,95 :: 		}
L_interrupt12:
;MyProject.c,96 :: 		}
L_interrupt7:
;MyProject.c,98 :: 		if((INTCON.INTF)&&(INTCON.INTE))
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt15
	BTFSS      INTCON+0, 4
	GOTO       L_interrupt15
L__interrupt47:
;MyProject.c,100 :: 		if(portb.rb0==1){
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt16
;MyProject.c,101 :: 		pluie=1;
	MOVLW      1
	MOVWF      _pluie+0
	MOVLW      0
	MOVWF      _pluie+1
;MyProject.c,102 :: 		}else{
	GOTO       L_interrupt17
L_interrupt16:
;MyProject.c,103 :: 		pluie=0;
	CLRF       _pluie+0
	CLRF       _pluie+1
;MyProject.c,104 :: 		}
L_interrupt17:
;MyProject.c,105 :: 		intcon.INTF=0;
	BCF        INTCON+0, 1
;MyProject.c,106 :: 		}
L_interrupt15:
;MyProject.c,109 :: 		if(INTCON.T0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt18
;MyProject.c,110 :: 		TMR0= 256;
	MOVLW      0
	MOVWF      TMR0+0
;MyProject.c,111 :: 		if(timerCmp>=0){
	MOVLW      128
	XORWF      _timerCmp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt62
	MOVLW      0
	SUBWF      _timerCmp+0, 0
L__interrupt62:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt19
;MyProject.c,112 :: 		timerCmp--;
	MOVLW      1
	SUBWF      _timerCmp+0, 1
	BTFSS      STATUS+0, 0
	DECF       _timerCmp+1, 1
;MyProject.c,113 :: 		}
L_interrupt19:
;MyProject.c,114 :: 		INTCON.T0IF=0;
	BCF        INTCON+0, 2
;MyProject.c,115 :: 		}
L_interrupt18:
;MyProject.c,116 :: 		}
L_end_interrupt:
L__interrupt60:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,119 :: 		void main(){
;MyProject.c,120 :: 		trisD=0;
	CLRF       TRISD+0
;MyProject.c,121 :: 		portD=0;
	CLRF       PORTD+0
;MyProject.c,122 :: 		TRISB.RB0=1;
	BSF        TRISB+0, 0
;MyProject.c,123 :: 		TRISB.RB4=1;
	BSF        TRISB+0, 4
;MyProject.c,124 :: 		TRISB.RB5=1;
	BSF        TRISB+0, 5
;MyProject.c,127 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;MyProject.c,128 :: 		INTCON.RBIE=1;
	BSF        INTCON+0, 3
;MyProject.c,129 :: 		INTCON.INTE=1;
	BSF        INTCON+0, 4
;MyProject.c,130 :: 		OPTION_REG.INTEDG=1;
	BSF        OPTION_REG+0, 6
;MyProject.c,132 :: 		TMR0= 256;
	MOVLW      0
	MOVWF      TMR0+0
;MyProject.c,133 :: 		INTCON.T0IE=1;
	BSF        INTCON+0, 5
;MyProject.c,134 :: 		OPTION_REG.T0CS=0;
	BCF        OPTION_REG+0, 5
;MyProject.c,135 :: 		OPTION_REG.T0SE=0;
	BCF        OPTION_REG+0, 4
;MyProject.c,136 :: 		OPTION_REG.PSA=0;
	BCF        OPTION_REG+0, 3
;MyProject.c,137 :: 		OPTION_REG.PS2=1;
	BSF        OPTION_REG+0, 2
;MyProject.c,138 :: 		OPTION_REG.PS1=1;
	BSF        OPTION_REG+0, 1
;MyProject.c,139 :: 		OPTION_REG.PS0=1;
	BSF        OPTION_REG+0, 0
;MyProject.c,141 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,142 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,143 :: 		Lcd_out(1,5,"Welcome");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,144 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
;MyProject.c,145 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,146 :: 		Lcd_out(1,3,"SMART GARDEN");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,147 :: 		Lcd_out(2,3,"By ApexAlliance");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,148 :: 		delay_ms(1200);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      45
	MOVWF      R12+0
	MOVLW      215
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;MyProject.c,149 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,151 :: 		do{
L_main22:
;MyProject.c,152 :: 		if (consulter == 1)
	MOVLW      0
	XORWF      _consulter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      1
	XORWF      _consulter+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L_main25
;MyProject.c,155 :: 		Lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,156 :: 		EEPROM_Write(ADDRESS, nb_panne);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _nb_panne+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,157 :: 		variable = EEPROM_Read(ADDRESS);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _variable+0
	CLRF       _variable+1
;MyProject.c,158 :: 		Lcd_out(1,2,"Nombre de panne:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,159 :: 		InttoStr(variable,string_variable);
	MOVF       _variable+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _variable+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _string_variable+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,160 :: 		Lcd_out(2,1,string_variable);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string_variable+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,161 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	NOP
;MyProject.c,162 :: 		consulter=0;
	CLRF       _consulter+0
	CLRF       _consulter+1
;MyProject.c,164 :: 		}
L_main25:
;MyProject.c,165 :: 		if(pluie==1){
	MOVLW      0
	XORWF      _pluie+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      1
	XORWF      _pluie+0, 0
L__main65:
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;MyProject.c,166 :: 		pluieFn();
	CALL       _pluieFn+0
;MyProject.c,167 :: 		intcon.INTF=1;
	BSF        INTCON+0, 1
;MyProject.c,168 :: 		}else{
	GOTO       L_main28
L_main27:
;MyProject.c,169 :: 		pluieClrCount=0;
	CLRF       _pluieClrCount+0
	CLRF       _pluieClrCount+1
;MyProject.c,170 :: 		if(finArrosageClrCount==0){
	MOVLW      0
	XORWF      _finArrosageClrCount+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      0
	XORWF      _finArrosageClrCount+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;MyProject.c,171 :: 		arrosage();
	CALL       _arrosage+0
;MyProject.c,172 :: 		}
L_main29:
;MyProject.c,173 :: 		hum= adc_read(0)*0.49;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      72
	MOVWF      R4+0
	MOVLW      225
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _hum+0
	MOVF       R0+1, 0
	MOVWF      _hum+1
;MyProject.c,175 :: 		if(testArrosage==1){
	MOVLW      0
	XORWF      _testArrosage+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      1
	XORWF      _testArrosage+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;MyProject.c,176 :: 		arrosage();
	CALL       _arrosage+0
;MyProject.c,177 :: 		intcon.RBIF=1;
	BSF        INTCON+0, 0
;MyProject.c,178 :: 		}
L_main30:
;MyProject.c,180 :: 		if(hum>=50){
	MOVLW      128
	XORWF      _hum+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      50
	SUBWF      _hum+0, 0
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main31
;MyProject.c,181 :: 		start=0;
	CLRF       _start+0
	CLRF       _start+1
;MyProject.c,182 :: 		}
L_main31:
;MyProject.c,184 :: 		if(hum<=30 || start==1){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _hum+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       _hum+0, 0
	SUBLW      30
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L__main51
	MOVLW      0
	XORWF      _start+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      1
	XORWF      _start+0, 0
L__main70:
	BTFSC      STATUS+0, 2
	GOTO       L__main51
	GOTO       L_main34
L__main51:
;MyProject.c,185 :: 		if(hum==28){
	MOVLW      0
	XORWF      _hum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      28
	XORWF      _hum+0, 0
L__main71:
	BTFSS      STATUS+0, 2
	GOTO       L_main35
;MyProject.c,186 :: 		test=0;
	CLRF       _test+0
	CLRF       _test+1
;MyProject.c,187 :: 		timerCmp=4577; //5 minute
	MOVLW      225
	MOVWF      _timerCmp+0
	MOVLW      17
	MOVWF      _timerCmp+1
;MyProject.c,188 :: 		}
L_main35:
;MyProject.c,189 :: 		arrosage();
	CALL       _arrosage+0
;MyProject.c,191 :: 		}else {
	GOTO       L_main36
L_main34:
;MyProject.c,192 :: 		if(finArrosageClrCount!=0 || hum>=50){
	MOVLW      0
	XORWF      _finArrosageClrCount+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      0
	XORWF      _finArrosageClrCount+0, 0
L__main72:
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      128
	XORWF      _hum+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      50
	SUBWF      _hum+0, 0
L__main73:
	BTFSC      STATUS+0, 0
	GOTO       L__main50
	GOTO       L_main39
L__main50:
;MyProject.c,193 :: 		start=0;
	CLRF       _start+0
	CLRF       _start+1
;MyProject.c,194 :: 		finArrosage();
	CALL       _finArrosage+0
;MyProject.c,195 :: 		}
L_main39:
;MyProject.c,196 :: 		}
L_main36:
;MyProject.c,198 :: 		while(hum<29 && timerCmp>0){
L_main40:
	MOVLW      128
	XORWF      _hum+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      29
	SUBWF      _hum+0, 0
L__main74:
	BTFSC      STATUS+0, 0
	GOTO       L_main41
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _timerCmp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVF       _timerCmp+0, 0
	SUBLW      0
L__main75:
	BTFSC      STATUS+0, 0
	GOTO       L_main41
L__main49:
;MyProject.c,199 :: 		hum= adc_read(0)*0.49;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      72
	MOVWF      R4+0
	MOVLW      225
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _hum+0
	MOVF       R0+1, 0
	MOVWF      _hum+1
;MyProject.c,200 :: 		if(test==0){
	MOVLW      0
	XORWF      _test+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      0
	XORWF      _test+0, 0
L__main76:
	BTFSS      STATUS+0, 2
	GOTO       L_main44
;MyProject.c,201 :: 		nb_panne++;
	INCF       _nb_panne+0, 1
	BTFSC      STATUS+0, 2
	INCF       _nb_panne+1, 1
;MyProject.c,203 :: 		}
L_main44:
;MyProject.c,204 :: 		test++;
	INCF       _test+0, 1
	BTFSC      STATUS+0, 2
	INCF       _test+1, 1
;MyProject.c,205 :: 		panne();
	CALL       _panne+0
;MyProject.c,206 :: 		}
	GOTO       L_main40
L_main41:
;MyProject.c,210 :: 		if(portb.rb4==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main45
;MyProject.c,211 :: 		testArrosage2=1;
	MOVLW      1
	MOVWF      _testArrosage2+0
	MOVLW      0
	MOVWF      _testArrosage2+1
;MyProject.c,212 :: 		}else{
	GOTO       L_main46
L_main45:
;MyProject.c,213 :: 		testArrosage2=0;
	CLRF       _testArrosage2+0
	CLRF       _testArrosage2+1
;MyProject.c,214 :: 		}
L_main46:
;MyProject.c,217 :: 		}
L_main28:
;MyProject.c,218 :: 		}while(1);
	GOTO       L_main22
;MyProject.c,220 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
