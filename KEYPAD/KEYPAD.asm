
_interrupt:

;KEYPAD.c,19 :: 		void interrupt()
;KEYPAD.c,28 :: 		if(TMR0IF_bit){               //estouro a cada 62,5ms
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;KEYPAD.c,30 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;KEYPAD.c,31 :: 		TMR0H = 0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;KEYPAD.c,32 :: 		TMR0L = 0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;KEYPAD.c,33 :: 		teste = ~teste;
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;KEYPAD.c,36 :: 		if(col_1 && control == 0x01)        //Coluna 1 em nível high? Control igual 1?
	BTFSS       RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L_interrupt3
	MOVF        _control+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
L__interrupt42:
;KEYPAD.c,38 :: 		control = 0x02;
	MOVLW       2
	MOVWF       _control+0 
;KEYPAD.c,39 :: 		col_1 = 0x00;                    //Apenas a coluna 1 em nível baixo
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPAD.c,40 :: 		col_2 = 0x01;
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPAD.c,41 :: 		col_3 = 0x01;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPAD.c,43 :: 		if(!row_A)      pulse(1);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt4
	MOVLW       1
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt5
L_interrupt4:
;KEYPAD.c,44 :: 		else if(!row_B) pulse(4);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt6
	MOVLW       4
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt7
L_interrupt6:
;KEYPAD.c,45 :: 		else if(!row_C) pulse(7);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt8
	MOVLW       7
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt9
L_interrupt8:
;KEYPAD.c,46 :: 		else if(!row_D) pulse(11);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt10
	MOVLW       11
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt10:
L_interrupt9:
L_interrupt7:
L_interrupt5:
;KEYPAD.c,48 :: 		}
	GOTO        L_interrupt11
L_interrupt3:
;KEYPAD.c,49 :: 		else if(col_2 && control == 0x02)   //Coluna 2 em nível high? Control igual 2?
	BTFSS       RD1_bit+0, BitPos(RD1_bit+0) 
	GOTO        L_interrupt14
	MOVF        _control+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt14
L__interrupt41:
;KEYPAD.c,51 :: 		control = 0x03;
	MOVLW       3
	MOVWF       _control+0 
;KEYPAD.c,52 :: 		col_1 = 0x01;                    //Apenas a coluna 2 em nível baixo
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPAD.c,53 :: 		col_2 = 0x00;
	BCF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPAD.c,54 :: 		col_3 = 0x01;
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPAD.c,56 :: 		if(!row_A)      pulse(2);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt15
	MOVLW       2
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt16
L_interrupt15:
;KEYPAD.c,57 :: 		else if(!row_B) pulse(5);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt17
	MOVLW       5
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt18
L_interrupt17:
;KEYPAD.c,58 :: 		else if(!row_C) pulse(8);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt19
	MOVLW       8
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt20
L_interrupt19:
;KEYPAD.c,59 :: 		else if(!row_D) pulse(10);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt21
	MOVLW       10
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt21:
L_interrupt20:
L_interrupt18:
L_interrupt16:
;KEYPAD.c,61 :: 		}
	GOTO        L_interrupt22
L_interrupt14:
;KEYPAD.c,62 :: 		else if(col_3 && control == 0x03)   //Coluna 3 em nível high? Control igual 3?
	BTFSS       RD2_bit+0, BitPos(RD2_bit+0) 
	GOTO        L_interrupt25
	MOVF        _control+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt25
L__interrupt40:
;KEYPAD.c,64 :: 		control = 0x01;
	MOVLW       1
	MOVWF       _control+0 
;KEYPAD.c,65 :: 		col_1 = 0x01;                    //Apenas a coluna 3 em nível baixo
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;KEYPAD.c,66 :: 		col_2 = 0x01;
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
;KEYPAD.c,67 :: 		col_3 = 0x00;
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
;KEYPAD.c,69 :: 		if(!row_A)      pulse(3);
	BTFSC       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_interrupt26
	MOVLW       3
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt27
L_interrupt26:
;KEYPAD.c,70 :: 		else if(!row_B) pulse(6);
	BTFSC       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_interrupt28
	MOVLW       6
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt29
L_interrupt28:
;KEYPAD.c,71 :: 		else if(!row_C) pulse(9);
	BTFSC       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_interrupt30
	MOVLW       9
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
	GOTO        L_interrupt31
L_interrupt30:
;KEYPAD.c,72 :: 		else if(!row_D) pulse(12);
	BTFSC       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_interrupt32
	MOVLW       12
	MOVWF       FARG_pulse_number+0 
	CALL        _pulse+0, 0
L_interrupt32:
L_interrupt31:
L_interrupt29:
L_interrupt27:
;KEYPAD.c,74 :: 		}
L_interrupt25:
L_interrupt22:
L_interrupt11:
;KEYPAD.c,79 :: 		}
L_interrupt0:
;KEYPAD.c,81 :: 		} //end interrupt
L_end_interrupt:
L__interrupt44:
	RETFIE      1
; end of _interrupt

_main:

;KEYPAD.c,85 :: 		void main()
;KEYPAD.c,87 :: 		TRISA =  0x00;
	CLRF        TRISA+0 
;KEYPAD.c,88 :: 		PORTA =  0x00;
	CLRF        PORTA+0 
;KEYPAD.c,89 :: 		TRISD =  0x78; // = 0b01111000
	MOVLW       120
	MOVWF       TRISD+0 
;KEYPAD.c,90 :: 		PORTD =  0x7F; // = 0b01111111
	MOVLW       127
	MOVWF       PORTD+0 
;KEYPAD.c,91 :: 		ADCON1 = 0x0F; //entradas e saídas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;KEYPAD.c,92 :: 		INTCON = 0xA0;// 0b10100000 interrupções globais ligadas
	MOVLW       160
	MOVWF       INTCON+0 
;KEYPAD.c,93 :: 		TMR0H =  0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;KEYPAD.c,94 :: 		TMR0L =  0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;KEYPAD.c,95 :: 		T0CON =  0x82; //Liga TMR0 no modo de 16 bits e prescaler 1:8
	MOVLW       130
	MOVWF       T0CON+0 
;KEYPAD.c,98 :: 		while(1)                             //Loop Infinito
L_main33:
;KEYPAD.c,102 :: 		} //end while
	GOTO        L_main33
;KEYPAD.c,104 :: 		} //end main
L_end_main:
	GOTO        $+0
; end of _main

_pulse:

;KEYPAD.c,107 :: 		void pulse(char number)
;KEYPAD.c,111 :: 		for(i=0;i<number;i++)
	CLRF        R1 
L_pulse35:
	MOVF        FARG_pulse_number+0, 0 
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_pulse36
;KEYPAD.c,113 :: 		led = 0x01;
	BSF         RD7_bit+0, BitPos(RD7_bit+0) 
;KEYPAD.c,114 :: 		delay_ms(200);
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
;KEYPAD.c,115 :: 		led = 0x00;
	BCF         RD7_bit+0, BitPos(RD7_bit+0) 
;KEYPAD.c,116 :: 		delay_ms(200);
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
;KEYPAD.c,111 :: 		for(i=0;i<number;i++)
	INCF        R1, 1 
;KEYPAD.c,117 :: 		}
	GOTO        L_pulse35
L_pulse36:
;KEYPAD.c,120 :: 		}
L_end_pulse:
	RETURN      0
; end of _pulse
