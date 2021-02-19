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
              
                 if((High[i] < High[j]) && (first > second) &&(first > third) &&(first > fourth)){
                  
                  horizLine(i);
                  verticalLine(i);
                  Comment("First" + " High[i] " + High[i] + " High[j] " + High[j]);
                
                }
              else{
              while((High[i] > High[j]) && (first < second) && (first < third ) && (first < fourth)){
              
              i++;
              j++;
              
              
           //   if(!(High[i] < High[j])){ 
             // j++;
               
                
                
               // }
               
               
             //  Comment("while");
             }
             
            while((High[i] > High[j]) && (first < second) && (first < third ) && (first < fourth)){
            
               
            
            
            
            
            
            }
            
            // loop through i
            // loop through j
            if(High[i] > High[j]){
            
               for(;i<counter;i++){
                  if ((High[i] > High[j]) && (first < second) && (first < third ) && (first < fourth)){
                  
                 Comment("Found " + i);
                horizLine(i);
                verticalLine(i);
                  }else{
                  if(i > j){
                  for(;j<i && j>=0; j--){
            if ((High[i] > High[j]) && (first < second) && (first < third ) && (first < fourth)){
               
                  horizLine(i);
                  verticalLine(i);
               
               Comment(i + " j " + j);
               
               }
                  Comment("Not found" + " i " + i + " j " + j);
                 // }
                 // }
               }
               }
               }
               }
              if ((High[i] > High[j]) && (first < second) && (first < third ) && (first < fourth)){
               
               horizLine(i);
                verticalLine(i);
               
               Comment(i + " j " + j);
               
               }
               
            }
            
            /*
            
            for(int cnt = 0 ; cnt < i; cnt ++){
            
            if((High[j] > High[i]) && (first > second) && (first > third)&& (first > fourth)){
            
               Comment("Found it hehehe " + i + " j " + j);
               
                 horizLine(i);
                 verticalLine(i);
                 
               }
            
            else{
               //    i++;
              //     cnt++;
              
            Comment("It is not " + i + " cnt is " + cnt);
            
            
            }
            
                 }
               */
               
               
               /*
               while(found){
               
               
               i++;
              // j++;
               Comment("i is " + i + " j is " + j);
                if (High[i] < High[j]){
                
                Comment("incrementing  " + " i is " + High[i] + " j is " + High[j]);
               
                found = true;
                 horizLine(i);
                verticalLine(i);
                
                
                
                
                        
              }
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
