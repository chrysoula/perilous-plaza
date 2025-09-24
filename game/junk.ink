TODO Next up conversations that you can Watch or Interrupt/Join In, usually through several turns (which don't trigger movement but may consume Spoons). 
TODO also can't forget to set them Engaged so they don't walk away mid scene.


TODO come back and clean up the data structures and function shit.


TODO ARRIVAL AND DEPARTURE MESSAGES FOR CHARACTERS. That's probably another switch again.





TODO /* NEXT UP MOVEMENT OF CHARACTERS (kinda done)

First of all, Fixed characters move rarely while Wandering characters move often.
Fixed characters take a short walk: they move to another location selected from a small set, hang around a couple of turns, and go home.
Wandering charaacters move around every 3-4 turns, and may have special movement rules like following somebody around.
Possibly movement can be suspended in case of drama. I feel like what I actually want to do is going to produce a lot of special cases.
Wandering and Fixed may not be useful lists in the game if i'm just going to sweep through all characters every turn.

*/
//-> comebackhereandreadthis




/* Turn to Char_Background_Actions, probably. Probably make it a knot and stitches, honestly. Duo conditions are checked for in solo knots.

=== Lune_Actions
 = Plaza
 {~The light notes of a flute drift on the wind. Lune is playing a {~love ballad|dance tune|lullaby|something strange|silly song}.| Lune has paused in her playing and is looking at the sky.| Lune sits out of the sun, flipping through a book. }
    * Hey, Lune![]"Hey, Lune!" you call, waving at the girl.
        -> DONE
- else:
{~Lune looks around, as if confused.|Lune cocks her head.}
    * Do you need some help?
        -> DONE

-> DONE

=== Tash_Actions
= Plaza
    * [Play Along]
    {~{LuneLoc==TashLoc:Tash slouches against a wall, pretending not to watch her.}|Tash has found a stick and is poking at something he probably shouldn’t.}|Tash is loitering near the fountain, flipping a coin.}
    * Yo, Tash!
- else:
{~Tash is running an errand for one of the shopkeepers.|Tash looks like he just finished some questionable job and is wiping his hands.|Tash is half-hidden, watching the place carefully.} 
    * Stare at Tash.
    -> DONE

-> DONE

=== Roxana_Actions
->->
=== Fordfect_Actions
->->
=== Lassette_Actions
->->
=== Tancred_Actions
->->
=== Park_Actions
->->
*/

/*
I go back and forth on what kind of things to use as list namespaces.

VAR Lune = (Unemployed, Neutral, Fixed, Plaza)
VAR Tash = (Unemployed, Neutral, Wandering, Plaza)
VAR Roxana = (Employed, Friendly, Fixed, Apothecary)
VAR Fordfect = (Employed, Social, Wandering, Pub)
VAR Lassette = (Employed, Neutral, Fixed, Pub) 
*/

/*
Once upon a time... The vision: a town interface, with different shops available and ongoing updates at each shop based on what you do there.

Where would you like to go?
* [Box 1]
* [Box 2]
* [Box 3]

- Everything's great!

I can randomly select from a LIST type variable, just as I can from a complete list, as such: {LIST_RANDOM(Lune)}

I can get the entire set of a list using LIST_ALL on a value, as so: {LIST_ALL(Plaza)}

Lune's LuneProp is: {LuneProp}

{ LuneProp ^ Shops:
- Plaza: Lune is sitting in the Plaza. 
- (): You changed the name again.
}

TashProp contains location derived from an intersection as so: {TashProp ^ Shops }.

@@@@ */

/*
===Local_Activity(room)
<> A pretty room.
{ LuneLoc == room: <- Lune_Actions.Plaza}
{ TashLoc == room: <- Tash_Actions.Plaza}
{ RoxanaLoc == room: <- Roxana_Actions}
{ FordfectLoc == room:  <- Fordfect_Actions}
{ LassetteLoc == room:  <- Lassette_Actions}
{ ParkLoc == room:      <- Park_Actions}
{ TancredLoc == room:   <- Tancred_Actions}
*/

