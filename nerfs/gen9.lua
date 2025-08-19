if nerfmon_config.pokes_nerf then

-- Annihilape 979 (~~~ Removed stacking effect)
SMODS.Joker:take_ownership('poke_annihilape',
  {
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.mult * (1 + G.GAME.current_round.hands_played), 
                      center.ability.extra.chips * (1 + G.GAME.current_round.hands_played)}}
    end,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.other_card.debuff then
        if context.other_card:get_id() == 2 or 
          context.other_card:get_id() == 3 or 
          context.other_card:get_id() == 5 or 
          context.other_card:get_id() == 7 then
          return {
              chips = card.ability.extra.chips,
              mult = card.ability.extra.mult,
              card = card
          }
        end
      end
    end
  },
  true
)

end