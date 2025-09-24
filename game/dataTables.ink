=== function dataQuery(what, NameData, PronounData, BaseLocData, BreakRateData, BreakMoveRateData, Field3data) 
 {what: 
 -   Name:   ~ return NameData 
 -   BreakRate: ~ return BreakRateData
 -   Pronoun: ~ return PronounData
 -   BaseLoc: ~ return BaseLocData
 -   BreakRate: ~ return BreakRateData
 -   BreakMoveRate: ~ return BreakMoveRateData
 }
~ return

=== function varQuery(what,destinations,origin,busy,wander) 
 {what: 
 -   PlaceVar:   ~ return destinations 
 -   LocVar: ~ return origin
 -   EngagedVar: ~ return busy
 -   LastMove: ~ return wander
 }
~ return


===function personData(who, what)
{who:
- Tancred: 
    ~ return dataQuery(what,"Tancred","he",Cutlers,1,2,"field3data")
- Boone:
- Lassette: 
    ~ return dataQuery(what,"Lassette","he",Pub,4,3,"field3data")
- Chef:
- Dash:
- CaDeena:
- Ember:
- Fordfect: 
    ~ return dataQuery(what,"Fordfect","he",Pub,2,4,"field3data")
- Gentle:
- Kianji:
- Lune: 
    ~ return dataQuery(what,"Lune","he",Plaza,10,4,"field3data")
- Qailie:
- Mysteria:
- Park: 
    ~ return dataQuery(what,"Park","he",Stationer,3,1,"field3data")
- Sash:
- Accessory:
- Roxana: 
    ~ return dataQuery(what,"Roxana","she",Apothecary,1,2,"field3data")
- Tash: 
    ~ return dataQuery(what,"Tash","he",Plaza,-1,2,"field3data")
- Inuki:
    ~ return dataQuery(what,"Inuki","she",Scribery,1,2,"field3data")
}

===function someBody(who, what)
{who:
- Tancred: 
    ~ return varQuery(what,TancredPlaces,TancredLoc,TancredEngaged,TurnsSinceTancredMoved)
- Boone:
- Lassette: 
    ~ return varQuery(what,LassettePlaces,LassetteLoc,LassetteEngaged,TurnsSinceLassetteMoved)
- Chef:
- Dash:
- CaDeena:
- Ember:
- Fordfect: 
    ~ return varQuery(what,FordfectPlaces,FordfectLoc,FordfectEngaged,TurnsSinceFordfectMoved)
- Gentle:
- Kianji:
- Lune: 
    ~ return varQuery(what,LunePlaces,LuneLoc,LuneEngaged,TurnsSinceLuneMoved)
- Qailie:
- Mysteria:
- Park: 
    ~ return varQuery(what,ParkPlaces,ParkLoc,ParkEngaged,TurnsSinceParkMoved)
- Sash:
- Accessory:
- Roxana: 
    ~ return varQuery(what,RoxanaPlaces,RoxanaLoc,RoxanaEngaged,TurnsSinceRoxanaMoved)
- Tash: 
    ~ return varQuery(what,TashPlaces,TashLoc,TashEngaged,TurnsSinceTashMoved)
- Inuki:
    ~ return varQuery(what,InukiPlaces,InukiLoc,InukiEngaged,TurnsSinceInukiMoved)
}


===function scheduleKeeper(who)

/* ok, I'd like to give everybody their own rule but I think that would cause needless work for the game. So let's knock out the structure of a rule and then call data into it. 

I think the structure of said rule is a comparison with their BaseLocation, which needs to be stored in the data table. I also need to re-imagine individual MoveRate. BreakTimeRate?
So if they aren't in their BaseLoc, they have a much lower BreakMoveRate
so that comparison above is "if they're in their BaseLoc, check their BreakTimeRate against their TurnsSinceMoved
*/
{who:
- Tancred: 
- Boone:
- Lassette:
- Chef:
- Dash:
- CaDeena:
- Ember:
- Fordfect:
- Gentle:
- Kianji:
- Lune:
- Qailie:
- Mysteria:
- Park:
- Sash:
- Accessory:
- Roxana:
- Tash:
- Inuki:
~ return
}
