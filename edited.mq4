//+------------------------------------------------------------------+
bool crossToBuy = false;
bool crossToSell = false;
int MASlowPeriod = 50;
int MAFastPeriod = 10;
static datetime TimeStamp;
static datetime alert_bar_time = 0;
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+


void OnTick()
  {

   bool found = false;
   bool notfound = false;
  int counter =100;
  for(int i = 0; i<=counter; i++){
  
  double first = Volume[i];
  double second = Volume [i+1];
  double third = Volume[i+2];
  double fourth = Volume[i+3];
  
  for(int j = 0; j<i; j++){
  
  
  if(( first > second ) && (first > third) && ( first > fourth) && (High[i] > High[j] || Low[i] < Low[j])){
 

      
      counter = i;
      
      printf("%d",counter);
         Comment("value of i is  "+ i + " value of counter is " + counter + " high i is " + High[i] + " high i -1 is " + High[i+1]  );
    
         horizLine(i);
         verticalLine(i);
        
           i--;
           counter --;
         if(High[0] > High[i]){
  if(IsNewCandle())

                 {
          //       Comment("new candle");
           //      i--;
                counter = i;
            //     counter--;

        
          //     Comment(counter + " IS new candle " + i );


         Alert(Symbol(),"  Crossed drawn line at2 :   ");
         
         SendNotification(Symbol()+" Buy");
        


                 }
                 }
  
            break;
  } else  {
  
        counter ++;
        Comment(counter);
        printf("%d",counter);
    
         
       
         
  }
  }
  
  
  
  }
  
      
      

             
             
             }
             





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsNewCandle()
  {

   static datetime saved_candle_time;
   if(Time[0] == saved_candle_time)
      return false;

   else
      saved_candle_time=Time[0];
   return true;

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void shortVerticalLine(int candles)
  {
   ObjectDelete("vertical");
   ObjectCreate("vertical",OBJ_VLINE,0,Time[candles],Low[candles]);
//  ObjectCreate("short",OBJ_VLINE,0,0,PERIOD_H4,Low[candles]);
//    Comment(candles);

  }
//+------------------------------------------------------------------+
void verticalLine(int candles)
  {

// if(Period() != PERIOD_H4 || Period() != PERIOD_D1){
// Comment("Change time frame for it to work");
// }
// else{
   ObjectDelete("vertical");
   ObjectCreate("vertical",OBJ_VLINE,0,Time[candles],High[candles]);
//    Comment(candles);
//}

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void shortHoriz(int candles)
  {
   ObjectDelete("line");
   ObjectCreate("line",OBJ_HLINE,0,0,Low[candles]);
// Comment("This is horizental line"+ candles);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void horizLine(int candles)
  {
// if(Period() != PERIOD_M1 || Period() != PERIOD_D1){
// Comment("Change time frame for it to work");
// }
// else{

   ObjectDelete("line");
   ObjectCreate("line",OBJ_HLINE,0,0,High[candles]);
//  }
// Comment("This is horizental line"+ candles);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void checkMaCross()
  {

   double MaSlowcurr = iMA(Symbol(),0,MASlowPeriod,0,MODE_SMA,PRICE_CLOSE,0);
   double MASlowPrev = iMA(Symbol(),0,MASlowPeriod,0,MODE_SMA,PRICE_CLOSE,1);
   double MAFastCurr = iMA(Symbol(),0,MAFastPeriod,0,MODE_SMA,PRICE_CLOSE,0);
   double MAFastPrev = iMA(Symbol(),0,MAFastPeriod,0,MODE_SMA,PRICE_CLOSE,1);

   if(MASlowPrev > MAFastPrev && MAFastCurr > MaSlowcurr)
     {
      crossToBuy = true;
      Comment("Cross to buy ");

     }
   if(MASlowPrev < MAFastPrev && MAFastCurr < MaSlowcurr)
     {

      crossToSell = true;
      Comment("cross to sell");
     }


  }
//+------------------------------------------------------------------+
