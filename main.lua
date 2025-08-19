nerfmon_config = SMODS.current_mod.config
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

SMODS.current_mod.config_tab = function() 
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
        },
        nodes = {
            create_toggle({
                label = "Allow Custom Jokers?",
                ref_table = nerfmon_config,
                ref_value = "customJokers",
            }),
        },
    }
end

--Load Joker Display if the mod is enabled
if (SMODS.Mods["JokerDisplay"] or {}).can_load then
  local jokerdisplays = NFS.getDirectoryItems(mod_dir.."jokerdisplay")

  for _, file in ipairs(jokerdisplays) do
    sendDebugMessage ("The file is: "..file)
    local helper, load_error = SMODS.load_file("jokerdisplay/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      helper()
    end
  end
end



-- Get mod path and load other files
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

print("DEBUG")

nerfmonconfig = function()
  local config_nodes =   
  {
    {
      n = G.UIT.R,
      config = {
        padding = 0.25,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = localize("poke_settings_header_required"),
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    create_toggle({
      label = localize("nerfmon_settings_energy_nerf"),
      ref_table = nerfmon_config,
      ref_value = "nerfmon_energy_nerf",
      callback = function(_set_toggle)
        NFS.write(mod_dir.."/config.lua", STR_PACK(nerfmon_config))
      end,
    }),
    create_toggle({
      label = localize("nerfmon_settings_item_nerf"),
      ref_table = nerfmon_config,
      ref_value = "nerfmon_item_nerf",
      callback = function(_set_toggle)
        NFS.write(mod_dir.."/config.lua", STR_PACK(nerfmon_config))
      end,
    }),
    create_toggle({
      label = localize("nerfmon_settings_pokes_nerf"),
      ref_table = nerfmon_config,
      ref_value = "nerfmon_pokes_nerf",
      callback = function(_set_toggle)
        NFS.write(mod_dir.."/config.lua", STR_PACK(nerfmon_config))
      end,
    }),
  }
  return config_nodes
end

SMODS.current_mod.config_tab = function()
    return {
      n = G.UIT.ROOT,
      config = {
        align = "cm",
        padding = 0.05,
        colour = G.C.CLEAR,
      },
      nodes = nerfmonconfig()
    }
end

--Load Nerfs
local nerf_files = NFS.getDirectoryItems(mod_dir.."nerfs")

for _, file in ipairs(nerf_files) do
  sendDebugMessage ("The file is: "..file)
  local helper, load_error = SMODS.load_file("nerfs/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    helper()
  end
end

-- FUNCTIONS

generate_pickup_item_key = function(seed)
  local item_key = 'c_poke_transformation'
  local item_chance = pseudorandom(seed)
  if item_chance < .50 then item_key = nil
  elseif item_chance < .74 then item_key = 'evo'
  elseif item_chance < .89 then item_key = 'c_poke_leftovers'
  elseif item_chance < .99 then item_key = 'c_poke_twisted_spoon'
  end
  
  if item_key == "evo" then
    local evo_item_keys = {}
    for k, v in pairs(G.jokers.cards) do
      if v.config.center.item_req then
        if type(v.config.center.item_req) == "table" then
          item_key = "c_poke_"..pseudorandom_element(v.config.center.item_req, pseudoseed(seed))
        else
          item_key = "c_poke_"..v.config.center.item_req
        end
        table.insert(evo_item_keys, item_key)
      end
    end
    if #evo_item_keys > 0 then
      item_key = pseudorandom_element(evo_item_keys, pseudoseed(seed))
    else
      item_key = nil
    end
  end
  
  return item_key
end