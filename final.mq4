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


// stay at previous volume bar unless it is crossed
//

   double askprice = MarketInfo(_Symbol,MODE_ASK);
// current price of bid
   double bidPrice = MarketInfo(_Symbol,MODE_BID);
// current price of candlestick at high
   double current = High[0];
// highest candlestick from current to 30 back
// candle sticks return the index of the highest candle


   int candlesticks = iHighest(_Symbol,_Period,MODE_VOLUME,4,0);   // 0 1 2 3 4
   int candlesticks1 = iHighest(_Symbol,_Period,MODE_VOLUME,7,4);  // 3 4 5 6 7
   int candlesticks2 = iHighest(_Symbol,_Period,MODE_VOLUME,15,10);  // 7 8 9 10
   int shortCandle = iLowest(_Symbol,_Period,MODE_LOW,10,0);
 //  Comment(candlesticks);
   
   int candleAhead = iHighest(_Symbol,_Period,MODE_VOLUME,candlesticks,0);
  //Comment(Volume[candleAhead] + " CANDLE STICK here    " + candlesticks);
   
 //  int canldy = iHigh(Symbol(),0,0);
   double currentCandle=High[candlesticks];
   double nextCandle = High[candlesticks -1];
  // Comment(" next candle is " +nextCandle);
// double nextCandle = High[candlesticks -1];
   double shortcurrent = Low[shortCandle];
   double shortnextCandle = Low[shortCandle-1];


// if 3 volume bars are less than the fourth, wait for a candlestick to cross the high of candle and send alert and draw a line on it

 // for(int i = 0; i<30; i++){
  
//  int candlesticks = iHighest(_Symbol,_Period,MODE_VOLUME,i,0);
 // if((Volume[candlesticks] > Volume[candlesticks + i])) 
  //}
  for(int i = 0; i<=20; i++){
  double first = Volume[i];
  double second = Volume [i+1];
  double third = Volume[i+2];
  double fourth = Volume[i+3];
 // double k = iVolume(NULL,0,i);
  //Comment(k);
  if(( first > second ) && (first > third) && ( first > fourth) && (High[0] > High[i])){
  
  if(IsNewCandle())

                 {

         Comment(i);
         horizLine(i);
         verticalLine(i);
               


         Alert(Symbol(),"  Crossed drawn line at2 :   ");


                 }
  
 
  } 
  
  }
  

  double bar =iBarShift(_Symbol,0,0);
  int shift = candlesticks + 1;
 // Comment("bar is "+ shift);
   // Comment("shift is  " + shift);
   /*

      if((Volume[candlesticks] > Volume[candlesticks+1]) && (Volume[candlesticks ] > Volume[candlesticks + 2]) && (Volume[candlesticks] > Volume[candlesticks +3])&& (High[candlesticks -1] > High[candlesticks]))
        {
         horizLine(candlesticks);
         verticalLine(candlesticks);
         double value = Volume[candlesticks];
    //  Comment("CandleStick " + Volume[candlesticks] + " candlestick -1 " + Volume[candlesticks+1] + " candlestick -2 " + Volume[candlesticks+2] + " candlestick -3 " + Volume[candlesticks+3] + " candlestick -4 " + Volume[candlesticks+4] +" high "+ High[0]); 

         if(Volume[candleAhead] > value)
           {
           if(High[1] > candlesticks){
           Comment(High[1]);
         //  if((Volume[candleAhead] > Volume[candleAhead +1]) && (Volume[candleAhead] > Volume[candleAhead +2]) && (Volume[candleAhead] > Volume[candleAhead +3])){
           
        //    Comment("COldkd");
          
         //   double nowCandle1 = currentCandle;
         //   double highest1 = High[0];
          //  if(highest1 > currentCandle)
           //   {


               if(IsNewCandle())

                 {

            //   Comment("Here");
             //     horizLine(candleAhead);
              //    verticalLine(candleAhead);


                  Alert(Symbol(),"  Just crossed ");

                     }
                     }
       //           }
                  }

         }

                 
        



        
      // second condition
      
      
      
       else  if((Volume[candlesticks1] > Volume[candlesticks1+1]) && (Volume[candlesticks1 ] > Volume[candlesticks1 + 2]) && (Volume[candlesticks1] > Volume[candlesticks1 +3]) && (High[candlesticks1 -1] > High[candlesticks1]))
           {
            horizLine(candlesticks1);
            verticalLine(candlesticks1);
            double value1 = Volume[candlesticks1];
        //    Comment("Value of Volume now is 2   " + value1 + " value of second " + Volume[candlesticks1 + 1] + " value of candlestick " + Volume[candlesticks-3]);
            

            if(Volume[candlesticks1] > value1)
              {
               horizLine(candlesticks1);
               verticalLine(candlesticks1);

               Comment("Now is bigger than value2");

              }

            double nowCandle2 = currentCandle;
            double highest2 = High[0];
            if(highest2 > currentCandle)
              {


               if(IsNewCandle())

                 {


               //   horizLine(candlesticks1);
              //    verticalLine(candlesticks1);


                  Alert(Symbol(),"  Crossed drawn line at2 :   ",currentCandle, " with new price  ", highest2);


                 }



              }



           }

         
         else  if((Volume[candlesticks2] > Volume[candlesticks2+1]) && (Volume[candlesticks ] > Volume[candlesticks2 + 2]) && (Volume[candlesticks2] > Volume[candlesticks2 +3]) && (High[candlesticks2-1] > High[candlesticks2]))
              {
               horizLine(candlesticks2);
               verticalLine(candlesticks2);
               double value2 = Volume[candlesticks2];
               Comment("Value of Volume now is 3  " + value2);

               if(Volume[candlesticks2] > value2)
                 {
                //  horizLine(candlesticks2);
               //   verticalLine(candlesticks2);

                  Comment("Now is bigger than value 3");

                 }

               double nowCandle3 = currentCandle;
               double highest3 = High[0];
               if(highest3 > currentCandle)
                 {


                  if(IsNewCandle())

                    {


                     horizLine(candlesticks2);
                     verticalLine(candlesticks2);


                     Alert(Symbol(),"  Crossed drawn line at 3 :   ",currentCandle, " with new price  ", highest3);


                    }

}

                 }

*/

             
             
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
