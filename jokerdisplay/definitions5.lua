local jd_def = JokerDisplay.Definitions

jd_def["j_poke_lampent"] = {
  text = {
    { text = "+" },
    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
  },
  text_config = { colour = G.C.MULT },
  calc_function = function(card)
    card.joker_display_values.mult = card.sell_cost * 0.5
  end
}