sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D7 at RD2_bit;
sbit LCD_D6 at RD3_bit;
sbit LCD_D5 at RD4_bit;
sbit LCD_D4 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D7_Direction at TRISD2_bit;
sbit LCD_D6_Direction at TRISD3_bit;
sbit LCD_D5_Direction at TRISD4_bit;
sbit LCD_D4_Direction at TRISD5_bit;

char humid[15];
int hum;
int testArrosage=0;
int testArrosage2=0;
int finArrosageClrCount=0;
int arrosageClrCount=0;
int timerCmp=4577; //5min
unsigned int nb_panne=0;
int test=0;
int start=1;
int pluie=0;
int pluieClrCount=0;
int consulter;
int variable     ;
char string_variable[20]="";


void arrosage(){
     testArrosage=0;
     finArrosageClrCount=0;

     if(arrosageClrCount==0){
        Lcd_Cmd(_LCD_CLEAR);
     }
     Lcd_out(1,2,"Arrosage gazon");
     portd.rd6=1;
     arrosageClrCount++;
}

void finArrosage(){
     arrosageClrCount=0;

     if(finArrosageClrCount==0){
        Lcd_Cmd(_LCD_CLEAR);
     }
     Lcd_out(1,3,"Fin arrosage");
     Lcd_out(2,6,"gazon");
     portd.rd6=0;
     finArrosageClrCount++;
}

void panne(){
     Lcd_out(1,1,"Systeme en panne");
     portd.rd7=1;
     delay_ms(500);
     portd.rd7=0;
     delay_ms(500);
     portd.rd6=0;

}

void pluieFn(){
     if(pluieClrCount==0){
        Lcd_Cmd(_LCD_CLEAR);
     }
     Lcd_out(1,5,"PLUIE");
     portd.rd6=0;
     pluieClrCount++;
}

void interrupt()
{
    if((INTCON.RBIF)&&(INTCON.RBIE)){
        if(portb.RB4==1){
           testArrosage=1;

        }
        if(portb.rb4==0){
             testArrosage=0;
             intcon.RBIF=0;

        }    if(portb.RB5==1){
           consulter=1;

        }if(portb.RB5==0){
           consulter=0;

        }
        if(testArrosage2==0){
              intcon.RBIF=0;
        }
    }

    if((INTCON.INTF)&&(INTCON.INTE))
    {
        if(portb.rb0==1){
             pluie=1;
        }else{
             pluie=0;
        }
        intcon.INTF=0;
    }


    if(INTCON.T0IF){
        TMR0= 256;
        if(timerCmp>=0){
           timerCmp--;
        }
        INTCON.T0IF=0;
    }
}
#define ADDRESS 0

void main(){
     trisD=0;
     portD=0;
     TRISB.RB0=1;
     TRISB.RB4=1;
     TRISB.RB5=1;


     INTCON.GIE=1;
     INTCON.RBIE=1;
     INTCON.INTE=1;
     OPTION_REG.INTEDG=1;
     //timer0config
     TMR0= 256;
     INTCON.T0IE=1;
     OPTION_REG.T0CS=0;
     OPTION_REG.T0SE=0;
     OPTION_REG.PSA=0;
     OPTION_REG.PS2=1;
     OPTION_REG.PS1=1;
     OPTION_REG.PS0=1;
     //
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Lcd_out(1,5,"Welcome");
     delay_ms(900);
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_out(1,3,"SMART GARDEN");
     Lcd_out(2,3,"By ApexAlliance");
     delay_ms(1200);
     Lcd_Cmd(_LCD_CLEAR);

     do{
     if (consulter == 1)
          {

            Lcd_cmd(_LCD_CLEAR);
             EEPROM_Write(ADDRESS, nb_panne);
             variable = EEPROM_Read(ADDRESS);
            Lcd_out(1,2,"Nombre de panne:");
            InttoStr(variable,string_variable);
            Lcd_out(2,1,string_variable);
            delay_ms(1000);
             consulter=0;

          }
            if(pluie==1){
               pluieFn();
               intcon.INTF=1;
            }else{
              pluieClrCount=0;
              if(finArrosageClrCount==0){
                 arrosage();
              }
              hum= adc_read(0)*0.49;
              //
              if(testArrosage==1){
                  arrosage();
                  intcon.RBIF=1;
              }

               if(hum>=50){
                  start=0;
               }

              if(hum<=30 || start==1){
                  if(hum==28){
                    test=0;
                    timerCmp=4577; //5 minute
                  }
                  arrosage();

              }else {
                  if(finArrosageClrCount!=0 || hum>=50){
                     start=0;
                     finArrosage();
                  }
              }

              while(hum<29 && timerCmp>0){
                  hum= adc_read(0)*0.49;
                  if(test==0){
                      nb_panne++;

                    }
                  test++;
                  panne();
              }



              if(portb.rb4==1){
                 testArrosage2=1;
              }else{
                  testArrosage2=0;
              }


            }
     }while(1);

}