if nerfmon_config.pokes_nerf then

-- Bulbasaur 001
SMODS.Joker:take_ownership('poke_bulbasaur',
  {
    config = {extra = {money_mod = 1, earned = 0, ptype = "Grass"}, evo_rqmt = 16},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      local money_left = math.max(0, self.config.evo_rqmt - center.ability.extra.earned)
      return {vars = {center.ability.extra.money_mod, money_left, localize(G.GAME.current_round.bulb1card and G.GAME.current_round.bulb1card.rank or "Ace", 'ranks')}}
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Ivysaur 002
SMODS.Joker:take_ownership('poke_ivysaur',
  {
    config = {extra = {money_mod = 1, earned = 0, ptype = "Grass"}, evo_rqmt = 16},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      local money_left = math.max(0, self.config.evo_rqmt - center.ability.extra.earned)
      return {vars = {center.ability.extra.money_mod, money_left, localize(G.GAME.current_round.bulb1card and G.GAME.current_round.bulb1card.rank or "Ace", 'ranks'), center.ability.extra.money_mod * 2}}
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Venusaur 003
SMODS.Joker:take_ownership('poke_venusaur',
  {
    config = {extra = {money_mod = 1, earned = 0, h_size = 1, ptype = "Grass"}},
    loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue + 1] = {set = 'Other', key = 'mega_poke'}
      end
      return {vars = {center.ability.extra.money_mod, center.ability.extra.money_mod * 2, center.ability.extra.h_size, localize(G.GAME.current_round.bulb1card and G.GAME.current_round.bulb1card.rank or "Ace", 'ranks')}}
    end,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.hand and context.other_card:get_id() == G.GAME.current_round.bulb1card.id then
          if not context.end_of_round and not context.before and not context.after then
            if context.other_card.debuff then
              return {
                message = localize("k_debuffed"),
                colour = G.C.RED,
                card = card,
              }
            else
              local more
              if pseudorandom('venusaur') < .50 then
                more = 0
              else
                more = 1
              end
              local earned = 0
              if not context.blueprint then
                card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money_mod + more
              end
              earned = earned + card.ability.extra.money_mod + more
              earned = ease_poke_dollars(card, "venu", earned)
              return {
                message = localize('$')..earned,
                colour = G.C.MONEY,
                card = card
              }
            end
          end
      end
    end,
  },
  true
)

-- Mega Venusaur 003-1
SMODS.Joker:take_ownership('poke_mega_venusaur',
  {
    config = {extra = {h_size = 3, ptype = "Grass"} },
  },
  true
)

-- Charmander 004
SMODS.Joker:take_ownership('poke_charmander',
  {
    config = {extra = {mult = 0, mult_mod = 1, d_remaining = 0, ptype = "Fire"}, evo_rqmt = 16},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.d_remaining}}
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Charmeleon 005
SMODS.Joker:take_ownership('poke_charmeleon',
  {
    config = {extra = {mult = 0, mult_mod = 1, d_remaining = 0, ptype = "Fire"}, evo_rqmt = 36},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.d_remaining, center.ability.extra.mult_mod * 2}}
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before and not context.blueprint then
          if G.GAME.current_round.discards_left == card.ability.extra.d_remaining then
              local more
              if pseudorandom('charmeleon') < .50 then
                more = 1
              else
                more = 2
              end
              card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * more)
              return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
              }
          end
        elseif context.joker_main then
            return {
              message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
              colour = G.C.MULT,
              mult_mod = card.ability.extra.mult
            }
        end
      end
      return scaling_evo(self, card, context, "j_poke_charizard", card.ability.extra.mult, self.config.evo_rqmt)
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Charizard 006 (~~~ Removed discards)
SMODS.Joker:take_ownership('poke_charizard',
  {
    config = {extra = {mult = 36, Xmult = 1.3, d_remaining = 0, d_size = 0, ptype = "Fire"}},
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end,
  },
  true
)

-- Mega Charizard X 006-1 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_mega_charizard_x',
  {
    config = {extra = {Xmult = 3, d_remaining = 0, ptype = "Fire"} },
  },
  true
)

-- Mega Charizard Y 006-2 (--- Worse stats [Discards])
SMODS.Joker:take_ownership('poke_mega_charizard_y, ptype = "Fire"',
  {
    config = {extra = {d_size = 3} },
  },
  true
)

-- Squirtle 007 (~~~ Removed extra hand)
SMODS.Joker:take_ownership('poke_squirtle',
  {
    config = {extra = {chips = 0, chip_mod = 1, ptype = "Water"}, evo_rqmt = 32},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.chips, self.config.evo_rqmt, center.ability.extra.chip_mod}}
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Wartortle 008 (~~~ Removed extra hand)
SMODS.Joker:take_ownership('poke_wartortle',
  {
    config = {extra = {chips = 32, chip_mod = 2, ptype = "Water"}, evo_rqmt = 72},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.chips, self.config.evo_rqmt, center.ability.extra.chip_mod}}
    end,
    add_to_deck = function(self, card, from_debuff)
    end,
    remove_from_deck = function(self, card, from_debuff)
    end
  },
  true
)

-- Blastoise 009 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_blastoise',
  {
    config = {extra = {chips = 72, chip_mod = 25, hands = 1, ptype = "Water"} },
  },
  true
)

-- Mega Blastoise 010 (--- Worse stats [Hands])
SMODS.Joker:take_ownership('poke_mega_blastoise',
  {
    config = {extra = {chips = 0, chip_mod = 128, hands = 2, rounds = 1, ptype = "Water"}},
  },
  true
)

-- Caterpie 010 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_caterpie',
  {
    config = {extra = {mult = 2, rounds = 2, ptype = "Grass"}},
  },
  true
)

-- Metapod 011 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_metapod',
  {
    config = {extra = {mult = 4, rounds = 3, ptype = "Grass"}},
  },
  true
)

-- Butterfree 012 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_butterfree',
  {
    config = {extra = {mult = 8, ptype = "Grass"}},
  },
  true
)

-- Weedle 013
SMODS.Joker:take_ownership('poke_weedle',
  {
    config = {extra = {chips = 15, rounds = 2, ptype = "Grass"}},
  },
  true
)

-- Kakuna 014 (--- Worse stats)
SMODS.Joker:take_ownership('poke_kakuna',
  {
    config = {extra = {chips = 30, rounds = 3, ptype = "Grass"}},
  },
  true
)

-- Beedrill 015 (--- Worse stats)
SMODS.Joker:take_ownership('poke_beedrill',
  {
    config = {extra = {chips = 60, ptype = "Grass"}},
  },
  true
)

-- Mega Beedrill 015-1 (--- Worse stats)
SMODS.Joker:take_ownership('poke_mega_beedrill',
  {
    config = {extra = {chips = 480, ptype = "Grass"}},
  },
  true
)

-- Pidgey 016 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_pidgey',
  {
    config = {extra = {mult_mod = 1, rounds = 4, ptype = "Colorless"}},
  },
  true
)

-- Pidgeotto 015 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_pidgeotto',
  {
    config = {extra = {mult_mod = 2, rounds = 4, ptype = "Colorless"}},
  },
  true
)

-- Pidgeot 014
SMODS.Joker:take_ownership('poke_pidgeot',
  {
    config = {extra = {mult_mod = 3, ptype = "Colorless"}}, 
  },
  true
)

-- Mega Pidgeot 018-1
SMODS.Joker:take_ownership('poke_mega_pidgeot',
  {
    config = {extra = {Xmult_multi = 0.4, ptype = "Colorless"}},
  },
  true
)

-- Rattata 019 (~~~ Less retriggers)
SMODS.Joker:take_ownership('poke_rattata',
  {
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
        if (context.other_card == context.scoring_hand[1]) then
          return {
              message = localize('k_again_ex'),
              repetitions = card.ability.extra.retriggers,
              card = card
          }
        end
      end
      return level_evo(self, card, context, "j_poke_raticate")
    end,
  },
  true
)

-- Raticate 020 (~~~ Less retriggers)
SMODS.Joker:take_ownership('poke_raticate',
  {
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
        if (context.other_card == context.scoring_hand[1]) or (context.other_card == context.scoring_hand[2]) then
          return {
              message = localize('k_again_ex'),
              repetitions = card.ability.extra.retriggers,
              card = card
          }
        end
      end
    end
  },
  true
)

-- Spearow 021
-- NN

-- Fearow 022
-- NN

-- Ekans 023
SMODS.Joker:take_ownership('poke_ekans',
  {
    config = {extra = {mult = 8, rounds = 4, ptype = "Dark"}},
  },
  true
)

-- Arbok 024
-- NN

-- Pikachu 025 (!!! Random amount of money)
SMODS.Joker:take_ownership('poke_pikachu',
  {
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = G.P_CENTERS.c_poke_thunderstone
      end
      return {vars = {center.ability.extra.money, (G.jokers and G.jokers.cards and #G.jokers.cards or 1) * center.ability.extra.money}}
    end,
    calc_dollar_bonus = function(self, card)
      return ease_poke_dollars(card, "pikachu", math.ceil(pseudorandom('pikachu') * #G.jokers.cards), true)
	  end,
  },
  true
)

-- Raichu 026 (!!! Replaced negative condition with spectral creation, removed cap)
SMODS.Joker:take_ownership('poke_raichu',
  {
    config = {extra = {money = 1, threshold = 120, plus_slot = false, money_limit = 16, odds = 2, ptype = "Lightning"}},
      loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {vars = {center.ability.extra.money, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
      end,
    calc_dollar_bonus = function(self, card)
      if (pseudorandom('raichu') < G.GAME.probabilities.normal/card.ability.extra.odds) then
        local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil)
        _card:add_to_deck()
        G.consumeables:emplace(_card)
        card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
      end
      return ease_poke_dollars(card, "raichu", #G.jokers.cards * card.ability.extra.money, true)
	  end,
  },
  true
)

-- Sandshrew 027 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_sandshrew',
  {
    config = {extra = {rounds = 5, chip_mod = 15, sandshrew_tally = 0, glass_restored = 0, ptype = "Earth"}},
  },
  true
)

-- Sandslash 028 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_sandslash',
  {
    config = {extra = {chip_mod = 25, sandshrew_tally = 0, glass_restored = 0, glass_limit = 2, ptype = "Earth"}},
  },
  true
)

-- Nidoran-F 029 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidoranf',
  {
    config = {extra = {chips = 30, rounds = 4, ptype = "Dark"}}
  },
  true
)

-- Nidorina 030 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidorina',
  {
    config = {extra = {chips = 50, ptype = "Dark", item_req = "moonstone"}}
  },
  true
)

-- Nidoqueen 031 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidoqueen',
  {
    config = {extra = {chips = 50, h_size = 1, ptype = "Dark"}}
  },
  true
)

-- Nidoran-M 032 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidoranm', -- object key (class prefix not required)
  { -- table of properties to change from the existing object
    config = {extra = {mult = 5, rounds = 4, ptype = "Dark"}}
  },
  true -- silent | suppresses mod badge
)

-- Nidorino 033 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidorino',
  {
    config = {extra = {mult = 8, ptype = "Dark", item_req = "moonstone"}}
  },
  true
)

-- Nidoking 034 (--- Worse stats)
SMODS.Joker:take_ownership('poke_nidoking',
  {
    config = {extra = {mult = 8, h_size = 1, ptype = "Dark"}}
  },
  true
)

-- Clefairy 035 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_clefairy',
  {
    config = {extra = {mult = 2, suit = "Clubs", ptype = "Fairy", item_req = "moonstone"}},
  },
  true
)

-- Clefable 036 (!!! Changed to "in played hand")
SMODS.Joker:take_ownership('poke_clefable',
  {
    config = {extra = {mult = 1, suit = "Clubs", clubs_scored = 0, ptype = "Fairy"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, localize(center.ability.extra.suit, 'suits_singular'), 5 * center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before and not context.blueprint then
          local club_count = 0
          for k, v in ipairs(context.scoring_hand) do
            if v:is_suit(card.ability.extra.suit) then club_count = club_count + 1 end
          end
          card.ability.extra.clubs_scored = club_count
        end
      end
      if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
        if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
          return {
            mult = card.ability.extra.mult * card.ability.extra.clubs_scored,
            card = card
          }
        end
      end
    end
  },
  true
)

-- Vulpix 037
-- NN

-- Ninetales 038
-- NN

-- Jigglypuff 039 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_jigglypuff',
  {
    config = {extra = {mult = 1, chips = 10, suit = "Spades", ptype = "Fairy", item_req = "moonstone"}},
  },
  true
)

-- Wigglytuff 040 (~~~ Removed +chips)
SMODS.Joker:take_ownership('poke_wigglytuff',
  {
    config = {extra = {mult = 2, chips = 0, suit = "Spades", ptype = "Fairy"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, localize(center.ability.extra.suit, 'suits_singular')}}
    end,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
        if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
          local total_chips = poke_total_chips(context.other_card) 
          return {
            message = "Tuff!", 
            colour = G.C.MULT,
            mult = card.ability.extra.mult,
            chips = total_chips,
            card = card
          }
        end
      end
    end
  },
  true
)

-- Zubat 041 (!!! Debuff card for round)
SMODS.Joker:take_ownership('poke_zubat',
  {
    config = {extra = {mult = 0, mult_mod = 1, ptype = "Dark"}, evo_rqmt = 15},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before then
          local enhanced = 0
          for k, v in pairs(context.scoring_hand) do
            if v.config.center ~= G.P_CENTERS.c_base then
              enhanced = enhanced + 1
              SMODS.debuff_card(v, true, card)
            end
          end
          
          if enhanced > 0 and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * enhanced)
            return {
              message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult_mod * enhanced}},
              colour = G.C.MULT
            }
          end
        end
        if context.joker_main and card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult 
          }
        end
      end
      if context.end_of_round and not context.individual and not context.repetition then
        for k, v in pairs(G.playing_cards) do
          SMODS.debuff_card(v,'reset', card)
        end
      end
      return scaling_evo(self, card, context, "j_poke_golbat", card.ability.extra.mult, self.config.evo_rqmt)
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not from_debuff or (from_debuff and card.ability.perishable and card.ability.perish_tally == 0) then
        for k, v in pairs(G.playing_cards) do
          SMODS.debuff_card(v, 'reset', card)
        end
      end
    end
  },
  true
)

-- Golbat 042 (!!! Debuff card for round)
SMODS.Joker:take_ownership('poke_golbat',
  {
    config = {extra = {mult = 0, mult_mod = 2, chips = 0, chip_mod = 10, Xmult = 1, Xmult_mod = .05, money = 0, money_mod = 1, eaten = 0, ptype = "Dark"}, evo_rqmt = 20},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.before and not context.blueprint then
        local m_count = 0 
        local c_count = 0 
        local x_count = 0 
        local d_count = 0
        local enhanced = {}
        for k, v in ipairs(context.scoring_hand) do
            if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then
                enhanced[#enhanced+1] = v
                v.vampired = true
                if v.config.center == G.P_CENTERS.m_mult or v.config.center == G.P_CENTERS.m_wild then
                  m_count = m_count + 1
                end
                if v.config.center == G.P_CENTERS.m_bonus or v.config.center == G.P_CENTERS.m_stone then
                  c_count = c_count + 1
                end
                if v.config.center == G.P_CENTERS.m_steel or v.config.center == G.P_CENTERS.m_glass then
                  x_count = x_count + 1
                end
                if v.config.center == G.P_CENTERS.m_gold or v.config.center == G.P_CENTERS.m_lucky then
                  d_count = d_count + 1
                end
                v:set_ability(G.P_CENTERS.c_base, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        v.vampired = nil
                        SMODS.debuff_card(v, true, card)
                        return true
                    end
                }))
                card.ability.extra.eaten = card.ability.extra.eaten + 1
                SMODS.debuff_card(v, true, card)
            end
        end

        if #enhanced > 0 then 
            if m_count > 0 then
              card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod * m_count
            end
            if c_count > 0 then
              card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod * c_count
            end
            if x_count > 0 then
              card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod * x_count
            end
            if d_count > 0 then
              card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod * d_count
            end
        end
      end
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          return {
            message = localize("poke_screech_ex"),
            colour = G.C.BLACK,
            mult_mod = card.ability.extra.mult,
            chip_mod = card.ability.extra.chips,
            Xmult_mod = card.ability.extra.Xmult
          }
        end
      end
      if context.end_of_round and not context.individual and not context.repetition then
        for k, v in pairs(G.playing_cards) do
          SMODS.debuff_card(v, 'reset', card)
        end
      end
      return scaling_evo(self, card, context, "j_poke_crobat", card.ability.extra.eaten, self.config.evo_rqmt)
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not from_debuff or (from_debuff and card.ability.perishable and card.ability.perish_tally == 0) then
        for k, v in pairs(G.playing_cards) do
          SMODS.debuff_card(v, 'reset', card)
        end
      end
    end
  },
  true
)

-- Oddish 043
SMODS.Joker:take_ownership('poke_oddish',
  {
    config = {extra = {mult = 1, mult2 = 3, rounds = 5, ptype = "Grass"}},
  },
  true
)

-- Gloom 044
SMODS.Joker:take_ownership('poke_gloom',
  {
    config = {extra = {mult = 3, mult2 = 5, ptype = "Grass", item_req = {"leafstone", "sunstone"}}},
  },
  true
)

-- Vileplume 045 (--- Worse stats)
SMODS.Joker:take_ownership('poke_vileplume',
  {
    config = {extra = {Xmult_multi = 1.3, mult = 7, ptype = "Grass"}},
  },
  true
)

-- Paras 046 (!!! Introduced penalty)
SMODS.Joker:take_ownership('poke_paras',
  {
    config = {extra = {mult = 0, mult_mod = 1, mult_mod2 = 1, ptype = "Grass"}, evo_rqmt = 8},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.mult_mod2}}
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if not context.blueprint then
          if context.before and next(context.poker_hands['Two Pair']) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
              message = localize('k_upgrade_ex'),
              colour = G.C.MULT
            }
          elseif context.before and card.ability.extra.mult > 0 then
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod2
            return {
              message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.mult_mod2}},
              colour = G.C.RED,
              card = card
            }
          end
        end
        if context.joker_main and card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return scaling_evo(self, card, context, "j_poke_parasect", card.ability.extra.mult, self.config.evo_rqmt)
    end
  },
  true
)

-- Parasect 047 (--- Harsher penalty)
SMODS.Joker:take_ownership('poke_parasect',
  {
    config = {extra = {mult = 0, mult_mod = 2, mult_mod2 = 4, ptype = "Grass"}},
  },
  true
)

-- Venonat 048 (~~~ Works 50% of time) TODO: Test
-- SMODS.Joker:take_ownership('poke_venonat',
--   {
--     config = {extra = {plus_odds = 0, rounds = 5, ptype = "Grass"}},
--     calculate = function(self, card, context)
--       if context.setting_blind then
--         if pseudorandom('venonat') < .50 then
--           if card.ability.extra.plus_odds == 0 then
--             card.ability.extra.plus_odds = 1
--             G.GAME.probabilities.normal = G.GAME.probabilities.normal + card.ability.extra.plus_odds * math.max(1, (2 ^ #find_joker('Oops! All 6s')))
--           else
--             G.GAME.probabilities.normal = G.GAME.probabilities.normal - card.ability.extra.plus_odds * math.max(1, (2 ^ #find_joker('Oops! All 6s')))
--             card.ability.extra.plus_odds = 0
--           end
--         end
--       end
--       return level_evo(self, card, context, "j_poke_venomoth")
--     end,
--     add_to_deck = function(self, card, from_debuff)
--       G.GAME.probabilities.normal = G.GAME.probabilities.normal + card.ability.extra.plus_odds * math.max(1, (2 ^ #find_joker('Oops! All 6s')))
--     end,
--     remove_from_deck = function(self, card, from_debuff)
--       G.GAME.probabilities.normal = G.GAME.probabilities.normal - card.ability.extra.plus_odds * math.max(1, (2 ^ #find_joker('Oops! All 6s')))
--     end
--   },
--   true
-- )

-- Venomoth 049 TODO: Come back to this
-- NN

-- Diglett 050 (--- Worse stats)
SMODS.Joker:take_ownership('poke_diglett',
  {
    config = {extra = {rounds = 3, chips = 50, mult = 3, ptype = "Earth"}},
  },
  true
)

-- Dugtrio 051 (--- Worse stats)
SMODS.Joker:take_ownership('poke_dugtrio',
  {
    config = {extra = {chips = 90, Xmult = 1.3, ptype = "Earth"}},
  },
  true
)

-- Meowth 052 (--- Worse stats)
SMODS.Joker:take_ownership('poke_meowth',
  {
    config = {extra = {money = 2, money_mod = 1, limit = 1, triggers = 0, ptype = "Colorless"}, evo_rqmt = 7},
  },
  true
)

-- Persian 053
SMODS.Joker:take_ownership('poke_persian',
  {
    config = {extra = {money = 2, money_mod = 1, limit = 1, triggers = 0, odds = 5, ptype = "Colorless"}},
  },
  true
)

-- Psyduck 054 (!!! First hand of round only [Slightly more money])
SMODS.Joker:take_ownership('poke_psyduck',
  {
    config = {extra = {money = 4, rounds = 5, ptype = "Water"}},
    calculate = function(self, card, context)
      if context.first_hand_drawn and not context.blueprint then
        local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
      end
      if context.joker_main and context.cardarea == G.jokers and context.scoring_hand and context.full_hand and #context.full_hand == 1 and context.scoring_hand[1]:is_face() and G.GAME.current_round.hands_played == 0 then
        local earned = ease_poke_dollars(card, "psyduck", card.ability.extra.money)
        return {
          message = '$'..earned,
          colour = G.C.MONEY
        }
      end
      return level_evo(self, card, context, "j_poke_golduck")
    end,
  },
  true
)

-- Golduck 055 (!!! First hand of round only [Slightly more money])
SMODS.Joker:take_ownership('poke_golduck',
  {
    config = {extra = {money = 4, ptype = "Water"}},
    calculate = function(self, card, context)
      if context.first_hand_drawn and not context.blueprint then
        local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
      end
      if context.before and context.cardarea == G.jokers and context.scoring_hand and context.full_hand and #context.full_hand == 1 and context.scoring_hand[1]:is_face() and G.GAME.current_round.hands_played == 0 then
        local face = context.scoring_hand[1]
        face:set_ability(G.P_CENTERS.m_gold, nil, true)
        G.E_MANAGER:add_event(Event({
            func = function()
                face:juice_up()
                return true
            end
        })) 
        return {
          message = localize('k_gold'),
          colour = G.C.MONEY,
          card = card
        }
      end
      if context.joker_main and context.cardarea == G.jokers and context.scoring_hand and context.full_hand and #context.full_hand == 1 and context.scoring_hand[1]:is_face() and G.GAME.current_round.hands_played == 0 then
        local earned = ease_poke_dollars(card, "golduck", card.ability.extra.money)
        return {
          message = '$'..earned,
          colour = G.C.MONEY
        }
      end
    end,
  },
  true
)

-- Mankey 056 (--- Worse stats)
SMODS.Joker:take_ownership('poke_mankey',
  {
    config = {extra = {mult = 2, chips = 3, rounds = 5, ptype = "Fighting"}},
  },
  true
)

-- Primeape 057 (--- Worse stats)
SMODS.Joker:take_ownership('poke_primeape',
  {
    config = {extra = {mult = 3, chips = 5, primes_played = 0, ptype = "Fighting"}, evo_rqmt = 25},
  },
  true
)

-- Growlithe 058
SMODS.Joker:take_ownership('poke_growlithe',
  {
    config = {extra = {mult = 6, ptype = "Fire", item_req = "firestone"}},
  },
  true
)

-- Arcanine 059
-- NN

-- Poliwag 060 (--- Worse stats)
SMODS.Joker:take_ownership('poke_poliwag',
  {
    config = {extra = {mult = 3, suits = {"Spades", "Hearts", "Clubs", "Diamonds"}, indice = 1, rounds = 5, ptype = "Water"}},
  },
  true
)

-- Poliwhirl 061 (--- Worse stats)
SMODS.Joker:take_ownership('poke_poliwhirl',
  {
    config = {extra = {mult = 5, suits = {"Spades", "Hearts", "Clubs", "Diamonds"}, indice = 1, ptype = "Water", item_req = {"waterstone", "kingsrock"}}},
  },
  true
)

-- Poliwrath 062
SMODS.Joker:take_ownership('poke_poliwrath',
  {
    config = {extra = {Xmult_multi = 1.2, suits = {"Spades", "Hearts", "Clubs", "Diamonds"}, indice = 1, mult = 2, ptype = "Water"}},
  },
  true
)

-- Abra 063
SMODS.Joker:take_ownership('poke_abra',
  {
    config = {extra = {odds = 3, rounds = 5, ptype = "Psychic"}},
  },
  true
)

-- Kadabra 064
SMODS.Joker:take_ownership('poke_kadabra',
  {
    config = {extra = {odds = 3, ptype = "Psychic", item_req = "linkcable"}},
  },
  true
)

-- Alakazam 065 (--- Worse stats [Odds])
SMODS.Joker:take_ownership('poke_alakazam',
  {
    config = {extra = {odds = 3, card_limit = 1, ptype = "Psychic"}},
  },
  true
)

-- Mega Alakazam 065-1 (--- Worse stats [Xmultf])
SMODS.Joker:take_ownership('poke_mega_alakazam',
  {
    config = {extra = {Xmult_multi2 = 1.5, Xmult_multi = 1.3, card_limit = 1, ptype = "Psychic"}},
  },
  true
)

-- Machop 066 (~~~ Removed mult)
SMODS.Joker:take_ownership('poke_machop',
  {
    config = {extra = {hands = 1, discards = 1, rounds = 5, ptype = "Fighting"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.hands, center.ability.extra.discards, center.ability.extra.rounds}}
    end,
    calculate = function(self, card, context)
      return level_evo(self, card, context, "j_poke_machoke")
    end,
  },
  true
)

-- Machoke 067 (~~~ Removed mult)
SMODS.Joker:take_ownership('poke_machoke',
  {
    config = {extra = {hands = 2, discards = 2, ptype = "Fighting", item_req = "linkcable"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.hands, center.ability.extra.discards}}
    end,
    calculate = function(self, card, context)
      return item_evo(self, card, context, "j_poke_machamp")
    end,
  },
  true
)

-- Machamp 068 (~~~ Removed mult)
SMODS.Joker:take_ownership('poke_machamp',
  {
    config = {extra = {hands = 3, discards = 4, ptype = "Fighting"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.hands, center.ability.extra.discards}}
    end,
    calculate = function(self, card, context)
    end,
  },
  true
)

-- Bellsprout 069 (--- Worse stats)
SMODS.Joker:take_ownership('poke_bellsprout',
  {
    config = {extra = {chips = 10, rounds = 4, ptype = "Grass"}},
  },
  true
)

-- Weepinbell 070 (--- Worse stats)
SMODS.Joker:take_ownership('poke_weepinbell',
  {
    config = {extra = {chips = 20, ptype = "Grass", item_req = "leafstone"}},
  },
  true
)

-- Victreebel 071 (~~~ Turned into an "or")
SMODS.Joker:take_ownership('poke_victreebel',
  {
    config = {extra = {chips = 30, retriggers = 1, ptype = "Grass"}, cur_type = 0},
      calculate = function(self, card, context)

      if context.before then
        if pseudorandom('victreebel') < .50 then
          card.ability.cur_type = 0
        else
          card.ability.cur_type = 1
        end
      end
        
      if card.ability.cur_type == 0 and context.individual and context.cardarea == G.play and not context.other_card.debuff then
        if context.other_card:get_id() == 2 or 
          context.other_card:get_id() == 4 or 
          context.other_card:get_id() == 6 or 
          context.other_card:get_id() == 8 or 
          context.other_card:get_id() == 10 then
            return {
              chips = card.ability.extra.chips,
              card = card
            }
        end
      end
      if card.ability.cur_type == 1 and context.repetition and context.cardarea == G.play and not context.other_card.debuff then
        if context.other_card:get_id() == 2 or 
          context.other_card:get_id() == 4 or 
          context.other_card:get_id() == 6 or 
          context.other_card:get_id() == 8 or 
          context.other_card:get_id() == 10 then
            return {
              message = localize('k_again_ex'),
              repetitions = card.ability.extra.retriggers,
              card = card
            }
        end
      end
    end
  },
  true
)

-- Tentacool 072 (--- Worse stats [Mult][Rounds])
SMODS.Joker:take_ownership('poke_tentacool',
  {
    config = {extra = {mult = 5, rounds = 5, ptype = "Water"}},
  },
  true
)

-- Tentacruel 073
SMODS.Joker:take_ownership('poke_tentacruel',
  {
    config = {extra = {mult = 8, ptype = "Water"}},
  },
  true
)

-- Geodude 074 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_geodude',
  {
    config = {extra = {chips = 60, h_size = 1, rounds = 4, ptype = "Earth"}},
  },
  true
)

-- Graveler 075 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_graveler',
  {
    config = {extra = {chips = 150, h_size = 2, ptype = "Earth", item_req = "linkcable"}},
  },
  true
)

-- Golem 076 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_golem',
  {
    config = {extra = {chips = 240, h_size = 3, ptype = "Earth"}},
  },
  true
)

-- Ponyta 077 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_ponyta',
  {
    config = {extra = {chips = 0, chip_mod = 8, ptype = "Fire"}, evo_rqmt = 40},
  },
  true
)

-- Rapidash 078 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_rapidash',
  {
    config = {extra = {chips = 0, chip_mod = 12, ptype = "Fire"}},
  },
  true
)

-- Slowpoke 079
-- NN

-- Slowbro 080 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_slowbro',
  {
    config = {extra = {Xmult_mod = 0.25, Xmult = 1, ptype = "Water"}},
  },
  true
)

-- Mega Slowbro 080-1 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_mega_slowbro',
  {
    config = {extra = {Xmult_mod = 0.25, Xmult = 1, hands_played = 0, ptype = "Water"}},
  },
  true
)

-- Magnemite 081 (--- Worse stats [Xmult])
-- NN

-- Magneton 082 (--- Worse stats [XMult])
-- NN

-- Farfetch'd 083 (--- Worse stats [Money])
SMODS.Joker:take_ownership('poke_farfetchd',
  {
    config = {extra = {money = 2, odds = 4, ptype = "Colorless"}},
  },
  true
)

-- Doduo 084 (-- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_doduo',
  {
    config = {extra = {mult = 5, rounds = 5, ptype = "Colorless"}},
  },
  true
)

-- Dodrio 085 (-- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_dodrio',
  {
    config = {extra = {mult = 6, h_size = 1, ptype = "Colorless"}},
  },
  true
)

-- Seel 086
-- NN

-- Dewgong 087
-- NN

-- Grimer 088 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_grimer',
  {
    config = {extra = {mult = 6, rounds = 5, ptype = "Dark"}},
  },
  true
)

-- Muk 089 (~~~ Changed to an "or", Worse stats [Mult])
SMODS.Joker:take_ownership('poke_muk',
  {
    config = {extra = {mult = 3, ptype = "Dark"}},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main and #G.playing_cards > G.GAME.starting_deck_size then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult * (#G.playing_cards - G.GAME.starting_deck_size)}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult * (#G.playing_cards - G.GAME.starting_deck_size),
            card = card
          }
        end
      end
      if context.end_of_round and not context.individual and not context.repetition then
        local cards, cur_card_count = {}, 1
        if pseudorandom('muk') < .50 then
          cur_card_count = 1
        else
          cur_card_count = 2
        end
        for i = 1, cur_card_count do
          cards[i] = create_playing_card({
            front = pseudorandom_element(G.P_CARDS, pseudoseed('muk')), 
            center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.PURPLE
          })
        end
        playing_card_joker_effects(cards);
        local target = pseudorandom_element(G.playing_cards, pseudoseed('muk'))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                if target.ability.name == 'Glass Card' then 
                    target:shatter()
                else
                    target:start_dissolve()
                end
            return true end }))
        delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = {target}})
        end
        card:juice_up()
      end
    end,
  },
  true
)

-- Shellder 090 (--- Worse stats [Odds])
SMODS.Joker:take_ownership('poke_shellder',
  {
    config = {extra = {retriggers = 1, odds = 4, ptype = "Water", item_req = "waterstone"}},
  },
  true
)

-- Cloyster 091 (--- Worse stats [Odds])
SMODS.Joker:take_ownership('poke_cloyster',
  {
    config = {extra = {retriggers = 1, odds = 3, ptype = "Water"}},
  },
  true
)

-- Gastly 092 (!!! Lose money on proc)
SMODS.Joker:take_ownership('poke_gastly',
  {
    config = {extra = {odds = 6, rounds = 3, ptype = "Psychic"}, money = 15},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        if not center.edition or (center.edition and not center.edition.negative) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        end
      end
      return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.rounds, center.ability.money}}
    end,
    calc_dollar_bonus = function(self, card)
      local eligible_card = nil
      if pseudorandom('gastly') < G.GAME.probabilities.normal/card.ability.extra.odds then
        if #G.jokers.cards > 0 then
          local eligible_editionless_jokers = {}
          for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and v ~= card and not v.gone then
                table.insert(eligible_editionless_jokers, v)
            end
          end
          if #eligible_editionless_jokers > 0 then
            eligible_card = pseudorandom_element(eligible_editionless_jokers, pseudoseed('gastly'))
            local edition = {negative = true}
            eligible_card:set_edition(edition, true)
          else
            eligible_card = pseudorandom_element(G.jokers.cards, pseudoseed('gastly'))
            local edition = {negative = true}
            eligible_card:set_edition(edition, true)
          end
        end
        remove(self, card, context)
        
        card_eval_status_text(eligible_card, 'extra', nil, nil, nil, {message = localize("poke_lick_ex"), colour = G.C.PURPLE})
        return ease_poke_dollars(card, "gastly", -(card.ability.money), true)
      end
    end
  },
  true
)

-- Haunter 093 (!!! Lose money on proc)
SMODS.Joker:take_ownership('poke_haunter',
  {
    config = {extra = {odds = 4, ptype = "Psychic", item_req = "linkcable"}, money = 10},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        if not center.edition or (center.edition and not center.edition.negative) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        end
      end
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = G.P_CENTERS.c_poke_linkcable
      end
      return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.money}}
    end,
    calc_dollar_bonus = function(self, card)
      local eligible_card = nil
      if pseudorandom('haunter') < G.GAME.probabilities.normal/card.ability.extra.odds and not card.ability.extra.evolve then
        if #G.jokers.cards > 0 then
          local eligible_editionless_jokers = {}
          for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and v ~= card and not v.gone then
                table.insert(eligible_editionless_jokers, v)
            end
          end
          if #eligible_editionless_jokers > 0 then
            eligible_card = pseudorandom_element(eligible_editionless_jokers, pseudoseed('haunter'))
            local edition = {negative = true}
            eligible_card:set_edition(edition, true)
          else
            eligible_card = pseudorandom_element(G.jokers.cards, pseudoseed('haunter'))
            local edition = {negative = true}
            eligible_card:set_edition(edition, true)
          end
        end
          
        remove(self, card, context)
        
        card_eval_status_text(eligible_card, 'extra', nil, nil, nil, {message = localize("poke_lick_ex"), colour = G.C.PURPLE})
        return ease_poke_dollars(card, "haunter", -(card.ability.money), true)
      end
    end
  },
  true
)

-- Gengar 094 (!!! Money drain mechanic)
SMODS.Joker:take_ownership('poke_gengar',
  {
    config = {extra = {gengar_rounds = 5, trigger = false, ptype = "Psychic"}, money = 3, money_drain = 2},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        if not center.edition or (center.edition and not center.edition.negative) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        end
      end
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = {set = 'Other', key = 'mega_poke'}
      end
      return {vars = {center.ability.extra.gengar_rounds, center.ability.money, center.ability.money_drain}}
    end,
    calculate = function(self, card, context)
      if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
        card.ability.extra.gengar_rounds = card.ability.extra.gengar_rounds - 1
        if card.ability.extra.gengar_rounds ~= 0 then
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("poke_nasty_plot_ex"), colour = G.C.PURPLE})
        end
        if card.ability.extra.gengar_rounds == 0 then
          card.ability.extra.trigger = true
          
          local gengar_chance = pseudorandom('gengar')
          if gengar_chance < .05 then card.ability.extra.gengar_rounds = 3
          elseif gengar_chance < .15 then card.ability.extra.gengar_rounds = 4
          elseif gengar_chance < .35 then card.ability.extra.gengar_rounds = 5
          elseif gengar_chance < .65 then card.ability.extra.gengar_rounds = 6
          elseif gengar_chance < .85 then card.ability.extra.gengar_rounds = 7
          elseif gengar_chance < .95 then card.ability.extra.gengar_rounds = 8
          else card.ability.extra.gengar_rounds = 9
          end
        end
      end
      if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual and not context.blueprint then
        card.ability.money = card.ability.money + card.ability.money_drain
        return {
          message = localize('k_nerfmon_penalty'),
          colour = G.C.PURPLE
        }
      end
    end,
    set_ability = function(self, card, initial, delay_sprites)
      if initial then
        local gengar_chance = pseudorandom('gengar')
        if gengar_chance < .05 then card.ability.extra.gengar_rounds = 3
        elseif gengar_chance < .15 then card.ability.extra.gengar_rounds = 4
        elseif gengar_chance < .35 then card.ability.extra.gengar_rounds = 5
        elseif gengar_chance < .65 then card.ability.extra.gengar_rounds = 6
        elseif gengar_chance < .85 then card.ability.extra.gengar_rounds = 7
        elseif gengar_chance < .95 then card.ability.extra.gengar_rounds = 8
        else card.ability.extra.gengar_rounds = 9
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      local eligible_card = nil
      if card.ability.extra.trigger then
        card.ability.extra.trigger = false
        if #G.jokers.cards > 0 then
          local eligible_jokers = {}
          for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and v.ability.name ~= "gengar" and not v.gone then
                table.insert(eligible_jokers, v)
            end
          end
          if #eligible_jokers > 0 then
            eligible_card = pseudorandom_element(eligible_jokers, pseudoseed('gengar'))
            local edition = {negative = true}
            eligible_card:set_edition(edition, true)
            card_eval_status_text(eligible_card, 'extra', nil, nil, nil, {message = localize("poke_lick_ex"), colour = G.C.PURPLE})
          end
        end
      end
      return ease_poke_dollars(card, "gengar", -(card.ability.money - 1), true)
    end
  },
  true
)

-- Mega Gengar 094-1
SMODS.Joker:take_ownership('poke_mega_gengar',
  {
    config = {extra = {retriggers = 1, odds = 3, ptype = "Psychic"}},
    calculate = function(self, card, context)
      if context.skip_blind then
        G.E_MANAGER:add_event(Event({
          func = (function()
              add_tag(Tag('tag_negative'))
              play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
              play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
              return true
          end)
        }))
      end
    end,
  },
  true
)

-- Onix 095
-- NN

-- Drowzee 096 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_drowzee',
  {
    config = {extra = {Xmult_mod = 0.1, planets_used = 0, ptype = "Psychic"}, evo_rqmt = 7},
  },
  true
)

-- Hypno 097 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_hypno',
  {
    config = {extra = {Xmult_mod = 0.15, planets_used = 0, ptype = "Psychic"}},
  },
  true
)

-- Krabby 098 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_krabby',
  {
    config = {extra = {chips = 15, rounds = 4, ptype = "Water"}},
  },
  true
)

-- Kingler 099 (~~~ Worse stats [Chips], only first unenhanced)
SMODS.Joker:take_ownership('poke_kingler',
  {
    config = {extra = {chips = 20, ptype = "Water"}, hand_change = false},
    calculate = function(self, card, context)
      if context.before and context.cardarea == G.jokers and not context.blueprint then
        local faces = {}
        card.ability.hand_change = false
        for k, v in ipairs(context.scoring_hand) do
            if v:is_face() and v.config.center == G.P_CENTERS.c_base then 
                faces[#faces+1] = v
                if not card.ability.hand_change then
                  v:set_ability(G.P_CENTERS.m_bonus, nil, true)
                  card.ability.hand_change = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          v:juice_up()
                          return true
                      end
                  }))
                end
            end
        end
        if #faces > 0 then 
            return {
                message = localize("poke_surf_ex"),
                colour = G.C.CHIPS,
                card = card
            }
        end
      end
      if context.individual and context.cardarea == G.play and context.other_card:is_face() then
        if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
              G.E_MANAGER:add_event(Event({func = function()
                  card:juice_up(0.8, 0.8)
              return true end }))
          return {
            colour = G.C.CHIPS,
            chips = card.ability.extra.chips
          }
        end
      end
    end
  },
  true
)

-- Voltorb 100 (--- Worse stats)
SMODS.Joker:take_ownership('poke_voltorb',
  {
    config = {extra = {Xmult = 1.5, rounds = 4, volatile = 'right', ptype = "Lightning"}},
  },
  true
)

-- Electrode 101 (--- Worse stats)
SMODS.Joker:take_ownership('poke_electrode',
  {
    config = {extra = {Xmult = 2, money = 2, volatile = 'right', ptype = "Lightning"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..center.ability.extra.volatile}
      end
      return {vars = {center.ability.extra.Xmult, center.ability.extra.money}}
    end,
  },
  true
)

-- Exeggute 102
SMODS.Joker:take_ownership('poke_exeggcute',
  {
    config = {extra = {mult = 1, suit = "Hearts", mult2 = 6, odds = 3, ptype = "Grass", item_req = "leafstone"}},
  },
  true
)

-- Exeggutor 103 (--- Worse stats)
SMODS.Joker:take_ownership('poke_exeggutor',
  {
    config = {extra = {mult_mod = 2, Xmult_multi = 1.3, suit = "Hearts", odds = 2, ptype = "Grass"}},
  },
  true
)

-- Cubone 104 (--- Worse stats)
SMODS.Joker:take_ownership('poke_cubone',
  {
    config = {extra = {mult = 3, consumables_used = 0, ptype = "Earth"}, evo_rqmt = 20},
  },
  true
)

-- Marowak 105 (--- Worse stats)
SMODS.Joker:take_ownership('poke_marowak',
  {
    config = {extra = {Xmult_mod = 0.25, card_limit = 1, ptype = "Earth"}},
  },
  true
)

-- Hitmonlee 106 (--- Worse stats)
SMODS.Joker:take_ownership('poke_hitmonlee',
  {
    config = {extra = {Xmult_mod = 0.1, ptype = "Fighting"}},
  },
  true
)

-- Hitmonchan 107 (--- Worse stats)
SMODS.Joker:take_ownership('poke_hitmonchan',
  {
    config = {extra = {Xmult_mod = 0.1, ptype = "Fighting"}},
  },
  true
)

-- Lickitung 108
-- NN

-- Koffing 109
-- NN

-- Weezing 110
-- NN

-- Rhyhorn 111 (--- Worse stats)
SMODS.Joker:take_ownership('poke_rhyhorn',
  {
    config = {extra = {chips = 10, rounds = 4, ptype = "Earth"}},
  },
  true
)

-- Rhydon 112 (--- Worse stats)
SMODS.Joker:take_ownership('poke_rhydon',
  {
    config = {extra = {chips = 12, retriggers = 1, ptype = "Earth", item_req = "linkcable"}},
  },
  true
)

-- Chansey 113 (~~~ Only first trigger)
SMODS.Joker:take_ownership('poke_chansey',
  {
    config = {extra = {limit = 1, triggers = 0, ptype = "Colorless"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
      end
      local deck_data = ''
      if G.playing_cards then
        local enhance_count = 0
        for k, v in pairs(G.playing_cards) do
          if SMODS.has_enhancement(v, 'm_lucky') then enhance_count = enhance_count  + 1 end
        end
        deck_data = '['..tostring(enhance_count)..'/'..tostring(math.ceil(#G.playing_cards/4))..'] '
      end
      return {vars = {deck_data}}
    end,
  },
  true
)

-- Tangela 114 (--- Worse stats [Mult][Chips][Money])
SMODS.Joker:take_ownership('poke_tangela',
  {
    config = {extra = {mult = 6, chips = 40, money_mod = 2, odds = 4, wilds_scored = 0, ptype = "Grass"}, evo_rqmt = 10},
  },
  true
)

-- Kangaskhan 115
-- NN

-- Mega Kangaskhan 115-1 (!!! Replaced retriggers with consumable slots)
SMODS.Joker:take_ownership('poke_mega_kangaskhan',
  {
    config = {extra = {consumeables_used = 0, consumeable_target = 2, card_limit = 3, ptype = "Colorless"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.consumeable_target, center.ability.extra.consumeables_used, center.ability.extra.card_limit}}
    end,
    calculate = function(self, card, context)
      if context.using_consumeable then
        card.ability.extra.consumeables_used = card.ability.extra.consumeables_used + 1
        if card.ability.extra.consumeables_used >= 2 then
          local eval = function(card) return (card.ability.extra.consumeables_used and card.ability.extra.consumeables_used >= 2) and not G.RESET_JIGGLES end
          juice_card_until(card, eval, true)
        end
      end
      if context.end_of_round and not context.individual and not context.repetition then
        if card.ability.extra.consumeables_used >= 2 then
          G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_double'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
          }))
        end
        card.ability.extra.consumeables_used = 0
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      local add = card.ability.extra.card_limit
      G.E_MANAGER:add_event(Event({func = function()
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + add
        return true end }))
    end,
    remove_from_deck = function(self, card, from_debuff)
      local remove = card.ability.extra.card_limit
      G.E_MANAGER:add_event(Event({func = function()
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - remove
        return true end }))
    end, 
  },
  true
)

-- Horsea 116 (!!! Last hand of round)
SMODS.Joker:take_ownership('poke_horsea',
  {
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before and not context.blueprint and G.GAME.current_round.hands_left == 0 then
          local upgraded = false
          for k, v in ipairs(context.scoring_hand) do
            if v:get_id() == 6 then
              card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
              if not upgraded then upgraded = true end
            end
          end
          if upgraded then
            return {
              message = localize('k_upgrade_ex'),
              colour = G.C.MULT
            }
          end
        end
        if context.joker_main and card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return scaling_evo(self, card, context, "j_poke_seadra", card.ability.extra.mult, self.config.evo_rqmt)
    end,
  },
  true
)

-- Seadra 117 (!!! Last hand of round)
SMODS.Joker:take_ownership('poke_seadra',
  {
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main and card.ability.extra.mult > 0 then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      if context.individual and context.cardarea == G.play and not context.other_card.debuff and not context.blueprint and G.GAME.current_round.hands_left == 0 then
        if context.other_card:get_id() == 6 then
          local has_king = false
          for i = 1, #G.hand.cards do 
            if G.hand.cards[i]:get_id() == 13 then has_king = true; break end
          end
          if has_king then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod * 2
          else
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
          end
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
        end
      end
      return type_evo(self, card, context, "j_poke_kingdra", "dragon")
    end,
  },
  true
)

-- Goldeen 118 (!!! Chance based)
SMODS.Joker:take_ownership('poke_goldeen',
  {
    config = {extra = {retriggers = 1, rounds = 5, odds = 2, ptype = "Water"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
      end
      return {vars = {center.ability.extra.retriggers, center.ability.extra.rounds, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) and SMODS.has_enhancement(context.other_card, 'm_gold') and (pseudorandom('goldeen') < G.GAME.probabilities.normal/card.ability.extra.odds) then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability.extra.retriggers,
          card = card
        }
      end
      return level_evo(self, card, context, "j_poke_seaking")
    end
  },
  true
)

-- Seaking 119 (--- Worse stats)
SMODS.Joker:take_ownership('poke_seaking',
  {
    config = {extra = {retriggers = 1, ptype = "Water"}},
  },
  true
)

-- Staryu 120 (~~~ Changed to "or")
SMODS.Joker:take_ownership('poke_staryu',
  {
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
        if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
          if pseudorandom('staryu') < .50 then
            return {
              mult = card.ability.extra.mult,
              card = card
            }
          else
            local earned = ease_poke_dollars(card, "starmie", card.ability.extra.money_mod, true)
            return {
              dollars = earned,
              card = card
            }
          end
        end
      end
      return item_evo(self, card, context, "j_poke_starmie")
    end
  },
  true
)

-- Starmie 121 (--- Worse stats)
SMODS.Joker:take_ownership('poke_starmie',
  {
    config = {extra = {mult = 2, money_mod = 1, suit = "Diamonds", ptype = "Water"}},
  },
  true
)

-- Mr Mime 122 (--- Worse stats [Repetitions])
SMODS.Joker:take_ownership('poke_mrmime',
  {
    config = {extra = {retriggers = 2, ptype = "Psychic"}},
  },
  true
)

-- Scyther 123 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_scyther',
  {
    calculate = function(self, card, context)
      if context.ending_shop then
        card.ability.extra.selected = false
        local eval = function() return not card.ability.extra.selected end
        juice_card_until(card, eval, true)
      end
      if context.setting_blind and not card.getting_sliced and not context.blueprint then
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then my_pos = i; break end
        end
        if my_pos and G.jokers.cards[my_pos+1] and not card.getting_sliced and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
            local sliced_card = G.jokers.cards[my_pos+1]
            sliced_card.getting_sliced = true
            
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, colour = G.C.RED, no_juice = true})
        end
        card.ability.extra.selected = true
      end
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          return {
              message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
              mult_mod = card.ability.extra.mult
          }
        end
      end
      local evo = nil
      evo = type_evo(self, card, context, "j_poke_scizor", "metal")
      if not evo then
        evo = item_evo(self, card, context, "j_poke_kleavor")
      end
      if evo then return evo end
    end
  },
  true
)

-- Jynx 124 (--- Worse stats)
SMODS.Joker:take_ownership('poke_jynx',
  {
    config = {extra = {h_size = 1, deck_size = 12, ptype = "Psychic"}},
  },
  true
)

-- Electabuzz 125 (--- Worse stats)
SMODS.Joker:take_ownership('poke_electabuzz',
  {
    config = {extra = {money_mod = 1, percent = 34, max = 20, ptype = "Lightning", item_req = "linkcable"}},
  },
  true
)

-- Magmar 126 (--- Worse stats)
SMODS.Joker:take_ownership('poke_magmar',
  {
    config = {extra = {mult = 0, mult_mod = 1, ptype = "Fire", item_req = "linkcable"}},
  },
  true
)

-- Pinsir 127
-- NN

-- Mega Pinsir 127-1 (--- Worse stats)
SMODS.Joker:take_ownership('poke_mega_pinsir',
  {
    config = {extra = {Xmult_multi = 1.5, ptype = "Grass"}},
  },
  true
)

-- Tauros 128 (--- Worse stats)
SMODS.Joker:take_ownership('poke_tauros',
  {
    config = {extra = {Xmult_multi = 1.6, odds = 15, ptype = "Colorless"}},
  },
  true
)

-- Tauros Herd 128-1 (--- Worse stats)
SMODS.Joker:take_ownership('poke_taurosh',
  {
    config = {extra = {mult = 4, ptype = "Colorless"}},
  },
  true
)

-- Magikarp 129
-- NN

-- Gyarados 130 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_gyarados',
  {
    config = {extra = {Xmult = 2, ptype = "Water"}},
  },
  true
)

-- Mega Gyarados 130-1 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_mega_gyarados',
  {
    config = {extra = {Xmult = 2, ptype = "Water"}},
  },
  true
)

-- Lapras 131
-- NN

-- Ditto 132
-- NN

-- Eevee 133 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_eevee',
  {
    config = {extra = {Xmult = 1.24, ptype = "Colorless", item_req = {"waterstone", "thunderstone", "firestone", "sunstone", "moonstone", "leafstone", "icestone", "shinystone"}, evo_list = {waterstone = "j_poke_vaporeon", thunderstone = "j_poke_jolteon", firestone = "j_poke_flareon", sunstone = "j_poke_espeon", moonstone = "j_poke_umbreon", 
              leafstone = "j_poke_leafeon", icestone = "j_poke_glaceon", shinystone = "j_poke_sylveon"},}},
  },
  true
)

-- Vaporeon 134 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_vaporeon',
  {
    config = {extra = {chips = 3, ptype = "Water"}},
  },
  true
)

-- Jolteon 135 (--- Worse stats [Money])
SMODS.Joker:take_ownership('poke_jolteon',
  {
    config = {extra = {money = 2, ptype = "Lightning"}},
  },
  true
)

-- Flareon 136 (--- Worse stats [Rerolls])
SMODS.Joker:take_ownership('poke_flareon',
  {
    config = {extra = {Xmult_multi = 1.5, ptype = "Fire"}},
  },
  true
)

-- Porygon 137
-- NN

-- Omanyte 138 (~~~ Worse stats [Money], switched first and second level)
SMODS.Joker:take_ownership('poke_omanyte',
  {
    config = {extra = {rank = "3", money = 1, third_goal = 5, third_times = 0, ptype = "Water"}, evo_rqmt = 5},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          local first_level = nil
          local second_level = nil
          local third_level = nil
          local threes = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 3 then threes = threes + 1 end
          end
          first_level = threes > 0
          second_level = threes > 1
          third_level = threes > 2
          
          if second_level then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil)
              _card:add_to_deck()
              G.consumeables:emplace(_card)
              card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
            end
          end
          
          if third_level then
            card.ability.extra.third_times = card.ability.extra.third_times + 1
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, nil)
              _card:add_to_deck()
              G.consumeables:emplace(_card)
              card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.ARGS.LOC_COLOURS.item})
            end
          end
          
          if first_level then
            local earned = ease_poke_dollars(card, "omanyte", card.ability.extra.money, true)
            return {
              dollars = earned, 
              card = card
            }
          end
        end
      end
      return scaling_evo(self, card, context, "j_poke_omastar", card.ability.extra.third_times, self.config.evo_rqmt)
    end,
  },
  true
)

-- Omastar 139 (~~~ Worse stats [Money], switched first and second level)
SMODS.Joker:take_ownership('poke_omastar',
  {
    config = {extra = {rank = "3", money = 2, tag_created = false, ptype = "Water"}},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          local first_level = nil
          local second_level = nil
          local third_level = nil
          local fourth_level = nil
          local threes = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 3 then threes = threes + 1 end
          end
          first_level = threes > 0
          second_level = threes > 1
          third_level = threes > 2
          fourth_level = threes > 3
          
          if second_level then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil)
              _card:add_to_deck()
              G.consumeables:emplace(_card)
              card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
            end
          end
          if third_level then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, nil)
              _card:add_to_deck()
              G.consumeables:emplace(_card)
              card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.ARGS.LOC_COLOURS.item})
            end
          end
          if fourth_level and not card.ability.extra.tag_created then
            card.ability.extra.tag_created = true
            local tag = ''
            local tag_choice = pseudorandom('sylveon')
            if tag_choice < 1/5 then
              tag = 'tag_handy'
            elseif tag_choice < 2/5 then
              tag = 'tag_garbage'
            elseif tag_choice < 3/5 then
              tag = 'tag_investment'
            elseif tag_choice < 4/5 then
              tag = 'tag_economy'
            else
              tag = 'tag_d_six'
            end
            G.E_MANAGER:add_event(Event({
              func = (function()
                  add_tag(Tag(tag))
                  play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                  play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                  return true
              end)
            }))
          end
          if first_level then
            local earned = ease_poke_dollars(card, "omastar", card.ability.extra.money, true)
            return {
              dollars = earned, 
              card = card
            }
          end
        end
      end
      if context.end_of_round and not context.individual and not context.repetition then
        card.ability.extra.tag_created = nil
      end
    end,
  },
  true
)

-- Kabuto 140 (--- Worse stats [Chips])
SMODS.Joker:take_ownership('poke_kabuto',
  {
    config = {extra = {rank = "2", chips1 = 25, chips2 = 5, chips3 = 50, third_times = 0, retrig_twos = 0, ptype = "Earth"}, evo_rqmt = 5},
  },
  true
)

-- Kabutops 141 (!!! Worse stats [Chips] / reworked retriggers)
SMODS.Joker:take_ownership('poke_kabutops',
  {
    config = {extra = {rank = "2", chips1 = 35, chips2 = 5, chips3 = 70, retriggers = 1, retrig_twos = 0, ptype = "Earth"}},
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before then
          local twos = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 2 then twos = twos + 1 end
          end
          card.ability.extra.first_level = twos > 0
          card.ability.extra.second_level = twos > 1
          card.ability.extra.third_level = twos > 2
          card.ability.extra.fourth_level = twos > 3
          card.ability.extra.retrig_twos = 0
        end
        if context.joker_main then
          local chips = 0
          if card.ability.extra.first_level then
            chips = chips + card.ability.extra.chips1
          end
          if card.ability.extra.third_level then
            chips = chips + card.ability.extra.chips3
          end
          
          if chips > 0 then
            return {
              message = localize{type = 'variable', key = 'a_chips', vars = {chips}}, 
              colour = G.C.CHIPS,
              chip_mod = chips
            }
          end
        end
      end
      if context.individual and not context.end_of_round and context.cardarea == G.play and card.ability.extra.second_level then
        if context.other_card:get_id() == 2 then 
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips2
          return {
            extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
            colour = G.C.CHIPS,
            card = card
          }
        end
      end
      if context.repetition and context.cardarea == G.play and card.ability.extra.fourth_level then
        if context.other_card:get_id() == 2 and context.ability.extra.retrig_twos < 2 then
          context.ability.extra.retrig_twos = context.ability.extra.retrig_twos + 1
          return {
              message = localize('k_again_ex'),
              repetitions = card.ability.extra.retriggers,
              card = card
          }
        end
      end
    end,
  },
  true
)

-- Aerodactyl 142 (--- Worse stats)
SMODS.Joker:take_ownership('poke_aerodactyl',
  {
    config = {extra = {rank = "Ace", Xmult = 1, Xmult_mod = 0.3, Xmult_original = 1, ptype = "Earth"}},
    calculate = function(self, card, context)
      if context.first_hand_drawn and not context.blueprint then
        card.ability.extra.Xmult_original = card.ability.extra.Xmult
      end
      if context.before then
          local first_level = nil
          local second_level = nil
          local third_level = nil
          local fourth_level = nil
          local mult = 0
          local ret_values = {}
          local aces = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 14 then aces = aces + 1 end
          end
          first_level = aces > 0
          second_level = aces > 1
          third_level = aces > 2
          fourth_level = aces > 3
          
          if third_level and not context.blueprint then
            local target = nil
            for k, v in pairs(context.scoring_hand) do
              if v:get_id() == 14 and v.config.center == G.P_CENTERS.c_base then
                target = v
                break
              end
            end
            if target then
              poke_convert_cards_to(target, {mod_conv = 'm_glass'}, true, true)
            end
          end
      end
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          local first_level = nil
          local second_level = nil
          local third_level = nil
          local fourth_level = nil
          local mult = 0
          local ret_values = {}
          local aces = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 14 then aces = aces + 1 end
          end
          first_level = aces > 0
          second_level = aces > 1
          third_level = aces > 2
          fourth_level = aces > 3
                  
          if second_level and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
          end
          
          if fourth_level and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult * 2
          end
          
          if first_level and card.ability.extra.Xmult > 1 then
            return {
              message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}}, 
              colour = G.C.XMULT,
              Xmult_mod = card.ability.extra.Xmult
            }
          end
        end
      end
      if not context.repetition and not context.individual and context.end_of_round and not context.blueprint then
        card.ability.extra.Xmult = card.ability.extra.Xmult_original
        return {
          message = localize('k_reset'),
          colour = G.C.RED
        }
      end
    end,
  },
  true
)

-- Mega Aerodactyl 142-1 (!!! Always destroys aces)
SMODS.Joker:take_ownership('poke_mega_aerodactyl',
  {
    calculate = function(self, card, context)
      if context.individual and not context.end_of_round and context.cardarea == G.play and context.other_card:get_id() == 14 then
        if pseudorandom('mega_aerodactyl') < G.GAME.probabilities.normal/card.ability.extra.odds then
        end
        return { 
          x_mult = card.ability.extra.Xmult_multi * card.ability.extra.aces,
          card = card
        }
      end
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.before then
          local aces = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:get_id() == 14 then aces = aces + 1 end
          end
          card.ability.extra.aces = aces
        end
        if context.after then
          card.ability.extra.aces = 0
        end
      end
      if context.destroying_card then
        return not context.blueprint and context.destroying_card:get_id() == 14
      end
    end,
  },
  true
)

-- Snorlax 143 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_snorlax',
  {
    config = {extra = {Xmult_mod = 0.05, Xmult = 1, ptype = "Colorless"}},
  },
  true
)

-- Articuno 144 (~~~ Changed to an "or")
SMODS.Joker:take_ownership('poke_articuno',
  {
    calculate = function(self, card, context)
      if context.before and context.cardarea == G.jokers and not context.blueprint and context.scoring_hand then
        local target = context.scoring_hand[1]
        local args
        if pseudorandom('articuno') < .50 then
          args = {edition = "e_foil"}
        else
          args = {seal = SMODS.poll_seal({guaranteed = true})}
        end
        poke_convert_cards_to(target, args, true, true)
      end
    end
  },
  true
)

-- Zapdos 145 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_zapdos',
  {
    config = {extra = {Xmult = 0.04, money_threshold = 2, ptype = "Lightning"}},
  },
  true
)

-- Moltres 146 (--- Worse stats [Level])
SMODS.Joker:take_ownership('poke_moltres',
  {
    calculate = function(self, card, context)
    if context.pre_discard and G.GAME.current_round.discards_used <= 0 and not context.hook then
      local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
      card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
      update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=                       G.GAME.hands[text].level})
      level_up_hand(context.blueprint_card or card, text, nil, 2)
      update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.discards_used <= 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
  end
  },
  true
)

-- Dratini 147
SMODS.Joker:take_ownership('poke_dratini',
  {
    config = {extra = {mult = 0, mult_mod = 1, size = 3, rounds = 5, ptype = "Dragon"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.size, center.ability.extra.rounds}}
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and context.full_hand then
        if context.before and #context.full_hand <= card.ability.extra.size and not context.blueprint then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        end
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return level_evo(self, card, context, "j_poke_dragonair")
    end,
  },
  true
)

-- Dragonair 148 (~~~ Changed to an "or")
SMODS.Joker:take_ownership('poke_dragonair',
  {
    config = {extra = {mult = 15, mult_mod = 1, size = 2, rounds = 4, ptype = "Dragon"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.size, center.ability.extra.rounds, center.ability.extra.mult_mod * 2}}
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and context.full_hand then
        local extra
        if pseudorandom('dragonair') < .50 then
          extra = 1
        else
          extra = 2
        end
        if context.before and #context.full_hand <= card.ability.extra.size and not context.blueprint then
          card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * extra)
        end
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return level_evo(self, card, context, "j_poke_dragonite")
    end,
  },
  true
)

-- Dragonite 149 (--- Worse stats [Repetitions])
SMODS.Joker:take_ownership('poke_dragonite',
  {
    config = {extra = {mult = 30, retriggers = 2, ptype = "Dragon"}},
  },
  true
)

-- Mewtwo 150 (!!! Removed extra polychrome bonus / Energizing)
SMODS.Joker:take_ownership('poke_mewtwo',
  {
    config = {extra = {Xmult_multi = 1, ptype = "Psychic"}},
    loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = {set = 'Other', key = 'energize'}
        if not center.edition or (center.edition and not center.edition.polychrome) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        end
        if next(SMODS.find_card('c_poke_megastone')) then
          info_queue[#info_queue+1] = {set = 'Other', key = 'split_mega', vars = {"Mega Mewtwo X", "Mega Mewtwo Y"}}
        end
        info_queue[#info_queue+1] = {set = 'Other', key = 'mega_poke'}
      end
      return {vars = {}}
    end,
    calculate = function(self, card, context)
      if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual and not context.blueprint then
        local leftmost = G.jokers.cards[1]
        if leftmost ~= card then
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
          local chosen_joker = G.jokers.cards[1]
          
          if (#G.jokers.cards - 1 < G.jokers.config.card_limit and not leftmost.ability.eternal) or (#G.jokers.cards < G.jokers.config.card_limit and leftmost.ability.eternal) then
            local _card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition)
            local edition = {polychrome = true}
            _card:set_edition(edition, true)
            -- if _card.config and _card.config.center.stage and _card.config.center.stage ~= "Other" and not type_sticker_applied(_card) then
            --   energy_increase(_card, _card.ability.extra.ptype)
            -- elseif type_sticker_applied(_card) then
            --   energy_increase(_card, type_sticker_applied(_card))
            -- end
            _card:add_to_deck()
            G.jokers:emplace(_card)
            if _card.debuff then 
              _card.debuff = false 
              if _card.ability.perishable then _card.ability.perish_tally = G.GAME.perishable_rounds end
            end
          end
          
          if not leftmost.ability.eternal then
            G.E_MANAGER:add_event(Event({
              remove(self, G.jokers.cards[1], context)
            }))
          end
        end
      end
    end,
  },
  true
)

-- Mega Mewtwo X 150-1 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_mega_mewtwo_x',
  {
    config = {extra = {Xmult_multi = 1.75, ptype = "Psychic"}},
  },
  true
)

-- Mega Mewtwo Y 150-2
SMODS.Joker:take_ownership('poke_mega_mewtwo_y',
  {
    config = {extra = {Xmult_mod = 3, ptype = "Psychic"}},
    calculate = function(self, card, context)
      if context.ending_shop and not context.blueprint then
        local leftmost = G.jokers.cards[1]
        if leftmost ~= card then
          local _card = G.jokers.cards[1]
          if _card.config and _card.config.center.stage and _card.config.center.stage ~= "Other" and not type_sticker_applied(_card) then
            energy_increase(_card, _card.ability.extra.ptype)
          elseif type_sticker_applied(_card) then
            energy_increase(_card, type_sticker_applied(_card))
          end
        end
      end
      if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss then
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("poke_future_sight"), colour = G.ARGS.LOC_COLOURS.psychic})
        if not G.GAME.energy_plus then
          G.GAME.energy_plus = 1
        else
          G.GAME.energy_plus = G.GAME.energy_plus + 1
        end
      end
    end
  },
  true
)

-- Mew 151 (--- Worse stats [Chance])
SMODS.Joker:take_ownership('poke_mew',
  {
    config = {extra = {percent = 10, ptype = "Psychic"}},
  },
  true
)

end