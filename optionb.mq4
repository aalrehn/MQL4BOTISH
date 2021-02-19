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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {

   bool found = false;
   bool notfound = false;
   int counter =250;
   int increment = 30;
   for(int i = 0; i<=counter; i++)
     {

      double first = Volume[i];
      double second = Volume [i+1];
      double third = Volume[i+2];
      double fourth = Volume[i+3];

      for(int j = 0; j<i; j++)
        {


         if((first > second) && (first > third) && (first > fourth) && (High[i] > High[j] || Low[i] < Low[j]))
           {


            counter = i;

    
            for(int k = counter; k>=0; k--)
              {
              
               for(int q = 0 ; q<increment ; q++){
               
              if(k > counter){
               if(High[k] > High[counter])
                 {
                  Comment("K is bigger " + k + " than i " + q + " counter is "+ counter);
                  horizLine(counter);
                  verticalLine(counter);
               //   i--;
              //    break;
                 }
                 }
                
              //   else if(q< counter){
                 //j = 
              //   k++;
                 //i++;
                 
            //     counter++;
                  if((High[i] < High[j])&& (first > second) && (first > third) && (first > fourth)){
                  horizLine(i);
                  verticalLine(i);
                 Comment("K " + k + " counter  " + High[counter] + " high q " + High[q] + " i is " + High[i]  + " j is " + High[j] +  "     " + j);
               //  counter++;
                 }else{
                 
                 
                 
                 i++;
                 if((High[i] < High[j])&& (first > second) && (first > third) && (first > fourth)){
                 
                  horizLine(i);
                  verticalLine(i);
                 }
                 }
               
              //   }
                 
                 
                 
                 /*
               else
                  if(High[0] > High[i])
                    {


                     Comment("Incrementing i " + i + " counter is " + counter + " k " + k + " resorting to else" + " value of j is" + j);

                     horizLine(i);
                     verticalLine(i);

                    }
                  else if((High[i] != 0)&& (High[i] < High[i-1]))
                          {

                           Comment(High[i] + "  High -1 ->  " + High[-1]);
                           horizLine(i);
                           verticalLine(i);

                          }
                       
                     else
                        if(High[i] > High[j])
                          {
                           Comment("value of i is " + i + " value of j is " + High[i+1]);
                           horizLine(i);
                           verticalLine(i);

                          }
                         */

              }
            if(High[0] > High[i])
              {
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

}
            break;
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
