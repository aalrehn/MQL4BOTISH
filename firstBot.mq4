//+------------------------------------------------------------------+
bool crossToBuy = false;
bool crossToSell = false;
int MASlowPeriod = 50;
int MAFastPeriod = 10;
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
   int candlesticks = iHighest(_Symbol,_Period,MODE_HIGH,10,0);
   int shortCandle = iLowest(_Symbol,_Period,MODE_LOW,10,0);


   double currentCandle=High[candlesticks];
   double nextCandle = High[candlesticks -1];
   double shortcurrent = Low[shortCandle];
   double shortnextCandle = Low[shortCandle-1];
   Comment( "index    :  "+candlesticks+ "     highest price   " + currentCandle+   "   the next candle is   " + nextCandle);


// sell place line under candlestick
//  place on daily
// when it touches the line, send alert
// choose option to choose from buy or sell







   for(int i = 0; i<=30; i++)
     {


      if((Volume[candlesticks] > Volume[candlesticks+1]) && (Volume[candlesticks ] > Volume[candlesticks + 2]))
        {


         horizLine(candlesticks);
         verticalLine(candlesticks);


         if(currentCandle > nextCandle)
           {

            if(alert_bar_time != iTime(Symbol(),240,0))
              {


               alert_bar_time= iTime(Symbol(),240,0);




               horizLine(candlesticks);
               verticalLine(candlesticks);
               // Comment("Just Changed");

               Alert(Symbol()," " , currentCandle);
              }
           }
        }
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
        }

     }







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
   ObjectDelete("vertical");
   ObjectCreate("vertical",OBJ_VLINE,0,Time[candles],High[candles]);
//    Comment(candles);

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
   ObjectDelete("line");
   ObjectCreate("line",OBJ_HLINE,0,0,High[candles]);
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
