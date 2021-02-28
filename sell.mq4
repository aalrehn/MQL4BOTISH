//+------------------------------------------------------------------+
//|
void OnTick()
  {
//---
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


         if((first > second) && (first > third) && (first > fourth) && (Low[i] > Low[j]))
           {


            counter = i;
            
            Comment("Found it her  " + i + " high of " + High[i] + " high of j " +j + " high of j " + High[j] + " value of counter is " + counter);
            //   break;
            horizLine(i);
            verticalLine(i);

         // get the value of i 
         //
            
            if(Low[0] < Low[i])
              {
               if(IsNewCandle())

                 {



                  Alert(Symbol(),"  Crossed drawn line at2 : Sell   ");

                  SendNotification(Symbol()+" Sell");

                 }

}
               

              

               

           }





         //      break;

        }


      //     break;
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
   ObjectCreate("vertical",OBJ_VLINE,0,Time[candles],Low[candles]);
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
   ObjectCreate("line",OBJ_HLINE,0,0,Low[candles]);
//  }
// Comment("This is horizental line"+ candles);

  }
//+------------------------------------------------------------------+
