===map_hub

    =map_plaza
    -> location_prep(Plaza)->
      [info font=merriweather side=accent]  This is the plaza. It's edged by interesting shops.  [/info]
        <- build_locale(Here_Now, -> compass_rose)
-   {SpoonsToday < 1: <- too_tired}
 //  
    -> DONE
    
    =map_east
        You stroll to the eastern side of the plaza, where you can find Store1, Store2 and Store3.
            <- store1 
            <- store2
            <- store3
            {SpoonsToday < 1: <- too_tired}
            + [Return to the center] -> continue.core
    -> DONE
    
    =map_west
            You stroll to the western side of the plaza, where you can find Store4, Store5 and Store6. 
            <- store4 
            <- store5
            <- store6
            {SpoonsToday < 1: <- too_tired}
            + [Return to the center] -> map_plaza
    
    -> DONE
    
    =map_south
    
    -> DONE
    
    =map_north
   
    -> DONE

===compass_rose

     + [Head east] 
        -> map_hub.map_east 
     + [Head west]
        -> map_hub.map_west
     + [Head south]
        -> map_hub.map_south
     + [Head north]
        -> map_hub.map_north
     + [Go in circles] # CLEAR
        -> map_hub.map_plaza
   
-> DONE        
/*    
===DoMovement
{Movement(Characters)}
->->
*/

===store1
<> Store 1 sells fun stuff.
 + {SpoonsToday > 0} [Go inside Store1] # CLEAR
    You go inside Store1. -> inside 
    
  =inside
  - (initial){initial == 1: Initial description here.}
  ->location_prep(Apothecary) -> build_locale(Here_Now, -> menu) ->
- (menu)        {SpoonsToday < 1: <- too_tired}
        + {SpoonsToday > 0}{RoxanaLoc==Apothecary} [Shop] -> burn_energy(SpoonsToday) ->
            You go shopping. 
            -> inside 
        + {SpoonsToday > 0} Talk to the boss.-> burn_energy(SpoonsToday) -> inside
        + Return to the Plaza
            -> map_hub.map_plaza
- It's all good.
       
-> DONE

===store2
<>  Store2 sells neccessary stuff.
 * {SpoonsToday > 0} Go inside Store2
-> DONE

===store3
<> Store3 sells weird stuff.
 * {SpoonsToday > 0} Go inside Store3
-> DONE

===store4
<> Store 4 sells nothing.
 * {SpoonsToday > 0} Go inside Store4
-> DONE
===store5
<> Store 5 sells food.
 * {SpoonsToday > 0} Go inside Store5
-> DONE
===store6
<> Store 6 sells information.
 * {SpoonsToday > 0} Go inside Store6
-> DONE
