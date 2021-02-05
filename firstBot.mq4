//+------------------------------------------------------------------+
bool crossToBuy = false;
bool crossToSell = false;
int MASlowPeriod = 50;
int MAFastPeriod = 10;

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
//current price of ask

   double askprice = MarketInfo(_Symbol,MODE_ASK);
// current price of bid
   double bidPrice = MarketInfo(_Symbol,MODE_BID);
// current price of candlestick at high
   double current = High[0];
// highest candlestick from current to 30 back
// candle sticks return the index of the highest candle
   int candlesticks = iHighest(_Symbol,_Period,MODE_HIGH,30,0);
   
  // Comment("Candle Stik is : " + candlesticks);
   
   double volume = 0;
  // long vl[];
    double array [];
    double vol = iVolume(NULL,0,0);
   // volume finds the index of 
    long b = Volume[candlesticks+1];
 //   Comment("B is  " + b);
 //   double candles [];
   // Comment("Volume is : " + vol);
    
    double num=iBars(_Symbol,0);
   
      
    for(int i = 0; i<=30; i++){
  //    volume = iVolume(NULL,_Period,i);
      
      if((Volume[candlesticks] > Volume[candlesticks+1]) && (Volume[candlesticks ] > Volume[candlesticks + 2])){
       //  Comment("Candlstick index " + candlesticks + "Volume index is " + Volume[candlesticks]);
         
      checkMaCross();
      
  //    if(crossToBuy == true){
     // if(OrdersTotal() < 20){
      //   OrderSend(Symbol(),OP_BUY,1,Ask,10,Bid-1*Point,Bid+3*Point);
       //  OrderSend(Symbol(),OP_SELL,1,Ask,10,0,Bid+3*Point);
       //  OrderSend(
  //       Comment("Buy");
 //        }
     // }
 //     if(crossToSell == true){
   //   if(OrdersTotal() < 20){
    //  OrderSend(Symbol(),OP_BUY,1,Ask,10,0,Bid+3*Point);
     // OrderSend(Symbol(),OP_SELL,1,Ask,10,Bid-1*Point,Bid+3*Point);
      //Comment("Sell");
   //   }
 //     }
      
    //  Comment(" volume is goooooood enough " );
     
      
 //     ArrayResize(array,30);
  //    ArrayFill(array,0,30,volume);
   
    //  double siz=ArraySize(array);
      
    
      horizLine(candlesticks);
      verticalLine(candlesticks);
      }
     }
     
   //  }
    
 



  }
//+------------------------------------------------------------------+
void verticalLine(int candles){
    ObjectDelete("vertical");
      ObjectCreate("vertical",OBJ_VLINE,0,Time[candles],High[candles]);
  //    Comment(candles);

}

void horizLine(int candles){
    ObjectDelete("line");
      ObjectCreate("line",OBJ_HLINE,0,0,High[candles]);
  // Comment("This is horizental line"+ candles);

}

void checkMaCross(){

      double MaSlowcurr = iMA(Symbol(),0,MASlowPeriod,0,MODE_SMA,PRICE_CLOSE,0);
      double MASlowPrev = iMA(Symbol(),0,MASlowPeriod,0,MODE_SMA,PRICE_CLOSE,1);
      double MAFastCurr = iMA(Symbol(),0,MAFastPeriod,0,MODE_SMA,PRICE_CLOSE,0);
      double MAFastPrev = iMA(Symbol(),0,MAFastPeriod,0,MODE_SMA,PRICE_CLOSE,1);
      
      if(MASlowPrev > MAFastPrev && MAFastCurr > MaSlowcurr){
         crossToBuy = true;
         Comment("Cross to buy " );
         
      }
      if(MASlowPrev < MAFastPrev && MAFastCurr < MaSlowcurr){
      
      crossToSell = true;
      Comment("cross to sell");
      }
      

}