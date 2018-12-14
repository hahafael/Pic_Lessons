
_main:

;TIMER0.c,2 :: 		void main() {
;TIMER0.c,4 :: 		TRISB = 0x00; //PORTB = saídas
	CLRF        TRISB+0 
;TIMER0.c,5 :: 		LATB  = 0x00;
	CLRF        LATB+0 
;TIMER0.c,6 :: 		ADCON1 = 0x0F; //entradas e saídas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;TIMER0.c,7 :: 		TMR0H =  0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;TIMER0.c,8 :: 		TMR0L =  0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;TIMER0.c,9 :: 		T0CON =  0x84; //Liga TMR0 no modo de 16 bits e prescaler 1:32
	MOVLW       132
	MOVWF       T0CON+0 
;TIMER0.c,16 :: 		while(1){
L_main0:
;TIMER0.c,17 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_main2
;TIMER0.c,18 :: 		cont++;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
;TIMER0.c,19 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TIMER0.c,20 :: 		TMR0H = 0x85;
	MOVLW       133
	MOVWF       TMR0H+0 
;TIMER0.c,21 :: 		TMR0L = 0xEE;
	MOVLW       238
	MOVWF       TMR0L+0 
;TIMER0.c,22 :: 		if(cont == 4){
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVLW       4
	XORWF       _cont+0, 0 
L__main5:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;TIMER0.c,23 :: 		LATB3_bit = ~LATB3_BIT;
	BTG         LATB3_bit+0, BitPos(LATB3_bit+0) 
;TIMER0.c,24 :: 		cont = 0;
	CLRF        _cont+0 
	CLRF        _cont+1 
;TIMER0.c,25 :: 		}
L_main3:
;TIMER0.c,27 :: 		}
L_main2:
;TIMER0.c,28 :: 		}
	GOTO        L_main0
;TIMER0.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
