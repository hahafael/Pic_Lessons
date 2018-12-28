//O usuário tem 10 segundos para apertar em uma quantidade de x vezes um botão. Ao final dos 10 segundos, o número de vezes em que o botão foi apertado
//será     gerado um pwm na saída com duty cicle proporcional.

#define  select   RB0_bit    //leitura, PORTX


int temp=0;
int cont=0;
void tempo();
void button();

void InitMain(){

     PWM1_Init(5000);
     TRISB = 0x01; //RB0 COMO INPUT.
     LATB  = 0x00;  //Começa tudo em 0.
     ADCON1 = 0x0F; //entradas e saídas digitais
     TMR0H =  0x85;
     TMR0L =  0xEE;
     T0CON =  0x84; //Liga TMR0 no modo de 16 bits e prescaler 1:32


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
                            tempo();
                            button();


              }
              

     }

}


void tempo(){
     temp++;
     if(temp == 0x28){         //tempo do usuário apertar o botão acaba.
       switch(cont){
                    case 0:
                    PWM1_Set_Duty(0);
                    break;
                    case 1:
                    PWM1_Set_Duty(55000);
                    break;
                    case 2:
                    PWM1_Set_Duty(0);
                    break;
                    case 3:
                    PWM1_Set_Duty(55000);
                    break;
       
       
       }



     }

}
void button(){
         if(select){
                    cont++;
         }


}