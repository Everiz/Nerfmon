local jd_def = JokerDisplay.Definitions

-- Fixed
jd_def["j_poke_venusaur"] = {
    text = {
        { text = "Max: ", colour = G.C.GREY, },
        { text = "+$",                              colour = G.C.GOLD , },
        {ref_table = "card.joker_display_values",    ref_value = "upper", colour = G.C.GOLD,   }
    },
    extra = {
        {        
                { text = "Min: ", colour = G.C.GREY, },
                { text = "+$",                              colour = G.C.GOLD },
                {ref_table = "card.joker_display_values",    ref_value = "lower", colour = G.C.GOLD,   }
        }
            },
    reminder_text = {
            { text = "(", colour = G.C.GREY },
            { ref_table = "card.joker_display_values", ref_value = "bulbcard", colour = G.C.ORANGE },
            { text = ")", colour = G.C.GREY },
 
    },
    reminder_text_config = { colour = G.C.ORANGE, scale = 0.3 },
    calc_function = function(card)
        local bulbcard = G.GAME.current_round.bulb1card.id
        local playing_hand = next(G.play.cards)
        local count = 0
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() and playing_card:get_id() == bulbcard then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end
        card.joker_display_values.lower = count * card.ability.extra.money_mod
        card.joker_display_values.upper = count * (card.ability.extra.money_mod +1)
        card.joker_display_values.bulbcard = localize(G.GAME.current_round.bulb1card.rank, 'ranks')

    end
}

-- Fixed
jd_def["j_poke_rattata"] = {
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        local first_card = scoring_hand and JokerDisplay.calculate_leftmost_card(scoring_hand)
        return first_card and playing_card == first_card and
        joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end
}

-- Fixed
jd_def["j_poke_raticate"] = {
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        local first_card = scoring_hand and JokerDisplay.calculate_leftmost_card(scoring_hand)
        local second_card = scoring_hand and JokerDisplay.sort_cards(scoring_hand)[2]
        return first_card and playing_card == first_card and
        joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0 and 
        second_card and playing_card == second_card and
        joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end

}

-- Fixed
jd_def["j_poke_clefable"] = {
    text = {
        { text = "+",                              colour = G.C.MULT },
        {ref_table = "card.joker_display_values", ref_value = "mult", colour = G.C.MULT},
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Clubs"], 0.35) },
        { text = ")" }
    },

    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local count = 0
        if G.play then
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Clubs") then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.mult = card.ability.extra.mult * count
        card.joker_display_values.localized_text = localize("Clubs", 'suits_plural')
    end
}

-- Fixed
jd_def["j_poke_machop"] = {
}
