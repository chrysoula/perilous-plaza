// My functions

// Some conversational subjects take more time than others.
=== weightyTopic

->->

===location_prep(place)
  ~ PrevPlace = Here_Now
  ~ Here_Now = ()
  ~ ReadyToGo = ()
  ~ Locale = place
  {checkMove(Characters,place,PrevPlace)} 
 // - Triggering goWhere cycle:
  {goWhere(ReadyToGo,place)} 
//  - <b>Done with goWhere</b>
//  - <b>Starting Incrementing</b>
 // ~ slowpokes = Characters - ReadyToGo
  -> slowpoking(Characters) -> 
//  Done with incrementing// incrementing counters -- kludge to replace slowpokes 
 -  {who_is_here(place)} 
 -  {Here_Now: {list_with_commas(Here_Now)} {isAre(Here_Now)} here.| Nobody is here.}

 ->->


===slowpoking(list)
  ~temp token = pop(list)
//  Now we start the incrementing of counters yet (again.)
  {token: 
  - Tancred: 
        ~TurnsSinceTancredMoved++
       // tancred's loc = {TancredLoc}
    //    tancred slow: {list}
      //  tancred rtg: {ReadyToGo}
        -> slowpoking(list)
  - Tash: 
        ~TurnsSinceTashMoved++
     /*   {TurnsSinceTashMoved} moves for tash's loc = {TashLoc}  // it stops incrementing the counter when they stop being slowpokes
        tash slow: {list}
        tash rtg: {ReadyToGo} */
        -> slowpoking(list) 
  - Lune: 
        ~TurnsSinceLuneMoved++
       // {TurnsSinceLuneMoved} {LuneLoc} // debug
        // debug
        -> slowpoking(list) 
  - Roxana: 
        ~TurnsSinceRoxanaMoved++
      //   Roxana's loc = {RoxanaLoc} //debug
        -> slowpoking(list) 
  - Fordfect: 
        ~TurnsSinceFordfectMoved++
     // Fordfect's loc = {FordfectLoc}  // debug
        -> slowpoking(list) 
  - Lassette: 
        ~TurnsSinceLassetteMoved++
        -> slowpoking(list) 
  - Park: 
        ~TurnsSinceParkMoved++
        -> slowpoking(list) 
  - Inuki:
        ~TurnsSinceInukiMoved++
        -> slowpoking(list) 
   }
->->



=== function goWhere(list, currentPlace)

~temp whoIs = ()
~temp places = ()
~temp goal = ()
// {list:the list in goWhere: {list}| the list in goWhere is empty.} // debug
~ whoIs = pop(list)
// \---{whoIs} is popped off the copied ReadyToGo here in goWhere before the switch begins.
{ whoIs:
-  Tancred:
    ~ TurnsSinceTancredMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - TancredLoc
    ~ goal = pop_random(places)
    ~ TancredLoc = goal
    {goWhere(list,currentPlace)}
-  Tash:
    ~ TurnsSinceTashMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - TashLoc
    ~ goal = pop_random(places)
    ~ TashLoc = goal
    {goWhere(list,currentPlace)} 
-  Fordfect:
    ~ TurnsSinceFordfectMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - FordfectLoc
    ~ goal = pop_random(places)
    ~ FordfectLoc = goal
    {goWhere(list,currentPlace)}
-   Lune:
    ~ TurnsSinceLuneMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - LuneLoc
    ~ goal = pop_random(places)
    ~ LuneLoc = goal
-   Lassette:
    ~ TurnsSinceLassetteMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - LassetteLoc
    ~ goal = pop_random(places)
    ~ LassetteLoc = goal
    {goWhere(list,currentPlace)}
-   Park:
    ~ TurnsSinceParkMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - ParkLoc
    ~ goal = pop_random(places)
    ~ ParkLoc = goal
    {goWhere(list,currentPlace)} 
-   Roxana:
    ~ TurnsSinceRoxanaMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - RoxanaLoc
    ~ goal = pop_random(places)
    ~ RoxanaLoc = goal
    {goWhere(list,currentPlace)} 
-   Inuki: 
    ~ TurnsSinceInukiMoved = 0 // reset personal move timer
    ~ places = someBody(whoIs,PlaceVar) - InukiLoc
    ~ goal = pop_random(places)
    ~ InukiLoc = goal
    {goWhere(list,currentPlace)} 

}
~ return

===function debug(whoIs)

~ return

/*
=== function vehicleLoad ()
~x = pop(readyToGo) 


~ return
*/

===function rateCalc(whoIs,move_rate)
 ~ move_rate += getRate(whoIs)
    {move_rate <= someBody(whoIs,LastMove) && not someBody(whoIs,EngagedVar):
            ~ ReadyToGo += whoIs
    }
~ return

===function checkMove(list,ref place,previous)
~ temp whoIs = pop(list)
~ temp move_rate = GENERAL_MOVE_TIMER
{whoIs:
- Lassette: 
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,PrevPlace)}
- Tancred: 
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,previous)} 
- Boone: 
    {checkMove(list,place,PrevPlace)}    
- Tash:   
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,PrevPlace)}
- Chef: {checkMove(list,place,PrevPlace)}
- Dash: {checkMove(list,place,PrevPlace)}
- CaDeena: {checkMove(list,place,PrevPlace)}
- Ember: {checkMove(list,place,PrevPlace)}
- Fordfect: 
    {rateCalc(whoIs,move_rate)} 
    {checkMove(list,place,PrevPlace)} 
- Gentle: {checkMove(list,place,PrevPlace)}
- Kianji: {checkMove(list,place,PrevPlace)}
- Lune: 
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,PrevPlace)}
- Qailie: {checkMove(list,place,PrevPlace)}
- Mysteria: {checkMove(list,place,PrevPlace)}
- Park:
    {rateCalc(whoIs,move_rate)} 
    {checkMove(list,place,PrevPlace)}
- Sash: {checkMove(list,place,PrevPlace)}
- Accessory: {checkMove(list,place,PrevPlace)}
- Roxana: 
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,PrevPlace)}
- Inuki: 
    {rateCalc(whoIs,move_rate)}
    {checkMove(list,place,PrevPlace)}
~ return
}



===function who_is_here(place) ===
{LuneLoc == place:
    ~ Here_Now += Lune
}
{TashLoc == place:
    ~ Here_Now += Tash
}
{RoxanaLoc == place:
    ~ Here_Now += Roxana
}
{FordfectLoc == place:
    ~ Here_Now += Fordfect
}
{LassetteLoc == place:
    ~ Here_Now += Lassette
}
{ParkLoc == place:
    ~ Here_Now += Park
}
{TancredLoc == place:
    ~ Here_Now += Tancred
}
{InukiLoc == place:
    ~ Here_Now += Inuki
}
~ return




===too_tired
You're too tired today to do anything else.
+  (tired) {SpoonsToday < 1} [Go home]
    You're exhausted. Time to go home. 
    -> cyclethrough

===burn_energy(ref energy)
~ energy--
You now have {energy} spoons left.
->->


==function gameToolbar()
  [button onclick=showAgenda display=modal]Agenda: {LIST_COUNT(AgendaToday)}[/button] [link=Head east]→[/link]↑↓←
~ return



===function showAgenda
  [title]Today's Agenda[/title]
  ~temp item = ()
  ~temp list = AgendaToday
  ~ item = pop(list)
 {_showAgenda(list, item)}


===function _showAgenda(list, item)
{LIST_COUNT(list):
-   {item}
~   list -= item
~   item = pop(list)
    {_showAgenda(list, item)}
-   else: {item}
~ return
}


===SetAgenda
// Goal: Set up today's agenda, carrying over past tasks.
~ temp remainder = AGENDA_LENGTH - LIST_COUNT(AgendaToday)
~ AgendaToday += list_random_subset_of_size(Catalog, remainder)
->->

===Acquired(item)
~ Catalog -= item
You mark {item} off your list. You have {list_with_commas(AgendaToday)} remaining.
->->



===function getRate(whoIs)
~ return personData(whoIs, BreakRate)

=== function seen_ever (-> x)
    ~ return TURNS_SINCE(x) >= 0

=== function movedRecently(-> x)
   ~ return seen_ever(x) && TURNS_SINCE(x) >= 8
   
=== Tash_Wander(whoIs)

->->




// Inky includes

/*
	Quick random function for varying choices

	Usage: 

		*	{maybe()} [Ask about apples]
		*	{maybe()} [Ask about oranges]
		*	{maybe()} [Ask about bananas]
		

*/

=== function maybe(list)
	~ return RANDOM(1, 3) == 1


/*
	Takes the bottom element from a list, and returns it, modifying the list.

	Returns the empty list () if the source list is empty.

	Usage: 

	LIST fruitBowl = (apple), (banana), (melon)

	I eat the {pop(fruitBowl)}. Now the bowl contains {fruitBowl}.

*/

=== function pop(ref _list) 
    ~ temp el = LIST_MIN(_list) 
    ~ _list -= el
    ~ return el 
/*
	Tests if the flow passes a particular gather on this turn.

	Usage: 

	- (welcome)
		"Welcome!"
	- (opts)
		*	{came_from(->welcome)}
			"Welcome to you!"
		*	"Er, what?"
			-> opts
		*	"Can we get on with it?"
		
*/


/*
	Takes a random element from a list, and returns it, modifying the list.

	Returns the empty list () if the source list is empty.

	Usage: 

	LIST fruitBowl = (apple), (banana), (melon)

	I eat the {pop_random(fruitBowl)}. Now the bowl contains {fruitBowl}.

*/

=== function pop_random(ref _list) 
    ~ temp el = LIST_RANDOM(_list) 
    ~ _list -= el
    ~ return el 
    
/*
	Returns a randomised subset of items from a list.

	Returns the empty list () if the source list is empty. Might return () anyway!

	Dependencies: 

		Requires "pop".

	Usage: 

		LIST fruitBowl = (apple), (banana), (melon)

		I put into my bag: {list_random_subset(fruitBowl)}. 



*/

=== function list_random_subset(sourceList) 
    ~ temp el = pop(sourceList) 
    {el:
        { RANDOM(0,1) == 0: 
            ~ el = () 
        }
        ~ return el + list_random_subset(sourceList) 
    }
    ~ return () 
/*
	Returns a randomised subset of items from a list, up to a given size.

	Returns the empty list () if the source list is empty, and the complete list if it runs out of items to pick.

	Dependencies: 

		Requires "pop_random".

	Usage: 

		LIST fruitBowl = (apple), (banana), (melon)

		I put into my bag: {list_random_subset_of_size(fruitBowl, 2)}. 



*/

=== function list_random_subset_of_size(sourceList, n) 
    { n > 0:
        ~ temp el = pop_random(sourceList) 
        { el: 
            ~ return el + list_random_subset_of_size(sourceList, n-1)
        }
    }
    ~ return () 
    
/*
	Tests if the flow passes a particular gather on this turn.

	Usage: 

	- (welcome)
		"Welcome!"
	- (opts)
		*	{came_from(->welcome)}
			"Welcome to you!"
		*	"Er, what?"
			-> opts
		*	"Can we get on with it?"
		
*/

=== function came_from(-> x) 
    ~ return TURNS_SINCE(x) == 0

=== function isAre(list)
 {LIST_COUNT(list) == 1:is|are}

    
/*
	Tests if the flow passes a particular gather "very recently" - that is, within the last 3 turns.

	Usage: 

	- (welcome)
		"Welcome!"
	- (opts)
		*	{seen_very_recently(->welcome)}
			"Sorry, hello, yes."
		+	"Er, what?"
			-> opts
		*	"Can we get on with it?"
		
*/

=== function seen_very_recently(-> x)
    ~ return TURNS_SINCE(x) >= 0 && TURNS_SINCE(x) <= 3

/*
	Threads in a given flow as a tunnel, with a given location to tunnel back to. 

	If choices within this content are taken, they should end with a tunnel return (->->).

	Useful for "pasting in" the same block of optional content into multiple locations.

	Usage: 


	- (opts)
		<- thread_in_tunnel(-> eat_apple, -> opts)
		<- thread_in_tunnel(-> eat_banana, -> get_going)
		*	[ Leave hungry ]
			-> get_going

	=== get_going
		You leave. 
		-> END 

	=== eat_apple 
		*	[ Eat an apple ]
			You eat an apple. It doesn't help.
			->->

	=== eat_banana 
		*	[ Eat a banana ]
			You eat a banana. It's very satisfying.
			->->
		
		
*/

=== thread_in_tunnel(-> tunnel_to_run, -> place_to_return_to)

    ~ temp entryTurnChoice = TURNS()
    
    -> tunnel_to_run ->
 
 	// if the tunnel contained choices which were chosen, then the turn count will 
 	// have increased, so we should use the given return point to continue the flow.
    {entryTurnChoice != TURNS():
        -> place_to_return_to      
    }  

    // otherwise the given tunnel simply ran through, in which case we should treat
    // this as a side-thread, and close it down.
    -> DONE 
/*
    Prints the correct form of the indefinite article before a noun.

    Usage: 

    VAR firstAnimal = "cat"
    VAR secondAnimal = "elephant"
    VAR thirdAnimal = "elongated badger"
    I put {a(firstAnimal)} and {a(secondAnimal)} into {a("{~old|nice} box")} with {a(thirdAnimal)}.



*/


=== function a(x)
    ~ temp stringWithStartMarker = "^" + x
    { stringWithStartMarker ? "^a" or stringWithStartMarker ? "^A" or stringWithStartMarker ? "^e" or  stringWithStartMarker ? "^E"  or stringWithStartMarker ? "^i" or stringWithStartMarker ? "^I"  or stringWithStartMarker ? "^o" or stringWithStartMarker ? "^O" or stringWithStartMarker ? "^u"  or stringWithStartMarker ? "^U"  :
            an {x}
            
    // this could be extended to check for "^hi" if you wanted "an historic..."            
    - else:
        a {x}
    }
    
    


/*
	Does a list item originate from a particular list? Returns false if testing ().

	Usage: 

	LIST Fruits = apple, banana, melon
	LIST Veggies = carrot, cucumber 

	~ temp x = apple
	I eat the {list_item_is_member_of(x, Fruits):fruit|vegetable}.

*/

=== function list_item_is_member_of(k, list) 
   	~ return k && LIST_ALL(list) ? k





/*
	Converts a string to the corresponding list element from a particular list. Note the element doesn't need to be in the list variable at that moment in time! 

	Useful for sending parameters into the ink from the game: the game can store and pass in the string ID of the list element as a parameter.

	Returns the empty list () if the element isn't found.

	Usage: 

	LIST capitalCities = Paris, London, NewYork

	~ temp thisCity = string_to_list("Paris", capitalCities)
	~ capitalCities += thisCity
	I've now visited {thisCity}.

	Optimisation:

	The code below works in inky, but can be externalised to speed up performance in game, with the following external C# function binding:

	story.BindExternalFunction("STRING_TO_LIST", (string itemKey) => {
        try
        {
            return InkList.FromString(itemKey, story);
        }
        catch
        {
            return new InkList();
        }
    }, true);

*/

/*
	Converts a string to the corresponding list element from a particular list. Note the element doesn't need to be in the list variable at that moment in time! 

	Useful for sending parameters into the ink from the game: the game can store and pass in the string ID of the list element as a parameter.

	Returns the empty list () if the element isn't found.

	Usage: 

	LIST capitalCities = Paris, London, NewYork

	~ temp thisCity = string_to_list("Paris", capitalCities)
	~ capitalCities += thisCity
	I've now visited {thisCity}.

	Optimisation:

	The code below works in inky, but can be externalised to speed up performance in game, with the following external C# function binding:

	story.BindExternalFunction("STRING_TO_LIST", (string itemKey) => {
        try
        {
            return InkList.FromString(itemKey, story);
        }
        catch
        {
            return new InkList();
        }
    }, true);

*/



/*
	Tests if the flow has reached a particular gather "this scene". This is an extension of "seen_more_recently_than", but it's so useful it's worth having separately.

	Usage: 

	// define where the start of the scene is
	~ sceneStart = -> start_of_scene

	- (start_of_scene)
		"Welcome!"

	- (opts)	
		<- cough_politely(-> opts)

		*	{ seen_this_scene(-> cough_politely.cough) }
			"Hello!"
		
		+	{ not seen_this_scene(-> cough_politely.cough) }
			["Hello!"]
			I try to speak, but I can't get the words out!
			-> opts


		
	=== cough_politely(-> go_to)
		*	(cough) [Cough politely]
			I clear my throat. 
			-> go_to
		
*/


VAR sceneStart = -> seen_this_scene 

=== function seen_this_scene(-> link)
	{  sceneStart == -> seen_this_scene:
		[ERROR] - you need to initialise the sceneStart variable before using "seen_this_scene"!
		~ return false
	}
	~ return seen_more_recently_than(link, sceneStart)
	

=== function seen_more_recently_than(-> link, -> marker)
	{ TURNS_SINCE(link) >= 0: 
        { TURNS_SINCE(marker) == -1: 
            ~ return true 
        } 
        ~ return TURNS_SINCE(link) < TURNS_SINCE(marker) 
    }
    ~ return false 

/*
	Takes a list and prints it out, using commas. 

	Dependenices: 

		This function relies on the "pop" function. 

	Usage: 

		LIST fruitBowl = (apples), (bananas), (oranges)

		The fruit bowl contains {list_with_commas(fruitBowl)}.
*/

=== function list_with_commas(list)
	{ list:
		{_list_with_commas(list, LIST_COUNT(list))}
	}

=== function _list_with_commas(list, n)
	{pop(list)}{ n > 1:{n == 2: and |, }{_list_with_commas(list, n-1)}}
	


===function goMapEast()
~ temp direction = -> map_hub.map_east
{direction}
~ return direction



