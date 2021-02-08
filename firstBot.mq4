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
   int shortCandle = iLowest(_Symbol,_Period,MODE_LOW,10,0);

   int canldy = iHigh(Symbol(),0,0);
   double currentCandle=High[candlesticks];
   double nextCandle = High[candlesticks -1];
// double nextCandle = High[candlesticks -1];
   double shortcurrent = Low[shortCandle];
   double shortnextCandle = Low[shortCandle-1];

// get the index of volume , compare it with the one before it, if it is
// Comment("CandleStick   " + candlesticks + "   currentCandle   " + currentCandle + "  Candly " + canldy);

//  Comment( "index    :  "+candlesticks+ "     highest price   " + currentCandle+   "   the next candle is   " + nextCandle);


// sell place line under candlestick
//  place on daily
// when it touches the line, send alert

// choose option to choose from buy or sell

// volume bar 4 after 3rd

// one for sell and one for buy

// just look at the volume

// if volume 5 first

// draw line highest volume
// check the volume before

// draw a line above the candlestick that has high volume

// and after it touches it, it should give an alert

// sell is the opposite

// get the current index of candlestick

// get the current volume



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
              

            //   alert_bar_time= iTime(Symbol(),PERIOD_CURRENT,0);




               horizLine(candlesticks);
               verticalLine(candlesticks);
               // Comment("Just Changed");

               Alert(Symbol()," ", currentCandle," CROSS ON BUY HAPPENED!! ");
              
              }



           }


         /*

         if(currentCandle > nextCandle)
         {

         Comment("Current candle is : " + currentCandle + "  next candle is " + nextCandle);

         if(alert_bar_time != iTime(Symbol(),240,0))
           {


            alert_bar_time= iTime(Symbol(),240,0);




            horizLine(candlesticks);
            verticalLine(candlesticks);
            // Comment("Just Changed");

            Alert(Symbol()," ", currentCandle );
           }
         }

         */
        }


      /*
      if((Volume[shortCandle] < Volume[shortCandle+1]) && (Volume[shortCandle ] < Volume[shortCandle + 2]))
      {






       shortHoriz(shortCandle);
       shortVerticalLine(shortCandle);


       if(shortcurrent > shortnextCandle)
         {

          if(alert_bar_time != iTime(Symbol(),240,0))
            {


             alert_bar_time= iTime(Symbol(),240,0);


         //    Comment("alert zone");

             shortHoriz(shortCandle);
             shortVerticalLine(shortCandle);
             // Comment("Just Changed");

             Alert(Symbol(), currentCandle, " Short ");
            }
         }
         */
      //     }

     }







  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

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
