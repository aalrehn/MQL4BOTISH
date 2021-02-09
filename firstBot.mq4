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
// look for current price

// scan through to candlestic 30 bars before

// find the posisiton of the candlestick

// check if three volumes led to a high volume

// // look for highest candlestick

// see if the volume is high volume after three volume bars

// price has crossed over

// put line in the middle of candlestick
// keep the  lines

// sell or buy
// only daily and save it
// option to choose from only daily or 4 hr


//current price of ask


   double askprice = MarketInfo(_Symbol,MODE_ASK);
// current price of bid
   double bidPrice = MarketInfo(_Symbol,MODE_BID);
// current price of candlestick at high
   double current = High[0];
// highest candlestick from current to 30 back
// candle sticks return the index of the highest candle
   int candlesticks = iHighest(_Symbol,_Period,MODE_VOLUME,5,0);
   int candlesticks1 = iHighest(_Symbol,_Period,MODE_VOLUME,10,5);
   int candlesticks2 = iHighest(_Symbol,_Period,MODE_VOLUME,15,10);
   int shortCandle = iLowest(_Symbol,_Period,MODE_LOW,10,0);

   int canldy = iHigh(Symbol(),0,0);
   double currentCandle=High[candlesticks];
   double nextCandle = High[candlesticks -1];
// double nextCandle = High[candlesticks -1];
   double shortcurrent = Low[shortCandle];
   double shortnextCandle = Low[shortCandle-1];




   for(int i = 0; i<=30; i++)
     {


      if((Volume[candlesticks] > Volume[candlesticks+1]) && (Volume[candlesticks ] > Volume[candlesticks + 2]) && (Volume[candlesticks] > Volume[candlesticks +3]))
        {
         horizLine(candlesticks);
         verticalLine(candlesticks);
         double value = Volume[candlesticks];
         Comment("Value of Volume now is   " + value);

         if(Volume[candlesticks] > value)
           {
            horizLine(candlesticks);
            verticalLine(candlesticks);

            Comment("Now is bigger than value");

           }

         double nowCandle = currentCandle;
         double highest = High[0];
         if(highest > currentCandle)
           {


            if(IsNewCandle())

              {


               horizLine(candlesticks);
               verticalLine(candlesticks);


               Alert(Symbol(),"  Crossed drawn line at :   ",currentCandle, " with new price  ", highest);


              }



           }



        }
      // second condition
      else
         if((Volume[candlesticks1] > Volume[candlesticks1+1]) && (Volume[candlesticks1 ] > Volume[candlesticks1 + 2]) && (Volume[candlesticks1] > Volume[candlesticks1 +3]))
           {
            horizLine(candlesticks1);
            verticalLine(candlesticks1);
            double value1 = Volume[candlesticks1];
            Comment("Value of Volume now is   " + value1);

            if(Volume[candlesticks1] > value1)
              {
               horizLine(candlesticks1);
               verticalLine(candlesticks1);

               Comment("Now is bigger than value");

              }

            double nowCandle1 = currentCandle;
            double highest1 = High[0];
            if(highest1 > currentCandle)
              {


               if(IsNewCandle())

                 {


                  horizLine(candlesticks1);
                  verticalLine(candlesticks1);


                  Alert(Symbol(),"  Crossed drawn line at :   ",currentCandle, " with new price  ", highest1);


                 }



              }



           }

         else
            if((Volume[candlesticks2] > Volume[candlesticks2+1]) && (Volume[candlesticks ] > Volume[candlesticks2 + 2]) && (Volume[candlesticks2] > Volume[candlesticks2 +3]))
              {
               horizLine(candlesticks2);
               verticalLine(candlesticks2);
               double value2 = Volume[candlesticks2];
               Comment("Value of Volume now is   " + value2);

               if(Volume[candlesticks2] > value2)
                 {
                  horizLine(candlesticks2);
                  verticalLine(candlesticks2);

                  Comment("Now is bigger than value");

                 }

               double nowCandle2 = currentCandle;
               double highest2 = High[0];
               if(highest2 > currentCandle)
                 {


                  if(IsNewCandle())

                    {


                     horizLine(candlesticks2);
                     verticalLine(candlesticks2);


                     Alert(Symbol(),"  Crossed drawn line at :   ",currentCandle, " with new price  ", highest2);


                    }



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
