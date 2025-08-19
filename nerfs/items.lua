if nerfmon_config.energy_nerf then
  energy_values = {
    mult = .25, mult1 = .25, mult2 = .25, chips = .2, chips1 = .2, chips2 = .2, chips3 = .2, Xmult = .1, Xmult1 = .1, Xmult2 = .1, Xchips = .1, money = .2, money2 = .2, money_mod = .1, mult_mod = .1, mult_mod2 = .1, s_mult = .3, chip_mod = .1, 
    Xmult_mod = .1, Xmult_multi = .03, Xmult_multi2 = .03, Xchips_multi = .03
  }
end

if nerfmon_config.item_nerf then
    -- Moonstone
    -- NN

    -- Sunstone
    -- NN

    -- Waterstone (--- Worse stats [Chips])
    SMODS.Consumable:take_ownership('poke_waterstone',
    {
        config = {max_highlighted = 1, max_chips = 30},
    },
    true
    )

    -- Thunderstone
    -- NN

    -- Firestone
    -- NN

    -- Leafstone (~~~ No longer works with hazards)
    SMODS.Consumable:take_ownership('poke_leafstone',
    {
        use = function(self, card, area, copier)
        set_spoon_item(card)
        if G.hand.cards and #G.hand.cards > 0 then
            juice_flip_hand(card)
            for i = 1, #G.hand.cards do
            if not SMODS.has_enhancement(G.hand.cards[i], "m_poke_hazard") and pseudorandom('leafstone') < G.GAME.probabilities.normal/self.config.odds then
                G.hand.cards[i]:set_ability(G.P_CENTERS.m_lucky, nil, true)
            end
            end
            juice_flip_hand(card, true)
            poke_unhighlight_cards()
            evo_item_use_total(self, card, area, copier)
        else
            highlighted_evo_item(self, card, area, copier)
        end
        end,
    },
    true
    )

    -- Link Cable
    -- NN

    -- Leftovers (--- Worse stats [Money])
    SMODS.Consumable:take_ownership('poke_leftovers',
    {
        config = {extra = {joker_highlighted = 1, money_mod = 1, usable = true}},
    },
    true
    )

    -- Leek
    -- NN

    -- Thick Club (--- Worse stats [Chips])
    SMODS.Consumable:take_ownership('poke_thickclub',
    {
        config = {max_highlighted = 1, bonus = 8, extra = {usable = true}},
    },
    true
    )

    -- Metal Coat
    -- NN

    -- Dragon Scale
    -- NN

    -- King's Rock
    -- NN

    -- Upgrade
    -- NN

    -- Dubious Disc
    -- NN

    -- Ice Stone
    -- NN

    -- Shiny Stone
    -- NN

    -- Twisted Spoon
    -- NN

    -- Hard Stone
    -- NN


    -- MART 3 [M3]

    -- Prism Scale
    -- NN

    -- Dusk Stone (--- Worse stats [Money])
    SMODS.Consumable:take_ownership('poke_duskstone',
    {
        config = {extra = {money = 3, max = 20, rounds = 3, round_on_add = 1}},
    },
    true
    )

    -- Dawn Stone (--- Worse stats [Money])
    SMODS.Consumable:take_ownership('poke_dawnstone',
    {
        use = function(self, card, area, copier)
        set_spoon_item(card)
        if card.ability.extra.hand_played then
            local money = 0
            local hand_played = card.ability.extra.hand_played
            local money_limit = card.ability.extra.money_limit
            
            if hand_played then
            local mult = nil
            if (SMODS.Mods["Talisman"] or {}).can_load then
                mult = to_big(G.GAME.hands[hand_played].mult)
                money = mult
                if to_big(money) > to_big(money_limit) then
                ease_dollars(money_limit) 
                else
                ease_dollars(to_number(money))
                end
            elseif not (SMODS.Mods["Talisman"] or {}).can_load then
                mult = G.GAME.hands[hand_played].mult
                money = mult
                money = math.min(money, money_limit)
                ease_dollars(money)
            end
            end
            
            evo_item_use_total(self, card, area, copier)
        else
            highlighted_evo_item(self, card, area, copier)
        end
        end,
    },
    true
    )

    -- BERRY JUICE [BERRYJUICE]

    -- Berry Juice Energy
    -- NN

    -- Berry Juice Spectral (~~~ Changed to "or")
    SMODS.Consumable:take_ownership('poke_berry_juice_spectral',
    {
        use = function(self, card, area, copier)
        if pseudorandom('berry_juice_spectral') < .50 then
            local target = G.hand.highlighted[1]
            local args = {seal = SMODS.poll_seal({guaranteed = true})}
            poke_convert_cards_to(target, args, nil, true)
        else
            local target = G.hand.highlighted[1]
            local args = {edition = poll_edition('aura', nil, true, true)}
            poke_convert_cards_to(target, args, nil, true)
        end
        end
    },
    true
    )

    -- Berry Juice Planet
    -- NN

    -- Berry Juice Item (~~~ Removed chance to get two)
    SMODS.Consumable:take_ownership('poke_berry_juice_item',
    {
        use = function(self, card, area, copier)
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local _card = create_card("Item", G.consumeables, nil, nil, nil, nil, 'c_poke_twisted_spoon')
            _card:add_to_deck()
            G.consumeables:emplace(_card)
        end
        end
    },
    true
    )

    -- Berry Juice Tarot (~~~ Removed money)
    SMODS.Consumable:take_ownership('poke_berry_juice_tarot',
    {
        use = function(self, card, area, copier)
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local _card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, 'c_fool')
            _card:add_to_deck()
            G.consumeables:emplace(_card)
        end
        end
    },
    true
    )
end