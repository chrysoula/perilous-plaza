INCLUDE functionLibrary.ink
INCLUDE definitions.ink


/* ---------------------------------

Ok, a premise: On each shopping trip, the player has a list of things to pick up or do. There are several items for each Shop, but the day's list is a subset of those items. Some items you can get from multiple sources, but sometimes only after unlocks.

Items are acquired through narrative if available when the player enters a shop.

A list may not need to be cleared every day but there's some kind of cost to not clearing it, and only a variable/limited number of stops a day are possible. Visiting somebody without business can influence their opinion about you, even if you don't have personal interaction.

In addition, not everybody is at work. You can arrive in an empty store, or a store where the proprieter has stepped out but other customers are waiting. Wandering characters may show up in a Location and interact with you or each other.

Let's see. Tash is a wandering character who is mostly unemployed. Lune is a musician which isn't employed currently, but she only rarely leaves her spot in the square. At any given time, Tash is in one of a few locations. He will stay there two or three turns and sometimes interact with somebody else present if the player is there. These interactions may be sequenced. The player will have opportunities to get involved and influence situations. 
Six stops only, which is not the same as a turn.
How to limit choices without using javascript?
How about a priority system?

In Ink Patterns they talk about filtering lists; might this be used to filter choices?
Can choices be stored in a list?
Counting entries in a list with a certain substring (see Patterns in book)
Also keep in mind switches as dictionaries.
 ----------------------------------*/

It's time to go shopping. Are you ready?
* I am!
* I'm not!
    Too bad!
- Here we go!


LIST Characters = Tancred, Boone, Lassette, Chef, Dash, CaDeena, Ember, Fordfect, Gentle, Kianji, Lune, Qailie, Mysteria, Park, Sash, Accessory, Roxana, Tash, Inuki


LIST Shops = Stationer, Florist, Haberdashery, Cutlers, Pub, Library, Tinsmith, Bakery, Tailor, Apothecary, Attorney, Scribery, Mechanic, Square

LIST Heritage = Fae, Human, Demon

LIST Catalog = Ribbons, Violets, Scissors, Pitcher, Ink, Lunch, Loaves, Cloak, WatchRepair, Newspaper, Candy, Contract, Scrolls, Fortunetelling

LIST Employment = Unemployed, Employed

LIST Weather = Rainy, Stormy, Windy, Fair, Clear

LIST Regard = Enmity, Dislike, Neutral, Friendly, Social, Trusted

LIST Mobility = Wandering, Fixed

LIST HaberdasherItems = Ribbons, Handkerchiefs, Clothesbrush

~ Shops = LIST_ALL(Shops)
~ Characters = LIST_ALL(Characters)

/*
I go back and forth on what kind of things to use as list namespaces.

VAR Lune = (Unemployed, Neutral, Fixed, Square)
VAR Tash = (Unemployed, Neutral, Wandering, Square)
VAR Roxana = (Employed, Friendly, Fixed, Apothecary)
VAR Fordfect = (Employed, Social, Wandering, Pub)
VAR Lassette = (Employed, Neutral, Fixed, Pub) 
*/

VAR LuneProp = (Unemployed, Neutral, Fixed, Square, Human)
VAR TashProp = (Unemployed, Neutral, Wandering, Square, Demon)
VAR RoxanaProp = (Employed, Friendly, Fixed, Apothecary, Fae)
VAR FordfectProp = (Employed, Social, Wandering, Pub, Fae)
VAR LassetteProp = (Employed, Neutral, Fixed, Pub, Human)
VAR ParkProp = (Employed, Neutral, Fixed, Stationer, Human)
VAR TancredProp = (Employed, Friendly, Wandering, Cutlers, Demon)

VAR LuneLoc = Square
VAR TashLoc = Square
VAR RoxanaLoc = Apothecary
VAR FordfectLoc = Pub
VAR LassetteLoc = Pub
VAR ParkLoc = Stationer
VAR TancredLoc = Cutlers


VAR LocState = ()
VAR Present = ()
VAR Locale = ()
VAR Here_Now = ()
VAR boo = ()

VAR FloristPop = (Mysteria)
VAR SquarePop = (Tash, Lune)
VAR StationerPop = (Park)
-> init_done

/*
Once upon a time... The vision: a town interface, with different shops available and ongoing updates at each shop based on what you do there.

Where would you like to go?
* [Box 1]
* [Box 2]
* [Box 3]

- Everything's great!

I can randomly select from a LIST type variable, just as I can from a complete list, as such: {LIST_RANDOM(Lune)}

I can get the entire set of a list using LIST_ALL on a value, as so: {LIST_ALL(Square)}

Lune's LuneProp is: {LuneProp}

{ LuneProp ^ Shops:
- Square: Lune is sitting in the square. 
- (): You changed the name again.
}

TashProp contains location derived from an intersection as so: {TashProp ^ Shops }.

@@@@ */

===init_done

~ TashProp -= Shops
~ TashProp += Apothecary
~ Locale = Square

// {Local_Folks(Stationer)} is in the Stationer.
// {SquarePop} are in the Square.

{walkTo(Park, StationerPop, SquarePop)}

{Local_Folks(Stationer)} is in the Stationer
{Local_Folks(Square)} is in the Square.

-> continue 


===continue
~ Locale = Square
{who_is_here(Locale)}

// {Here_Now}
In this {Locale}, there is a description. -> build_locale ->
* Where are we?[] I don't remember.
  Don't you know? 
* Try to be more.
 And so you do, and so it's wonderful. 
- But we were done.
<- Local_Activity(Square) 

-> END

/* the goal now is to search up character activities if they're in a location. I guess it can't be a function if it's based around diverts/threads. */

===Local_Activity(room)
<> A pretty room.
/*
{ LuneLoc == room: <- Lune_Actions.Plaza}
{ TashLoc == room: <- Tash_Actions.Plaza}
{ RoxanaLoc == room: <- Roxana_Actions}
{ FordfectLoc == room:  <- Fordfect_Actions}
{ LassetteLoc == room:  <- Lassette_Actions}
{ ParkLoc == room:      <- Park_Actions}
{ TancredLoc == room:   <- Tancred_Actions}
*/

   
-> DONE

===build_locale
~ temp perp=pop(Here_Now)
{perp:
- Lune: <> {~->Lune_Actions.Plaza->|The light notes of a flute drift on the wind. Lune is playing a {~love ballad|dance tune|lullaby|something strange|silly song}.| Lune has paused in her playing and is looking at the sky.| Lune sits out of the sun, flipping through a book.}.
-> build_locale
- Tash: <> {~Ze Ash|Yo Tash|Xi Ash|Whee Tash}.
-> build_locale

-> DONE
}

->->

===Lune_Actions
=Plaza
{LuneLoc==TashLoc:Lune refuses to look at Tash<>}
->->


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

