return {
    descriptions = {

        Back = {},

        Joker = {
            j_poke_bulbasaur = {
                name = "Bulbasaur",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}#3#{} held in hand",
                    "{C:inactive,s:0.8}(Rank changes every round){}",
                    "{C:inactive,s:0.8}(Evolves after earning {C:money,s:0.8}$#2#{C:inactive,s:0.8})",
                } 
            },
            j_poke_ivysaur = {
                name = "Ivysaur",
                text = {
                    "Earn {C:money}$#1#{} or {C:money}$#4#{} for each",
                    "{C:attention}#3#{} held in hand",
                    "{C:inactive,s:0.8}(Rank changes every round){}",
                    "{C:inactive,s:0.8}(Evolves after earning {C:money,s:0.8}$#2#{C:inactive,s:0.8})",
                } 
            },
            j_poke_venusaur = {
                name = "Venusaur",
                text = {
                    "{C:attention}+#3#{} hand size",
                    "Earn {C:money}$#1#{} or {C:money}$#2#{} for each",
                    "{C:attention}#4#{} held in hand",
                    "{C:inactive,s:0.8}(Rank changes every round){}",
                }
            },
            j_poke_charmander = {
                name = "Charmander",
                text = {
                    "Gains {C:mult}+#2#{} Mult per hand played",
                    "when {C:attention}#3#{} discards remaining",
                    "{C:inactive}(Evolves at {C:mult}+#1#{C:inactive} / +16 Mult)",
                } 
            },
            j_poke_charmeleon = {
                name = "Charmeleon",
                text = {
                    "Gains {C:mult}+#2#{} or {C:mult}+#4#{} Mult per hand played",
                    "when {C:attention}#3#{} discards remaining",
                    "{C:inactive}(Evolves at {C:mult}+#1#{C:inactive} / +36 Mult)",
                }
            },
            j_poke_charizard = {
                name = "Charizard",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{X:mult,C:white} X#2# {} Mult when {C:attention}#3#{} discards remaining",
                } 
            },
            j_poke_squirtle = {
                name = "Squirtle",
                text = {
                    "Gains {C:chips}+#3#{} Chips for each",
                    "remaining {C:attention}hand{} when",
                    "hand is played",
                    "{C:inactive}(Evolves at {C:chips}+#1#{C:inactive} / +#2# Chips)",
                } 
            },
            j_poke_wartortle = {
                name = "Wartortle",
                text = {
                    "Gains {C:chips}+#3#{} Chips for each",
                    "remaining {C:attention}hand{} when",
                    "hand is played",
                    "{C:inactive}(Evolves at {C:chips}+#1#{C:inactive} / +#2# Chips)",
                } 
            },
            j_poke_rattata = {
                name = "Rattata",
                text = {
                    "Retrigger {C:attention}first{} scored card",
                    "{C:attention}#1#{} additional time",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                } 
            },
            j_poke_raticate = {
                name = "Raticate",
                text = {
                    "Retrigger {C:attention}first 2{} scored cards",
                    "{C:attention}#1#{} additional time",
                }
            },
            j_poke_pikachu = {
                name = "Pikachu",
                text = {
                    "Earn between {C:money}$#1#{} and {C:money}$#2#{}",
                    "at end of round",
                    "{C:inactive,s:0.8}(Increases for each Joker you have)",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Thunder Stone{C:inactive,s:0.8})"
                }
            },
            j_poke_raichu = {
                name = "Raichu",
                text = {
                    "{C:green}#2# in #3#{} chance to create a",
                    "{C:spectral}Spectral{} card at end of round",
                    "{C:inactive,s:0.8}(Must have room)",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Earn {C:money}$#1#{} for each Joker card",
                    "you have at end of round"
                } 
            },
            j_poke_clefable = {
                name = "Clefable",
                text = {
                    "When scored, {C:clubs}#2#{} cards",
                    "give {C:mult}+#1#{} Mult for each",
                    "{C:clubs}#2#{} card played in hand",
                    "{C:inactive,s:0.8}(If you play 5 clubs, each gives {C:mult,s:0.8}+#3#{C:inactive,s:0.8} Mult)",
                } 
            },
            j_poke_ninetales = {
                name = "Ninetales",
                text = {
                    "{C:attention}Holding {C:dark_edition}Negative {C:spectral}Medium{}",
                    "{br:2}ERROR - CONTACT STEAK",
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}9{} to create a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive,s:0.8}(Must have room)",
                } 
            },
            j_poke_wigglytuff = {
                name = "Wigglytuff",
                text = {
                    "Played {C:spades}#2#{} cards give",
                    "{C:mult}+#1#{} Mult and the card's",
                    "total chips when scored",
                } 
            },
            j_poke_zubat = {
                name = "Zubat",
                text = {
                    "Gains {C:mult}+#2#{} Mult for each",
                    "{C:attention}Enhanced{} card in scoring hand,",
                    "debuffs scoring {C:attention}Enhanced{} cards",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive}(Evolves at {C:mult}+#1#{C:inactive} / +#3# Mult)",
                }
            },
            j_poke_golbat = {
                name = "Golbat",
                text = {
                    "Gain {C:chips}+#4#{} for scoring {C:attention}Bonus{} / {C:attention}Stone{} cards",
                    "{C:mult}+#2#{} for scoring {C:attention}Mult{} / {C:attention}Wild{} cards",
                    "{X:mult,C:white}X#6#{} for scoring {C:attention}Steel{} / {C:attention}Glass{} cards",
                    "{C:money}$#8#{} for scoring {C:attention}Gold{} / {C:attention}Lucky{} cards",
                    "Then debuff scoring card and remove {C:dark_edition}Enhancements",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive}, {C:mult}+#1#{C:inactive}, {X:mult,C:white}X#5#{C:inactive}, {C:money}$#7#{C:inactive} end of round)",
                    "{C:inactive,s:0.8}(Evolves after eating {C:attention,s:0.8}#9#{C:inactive,s:0.8} Enhancements)",
                } 
            },
            j_poke_psyduck = {
                name = "Psyduck",
                text = {
                    "If first played hand is a",
                    "single {C:attention}face card{}, earn {C:money}$#1#{}",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                } 
            },
            j_poke_paras = {
                name = "Paras",
                text = {
                    "{C:mult}+#2#{} Mult per played hand",
                    "that contains a {C:attention}Two Pair{}",
                    "{C:mult}-#3#{} Mult per played hand",
                    "that does not",
                    "{C:inactive}(Evolves at {C:mult}+#1#{C:inactive} / +8 Mult)",
                } 
            },
            j_poke_machop = {
                name = "Machop",
                text = {
                    "{C:chips}+#1#{} hands",
                    "{C:mult}-#2# discards{}",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_poke_machoke = {
                name = "Machoke",
                text = {
                    "{C:chips}+#1#{} hands",
                    "{C:mult}-#2# discards{}",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Linking Cord{C:inactive,s:0.8})"
                } 
            },
            j_poke_machamp = {
                name = "Machamp",
                text = {
                    "{C:chips}+#1#{} hands",
                    "{C:mult}-#2# discards{}",
                } 
            },
            j_poke_victreebel = {
                name = "Victreebel",
                text = {
                    "Played cards with {C:attention}Even{} rank",
                    "give {C:chips}+#1#{} Chips when scored",
                    "or {C:attention}retrigger{}"
                } 
            },
            j_poke_ponyta = {
                name = "Ponyta",
                text = {
                    "Gains {C:chips}+#2#{} Chips if played", 
                    "hand contains a {C:attention}Straight{}",
                    "{C:inactive}(Evolves at {C:chips}+#1#{C:inactive} / +40 Chips)",
                } 
            },
            j_poke_farfetchd = {
                name = 'Farfetch\'d',      
                text = {
                    "{C:attention}Holding {C:item}Leek{}",
                    "{br:4}ERROR - CONTACT STEAK",
                    "{C:green}#2# in #3#{} chance to earn {C:money}$#1#",
                    "when a {C:attention}Consumable{} is used",
                    "{C:money}${} guaranteed when using {C:attention}Leeks{}",
                } 
            },
            j_poke_muk = {
                name = 'Muk',      
                text = {
                    "{C:mult}+#1#{} Mult per card over {C:attention}#2#{} in your deck",
                    "{br:4}ERROR - CONTACT STEAK",
                    "At end of round, remove {C:attention}1{} random card",
                    "from deck then add {C:attention}1{} or {C:attention}2{} random cards",
                    "{C:inactive}(Currently {C:mult}+#3#{} {C:inactive}Mult){}"
                } 
            },
            j_poke_gastly = {
                name = 'Gastly',      
                text = {
                    "{C:green}#1# in #2#{} chance to {C:attention}replace{} the",
                    "edition of a random {C:attention}Joker{} with",
                    "{C:dark_edition}Negative{} and lose {C:money}$#4#{} at end of round",
                    "{S:1.1,C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_poke_haunter = {
                name = 'Haunter',      
                text = {
                    "{C:green}#1# in #2#{} chance to {C:attention}replace{} the",
                    "edition of a random {C:attention}Joker{} with",
                    "{C:dark_edition}Negative{} and lose {C:money}$#3#{} at end of round",
                    "{S:1.1,C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Linking Cord{C:inactive,s:0.8})"
                } 
            },
            j_poke_gengar = {
                name = 'Gengar',      
                text = {
                    "{C:attention}Replace{} the edition of a random",
                    "{C:attention}Joker{} with {C:dark_edition}Negative{} in {C:dark_edition}#1#{} rounds,",
                    "lose {C:money}$#2#{} at end of round",
                    "{C:inactive,s:0.8}(Excludes Gengars. Gengar picks a new number!){}",
                    "{C:inactive,s:0.8}(Penalty increases by {C:money,s:0.8}$#3#{C:inactive,s:0.8} each {C:attention,s:0.8}Boss Blind{C:inactive,s:0.8}){}",
                } 
            },
            j_poke_mega_gengar = {
                name = 'Mega Gengar',      
                text = {
                    "Creates a {C:dark_edition}Negative{} {C:attention}tag{}",
                    "when {C:attention}Blind{} is skipped",
                } 
            },
            j_poke_hypno = {
                name = 'Hypno',      
                text = {
                    "{C:attention}Holding {C:spectral}Trance{}",
                    "{br:4}ERROR - CONTACT STEAK",
                    "{X:mult,C:white}X#2#{} Mult per unique",
                    "{C:planet}Planet{} card used this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                } 
            },
            j_poke_kingler = {
                name = 'Kingler',      
                text = {
                    "All played {C:attention}face{} cards give",
                    "{C:chips}+#1#{} Chips",
                    "First scored face card",
                    "becomes {C:attention}Bonus{} if unenhanced",
                } 
            },
            j_poke_cubone = {
                name = 'Cubone',
                text = {
                    "{C:attention}Holding {C:item}Thick Club{}",
                    "{br:4}ERROR - CONTACT STEAK",
                    "Gives {C:mult}+#1#{} Mult for",
                    "each {C:attention}held{} consumable",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Thick Clubs{C:inactive,s:0.8} count as double){}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves after using {C:attention,s:0.8}#3#{C:inactive,s:0.8} consumables)",
                } 
            },
            j_poke_chansey = {
                name = 'Chansey',      
                text = {
                    "The {C:attention}first{} time a {C:attention}Lucky{} card triggers",
                    "each round, add a permanent copy to",
                    "your deck and draw it to {C:attention}Hand",
                    "{C:inactive,s:0.8}(Evolves when deck is >= 25% #1#{C:attention,s:0.8}Lucky{C:inactive,s:0.8} cards)"
                } 
            },
            j_poke_mega_kangaskhan = {
                name = 'Mega Kangaskhan',      
                text = {
                    "{C:attention}+#3{} consumable slots",
                    "{br:3}ERROR - CONTACT STEAK",
                    "Create a {C:attention}Double Tag{} at",
                    "end of round if at least",
                    "{C:attention}#1# Consumables{} used this round",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive} Consumables used)"
                } 
            },
            j_poke_horsea = {
                name = 'Horsea',      
                text = {
                    "Gains {C:mult}+#2#{} Mult for each {C:attention}6{}",
                    "in scoring hand",
                    "on final hand of round",
                    "{C:inactive}(Evolves at {C:mult}+#1#{C:inactive} / +12 Mult)",
                } 
            },
            j_poke_seadra = {
                name = 'Seadra',      
                text = {
                    "Gains {C:mult}+#2#{} Mult for each scored {C:attention}6{}",
                    "on final hand of round",
                    "Doubled if a {C:attention}King{} is held in hand",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves with a {C:dragon,s:0.8}Dragon{C:inactive,s:0.8} sticker)"
                } 
            },
            j_poke_goldeen = {
                name = 'Goldeen',      
                text = {
                    "{C:green}#3# in #4#{} chance to retrigger",
                    "each {C:attention}Gold{} card held in hand",
                    "{C:attention}#1#{} additional time",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_poke_staryu = {
                name = 'Staryu',      
                text = {
                    "Played {C:diamonds}#2#{} cards give",
                    "{C:mult}+#1#{} Mult or {C:money}$#3#{} when scored",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Water Stone{C:inactive,s:0.8})"
                } 
            },
            j_poke_scyther = {
                name = 'Scyther',      
                text = {
                    "When Blind is selected, destroy Joker",
                    "to the right and gain {C:mult}+#2#{} Mult",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves with a {C:metal,s:0.8}Metal{C:inactive,s:0.8} sticker or a {C:attention,s:0.8}Hard Stone{C:inactive,s:0.8})",
                } 
            },
            j_poke_omanyte = {
                name = 'Omanyte',
                text = {
                    "{C:attention}Ancient #1#s{}",
                    "{X:attention,C:white}1+{} : Earn {C:money}$#2#{}",
                    "{X:attention,C:white}2+{} : Create a {C:tarot}Tarot{} card",
                    "{X:attention,C:white}3+{} : Create a {C:item}Item{} card {C:inactive,s:0.7}(Trigger {C:attention,s:0.7}#3#{C:inactive,s:0.7} times to evolve)",
                    "{C:inactive,s:0.8}(Must have room)",
                } 
            },
            j_poke_omastar = {
                name = 'Omastar',
                text = {
                    "{C:attention}Ancient #1#s{}",
                    "{X:attention,C:white}1+{} : Earn {C:money}$#2#{}",
                    "{X:attention,C:white}2+{} : Create a {C:tarot}Tarot{} card",
                    "{X:attention,C:white}3+{} : Create a {C:item}Item{} card",
                    "{C:inactive,s:0.8}(Must have room)",
                    "{X:attention,C:white}4+{} : Create a {C:attention}tag{} once per round{C:inactive}#3#{}",
                } 
            },
            j_poke_kabutops = {
                name = 'Kabutops',
                text = {
                    "{C:attention}Ancient #1#s{}",
                    "{X:attention,C:white}1+{} : {C:chips}+#2#{} Chips",
                    "{X:attention,C:white}2+{} : {}Scoring {C:attention}#1#s{} permanently gain {C:chips}+#3#{} Chips",
                    "{X:attention,C:white}3+{} : {C:chips}+#4#{} Chips",
                    "{X:attention,C:white}4+{} : {}Retrigger first {C:attention}2{} played {C:attention}#1#s{}",
                } 
            },
            j_poke_mega_aerodactyl = {
                name = 'Mega Aerodactyl',
                text = {
                    "Played {C:attention}#1#s{} give {X:mult,C:white} X#2# {} Mult for each",
                    "{C:attention}#1#{} in played hand when scored",
                    "{br:3.5}ERROR - CONTACT STEAK",
                    "Destroys each played {C:attention}#1#{}",
                } 
            },
            j_poke_articuno = {
                name = 'Articuno',
                text = {
                    "Add {C:attention}Foil{} or a {C:attention}seal{}",
                    "to leftmost scoring card",
                    "in played hand"
                } 
            },
            j_poke_dratini = {
                name = 'Dratini',
                text = {
                    "Gains {C:mult}+#2#{} Mult",
                    "if played hand has",
                    "{C:attention}#3#{} or fewer cards",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#4#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_poke_dragonair = {
                name = 'Dragonair',
                text = {
                    "Gains {C:mult}+#2#{} or {C:mult}+#5#{} Mult",
                    "if played hand has",
                    "{C:attention}#3#{} or fewer cards",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#4#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_poke_mewtwo = {
                name = 'Mewtwo',
                text = {
                    "When {C:attention}Boss Blind{} is defeated, create a",
                    "{C:dark_edition}Polychrome{} {C:attention}duplicate{} of leftmost Joker",
                    "then destroy leftmost {C:attention}Joker{}",
                    "{C:inactive}(Can't destroy self)",
                } 
            },
            j_poke_mega_mewtwo_y = {
                name = "Mega Mewtwo Y",
                text = {
                    "{C:pink}Energize{} leftmost joker",
                    "at end of shop",
                    "{br:2}ERROR - CONTACT STEAK",
                    "{C:pink}+1{} Energy Limit when",
                    "{C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Can't {C:pink}Energize{C:inactive} self)",
                } 
            },
            j_poke_bellossom = {
                name = 'Bellossom',
                text = {
                    "Played cards with {C:attention}Odd{} rank",
                    "give {C:mult}+#1#{} Mult or become",
                    "{C:attention}Wild{} cards when scored",
                    "If already {C:attention}Wild{}, {C:green}#1# in #2#{} chance to add",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{} or {C:dark_edition}Polychrome{} edition"
                } 
            },
            j_poke_mega_steelix = {
                name = "Mega Steelix",
                text = {
                  "Earn {C:money}$#1#{} for each {C:attention}two{} {C:diamonds}#2#{} cards",
                  "in your {C:attention}full deck{} at end of round",
                  "{br:2}ERROR - CONTACT STEAK",
                  "non-{C:diamonds}#2#{} {C:attention}Steel{} cards",
                  "{C:attention}held{} in hand become {C:diamonds}#3#{}",
                  "then lose their {C:attention}enhancement{}",
                }
            },
            j_poke_scizor = {
                name = 'Scyther',      
                text = {
                    "When Blind is selected, destroy Joker",
                    "to the right and gain {C:mult}+#2#{} Mult",
                    "Gain {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}",
                    "if it was {C:rare}Rare{} or higher",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                } 
            },
            j_poke_kingdra = {
                name = 'Kingdra',
                text = {
                    "Gains {C:mult}+#2#{} Mult for each scored {C:attention}6{}",
                    "on final hand of round",
                    "If a {C:attention}King{} is held in hand,",
                    "gains {X:mult,C:white}X#4#{} Mult {C:attention}instead{} for each scored {C:attention}6{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {X:mult,C:white}X#3#{C:inactive} Mult)",
                } 
            },
            j_poke_porygon2 = {
                name = 'Porygon2',
                text = {
                    "{C:pink}+1{} Energy Limit",
                    "When any {C:attention}Booster Pack{} is opened",
                    "create an {C:pink}Energy{} card of",
                    "the same {C:pink}Type{} of leftmost Joker",
                    "{C:inactive,s:0.8}(Evolves with a {C:metal,s:0.8}Dubious Disc{C:inactive,s:0.8})",
                } 
            },
            j_poke_blissey = {
                name = 'Blissey',
                text = {
                    "The {C:attention}first{} time a {C:attention}Lucky{} card triggers",
                    "each round, add a permanent copy with",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{} to",
                    "your deck and draw it to {C:attention}Hand",
                } 
            },
            j_poke_rhyperior = {
                name = 'Rhyperior',
                text = {
                    "Each played {C:attention}Stone{} card ",
                    "permanently gains {C:chips}+#1#{} Chips",
                    "{br:3}ERROR - CONTACT STEAK",
                    "Retrigger {C:attention}first{} scored {C:attention}Stone{} card",
                    "once with an additional time for every",
                    "{C:attention}3{} {X:earth,C:white}Earth{} Jokers you have",
                    "{C:inactive}(Currently #2# retriggers)"
                } 
            },
            j_poke_porygonz = {
                name = 'Porygon-Z',
                text = {
                    "{C:pink}+2{} Energy Limit",
                    "{X:mult,C:white} X#2# {} Mult per {C:pink}Energy{}",
                    "card used this {C:attention}run{}",
                    "{br:2}text needs to be here to work",
                    "Creates an {C:pink}Energy",
                    "when you use an {C:pink}Energy",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                } 
            },
            j_poke_kleavor = {
                name = 'Kleavor',      
                text = {
                    "When Blind is selected, destroy",
                    "Joker to the right and gain {C:mult}+#2#{} Mult",
                    "Add a {C:attention}Stone{} card to deck with",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{} if",
                    "it was {C:rare}Rare{} or higher",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                } 
            },
            j_poke_annihilape = {
                name = "Annihilape",
                text = {
                    "Each played {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}7{} gives",
                    "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips when scored",
                } 
            },
            j_poke_unown_swarm = {
                name = "Unown Swarm",
                text = {
                  "Each {C:purple}Legendary{} Joker",
                  "gives {C:mult}+#1#{} Mult"
                }
            },
        },
        Item = {
            c_poke_dawnstone = {
                name = "Dawn Stone",
                text = {
                    "{C:attention}Evolution Card{}",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Earn {C:money}${} equal to the",
                    "{C:mult}Mult{} value of {C:attention}#1#{}",
                    "{C:inactive}#4#{}",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive}/$40 Max)",
                }
            },
            c_poke_berry_juice_spectral = {
                name = "Ghostly Berry Juice",
                text = {
                    "Add a random {C:attention}seal{} or {C:dark_edition}Foil{}, ",
                    "{C:dark_edition}Holographic{} or {C:dark_edition}Polychrome{} to",
                    "{C:attention}1{} selected card in hand"
                },
            },
            c_poke_berry_juice_item = {
                name = "Itemized Berry Juice",
                text = {
                    "Create a {C:item}Twisted Spoon{} card",
                    "{C:inactive}(Must have room){}"
                },
            },
        },
        Other = {
            deli_gift = {
                name = "Presents",
                text = {
                    "{C:green}40%{} - {C:money}$8{}",
                    "{C:green}35%{} - {C:item}Item{} {C:attention}Card",
                    "{C:green}15%{} - {C:attention}Coupon Tag",
                    "{C:green}10%{} - {C:dark_edition}Polychrome{} {C:attention}Gift Card",
                }
            },
            pickup = {
                name = "Pickup",
                text = {
                "{C:green}50%{} - {C:item}Item{}",
                "{C:green}24%{} - {C:item}Evolution Item",
                "{C:green}15%{} - {C:item}Leftovers",
                "{C:green}10%{} - {C:item}Twisted Spoon",
                "{C:green}1%{} - {C:spectral}Transformation",
                }
            },
            sketch = {
              name = "Sketch",
              text = {
                "Copies Joker until it is",
                "sold or destroyed",
                "Copy appears as a tooltip",
                "and in Pokedex menu",
              }
            },
            rewards_ruins_of_alph = {
                name = "Rewards",
                text = {
                  "{C:attention}#1#{} - {C:attention}Double Tag{}",
                  "{C:attention}#2#{} - {C:attention}Safari{} Joker",
                  "{C:attention}#3#{} - {C:attention}Duplicate{} a random Joker",
                  "{C:attention}#4#{} - {C:attention}Unown Swarm and The Soul",
                  "{C:inactive}(Rewards are not cumulative){}"
                }
            },
        },
    },
    misc = {
        dictionary = {
            k_nerfmon_penalty = "Increase!",
            nerfmon_settings_energy_nerf = "Nerf energy efficiency?",
            nerfmon_settings_item_nerf = "Nerf select items?",
            nerfmon_settings_pokes_nerf = "Nerf pokemon Jokers?",
            nerfmon_settings_rarity_nerf = "Nerf rarity of Jokers?"
        }
    }       
}

