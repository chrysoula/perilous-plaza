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

	Overview: 

	A system for tracking "good and bad" actions, and returning the proportion the player has encountered in the course of their playthrough. 

	e.g. the player has said 15 nice things and 5 nasty things, so they are 75% nice.

	This allows the game to make decisions about the balance of the player's choices across the game regardless of knowing how many choice moments they've actually encountered. 

	It also means that the player's behaviour settles over time - each additional decision they take has less and less effect on the overall value. In short, "what's done is done."


	System:

	Each concept is given a "swing variable", which after being given an initial value, can be "raised" or "lowered".

	For more significant actions, one can "elevate" or "ditch" it. For all-but-irrecoverable actions, you can "escalate" or "demolish" the stat.

	To test the variable, the following queries are provided: "high", "up", "mid", "down", "low".

	Note that the system won't return a "up" or "down" result until the player has taken a few choices to seed the system.


	Usage:

	// initialise the variable
	VAR niceness = INITIAL_SWING

	// alter the variable
	~ raise(niceness) 		// note a nice choice
	~ lower(niceness)		// note a nasty choice 

	// test the variable
	I'm <>
	{ 
	- up(niceness):
		nice 
	- down(niceness):
		nasty 
	- else: 
		undecided 
	} 
	<>.


*/


CONST INITIAL_SWING = 1001

=== function swing_count(x) 
    ~ return (upness(x) + downness(x)) - 2

=== function swing_ready(x) 
    ~ return swing_count(x) >= 2

=== function raise(ref x)
	~ x = x + 1000
	
	

=== function elevate(ref x)
    ~ raise(x)
    ~ raise(x)
    ~ raise(x)

=== function lower(ref x)
	~ x = x + 1 

== function ditch (ref x) 
    ~ lower(x) 
    ~ lower(x) 
    ~ lower(x)

=== function demolish(ref x)
    ~ x = x + 20
    
=== function escalate(ref x)
    ~ x = x + (20 * 1000)

	

=== function upness(x)
	~ return x / 1000

=== function downness(x)
	~ return x % 1000


=== function high(x)
    ~ return (1 * upness(x) >= downness(x) * 9)

=== function up(x)
	~ return swing_ready(x) && (4 * upness(x) >= downness(x) * 6)

=== function down(x)
	~ return swing_ready(x) && (6 * upness(x) <= downness(x) * 4)
	
=== function low(x)
	~ return swing_ready(x) && (9 * upness(x) <= downness(x) * 1)
	
=== function mid(x)
    // If the swing isn't ready this returns true 
    // Because "up is false and down is false"
    ~ return (not up(x) && not down(x))

    

