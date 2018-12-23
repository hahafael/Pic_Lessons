//O usuário tem 10 segundos para apertar em uma quantidade de x vezes um botão. Ao final dos 10 segundos, o número de vezes em que o botão foi apertado
//será     gerado um pwm na saída com duty cicle proporcional.

#define  select   LATB0_bit

int temp=0;
int cont=0;
bit flag;


void tempo();

void InitMain(){

     PWM1_Init(5000);
     TRISB = 0x01; //RB0 COMO INPUT.
     LATB  = 0x00;  //Começa tudo em 0.
     ADCON1 = 0x0F; //entradas e saídas digitais
     TMR0H =  0x85;
     TMR0L =  0xEE;
     T0CON =  0x84; //Liga TMR0 no modo de 16 bits e prescaler 1:32
     flag = 0;

     //O cálculo de tempo de estouro do timer0 é :
     //(65536- TMR0) * prescaler * ciclo de maquina
     //(65536 - 0x85EE )*32* 1/4M
     //(65536 - 34286)*32*250n =  250ms

}

void main() {
     InitMain();
     PWM1_Start();
     PWM1_Set_Duty(30000);

     while(1){
              if(TMR0IF_bit){

                            TMR0IF_bit = 0;
                            TMR0H = 0x85;
                            TMR0L = 0xEE;
                            temp++;
                            if(!flag) tempo();

              }
              

     }

}


void tempo(){
     if(temp == 0x28){         //tempo do usuário apertar o botão acaba.
             temp = 0;
             flag = 0x01;
             switch (cont){
                     case 0:
                     PWM1_Set_Duty(0);
                     case 1:
                     PWM1_Set_Duty(0);
                     case 2:
                     PWM1_Set_Duty(30000);
                     case 3:
                     PWM1_Set_Duty(0);
                     case 4:
                     PWM1_Set_Duty(30000);

              }
             
     
     }
     else{
          if(select){
                     cont++;
          }
     
     }


     }