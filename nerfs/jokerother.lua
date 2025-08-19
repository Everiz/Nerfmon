if nerfmon_config.pokes_nerf then

-- Pokedex (--- Worse stats [Mult])
SMODS.Joker:take_ownership('poke_pokedex',
  {
    config = {extra = {mult = 0, mult_mod = 1}},
  },
  true
)

-- Everstone (--- Worse stats [XMult])
SMODS.Joker:take_ownership('poke_everstone',
  {
    config = {extra = {Xmult_multi = 1.6}},
  },
  true
)

-- Tall Grass (--- Worse stats [Odds])
SMODS.Joker:take_ownership('poke_tall_grass',
  {
    config = {extra = {odds = 3}},
  },
  true
)

-- Jelly Donut
-- NN

-- Treasure Eatery
-- NN

-- Mystery Egg
-- NN

-- Rival (--- Worse stats [Mult][XMult])
SMODS.Joker:take_ownership('poke_rival',
  {
    config = {extra = {mult = 5, Xmult = 2.5, form = 0}},
  },
  true
)

-- Ruins of Alph (!!! Updated rewards, worse stats [Mult])
SMODS.Joker:take_ownership('poke_ruins_of_alph',
  {
    config = {extra = {mult = 0, mult_mod = 1, merged = 0, forms = {}, quest1 = 5, quest2 = 10, quest3 = 20, quest4 = 28}},
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
            if card.ability.extra.mult > 0 then
            return {
                message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult
            }
            end
        end
        if context.after then
            local unowns = SMODS.find_card("j_poke_unown")
            local added = nil
            for k, v in pairs(unowns) do
            if v.ability.extra.triggered and not v.ability.extra.merged then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                card.ability.extra.merged = card.ability.extra.merged + 1
                v.ability.extra.merged = true
                table.insert(card.ability.extra.forms, v.ability.extra.form)
                added = true
            end
            end
            if added then table.sort(card.ability.extra.forms) end
        end
        end
        if context.setting_blind and not context.blueprint then
        for i = 1, 3 do
            G.E_MANAGER:add_event(Event({func = function()
            local temp_card = {set = "Joker", area = G.jokers, key = "j_poke_unown"}
            local new_card = SMODS.create_card(temp_card)
            local edition = {negative = true}
            new_card:set_edition(edition, true)
            new_card.cost = 0
            new_card.sell_cost = 0
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
            new_card:start_materialize()
            return true end }))
        end
        end
        if context.selling_self and not context.blueprint then
        local temp_card = nil
        local reward_card = nil
        if card.ability.extra.merged >= 28 then
            temp_card = {set = "Joker", area = G.jokers, key = "j_poke_unown_swarm"}
            reward_card = SMODS.create_card(temp_card)
            local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
        elseif card.ability.extra.merged >= 20 then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
            local chosen_joker = pseudorandom_element(jokers, 'alph')
            reward_card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
            else
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_no_other_jokers')})
            end
        elseif card.ability.extra.merged >= 10 then
            reward_card = create_random_poke_joker("alph", nil, "poke_safari", G.jokers)
        elseif card.ability.extra.merged >= 5 then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_double'))
                    return true
                end)
              }))
        end
        if reward_card then
            reward_card:add_to_deck()
            G.jokers:emplace(reward_card)
            reward_card:start_materialize()
        end
        end
    end,
  },
  true
)

-- Unown Swarm (~~~ Removed XMult)
SMODS.Joker:take_ownership('poke_unown_swarm',
  {
    config = {extra = {mult = 28, Xmult_multi = 1}},
    calculate = function(self, card, context)
        if context.other_joker and (context.other_joker.config.center.rarity == 4 or context.other_joker.config.center.rarity == "Legendary")then
        G.E_MANAGER:add_event(Event({
            func = function()
                context.other_joker:juice_up(0.5, 0.5)
                return true
            end
        })) 
        return {
            message = localize('poke_hidden_power_ex'), 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
        }
        end
    end,
  },
  true
)

end