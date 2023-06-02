local mod = get_mod("PewPew")

--[[
Mod: PewPew
Description: Change ranged weapon sounds and projectile visual effects
Author: tinybike (GlaresAtKoalas on Nexus)
]]

local PlayerLineEffects = require("scripts/settings/effects/player_line_effects")
local PlayerCharacterSoundEventAliases = require("scripts/settings/sound/player_character_sound_event_aliases")

local function load_resource(package_name, cb)
    if Application.can_get_resource("package", package_name) then
        Managers.package:load(package_name, "PewPew", cb)
    else
        cb()
    end
end

-- Projectile visual effects
local function update_line_effects()
    local line_effects_to_be_changed = mod:get("line_effects_to_be_changed")
    local new_line_effects = mod:get("new_line_effects")
    PlayerLineEffects[line_effects_to_be_changed].vfx_width = PlayerLineEffects[new_line_effects].vfx_width
    PlayerLineEffects[line_effects_to_be_changed].keep_aligned = PlayerLineEffects[new_line_effects].keep_aligned
    PlayerLineEffects[line_effects_to_be_changed].link = PlayerLineEffects[new_line_effects].link
    load_resource(PlayerLineEffects[new_line_effects].vfx, function()
        PlayerLineEffects[line_effects_to_be_changed].vfx = PlayerLineEffects[new_line_effects].vfx
    end)    
    load_resource(PlayerLineEffects[new_line_effects].sfx, function()
        PlayerLineEffects[line_effects_to_be_changed].sfx = PlayerLineEffects[new_line_effects].sfx
    end)
    load_resource(PlayerLineEffects[new_line_effects].vfx_crit, function()
        PlayerLineEffects[line_effects_to_be_changed].vfx_crit = PlayerLineEffects[new_line_effects].vfx_crit
    end)
    if type(PlayerLineEffects[new_line_effects].emitters) == "table" then
        load_resource(PlayerLineEffects[new_line_effects].emitters.vfx.default, function()
            load_resource(PlayerLineEffects[new_line_effects].emitters.vfx.start, function()
                PlayerLineEffects[line_effects_to_be_changed].emitters = table.clone(PlayerLineEffects[new_line_effects].emitters)
            end)
        end)
    else
        PlayerLineEffects[line_effects_to_be_changed].emitters = nil
    end
    if type(PlayerLineEffects[new_line_effects].emitters_crit) == "table" then
        load_resource(PlayerLineEffects[new_line_effects].emitters_crit.vfx.default, function()
            load_resource(PlayerLineEffects[new_line_effects].emitters_crit.vfx.start, function()
                PlayerLineEffects[line_effects_to_be_changed].emitters_crit = table.clone(PlayerLineEffects[new_line_effects].emitters_crit)
            end)
        end)
    else
        PlayerLineEffects[line_effects_to_be_changed].emitters_crit = nil
    end
end

-- Sound effects
local function update_sound_effects()
    local ranged_shooting_labels = {
        weapon_autopistol_auto = {
            braced = "weapon_autopistol_auto",
            pre_loop_shot = "weapon_autopistol",
        },
        autogun_p2_m2_auto = {
            braced = "autogun_p2_m2_auto",
            pre_loop_shot = "autogun_p2_m2_first",
        },
        forcestaff_warp_fire = {
            braced = "forcestaff_warp_fire",
            pre_loop_shot = nil,
        },
        flamethrower_fire_loop = {
            braced = nil,
            pre_loop_shot = nil,
        },
        lasgun_p3_m1_fire_auto = {
            braced = "lasgun_p3_m1_fire_auto",
            pre_loop_shot = "lasgun_p3_m1_fire_single",
        },
        lasgun_p3_m3_fire_auto = {
            braced = "lasgun_p3_m3_fire_auto",
            pre_loop_shot = "lasgun_p3_m3_fire_single",
        },
        autogun_p2_m1_auto = {
            braced = "autogun_p2_m1_auto",
            pre_loop_shot = "autogun_p2_m1_first",
        },
        autogun_p1_m1_auto = {
            braced = "autogun_p1_m1_auto",
            pre_loop_shot = "autogun_p1_m1_first",
        },
        heavy_stubber_p1_m2_auto = {
            braced = "heavy_stubber_p1_m2_auto",
            pre_loop_shot = "heavy_stubber_p1_m2_punch_first",
        },
        heavy_stubber_auto = {
            braced = "heavy_stubber_auto",
            pre_loop_shot = "heavy_stubber_punch_first",
        },
        lasgun_p3_m2_fire_auto = {
            braced = "lasgun_p3_m2_fire_auto",
            pre_loop_shot = "lasgun_p3_m2_fire_single",
        },
        autogun_p1_m2_auto = {
            braced = "autogun_p1_m2_auto",
            pre_loop_shot = "autogun_p1_m2_single",
        },
        autogun_p2_m3_auto = {
            braced = "autogun_p2_m3_auto",
            pre_loop_shot = "autogun_p2_m3_first",
        },
        autogun_p1_m3_auto = {
            braced = "autogun_p1_m3_auto",
            pre_loop_shot = "autogun_p1_m3_first",
        },
        heavy_stubber_p1_m3_auto = {
            braced = "heavy_stubber_p1_m3_auto",
            pre_loop_shot = "heavy_stubber_p1_m3_punch_first",
        },
        psyker_chain_lightning = {
            braced = "psyker_chain_lightning_heavy",
            pre_loop_shot = nil,
        },
    }
    local weapon_to_be_changed = mod:get("weapon_to_be_changed")
    local new_ranged_shooting_sfx = mod:get("new_ranged_shooting_sfx")
    local play_new_ranged_shooting_auto = "wwise/events/weapon/play_" .. new_ranged_shooting_sfx
    local stop_new_ranged_shooting_auto = "wwise/events/weapon/stop_" .. new_ranged_shooting_sfx
    local play_new_ranged_braced_shooting_auto = nil
    local stop_new_ranged_braced_shooting_auto = nil
    if ranged_shooting_labels[new_ranged_shooting_sfx].braced ~= nil then
        play_new_ranged_braced_shooting_auto = "wwise/events/weapon/play_" .. ranged_shooting_labels[new_ranged_shooting_sfx].braced
        stop_new_ranged_braced_shooting_auto = "wwise/events/weapon/stop_" .. ranged_shooting_labels[new_ranged_shooting_sfx].braced
    end
    local play_new_ranged_pre_loop_shot = nil
    if ranged_shooting_labels[new_ranged_shooting_sfx].pre_loop_shot ~= nil then
        play_new_ranged_pre_loop_shot = "wwise/events/weapon/play_" .. ranged_shooting_labels[new_ranged_shooting_sfx].pre_loop_shot
    end
    load_resource(play_new_ranged_shooting_auto, function()
        PlayerCharacterSoundEventAliases.play_ranged_shooting.events[weapon_to_be_changed] = play_new_ranged_shooting_auto
    end)
    load_resource(stop_new_ranged_shooting_auto, function()
        PlayerCharacterSoundEventAliases.stop_ranged_shooting.events[weapon_to_be_changed] = stop_new_ranged_shooting_auto
    end)
    load_resource(play_new_ranged_braced_shooting_auto, function()
        PlayerCharacterSoundEventAliases.play_ranged_braced_shooting.events[weapon_to_be_changed] = play_new_ranged_braced_shooting_auto
    end)
    load_resource(stop_new_ranged_braced_shooting_auto, function()
        PlayerCharacterSoundEventAliases.stop_ranged_braced_shooting.events[weapon_to_be_changed] = stop_new_ranged_braced_shooting_auto
    end)
    load_resource(play_new_ranged_pre_loop_shot, function()
        PlayerCharacterSoundEventAliases.ranged_pre_loop_shot.events[weapon_to_be_changed] = play_new_ranged_pre_loop_shot
    end)
end

update_line_effects()
update_sound_effects()

mod.on_setting_changed = function()
    update_line_effects()
    update_sound_effects()
end
