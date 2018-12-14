#line 1 "C:/Users/rafaa/Documents/GitHub/PIC-Lessons/TIMER0/TIMER0.c"
int cont=0;
void main() {

 TRISB = 0x00;
 LATB = 0x00;
 ADCON1 = 0x0F;
 TMR0H = 0x85;
 TMR0L = 0xEE;
 T0CON = 0x84;






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
