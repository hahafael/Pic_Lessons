int cont=0;
void main() {

     TRISB = 0x00; //PORTB = saídas
     LATB  = 0x00;
     ADCON1 = 0x0F; //entradas e saídas digitais
     TMR0H =  0x85;
     TMR0L =  0xEE;
     T0CON =  0x84; //Liga TMR0 no modo de 16 bits e prescaler 1:32

     //O cálculo de tempo de estouro do timer0 é :
     //(65536- TMR0) * prescaler * ciclo de maquina
     //(65536 - 0x85EE )*32* 1/4M
     //(65536 - 34286)*32*250n =  250ms

     while(1){
              if(TMR0IF_bit){
                            cont++;
                            TMR0IF_bit = 0;
                            TMR0H = 0x85;
                            TMR0L = 0xEE;
                            if(cont == 4){
                                    LATB3_bit = ~LATB3_BIT;
                                    cont = 0;
                             }

              }
     }
}