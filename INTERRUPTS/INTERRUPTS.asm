
_interrupt:

;INTERRUPTS.c,4 :: 		void interrupt(){
;INTERRUPTS.c,6 :: 		if(INT1IF_bit){
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt0
;INTERRUPTS.c,7 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;INTERRUPTS.c,8 :: 		led = ~led;
	BTG         LATA0_bit+0, BitPos(LATA0_bit+0) 
;INTERRUPTS.c,9 :: 		delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;INTERRUPTS.c,10 :: 		}
L_interrupt0:
;INTERRUPTS.c,12 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;INTERRUPTS.c,15 :: 		void main() {
;INTERRUPTS.c,16 :: 		LATA = 0x00;
	CLRF        LATA+0 
;INTERRUPTS.c,17 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;INTERRUPTS.c,18 :: 		ADCON1   = 0b00001111; //pinos setados como entradas/saidas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;INTERRUPTS.c,19 :: 		INTCON   = 0b10000000; //interrupções globais ligadas
	MOVLW       128
	MOVWF       INTCON+0 
;INTERRUPTS.c,20 :: 		INTCON2  = 0b10100000;  //Pull ups desabilitados, interrupção no pino em high-edge
	MOVLW       160
	MOVWF       INTCON2+0 
;INTERRUPTS.c,21 :: 		INTCON3  = 0b10001000;
	MOVLW       136
	MOVWF       INTCON3+0 
;INTERRUPTS.c,23 :: 		while(1){
L_main2:
;INTERRUPTS.c,24 :: 		}
	GOTO        L_main2
;INTERRUPTS.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
