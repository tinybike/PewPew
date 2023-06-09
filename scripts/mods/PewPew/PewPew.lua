local mod = get_mod("PewPew")

--[[
Mod: PewPew
Description: Change ranged weapon sounds and projectile visual effects
Author: tinybike (GlaresAtKoalas on Nexus)
]]

local PlayerLineEffects = require("scripts/settings/effects/player_line_effects")
local PlayerCharacterSoundEventAliases = require("scripts/settings/sound/player_character_sound_event_aliases")

local original_player_line_effects = table.clone(PlayerLineEffects)

local RANGED_SHOOTING_SOUND_EFFECTS = {
    weapon_autopistol_auto = { loop="weapon_autopistol_auto", braced="weapon_autopistol_auto", pre_loop_shot="weapon_autopistol" },
    autogun_p2_m2_auto = { loop="autogun_p2_m2_auto", braced="autogun_p2_m2_auto", pre_loop_shot="autogun_p2_m2_first" },
    forcestaff_warp_fire = { loop="forcestaff_warp_fire", braced="forcestaff_warp_fire", pre_loop_shot="weapon_silence" },
    flamethrower_fire_loop = { loop="flamethrower_fire_loop", braced=nil, pre_loop_shot="weapon_silence" },
    lasgun_p3_m1_fire_auto = { loop="lasgun_p3_m1_fire_auto", braced="lasgun_p3_m1_fire_auto", pre_loop_shot="lasgun_p3_m1_fire_single" },
    lasgun_p3_m3_fire_auto = { loop="lasgun_p3_m3_fire_auto", braced="lasgun_p3_m3_fire_auto", pre_loop_shot="lasgun_p3_m3_fire_single" },
    autogun_p2_m1_auto = { loop="autogun_p2_m1_auto", braced="autogun_p2_m1_auto", pre_loop_shot="autogun_p2_m1_first" },
    autogun_p1_m1_auto = { loop="autogun_p1_m1_auto", braced="autogun_p1_m1_auto", pre_loop_shot="autogun_p1_m1_first" },
    heavy_stubber_p1_m2_auto = { loop="heavy_stubber_p1_m2_auto", braced="heavy_stubber_p1_m2_auto", pre_loop_shot="heavy_stubber_p1_m2_punch_first" },
    heavy_stubber_auto = { loop="heavy_stubber_auto", braced="heavy_stubber_auto", pre_loop_shot="heavy_stubber_punch_first" },
    lasgun_p3_m2_fire_auto = { loop="lasgun_p3_m2_fire_auto", braced="lasgun_p3_m2_fire_auto", pre_loop_shot="lasgun_p3_m2_fire_single" },
    autogun_p1_m2_auto = { loop="autogun_p1_m2_auto", braced="autogun_p1_m2_auto", pre_loop_shot="autogun_p1_m2_single" },
    autogun_p2_m3_auto = { loop="autogun_p2_m3_auto", braced="autogun_p2_m3_auto", pre_loop_shot="autogun_p2_m3_first" },
    autogun_p1_m3_auto = { loop="autogun_p1_m3_auto", braced="autogun_p1_m3_auto", pre_loop_shot="autogun_p1_m3_first" },
    heavy_stubber_p1_m3_auto = { loop="heavy_stubber_p1_m3_auto", braced="heavy_stubber_p1_m3_auto", pre_loop_shot="heavy_stubber_p1_m3_punch_first" },
    psyker_chain_lightning = { loop="psyker_chain_lightning", braced="psyker_chain_lightning_heavy", pre_loop_shot="weapon_silence" },
    psyker_chain_lightning_charge = { loop="psyker_chain_lightning_charge", braced="psyker_chain_lightning_charge", pre_loop_shot="weapon_silence" },
    plasmagun_charge = { loop="plasmagun_charge", braced="plasmagun_charge", pre_loop_shot="weapon_silence" },
    psyker_headpop_hands = { loop="psyker_headpop_hands", braced="psyker_headpop_hands", pre_loop_shot="weapon_silence" },
    lasgun_p2_m2_charge = { loop="lasgun_p2_m2_charge", braced="lasgun_p2_m2_charge", pre_loop_shot="weapon_silence" },
    forcestaff_warp_fire_charge_loop = { loop="forcestaff_warp_fire_charge_loop", braced="forcestaff_warp_fire_charge_loop", pre_loop_shot="weapon_silence" },
    lasgun_p2_charge = { loop="lasgun_p2_charge", braced="lasgun_p2_charge", pre_loop_shot="weapon_silence" },
    forcestaff_p4_charge_loop = { loop="forcestaff_p4_charge_loop", braced="forcestaff_p4_charge_loop", pre_loop_shot="weapon_silence" },
    lasgun_p2_m3_charge = { loop="lasgun_p2_m3_charge", braced="lasgun_p2_m3_charge", pre_loop_shot="weapon_silence" },
    weapon_plasmagun_charge_fast = { loop="weapon_plasmagun_charge_fast", braced="weapon_plasmagun_charge_fast", pre_loop_shot="weapon_silence" },
    psyker_smite_charge = { loop="psyker_smite_charge", braced="psyker_smite_charge", pre_loop_shot="weapon_silence" },
    weapon_plasma_mech_vent = { loop="weapon_plasma_mech_vent", braced="weapon_plasma_mech_vent", pre_loop_shot="weapon_silence" },
    thunder_hammer_powered_loop = { loop="thunder_hammer_powered_loop", braced="thunder_hammer_powered_loop", pre_loop_shot="weapon_silence" },
    force_sword_loop = { loop="force_sword_loop", braced="force_sword_loop", pre_loop_shot="weapon_silence" },
    power_sword_loop = { loop="power_sword_loop", braced="power_sword_loop", pre_loop_shot="weapon_silence" },
    ogryn_power_maul_1h_loop = { loop="ogryn_power_maul_1h_loop", braced="ogryn_power_maul_1h_loop", pre_loop_shot="weapon_silence" },
}

local function load_resource(package_name, cb)
    if Application.can_get_resource("package", package_name) then
        Managers.package:load(package_name, "PewPew", cb)
    else
        cb()
    end
end

-- Projectile visual effects
local function update_line_effects(line_effects_to_be_changed)
    local new_line_effects = mod:get(line_effects_to_be_changed)
    PlayerLineEffects[line_effects_to_be_changed].vfx_width = original_player_line_effects[new_line_effects].vfx_width
    PlayerLineEffects[line_effects_to_be_changed].keep_aligned = original_player_line_effects[new_line_effects].keep_aligned
    PlayerLineEffects[line_effects_to_be_changed].link = original_player_line_effects[new_line_effects].link
    load_resource(original_player_line_effects[new_line_effects].vfx, function ()
        PlayerLineEffects[line_effects_to_be_changed].vfx = original_player_line_effects[new_line_effects].vfx
    end)
    load_resource(original_player_line_effects[new_line_effects].sfx, function ()
        PlayerLineEffects[line_effects_to_be_changed].sfx = original_player_line_effects[new_line_effects].sfx
    end)
    load_resource(original_player_line_effects[new_line_effects].vfx_crit, function ()
        PlayerLineEffects[line_effects_to_be_changed].vfx_crit = original_player_line_effects[new_line_effects].vfx_crit
    end)
    if type(original_player_line_effects[new_line_effects].emitters) == "table" then
        load_resource(original_player_line_effects[new_line_effects].emitters.vfx.default, function ()
            load_resource(original_player_line_effects[new_line_effects].emitters.vfx.start, function ()
                PlayerLineEffects[line_effects_to_be_changed].emitters = table.clone(original_player_line_effects[new_line_effects].emitters)
            end)
        end)
    else
        PlayerLineEffects[line_effects_to_be_changed].emitters = nil
    end
    if type(original_player_line_effects[new_line_effects].emitters_crit) == "table" then
        load_resource(original_player_line_effects[new_line_effects].emitters_crit.vfx.default, function ()
            load_resource(original_player_line_effects[new_line_effects].emitters_crit.vfx.start, function ()
                PlayerLineEffects[line_effects_to_be_changed].emitters_crit = table.clone(original_player_line_effects[new_line_effects].emitters_crit)
            end)
        end)
    else
        PlayerLineEffects[line_effects_to_be_changed].emitters_crit = nil
    end
end

-- Sound effects
local function update_sound_effects(weapon_to_be_changed)
    local new_ranged_shooting_sfx = mod:get(weapon_to_be_changed)

    -- Update single-shot sounds
    local play_ranged_single_shot = "wwise/events/weapon/play_" .. new_ranged_shooting_sfx
    load_resource(play_ranged_single_shot, function ()
        PlayerCharacterSoundEventAliases.ranged_single_shot.events[weapon_to_be_changed] = play_ranged_single_shot
    end)

    -- Update looping sounds
    if RANGED_SHOOTING_SOUND_EFFECTS[new_ranged_shooting_sfx] ~= nil then
        local play_new_ranged_shooting_auto = "wwise/events/weapon/play_" .. new_ranged_shooting_sfx
        local stop_new_ranged_shooting_auto = "wwise/events/weapon/stop_" .. new_ranged_shooting_sfx
        local play_new_ranged_braced_shooting_auto = nil
        local stop_new_ranged_braced_shooting_auto = nil
        if RANGED_SHOOTING_SOUND_EFFECTS[new_ranged_shooting_sfx].braced ~= nil then
            play_new_ranged_braced_shooting_auto = "wwise/events/weapon/play_" .. RANGED_SHOOTING_SOUND_EFFECTS[new_ranged_shooting_sfx].braced
            stop_new_ranged_braced_shooting_auto = "wwise/events/weapon/stop_" .. RANGED_SHOOTING_SOUND_EFFECTS[new_ranged_shooting_sfx].braced
        end
        play_new_ranged_pre_loop_shot = "wwise/events/weapon/play_" .. RANGED_SHOOTING_SOUND_EFFECTS[new_ranged_shooting_sfx].pre_loop_shot
        load_resource(play_new_ranged_shooting_auto, function ()
            PlayerCharacterSoundEventAliases.play_ranged_shooting.events[weapon_to_be_changed] = play_new_ranged_shooting_auto
        end)
        load_resource(stop_new_ranged_shooting_auto, function ()
            PlayerCharacterSoundEventAliases.stop_ranged_shooting.events[weapon_to_be_changed] = stop_new_ranged_shooting_auto
        end)
        load_resource(play_new_ranged_braced_shooting_auto, function ()
            PlayerCharacterSoundEventAliases.play_ranged_braced_shooting.events[weapon_to_be_changed] = play_new_ranged_braced_shooting_auto
        end)
        load_resource(stop_new_ranged_braced_shooting_auto, function ()
            PlayerCharacterSoundEventAliases.stop_ranged_braced_shooting.events[weapon_to_be_changed] = stop_new_ranged_braced_shooting_auto
        end)
        load_resource(play_new_ranged_pre_loop_shot, function ()
            PlayerCharacterSoundEventAliases.ranged_pre_loop_shot.events[weapon_to_be_changed] = play_new_ranged_pre_loop_shot
        end)
    end
end

-- function update_single_shot_sound_effects(weapon_to_be_changed)
--     local new_ranged_shooting_sfx = mod:get(weapon_to_be_changed)
--     local play_new_ranged_shooting_auto = "wwise/events/weapon/play_" .. new_ranged_shooting_sfx
--     load_resource(play_new_ranged_shooting_auto, function ()
--         PlayerCharacterSoundEventAliases.play_ranged_shooting.events[weapon_to_be_changed] = play_new_ranged_shooting_auto
--     end)
-- end

for _, line_effects_widget in ipairs(mod.line_effects_widgets) do
    update_line_effects(line_effects_widget.setting_id)
end
for _, sound_effects_widget in ipairs(mod.sound_effects_widgets) do
    update_sound_effects(sound_effects_widget.setting_id)
end
-- for _, single_shot_sound_effects_widget in ipairs(mod.single_shot_sound_effects_widgets) do
--     update_single_shot_sound_effects(single_shot_sound_effects_widget.setting_id)
-- end

mod.on_setting_changed = function (setting_id)
    if table.find_by_key(mod.line_effects_widgets, "setting_id", setting_id) ~= nil then
        update_line_effects(setting_id)
    elseif table.find_by_key(mod.sound_effects_widgets, "setting_id", setting_id) ~= nil then
        update_sound_effects(setting_id)
    -- elseif table.find_by_key(mod.single_shot_sound_effects_widgets, "setting_id", setting_id) ~= nil then
    --     update_single_shot_sound_effects(setting_id)
    end
end
