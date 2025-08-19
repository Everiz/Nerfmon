if nerfmon_config.pokes_nerf then

-- Magnezone 462 (--- Worse stats [XMult])
-- NN

-- Lickilicky 463
-- NN

-- Rhyperior 464 (!!! Retriggers only affect first stone)
SMODS.Joker:take_ownership('poke_rhyperior',
  {
    config = {extra = {chips = 12, ptype = "Earth"}},
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.other_card.debuff and not context.end_of_round and SMODS.has_enhancement(context.other_card, 'm_stone') then
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
        return {
            extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
            colour = G.C.CHIPS,
            card = card
        }
      end
      if context.repetition and not context.end_of_round and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
        local first = nil
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i] == context.other_card then
            first = true
            break
          elseif context.scoring_hand[i].ability.name == 'Stone Card' then
            break
          end
        end
        if first then
          local rhytriggers = 1 + math.floor(#find_pokemon_type("Earth")/3)
          return {
            message = localize('k_again_ex'),
            repetitions = rhytriggers,
            card = card
          }
        end
      end
    end
  },
  true
)

-- Tangrowth 465 (--- Worse stats [Mult][Chips])
SMODS.Joker:take_ownership('poke_tangrowth',
  {
    config = {extra = {mult = 10, chips = 50, money_mod = 3, odds = 4, ptype = "Grass"}},
  },
  true
)

-- Electivire 466 (--- Worse stats [Money][XMult])
SMODS.Joker:take_ownership('poke_electivire',
  {
    config = {extra = {money_mod = 1, Xmult_mod = 0.01, ptype = "Lightning"}},
  },
  true
)

-- Magmortar 467 (--- Worse stats [Mult][XMult])
SMODS.Joker:take_ownership('poke_magmortar',
  {
    config = {extra = {mult = 0, mult_mod = 1, Xmult = 1, Xmult_mod = 0.03, ptype = "Fire"}},
  },
  true
)

-- Leafeon 470 (--- Worse stats [Handsize])
SMODS.Joker:take_ownership('poke_leafeon',
  {
    config = {extra = {extra = {h_size = 5, h_mod = 1, h_size_limit = 5, ptype = "Grass"}}},
  },
  true
)

-- Glaceon 471 (--- Worse stats [Odds])
SMODS.Joker:take_ownership('poke_glaceon',
  {
    config = {extra = {odds = 5, ptype = "Water"}},
  },
  true
)

-- PorygonZ 474 (--- Worse stats [XMult][Energy])
SMODS.Joker:take_ownership('poke_porygonz',
  {
    config = {extra = {Xmult_mod = 0.03, ptype = "Colorless"}},
    add_to_deck = function(self, card, from_debuff)
      if not G.GAME.energy_plus then
        G.GAME.energy_plus = 2
      else
        G.GAME.energy_plus = G.GAME.energy_plus + 2
      end
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not G.GAME.energy_plus then
        G.GAME.energy_plus = 0
      else
        G.GAME.energy_plus = G.GAME.energy_plus - 2
      end
    end
  },
  true
)

-- Probopass 476 (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_probopass',
  {
    config = {extra = {Xmult_multi = 1.3, ptype = "Earth"}},
  },
  true
)

-- Froslass 478
-- NN

end