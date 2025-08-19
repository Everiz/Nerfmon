# **Nerfmon**

This is an addon for the balatro mod, Pokermon.  

Numerous balance changes have been made to various Pokermon Jokers
to allow for more enjoyable and challenging **high stake, non-endless** runs.
These changes are made with the philosophy that nothing should be able
to "carry" you throughout your run, and that every Joker should be
equally helpful in different, unique aspects.

**I have not proven that gold stake is possible on every deck. Be forewarned.**

# **Balance Changes (1.0.0)**

## Energy Benefits

| Type | Old | New |
| ----- | --- | --- |
| Flat +Chips | 30% | 20% |
| Scaling/repeatable +Chips | 20% | 10% |
| Flat +Mult | 40% | 25% |
| Scaling/Repeatable +Mult | 20% | 10% |
| Independent XMult | 20% | 10% |
| On Scoring XMult | 5% | 3% |
| Flat +$ | 30% | 20% |
| Scaling/Repeatable +$ | 10% | 10% |

(Removable via config. On by default.)

## Consumables

| Consumable | Old | New |
| ----- | --- | --- |
| Waterstone | +50 Chips Max | +30 Chips Max |
| Leafstone | Can override Hazards | Removed |
| Leftovers | +$2 Sell Value | +$1 Sell Value |
| Thick Club | +10 Chips | +8 Chips |
| Dusk Stone | $4, Max $30 | $3, Max $20 |
| Dawn Stone | $ of Double Mult | $ of Mult |
| Berry Juice (Spectral) | Seal and Edition | Seal or Edition |
| Berry Juice (Item) | Chance for Two | Chance Removed |
| Berry Juice (Tarot) | Earn $5 | Money Removed |

(Removable via config. On by default.)

## Pokemon

### Generation 1

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 001 | Bulbasaur | Hand size +1 => Removed |
| 002 | Ivysaur | Money $1 or $2 => $1 |
| 003 | Venusaur | Money $2 => $1 or $2 |
| 003-1 | M. Venusaur | Hand size +4 => +3 |
| 004 | Charmander | Discards +1 => Removed |
| 005 | Charmeleon | Discards +1 => Removed |
| 006 | Charizard | Discards +1 => Removed<br>XMult X1.5 => X1.3 |
| 006-1 | M. Charizard X | XMult X4 => X3 |
| 006-2 | M. Charizard Y | Discards +4 => +3 |
| 007 | Squirtle | Hands +1 => Removed<br>Chip Req +40 => +32 |
| 008 | Wartortle | Hands +1 => Removed<br>Chip Req +120 => +72 |
| 009 | Blastoise | Chips +120 => +72 |
| 009-1 | M. Blastoise | Hands +3 => +2 |
| 010 | Caterpie | Mult +3 => +2 |
| 011 | Metapod | Mult +6 => +4 |
| 012 | Butterfree | Mult +12 => +8 |
| 013 | Weedle | Chips +20 => +15 |
| 014 | Kakuna | Chips +40 => +30 |
| 015 | Beedrill | Chips +80 => +60 |
| 015-1 | M. Beedrill | Chips +640 => +480 |
| 016 | Pidgey | Mult +2 => +1 |
| 017 | Pidgeotto | Mult +3 => +2 |
| 018 | Pidgeot | Mult +5 => +3 |
| 018-1 | M. Pidgeot | XMult X0.75 => X0.4 |
| 019 | Rattata | Retrigger first 2 => 1 |
| 020 | Raticate | Retrigger first 3 => 2 |
| 021 | Spearow |
| 022 | Fearow |
| 023 | Ekans | Mult +10 => +8 |
| 024 | Arbok |
| 025 | Pikachu | Gives $#Jokers => $1 to $#Jokers |
| 026 | Raichu | Applies Negative => Removed<br>1 in 2 to create Spectral |
| 027 | Sandshrew | Chips +25 => +15 |
| 028 | Sandslash | Chips +40 => +25 |
| 029 | Nidoran-F | Chips +50 => +30 |
| 030 | Nidorina | Chips +75 => +50 |
| 031 | Nidoqueen | Chips +90 => +50 |
| 032 | Nidoran-M | Mult +8 => +5 |
| 033 | Nidorino | Mult +12 => +8 |
| 034 | Nidoking | Mult +15 => +8 |
| 035 | Clefairy | Mult +3 => +2 |
| 036 | Clefable | This round => In played hand |
| 037 | Vulpix |
| 038 | Ninetales |
| 039 | Jigglypuff | Mult +2 => +1 |
| 040 | Wigglytuff | Chips +30 => Removed |
| 041 | Zubat | Debuffs enhanced cards | 
| 042 | Golbat | Chips +15 => +10<br>XMult X0.1 => X0.05<br>Debuffs enhanced cards |
| 043 | Oddish | Mult +1 or +5 => +1 or +3 |
| 044 | Gloom | Mult +3 or +7 => +3 or +5 |
| 045 | Vileplume | XMult X1.5 => X1.3 |
| 046 | Paras | Mult -1 when not activated |
| 047 | Parasect | Mult +3 => +2 | Mult -2 => -4 |
| 048 | Venonat |
| 049 | Venomoth |
| 050 | Diglett | Chips +60 => +50<br>Mult +4 => +3 |
| 051 | Dugtrio | Chips +120 => +90<br>XMult X1.5 => X1.3 |
| 052 | Meowth | Payout +$2 => +$1<br>Starts at $2 |
| 053 | Persian | Payout +$2 => +$1<br>Starts at $2 |
| 054 | Psyduck | First hand of round only<br>Rewards $4 |
| 055 | Golduck | First hand of round only<br>Rewards $4 |
| 056 | Mankey | Mult +3 => +2 |
| 057 | Primeape | Mult +5 => +3 |
| 058 | Growlithe | Mult +8 => +6 |
| 059 | Arcanine |
| 060 | Poliwag | Mult +4 => +3 |
| 061 | Poliwhirl | Mult +6 => +5 |
| 062 | Poliwrath | Mult +3 => +2<br>XMult X1.3 => X1.2 |
| 063 | Abra | Odds 2 => 3 |
| 064 | Kadabra | Odds 2 => 3 |
| 065 | Alakazam | Odds 2 => 3 |
| 065-1 | M. Alakazam | XMult X1.5 => X1.3<br>Sp. XMult X2 => X1.5 |
| 066 | Machop | Mult +2 => Removed |
| 067 | Machoke | Mult +12 => Removed |
| 068 | Machamp | Mult +24 => Removed<br>Hands +4 => +3 |
| 069 | Bellsprout | Chips +16 => +10 |
| 070 | Weepinbell | Chips +32 => +20 |
| 071 | Victreebel | Chips +16 => +30<br>Condition changed to "or" |
| 072 | Tentacool | Mult +7 => +5 |
| 073 | Tentacruel | Mult +10 => +8 |
| 074 | Geodude | Chips +75 => +60 |
| 075 | Graveler | Chips +175 => +150 |
| 076 | Golem | Chips +275 => +240 |
| 077 | Ponyta | Chips +10 => +8 |
| 078 | Rapidash | Chips +15 => +12 |
| 079 | Slowpoke |
| 080 | Slowbro | XMult X0.4 => X0.25 |
| 080-1 | M. Slowbro | XMult X0.5 => X0.25 |
| 081 | Magnemite |
| 082 | Magneton |
| 083 | Farfetch'd | Money $4 => $2 |
| 084 | Doduo | Mult +6 => +5 |
| 085 | Dodrio | Mult +7 => +6 |
| 086 | Seel |
| 087 | Dewgong |
| 088 | Grimer | Mult +8 => +6 |
| 089 | Muk | Add 2 cards => Add 1 or 2 cards |
| 090 | Shellder | Odds 3 => 4 |
| 091 | Cloyster | Odds 2 => 3 |
| 092 | Gastly | -$15 on trigger |
| 093 | Haunter | -$10 on trigger |
| 094 | Gengar | -$3 every round<br>Increases by $2 after boss blind |
| 094-1 | M. Gengar | Select blind => Skip blind |
| 095 | Onix |
| 096 | Drowzee | XMult X0.2 => X0.1 |
| 097 | Hypno | XMult X0.25 => X0.15 |
| 098 | Krabby | Chips +20 => +15 |
| 099 | Kingler | Only enhances first face card |
| 100 | Voltorb | XMult X2 => X1.5 |
| 101 | Electrode | XMult X2.5 => X2<br>Money $3 => $2 |
| 102 | Exeggute | Mult +2 => +1<br>Odds 4 => 3 |
| 103 | Exeggutor | XMult X1.4 => X1.3 |
| 104 | Cubone | Mult +5 => +3 |
| 105 | Marowak | XMult X0.4 => X0.25 |
| 106 | Hitmonlee | XMult X0.15 => X0.1 |
| 107 | Hitmonchan | XMult X0.15 => X0.1 |
| 108 | Lickitung |
| 109 | Koffing |
| 110 | Wheezing |
| 111 | Rhyhorn | Chips +12 => +10 |
| 112 | Rhydon | Chips +16 => +10 |
| 113 | Chansey | Only first lucky card copied |
| 114 | Tangela | Mult +10 => +6<br>Chips +50 => +40<br>Money $3 => $2 |
| 115 | Kangaskhan |
| 115-1 | M. Kangaskhan | Retrigger cards => Removed<br>+3 consumable slots |
| 116 | Horsea | Final hand of round only |
| 117 | Seadra | Final hand of round only |
| 118 | Goldeen | 1 in 2 to trigger |
| 119 | Seaking | Retriggers 2 => 1 |
| 120 | Staryu | Condition changed to "or" |
| 121 | Starmie | Money $2 => $1 |
| 122 | Mr. Mime | Retriggers 3 => 2 |
| 123 | Scyther | Edition on rare => Removed |
| 124 | Jynx | Hand size +2 => +1 |
| 125 | Electabuzz | Money $2 => $1<br>Payout 25% => 34% |
| 126 | Magmar | Mult +2 => +1 |
| 127 | Pinsir |
| 127-1 | M. Pinsir | XMult X2 => X1.5 |
| 128 | Tauros | XMult X1.75 => X1.6 |
| 128-1 | Tauros H. | Mult +6 => +4 |
| 129 | Magikarp |
| 130 | Gyarados | XMult X2.5 => X2 |
| 130-1 | M. Gyarados | XMult X3 => X2 |
| 131 | Lapras |
| 132 | Ditto |
| 133 | Eevee | XMult X1.33 => X1.24 |
| 134 | Vaporeon | Chips +4 => +3 |
| 135 | Jolteon | Money $6 => $2 |
| 136 | Flareon | XMult X3 => X1.5 |
| 137 | Porygon |
| 138 | Omanyte | Money $2 => $1<br>Switched tier 1 and 2 |
| 139 | Omastar | Money $4 => $2<br>Switched tier 1 and 2 |
| 140 | Kabuto | Chips (T1) +50 => +25 |
| 141 | Kabutops | Chips (T1) +70 => +35<br>Only retriggers first two 2's |
| 142 | Aerodactyl | XMult (T1) X2 => X1<br>XMult (T2) X0.5 => X0.3 |
| 142-1 | M. Aerodactyl | Destroys 1 in 4 => Guaranteed |
| 143 | Snorlax | XMult X0.2 => X0.05 |
| 144 | Articuno | Condition changed to "or" |
| 145 | Zapdos | XMult X0.08 => X0.04 |
| 146 | Moltres | Upgrade hand by 3 => 2 |
| 147 | Dratini | Level evo (5 rounds) |
| 148 | Dragonair | Mult +2 => +1 or +2<br>Level evo (4 rounds) |
| 149 | Dragonite | Mult +55 => +30<br>Repetitions 5 => 2 |
| 150 | Mewtwo | Energy +1 => Removed<br>XMult X1.2 => Removed |
| 150-1 | M. Mewtwo X | XMult X2.5 => X1.75 |
| 150-2 | M. Mewtwo Y | Give energy +2 => +1 |
| 151 | Mew | Negative Joker 15% => 10% |

### Generation 2

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 182 | Bellossom | Mult +7 => +5<br>1 in 3 to apply Edition |
| 196 | Espeon |
| 197 | Umbreon |
| 199 | Slowking | XMult X0.2 => X0.1 |
| 201 | Unown | Mult +6 => +4 |
| 208 | Steelix |
| 208-1 | M. Steelix | $1 Each diamond => Each two |
| 212 | Scizor | Editions stack => Removed |
| 230 | Kingdra | Final hand of round only<br>XMult X0.05 => X0.03 |
| 233 | Porygon2 | Energy limit +2 => +1 |
| 242 | Blissey | Only first lucky card copied |

### Generation 4

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 462 | Magnezone |
| 463 | Lickilicky |
| 464 | Rhyperior | Only retrigger first stone card<br>Chips +8 => +12 |
| 465 | Tangrowth | Mult +15 => +10<br>Chips +75 => +50 |
| 466 | Electivire | Money $2 => $1<br>XMult X0.02 => X0.01 |
| 467 | Magmortar | Mult +2 => +1<br>XMult X0.05 => X0.03 |
| 470 | Leafeon | Handsize 7 => 5 |
| 471 | Glaceon | Odds 4 => 5 |
| 474 | PorygonZ | Energy limit +2 => +1<br>XMult X0.1 => X0.03 |

### Generation 6

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 700 | Sylveon |

### Generation 8

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 900 | Kleavor | Add stone if uncommon => rare |

### Generation 9

| ID | Pokemon | Changes |
| ----- | --- | --- |
| 979 | Annihilape | This round => Removed |

### Non-Pokemon

| Joker | Changes |
| ----- | ------- |
| Pokedex | Mult +2 => +1 |
| Everstone | XMult X1.75 => X1.6 |
| Tall Grass | Odds 2 => 3 |
| Jelly Donut |
| Treasure Eatery |
| Mystery Egg | 
| Rival | Mult +10 => +5 |
| Rival (Bitter) | Mult +20 => +10 |
| Rival (Champion) | XMult X3 => X2.5 |
| Ruins of Alph | Mult +2 => +1<br>(T1) Safari => Double Tag<br>(T2) Duplicate Joker => Safari<br>(T3) Brainstorm => Duplicate Joker |

# Other

## To-Do List

- [x] Gen One First Pass
- [ ] Gen One Initial Playtest
- [ ] Gen One Playtest / Finalization
- [ ] Gen Two First Pass
- [ ] Gen Two Initial Playtest
- [ ] Gen Two Playtest / Finalization
- [ ] Other Gen First Pass
- [ ] Other Gen Initial Playtest
- [ ] Other Gen Playtest / Finalization
- [ ] Non-Pokemon Balance Changes
- [ ] Last Sweep Playtest / Finalization
- [ ] Initial Release

## Previous Patchnotes

After any updates, previous patchnotes will be stored here.