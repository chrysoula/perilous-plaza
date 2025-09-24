# title: Plaza
# author: Chrysoula Tzavelas
# debug
# font: Lora
# toolbar: gameToolbar
# about: game_about
# choices: grouped
# scenes_align: top
# theme: light


INCLUDE definitions.ink
INCLUDE functionLibrary.ink
INCLUDE map.ink
INCLUDE CONSTANTS.ink
INCLUDE dataTables.ink
INCLUDE junk.ink


/* ---------------------------------

Ok, a premise: On each shopping trip, the player has a list of things to pick up or do. There are several items for each Shop, but the day's list is a subset of those items. Some items you can get from multiple sources, but sometimes only after unlocks.

Items are acquired through narrative if available when the player enters a shop.

A list may not need to be cleared every day but there's some kind of cost to not clearing it, and only a variable/limited number of stops a day are possible. Visiting somebody without business can influence their opinion about you, even if you don't have personal interaction.

In addition, not everybody is at work. You can arrive in an empty store, or a store where the proprieter has stepped out but other customers are waiting. Wandering characters may show up in a Location and interact with you or each other.

Let's see. Tash is a wandering character who is mostly unemployed. Lune is a musician which isn't employed currently, but she only rarely leaves her spot in the Plaza. At any given time, Tash is in one of a few locations. He will stay there two or three turns and sometimes interact with somebody else present if the player is there. These interactions may be sequenced. The player will have opportunities to get involved and influence situations. 
Six stops only, which is not the same as a turn.
How to limit choices without using javascript?
How about a priority system?

In Ink Patterns they talk about filtering lists; might this be used to filter choices?
Can choices be stored in a list?
Counting entries in a list with a certain substring (see Patterns in book)
Also keep in mind switches as dictionaries.
 ----------------------------------*/

~ Shops = LIST_ALL(Shops)
// ~ Characters = LIST_ALL(Characters)
~ Catalog = LIST_ALL(Catalog)

 
-> continue



===cyclethrough // currently orphaned if anything depends here.
You go home. Tomorrow is another day.
 + [Ready to set out?]
-> continue 


===continue

~ AgendaToday = (DeedBox, Rumour)
~ SpoonsToday =  TURNS_PER_DAY
-> SetAgenda->

<> Today, we're looking for {list_with_commas(AgendaToday)}. We have {SpoonsToday} energy left.

~ temp item=pop_random(AgendaToday)
-> Acquired(item) -> 

- (core) 
   <- map_hub.map_plaza 
    -> DONE
-> END


===build_locale(list, -> exit)
- (loop) 
    {LuneLoc==Locale:{ not seen_very_recently(->Lune_Actions.Conv.greeted_lune): <- Lune_Actions}}
    {TashLoc==Locale: <- Tash_Actions}
    {RoxanaLoc==Locale:{~Roxana is lighting a cigarette.|Roxana stands around looking bored.| Roxana looks at you curiously.}}
    {TancredLoc==Locale: Tancred lounges and snickers.}
    {ParkLoc==Locale: Park reads a book.}
    {FordfectLoc==Locale: Fordfect strolls along.}
    {InukiLoc==Locale: Inuki looks for something.}
    {LassetteLoc==Locale: Lassette enjoys the fresh air.}
             
- Building locale now done.    
-> exit
-> DONE

===Lune_Actions
 {shuffle:
 - {LuneLoc==TashLoc: <-Plaza_With_Tash}
 - <- Performing
 - Lune has paused in her playing and is looking at the sky.
 - Lune sits out of the sun, flipping through a book.
 }
    <- Conv
    -> DONE     
    
=Plaza_With_Tash
{shuffle:
 -    Lune refuses to look at Tash. <>
 -    Lune ignores Tash completely. <>
 }
-> DONE

=Performing
The light notes of a flute drift on the wind. <>
{shuffle: 
- Lune is playing a {~love ballad|dance tune|lullaby|strange tune|silly song}.
-  Then Lune stops with a screech.
}
-> DONE

=Conv
    + (greeted_lune){not seen_very_recently(-> greeted_lune)}[Say hi to Lune]
        "Hey, Lune," you say. 
            ** (moira){came_from(-> greeted_lune)} [Ask Lune for a song.]
            "Lune, do you know The Airs of Mount Moira?"
            "I'm sorry, I don't!"  
                *** [Offer to teach the song.] "Maybe if I hum it you could pick up on it?"
                    Lune looks interested. "I can give it a try, sure." 
            ++  ->
                 "Hi back, you," chirps Lune. 
           // -   <- build_locale(Here_Now)

- -> location_prep(Locale) -> build_locale(Here_Now,->back)
-> DONE

/////////////

===Tash_Actions
{shuffle:
- {LuneLoc==TashLoc: <-Plaza_With_Lune}
- Tash kicks a rock along.
- Tash has his hands in his pockets, trying to look cool. 
- Tash is grinning.
}
<- Conv
-> DONE

    
=Plaza_With_Lune
{shuffle:
- {came_from(->Lune_Actions.Performing): Dancing Tash.}
- Tash watches Lune while leaning against the wall.
- Tash is frowning at the ground.
}
-> DONE

=Conv
    + (greeted_tash){not seen_very_recently(-> greeted_tash)}[Say hi to Tash]
        "Yo, Tash!" you call.
        "'Sup," says Tash.
- -> location_prep(Locale)->build_locale(Here_Now, -> back)
-> DONE

===back
{Locale:
- Plaza: <- compass_rose
- Apothecary: <- store1.inside
}
-> DONE
