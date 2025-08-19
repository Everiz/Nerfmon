local jd_def = JokerDisplay.Definitions

jd_def["j_poke_wobbuffet"] = {
reminder_text = {
    { ref_table = "card.joker_display_values", ref_value = "localized_text" }
},
calc_function = function(card)
    card.joker_display_values.localized_text = "(7,8,9)"
end,
retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
    if held_in_hand then return 0 end
    return (playing_card:get_id() == 7 or playing_card:get_id() == 8 or playing_card:get_id() == 9) and
        joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
end
}