
_interrupt:

;KEYPADLCD.c,35 :: 		void interrupt()
;KEYPADLCD.c,42 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;KEYPADLCD.c,44 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;KEYPADLCD.c,45 :: 		TMR0H = 0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;KEYPADLCD.c,46 :: 		TMR0L = 0xB0;
	MOVLW       176
	MOVWF       TMR0L+0 
;KEYPADLCD.c,47 :: 		teste = ~teste;
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;KEYPADLCD.c,50 :: 		if(col_1 && control == 0x01)        //Coluna 1 em nível high? Control igual 1?
	BTFSS       RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L_interrupt3
	MOVF        _control+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
L__interrupt42:
;KEYPADLCD.c,52 :: 		control = 0x02;
	MOVLW       2
	MOVWF       _control+0 
;KEYPADLCD.c,53 :: 		col_1 = 0x00;                    //Apenas a coluna 1 em nível baixo
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPADLCD.c,54 :: 		col_2 = 0x01;
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPADLCD.c,55 :: 		col_3 = 0x01;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPADLCD.c,57 :: 		if(!row_A)      pulse(1);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt4
	MOVLW       1
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt5
L_interrupt4:
;KEYPADLCD.c,58 :: 		else if(!row_B) pulse(4);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt6
	MOVLW       4
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt7
L_interrupt6:
;KEYPADLCD.c,59 :: 		else if(!row_C) pulse(7);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt8
	MOVLW       7
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt9
L_interrupt8:
;KEYPADLCD.c,60 :: 		else if(!row_D) pulse(11);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt10
	MOVLW       11
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt10:
L_interrupt9:
L_interrupt7:
L_interrupt5:
;KEYPADLCD.c,62 :: 		}
	GOTO        L_interrupt11
L_interrupt3:
;KEYPADLCD.c,63 :: 		else if(col_2 && control == 0x02)   //Coluna 2 em nível high? Control igual 2?
	BTFSS       RD1_bit+0, BitPos(RD1_bit+0) 
	GOTO        L_interrupt14
	MOVF        _control+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt14
L__interrupt41:
;KEYPADLCD.c,65 :: 		control = 0x03;
	MOVLW       3
	MOVWF       _control+0 
;KEYPADLCD.c,66 :: 		col_1 = 0x01;                    //Apenas a coluna 2 em nível baixo
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPADLCD.c,67 :: 		col_2 = 0x00;
	BCF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPADLCD.c,68 :: 		col_3 = 0x01;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPADLCD.c,70 :: 		if(!row_A)      pulse(2);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt15
	MOVLW       2
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt16
L_interrupt15:
;KEYPADLCD.c,71 :: 		else if(!row_B) pulse(5);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt17
	MOVLW       5
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt18
L_interrupt17:
;KEYPADLCD.c,72 :: 		else if(!row_C) pulse(8);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt19
	MOVLW       8
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt20
L_interrupt19:
;KEYPADLCD.c,73 :: 		else if(!row_D) pulse(10);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt21
	MOVLW       10
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt21:
L_interrupt20:
L_interrupt18:
L_interrupt16:
;KEYPADLCD.c,75 :: 		}
	GOTO        L_interrupt22
L_interrupt14:
;KEYPADLCD.c,76 :: 		else if(col_3 && control == 0x03)   //Coluna 3 em nível high? Control igual 3?
	BTFSS       RD2_bit+0, BitPos(RD2_bit+0) 
	GOTO        L_interrupt25
	MOVF        _control+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt25
L__interrupt40:
;KEYPADLCD.c,78 :: 		control = 0x01;
	MOVLW       1
	MOVWF       _control+0 
;KEYPADLCD.c,79 :: 		col_1 = 0x01;                    //Apenas a coluna 3 em nível baixo
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPADLCD.c,80 :: 		col_2 = 0x01;
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPADLCD.c,81 :: 		col_3 = 0x00;
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPADLCD.c,83 :: 		if(!row_A)      pulse(3);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt26
	MOVLW       3
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt27
L_interrupt26:
;KEYPADLCD.c,84 :: 		else if(!row_B) pulse(6);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt28
	MOVLW       6
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt29
L_interrupt28:
;KEYPADLCD.c,85 :: 		else if(!row_C) pulse(9);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt30
	MOVLW       9
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt31
L_interrupt30:
;KEYPADLCD.c,86 :: 		else if(!row_D) pulse(12);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt32
	MOVLW       12
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt32:
L_interrupt31:
L_interrupt29:
L_interrupt27:
;KEYPADLCD.c,88 :: 		}
L_interrupt25:
L_interrupt22:
L_interrupt11:
;KEYPADLCD.c,93 :: 		}
L_interrupt0:
;KEYPADLCD.c,95 :: 		} //end interrupt
L_end_interrupt:
L__interrupt44:
	RETFIE      1
; end of _interrupt

_main:

;KEYPADLCD.c,99 :: 		void main()
;KEYPADLCD.c,101 :: 		TRISA =  0x00;
	CLRF        TRISA+0 
;KEYPADLCD.c,102 :: 		PORTA =  0x00;
	CLRF        PORTA+0 
;KEYPADLCD.c,103 :: 		TRISD =  0x78; // = 0b01111000
	MOVLW       120
	MOVWF       TRISD+0 
;KEYPADLCD.c,104 :: 		PORTD =  0x7F; // = 0b01111111
	MOVLW       127
	MOVWF       PORTD+0 
;KEYPADLCD.c,105 :: 		ADCON1 = 0x0F; //entradas e saídas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;KEYPADLCD.c,106 :: 		INTCON = 0xA0;// 0b10100000 interrupções globais ligadas
	MOVLW       160
	MOVWF       INTCON+0 
;KEYPADLCD.c,107 :: 		TMR0H =  0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;KEYPADLCD.c,108 :: 		TMR0L =  0xB0;
	MOVLW       176
	MOVWF       TMR0L+0 
;KEYPADLCD.c,109 :: 		T0CON =  0x82; //Liga TMR0 no modo de 16 bits e prescaler 1:8
	MOVLW       130
	MOVWF       T0CON+0 
;KEYPADLCD.c,110 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;KEYPADLCD.c,112 :: 		while(1)                             //Loop Infinito
L_main33:
;KEYPADLCD.c,116 :: 		} //end while
	GOTO        L_main33
;KEYPADLCD.c,118 :: 		} //end main
L_end_main:
	GOTO        $+0
; end of _main

_pulse:

;KEYPADLCD.c,121 :: 		void pulse(char number)
;KEYPADLCD.c,125 :: 		for(i=0;i<number;i++)
	CLRF        R1 
L_pulse35:
	MOVF        FARG_pulse_number+0, 0 
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_pulse36
;KEYPADLCD.c,127 :: 		led = 0x01;
	BSF         RD7_bit+0, BitPos(RD7_bit+0) 
;KEYPADLCD.c,128 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_pulse38:
	DECFSZ      R13, 1, 1
	BRA         L_pulse38
	DECFSZ      R12, 1, 1
	BRA         L_pulse38
	DECFSZ      R11, 1, 1
	BRA         L_pulse38
;KEYPADLCD.c,129 :: 		led = 0x00;
	BCF         RD7_bit+0, BitPos(RD7_bit+0) 
;KEYPADLCD.c,130 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_pulse39:
	DECFSZ      R13, 1, 1
	BRA         L_pulse39
	DECFSZ      R12, 1, 1
	BRA         L_pulse39
	DECFSZ      R11, 1, 1
	BRA         L_pulse39
;KEYPADLCD.c,125 :: 		for(i=0;i<number;i++)
	INCF        R1, 1 
;KEYPADLCD.c,131 :: 		}
	GOTO        L_pulse35
L_pulse36:
;KEYPADLCD.c,134 :: 		}
L_end_pulse:
	RETURN      0
; end of _pulse
