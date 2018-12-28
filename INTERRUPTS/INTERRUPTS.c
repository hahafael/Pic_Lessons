//Demonstra a interrupção externa no pino INT1.
#define led LATA0_bit

void interrupt(){

     if(INT1IF_bit){
                INT1IF_bit = 0;
                led = ~led;
                delay_ms(500);
     }

}


void main() {
     LATA = 0x00;
     TRISA = 0x00;
     ADCON1   = 0b00001111; //pinos setados como entradas/saidas digitais
     INTCON   = 0b10000000; //interrupções globais ligadas
     INTCON2  = 0b10100000;  //Pull ups desabilitados, interrupção no pino em high-edge
     INTCON3  = 0b10001000;
     
     while(1){
     }
}