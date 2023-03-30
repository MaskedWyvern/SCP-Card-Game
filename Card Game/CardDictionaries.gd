extends Node

var Name
var Type
var Description
var Cost
var Attack
var Defense


var deck = []

var deck2 = []

var SCP002 = {Name = "SCP-002", Type = "Euclid", Description = "Kill 3 Creatures", Cost = 4, Attack =  "", 
Defense = "", script = preload("res://TestCard.gd")}

var SCP003 = {Name = "SCP-003", Type = "Euclid", Description = 
"Summon SCP-003-1 and SCP-003-2", Cost = 7, Attack =  "", Defense = "", script = null }

var SCP0031 = {Name = "SCP-003-1", Type = "Euclid", Description = "A Utility Creature card that can convert enemy 
creatures to its side once per turn, doing so increases its attack and hp", Cost = "", Attack =  1 , Defense = 1}

var SCP0032 = {Name = "SCP-003-2", Type = "Euclid", Description = "Summoned on enemy players side whenever 
SCP-003-1 is summoned, can be used once per turn to stop SCP-003-1s conversion process, sacrificing research
points dependent on the RP cost of the originally targeted card", Cost = "X", Attack =  "", Defense = "" }

var SCP004 = {Name = "SCP-004", Type = "Euclid", Description = "Every turn while SCP-004 is on the field, 
it will gain 1 key token, once token count has reached 12, the door will open and all creature cards will have -2/-3",
Cost = 1, Attack =  "", Defense = ""}

var SCP005 = {Name = "SCP-005", Type = "Safe", Description = "Gain 3 RP", Cost = 0,
Attack = "", Defense = ""}

var SCP006 = {Name = "SCP-006", Type = "Safe", Description = "Heal X HP, where X is the research points 
used to play this card", Cost = "X", Attack = "", Defense = ""}

var SCP007 = {Name = "SCP-007", Type = "Euclid", Description = 
"can be used to summon a 1/1 medieval knight card once per turn for 3 RP", Cost = 2, Attack = 2, Defense = 4}

var SCP0071 = {Name = "Medieval Knight", Type = "Euclid", Description = "", Cost = 3, Attack = 1, Defense = 1}

var SCP008 = {Name = "SCP-008", Type = "Euclid", Description = 
"Give a creature card +5 HP, target creature can no longer attack", Cost = 5, Attack = "", Defense = ""}

var SCP009 = {Name = "SCP-009", Type = "Euclid", Description = "Freeze a creature card, if the cards 
controller does not pay 2 research points at some point within the next 3 unfreeze it, the creature dies",
Cost = 2, Attack = "", Defense = ""}

var SCP010 = {Name = "SCP-010", Type = "Safe", Description = "Take control of X amount of the enemy 
players creature cards, X being the number of RP paid to play this card (max of 6)", Cost = "X", Attack = "",
Defense = ""}

var SCP011 = {Name = "SCP-011", Type = "Safe", Description = "", Cost = 3, Attack = 3, Defense = 5}

var SCP012 = {Name = "SCP-012", Type = "Euclid", Description = "Spend X HP to gain X RP", Cost = "X", Attack = "",
Defense = ""}

var SCP013 = {Name = "SCP-013", Type = "Safe", Description = "Transform a creature card into a 1/1 'Blue Lady' card",
Cost = 1, Attack = "", Defense = ""}

var blueLady = {Name = "Blue Lady", Type = "Safe", Description = "", Cost = 1, Attack = 1, Defense = 1}

var SCP014 = {Name = "SCP-014", Type = "Safe", Description = "", Cost = 1, Attack = 0, Defense = 5}

var SCP015 = {Name ="SCP-015", Type = "Euclid", Description = "Any creature who attacks a player 
while they have this card on the field will take 2 damage", Cost = 6, Attack = "", Defense = "" }

var SCP016 = {Name = "SCP-016", Type = "Keter", Description = "Choose a player, all their creature 
cards every turn after playing this card will gain +1/-1", Cost = 10, Attack = "", Defense = ""}

var SCP017 = {Name = "SCP-017", Type = "Keter", Description = "3 RP points can be spent to 
take any utility card off the field", Cost = 3, Attack = 1, Defense = 2}

var SCP018 = {Name = "SCP-018", Type = "Euclid", Description = "Every turn on the field, SCP-018 will gain a bounce token, 
maxing out at 6. At any point while SCP-018 is on the field, its controller can target a creature or the enemy 
player and deal damage equal to the amount of bounce tokens on it.", Cost = 2, Attack = "", Defense = ""}

var SCP019 = {Name = "SCP-019", Type = "Keter", Description = "If more than 2 cards are played while SCP-019 is 
on the field in one turn, a SCP-019-2 (2/1 Creature Card) will be summoned", Cost = 4, Attack = "", Defense = ""}

var SCP0192 = {Name = "SCP-0019-2", Type = "Keter", Description = "", Cost = "", Attack = 2, Defense = 1}

var SCP020 = {Name = "SCP-020", Type = "Keter", Description = "Give a creature -1 HP every turn. For as 
long as this creature is alive, this effect will spread to any creature cards next to it each turn.", Cost = 5,
Attack = "", Defense = ""}

var SCP021 = {Name = "SCP-021", Type = "Safe", Description = "Give a creature +3/-3, spend 2 RP 
to attach card to a different creature", Cost = 2, Attack = "", Defense = ""}

var SCP022 = {Name = "SCP-022", Type = "Euclid", Description = "Every turn while on the field, you may spend 
2 RP to summon a 1/2 cadaver.", Cost = 2, Attack = "", Defense = ""}

var Cadaver = {Name = "Cadaver", Type = "Euclid", Description = "", Cost = 2, Attack = 1, Defense = 2}

var SCP023 = {Name = "SCP-023", Type = "Euclid", Description = "if engaged in combat with a creature, target another creature to kill.",
Cost = 3, Attack = 2, Defense = 3}

var SCP024 = {Name = "SCP-024", Type = "Euclid", Description = "Search your deck for the first 4 creature cards, choose 1 and 
send the rest to containment. The chosen card has +2/+2", Cost = 3, Attack = "", Defense = ""}

var SCP025 = {Name = "SCP-025", Type = "Safe", Description = "Attach to a creature, after 3 turns, the creature dies.", Cost = 1,
Attack = "", Defense = ""}

var SCP026 = {Name = "SCP-026", Type = "Euclid", Description = "While on the field, you may spend 1 RP per turn to summon a 
1/1 student, this student will die at the end of your next turn.", Cost = 3, Attack = "", Defense = ""}

var Student = {Name = "Student", Type = "Euclid", Description = "", Cost = "", Attack = 1, Defense = 1}

var SCP027 = {Name = "SCP-027", Type = "Euclid", Description = "Choose a creature, every turn while this creature is on the field, 
3 1/1 vermin creatures will be summoned", Cost = 2, Attack = "", Defense = ""}

var Vermin = {Name = "Vermin", Type = "Euclid", Description = "", Cost = "", Attack = 1, Defense = 1}

var SCP028 = {Name = "SCP-028", Type = "Safe", Description = "Gain 5 RP", Cost = 0, Attack = "", Defense = ""}

var SCP029 = {Name = "SCP-029", Type = "Keter", Description = "any damage taken by SCP-029 is halved.", Cost = 5,
Attack = 5, Defense = 5}

var SCP030 = {Name = "SCP-030", Type = "Safe", Description = "can spend 2 research points to remould", Cost = 3,
Attack = 2, Defense = 4}

var SCP031 = {Name = "SCP-031", Type = "Euclid", Description = "pay 3 RP to take control of an enemy creature, 
target creature dies after 3 turns", Cost = 4, Attack = 4, Defense = 5}

var SCP032 = {Name = "SCP-032", Type = "Euclid", Description = "spend 1 research point to contain a non-humanoid creature card",
Cost = 3, Attack = 2, Defense = 2}

var SCP033 = {Name = "SCP-033", Type = "Euclid", Description = "Give a creature card +1/+1 OR 
Add any kind of token to its relevant card OR Add 1 RP next turn", Cost = 1, Attack = "", Defense = ""}

var SCP034 = {Name = "SCP-034", Type = "Safe", Description = "Attach to a creature, if the creature deals damage to 
another creature without killing it, it becomes damaged creature", Cost = 2, Attack = "", Defense = ""}

var SCP035 = {Name = "SCP-035", Type = "Keter", Description = "Attach to a creature, changes between comedy and tragedy each turn. 
If comedy, +2/+0, if tragedy +0/+2. After 3 turns the creature turns into a 1/1 corpse", Cost = 4, Attack = "", Defense = ""}

var Corpse = {Name = "Corpse", Type = "Keter", Description = "", Cost = "", Attack = 1, Defense = 1}

var SCP036 = {Name = "SCP-036", Type = "Safe", Description = "if a creature you control dies, replace it with a 1/1 pilgrim, 
each turn this card gains 1 day token, once the count reaches 7, this card and all pilgrims created with it dissapear", Cost = 3,
Attack = "", Defense = ""}

var Pilgrim = {Name = "Pilgrim", Type = "Safe", Description = "", Cost = "", Attack = 1, Defense = 1}

var SCP037 = {Name = "SCP-037", Type = "Euclid", Description = "Gains 1 radiation token per turn, once count has 
reached 10, wipe field of all cards", Cost = 10, Attack = "", Defense = ""}

var SCP038 = {Name = "SCP-038", Type = "Safe", Description = "Choose a creature, it gets copied with all modifications 
applied if there are any, this copy dies after 2 turns", Cost = 4, Attack = "", Defense = ""}

var SCP039 = {Name = "SCP-039", Type = "Euclid", Description = "Pay X amount of RP to summon X amount of 1/1 'Proboscis Monkey', max of 5",
Cost = "X", Attack = "", Defense = ""}

var ProMonkey = {Name = "Proboscis Monkey", Type = "Euclid", Description = "", Cost = "", Attack = 1, Defense = 1}

var SCP040 = {Name = "SCP-040", Type = "Euclid", Description = "choose 1 card to add to your hand when SCP-040 enters the field.
SCP-040-1A, SCP-040-1C, SCP-040-1J", Cost = 3, Attack = 2, Defense = 2}

var SCP0401A = {Name = "SCP-040-1A", Type= "Euclid", Description = "Attach to SCP-040 to add +0/+1", Cost = 1, Attack = "", Defense = ""}

var SCP0401C = {Name = "SCP-040-1C", Type = "Euclid", Description = "flight", Cost = 1, Attack = 1, Defense = 1}

var SCP0401J = {Name = "SCP-040-1J", Type = "Euclid", Description = "reach", Cost = 1, Attack = 1, Defense = 1}

var ALLCARDS = {"SCP002" = SCP002, "SCP003" = SCP003, "SCP0031" = SCP0031, "SCP0032" = SCP0032, 
"SCP004" = SCP004, "SCP005" = SCP005, "SCP006" = SCP006, "SCP007" = SCP007, "MEDIEVAL KNIGHT" = SCP0071, 
"SCP008" = SCP008, "SCP009" = SCP009, "SCP010" = SCP010, "SCP011" = SCP011, "SCP012" = SCP012, "SCP013" = SCP013,
"BLUE LADY" = blueLady, "SCP014" = SCP014, "SCP015" = SCP015, "SCP016" = SCP016, "SCP017" = SCP017, "SCP018" = SCP018,
"SCP019" = SCP019, "SCP0192" = SCP0192, "SCP020" = SCP020, "SCP021" = SCP021, "SCP022" = SCP022, "CADAVER" = Cadaver,
"SCP023" = SCP023, "SCP024" = SCP024, "SCP025" = SCP025, "SCP026" = SCP026, "STUDENT" = Student, "SCP028" = SCP028,
"SCP029" = SCP029, "SCP030" = SCP030, "SCP031" = SCP031, "SCP032" = SCP032, "SCP033" = SCP033, "SCP034" = SCP034, "SCP035" = SCP035, "CORPSE" = Corpse,
"SCP036" = SCP036, "PILGRIM" = Pilgrim, "SCP037" = SCP037, "SCP038" = SCP038, "SCP039" = SCP039, "PROBOSCIS MONKEY" = ProMonkey,
"SCP040" = SCP040, "SCP0401A" = SCP0401A, "SCP0401C" = SCP0401C, "SCP0401J" = SCP0401J}
