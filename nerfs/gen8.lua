if nerfmon_config.pokes_nerf then

-- Kleavor 900 (~~~ Requires rare)
SMODS.Joker:take_ownership('poke_kleavor',
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
            if (sliced_card.config.center.rarity ~= 1 and slice_card.config.center.rarity ~= 2) then
              local edition = poll_edition('aura', nil, true, true)
              local _card = create_playing_card({
                              front = pseudorandom_element(G.P_CARDS, pseudoseed('kleavor')), 
                              center = G.P_CENTERS.m_stone}, G.deck, nil, nil, {G.C.SECONDARY_SET.Enhanced})
              _card:set_edition(edition, true)
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
    end
  },
  true
)

end