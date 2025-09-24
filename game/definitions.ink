// Just variable and list configuration here.

LIST Characters = (Tancred), Boone, (Lassette), Chef, Dash, CaDeena, Ember, (Fordfect), Gentle, Kianji, Qailie, Mysteria, (Park), Sash, Accessory, (Roxana), (Inuki),(Lune), (Tash)


LIST Shops = Stationer, Florist, Haberdashery, Cutlers, Pub, Library, Tinsmith, Bakery, Tailor, Apothecary, Attorney, Scribery, Mechanic, Plaza,Shadow

LIST Heritage = Fae, Human, Demon

LIST Catalog = Ink, SealPress, ApologyDraft, VellumSheet, GhostInk, Violets, ThornBundle, FlowerMessage, HothouseOrchid, GraveBloom, Ribbons, NeedleCase, Alteration, WhaleboneStays, WhisperThread, Scissors, SugarCutter, Sharpening, LancetSet, ColdironDirk, Lunch, DiceSet, Rumour, ImportedBrandy, SmugglerMark, Newspaper, MapTube, ReadingRoomPass, Gazetteer, RestrictedGrimoire, Pitcher, SpeakingTube, Repairs, PressureGauge, AetherMask, Loaves, YeastStarter, HearthTime, SaffronBun, BlessedLoaf, Cloak, HiddenPocket, Fitting, SilkLining, GlamourHem, Candy, ScentedSalts, Consultation, QuinineTonic, NightshadeTincture, Contract, DeedBox, Counsel, TitleSearch, BindingOath, Scrolls, CipherScript, Copying, GoldLeaf, TrueName, WatchRepair, SpringKit, Calibration, PressureValve, ClockworkHeart, Fortunetelling, Marionette, Blessing, SpiceSatchel, VeilCoin

LIST SecretGoals = Reveal, Engagement, Fun

LIST Employment = Unemployed, Employed

LIST Weather = Rainy, Stormy, Windy, Fair, Clear

LIST Regard = Enmity, Dislike, Neutral, Friendly, Social, Trusted

LIST Mobility = Wandering, Fixed

LIST CharData = Name, Pronoun, BaseLoc, BreakRate, BreakMoveRate, Field3

LIST CharVar = PlaceVar,LocVar,EngagedVar,LastMove
//////////////////////////
///////////////////////// 

VAR StationerItems    = (Ink, SealPress, ApologyDraft, VellumSheet, GhostInk)
VAR FloristItems      = (Violets, ThornBundle, FlowerMessage, HothouseOrchid, GraveBloom)
VAR HaberdasheryItems = (Ribbons, NeedleCase, Alteration, WhaleboneStays, WhisperThread)
VAR CutlersItems      = (Scissors, SugarCutter, Sharpening, LancetSet, ColdironDirk)
VAR PubItems          = (Lunch, DiceSet, Rumour, ImportedBrandy, SmugglerMark)
VAR LibraryItems      = (Newspaper, MapTube, ReadingRoomPass, Gazetteer, RestrictedGrimoire)
VAR TinsmithItems     = (Pitcher, SpeakingTube, Repairs, PressureGauge, AetherMask)
VAR BakeryItems       = (Loaves, YeastStarter, HearthTime, SaffronBun, BlessedLoaf)
VAR TailorItems       = (Cloak, HiddenPocket, Fitting, SilkLining, GlamourHem)
VAR ApothecaryItems   = (Candy, ScentedSalts, Consultation, QuinineTonic, NightshadeTincture)
VAR AttorneyItems     = (Contract, DeedBox, Counsel, TitleSearch, BindingOath)
VAR ScriberyItems     = (Scrolls, CipherScript, Copying, GoldLeaf, TrueName)
VAR MechanicItems     = (WatchRepair, SpringKit, Calibration, PressureValve, ClockworkHeart)
VAR PlazaItems        = (Fortunetelling, Marionette, Blessing, SpiceSatchel, VeilCoin)

////////// Character variables.

VAR TashPlaces = (Apothecary, Plaza, Cutlers)// (Stationer, Florist, Haberdashery, Cutlers, Pub, Library, Tinsmith, Bakery, Tailor, Apothecary, Attorney, Scribery, Mechanic, Plaza)
VAR TurnsSinceTashMoved = 0
VAR TashEngaged = false
VAR TashLoc = Plaza

VAR InukiPlaces = (Scribery, Plaza, Bakery)
VAR InukiEngaged = false
VAR TurnsSinceInukiMoved = 0
VAR InukiLoc = Scribery

VAR LunePlaces = (Plaza, Florist, Library, Apothecary)
VAR LuneLoc = Plaza
VAR TurnsSinceLuneMoved = 0
VAR LuneEngaged = false

VAR RoxanaPlaces = (Apothecary, Plaza, Pub, Library, Tailor, Bakery)
VAR RoxanaLoc = Apothecary
VAR TurnsSinceRoxanaMoved = 0
VAR RoxanaEngaged = false

VAR FordfectPlaces = (Pub, Plaza, Haberdashery, Cutlers, Attorney, Mechanic)
VAR FordfectLoc = Pub
VAR TurnsSinceFordfectMoved = 0
VAR FordfectEngaged = false

VAR LassettePlaces = (Pub, Plaza, Haberdashery, Cutlers, Tinsmith, Apothecary)
VAR LassetteLoc = Pub
VAR TurnsSinceLassetteMoved = 0
VAR LassetteEngaged = false

VAR ParkPlaces = (Pub, Plaza, Florist, Bakery, Tinsmith, Library)
VAR ParkLoc = Stationer
VAR TurnsSinceParkMoved = 0
VAR ParkEngaged = false

VAR TancredPlaces = (Scribery, Plaza, Mechanic, Stationer, Tinsmith)
VAR TancredLoc = Cutlers
VAR TurnsSinceTancredMoved = 0
VAR TancredEngaged = false

VAR Locale = ()
VAR PrevPlace=Shadow
VAR Here_Now = ()

VAR HereBefore = ()
VAR HereAfter = ()

VAR AgendaToday = ()
VAR ReadyToGo = ()
VAR SpoonsToday = TURNS_PER_DAY
VAR ClockKeeper = 0


