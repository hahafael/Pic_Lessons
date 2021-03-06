// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections


#define col_1   RD0_bit
#define col_2   RD1_bit
#define col_3   RD2_bit
#define row_A   RD3_bit
#define row_B   RD4_bit
#define row_C   RD5_bit
#define row_D   RD6_bit
#define teste   RA0_bit
#define  led    RD7_bit


void pulse(char number);                //Fun��o para pulsar o led


char control = 0x01;


void interrupt()
{
     //O c�lculo de tempo de estouro do timer0 � :
     //(65536- TMR0) * prescaler * ciclo de maquina
     //(65536 - 0x3CB0 )*8* 1/4M
     //(65536 - 15536)*8*250n =  100ms

   if(TMR0IF_bit){

     TMR0IF_bit = 0;
     TMR0H = 0x3C;
     TMR0L = 0xB0;
     teste = ~teste;


      if(col_1 && control == 0x01)        //Coluna 1 em n�vel high? Control igual 1?
      {                                   //Sim...
         control = 0x02;
         col_1 = 0x00;                    //Apenas a coluna 1 em n�vel baixo
         col_2 = 0x01;
         col_3 = 0x01;

         if(!row_A)      pulse(1);
         else if(!row_B) pulse(4);
         else if(!row_C) pulse(7);
         else if(!row_D) pulse(11);

      }
      else if(col_2 && control == 0x02)   //Coluna 2 em n�vel high? Control igual 2?
      {                                   //Sim...
         control = 0x03;
         col_1 = 0x01;                    //Apenas a coluna 2 em n�vel baixo
         col_2 = 0x00;
         col_3 = 0x01;

         if(!row_A)      pulse(2);
         else if(!row_B) pulse(5);
         else if(!row_C) pulse(8);
         else if(!row_D) pulse(10);

      }
      else if(col_3 && control == 0x03)   //Coluna 3 em n�vel high? Control igual 3?
      {                                   //Sim...
         control = 0x01;
         col_1 = 0x01;                    //Apenas a coluna 3 em n�vel baixo
         col_2 = 0x01;
         col_3 = 0x00;

         if(!row_A)      pulse(3);
         else if(!row_B) pulse(6);
         else if(!row_C) pulse(9);
         else if(!row_D) pulse(12);

      }




    }

} //end interrupt


// --- Fun��o Principal
void main()
{
     TRISA =  0x00;
     PORTA =  0x00;
     TRISD =  0x78; // = 0b01111000
     PORTD =  0x7F; // = 0b01111111
     ADCON1 = 0x0F; //entradas e sa�das digitais
     INTCON = 0xA0;// 0b10100000 interrup��es globais ligadas
     TMR0H =  0x3C;
     TMR0L =  0xB0;
     T0CON =  0x82; //Liga TMR0 no modo de 16 bits e prescaler 1:8
     LCD_Init();

     while(1)                             //Loop Infinito
     {


     } //end while

} //end main


void pulse(char number)
{
   char i;                                //vari�vel de itera��es

   for(i=0;i<number;i++)
   {
     led = 0x01;
     delay_ms(200);
     led = 0x00;
     delay_ms(200);
   }


}