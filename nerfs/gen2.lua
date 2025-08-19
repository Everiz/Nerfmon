if nerfmon_config.pokes_nerf then

-- Bellossom 182 (!!! Random chance on wild, worse stats [Mult])
SMODS.Joker:take_ownership('poke_bellossom',
  {
    config = {extra = {mult = 5, odds = 3, ptype = "Grass"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        if not center.edition or (center.edition and not center.edition.polychrome) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        end
        if not center.edition or (center.edition and not center.edition.foil) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        end
        if not center.edition or (center.edition and not center.edition.holo) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        end
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
      end
      return {vars = {center.ability.extra.mult, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
      if context.before and context.cardarea == G.jokers and not context.blueprint then
        local odds = {}
        for k, v in ipairs(context.scoring_hand) do
            local upgrade = pseudorandom(pseudoseed('bellossom'))
            if (v:get_id() == 3 or v:get_id() == 5 or v:get_id() == 7 or v:get_id() == 9 or v:get_id() == 14) and upgrade > .50 and not v.edition then
                odds[#odds+1] = v
                if v.ability.name == 'Wild Card' and not v.edition and (pseudorandom('natu') < G.GAME.probabilities.normal/card.ability.extra.odds) then
                  local edition = poll_edition('aura', nil, true, true)
                  v:set_edition(edition, true, true)
                end
                v:set_ability(G.P_CENTERS.m_wild, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        return true
                    end
                })) 
            else
              v.bellossom_score = true
            end
        end
        if #odds > 0 then 
            return {
              message = localize("poke_petal_dance_ex"),
                colour = G.C.MULT,
                card = card
            }
        end
      end
      if context.after and context.cardarea == G.jokers and not context.blueprint then
        for k, v in ipairs(context.scoring_hand) do
          if v.bellossom_score then v.bellossom_score = nil end
        end
      end
      if context.individual and context.cardarea == G.play and not context.other_card.debuff then
        if context.other_card:get_id() == 3 or 
          context.other_card:get_id() == 5 or 
          context.other_card:get_id() == 7 or 
          context.other_card:get_id() == 9 or 
          context.other_card:get_id() == 14 then
            if context.other_card.bellossom_score then
              return {
                mult = card.ability.extra.mult,
                card = card
              }
            end
        end
      end
    end
  },
  true
)

-- Slowking 199 (--- Worse stats [Xmult])
SMODS.Joker:take_ownership('poke_slowking',
  {
    config = {extra = {Xmult_multi = 1, Xmult_multi2 = 0.1, oXmult = 1, ptype = "Water"}},
  },
  true
)

-- Unown 201 (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_unown',
  {
    config = {extra = {mult = 4, form = "A", targets = {{value = "Ace", id = "14"}}, ptype = "Psychic"}},
  },
  true
)

-- Steelix 208
-- NN

-- Mega Steelix 208-1
SMODS.Joker:take_ownership('poke_mega_steelix',
  {
    calc_dollar_bonus = function(self, card)
      local diamond_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
          if playing_card:is_suit(card.ability.extra.suit) then diamond_tally = diamond_tally + 1 end
      end
      diamond_tally = math.floor(diamond_tally / 2)
      return diamond_tally > 0 and card.ability.extra.money * diamond_tally or nil
    end
  },
  true
)

-- Scizor 212
SMODS.Joker:take_ownership('poke_scizor',
  {
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      if pokermon_config.detailed_tooltips then
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        info_queue[#info_queue + 1] = {set = 'Other', key = 'mega_poke'}
      end
      local emult = 0 
      local echips = 0 
      local eXmult = 1
      if center.edition and center.edition.holo then
        emult = center.edition.mult or 0
      end
      if center.edition and center.edition.foil then
        echips = center.edition.chips or 0
      end
      if center.edition and center.edition.polychrome then
      eXmult = center.edition.x_mult or 1
      end
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod}}
    end,
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
            if (sliced_card.config.center.rarity ~= 1) and (sliced_card.config.center.rarity ~= 2) and not card.edition then
              local edition = poll_edition('wheel_of_fortune', nil, true, true)
              card:set_edition(edition, true)
            end
            
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

-- Kingdra 230 (!!! Final hand only, worse stats [Xmult])
SMODS.Joker:take_ownership('poke_kingdra',
  {
    config = {extra = {mult = 0, mult_mod = 1, Xmult = 1, Xmult_mod = .03, ptype = "Dragon"}},
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.other_card.debuff and not context.blueprint and G.GAME.current_round.hands_left == 0 then
        if context.other_card:get_id() == 6 then
          local has_king = false
          for i = 1, #G.hand.cards do 
            if G.hand.cards[i]:get_id() == 13 then has_king = true; break end
          end
          if has_king then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
          else
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
          end
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
        end
      end
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          return {
            message = localize("poke_twister_ex"),
            colour = G.C.XMULT,
            mult_mod = card.ability.extra.mult,
            Xmult_mod = card.ability.extra.Xmult
          }
        end
      end
    end,
  },
  true
)

-- Porygon2 233 (--- Worse stats [Energy])
SMODS.Joker:take_ownership('poke_porygon2',
  {
    add_to_deck = function(self, card, from_debuff)
      if not G.GAME.energy_plus then
        G.GAME.energy_plus = 1
      else
        G.GAME.energy_plus = G.GAME.energy_plus + 1
      end
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not G.GAME.energy_plus then
        G.GAME.energy_plus = 0
      else
        G.GAME.energy_plus = G.GAME.energy_plus - 1
      end
    end
  },
  true
)

-- Blissey 242 (~~~ Only first trigger, edition from aura)
SMODS.Joker:take_ownership('poke_blissey',
  {
    config = {extra = {limit = 1, triggers = 0, ptype = "Colorless"}},
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and card.ability.extra.triggers < card.ability.extra.limit then
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        local card_to_copy = context.other_card

        G.E_MANAGER:add_event(Event({
            func = function()
                local copy = copy_card(card_to_copy, nil, nil, G.playing_card)
                copy:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy)
                G.hand:emplace(copy)
                copy.states.visible = nil
                copy:start_materialize()
                local edition = poll_edition('aura', nil, true, true)
                copy:set_edition(edition, true)
                playing_card_joker_effects({copy})
                return true
            end
        })) 
        if not context.blueprint then
          card.ability.extra.triggers = card.ability.extra.triggers + 1
        end
        return {
            message = localize('k_copied_ex'),
            colour = G.C.CHIPS,
            card = card,
            playing_cards_created = {true}
        }
      end
      if not context.repetition and not context.individual and context.end_of_round then
        card.ability.extra.triggers = 0
      end
    end
  },
  true
)

end