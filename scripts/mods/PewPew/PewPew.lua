local mod = get_mod("PewPew")

--[[
Title: PewPew
Author: tinybike (GlaresAtKoalas on Nexus)
Date: 5/29/2023
Version: 0.1
]]

-- Projectile visual effects
mod:hook_require("scripts/settings/effects/player_line_effects", function(line_effects)
    mod:echo("visuals")
    local line_effects_to_be_changed = mod:get("line_effects_to_be_changed")
    local new_line_effects = mod:get("new_line_effects")
    line_effects[line_effects_to_be_changed].vfx = line_effects[new_line_effects].vfx
    line_effects[line_effects_to_be_changed].sfx = line_effects[new_line_effects].sfx
    line_effects[line_effects_to_be_changed].vfx_width = line_effects[new_line_effects].vfx_width
    line_effects[line_effects_to_be_changed].keep_aligned = line_effects[new_line_effects].keep_aligned
    line_effects[line_effects_to_be_changed].vfx_crit = line_effects[new_line_effects].vfx_crit
    line_effects[line_effects_to_be_changed].link = line_effects[new_line_effects].link
    if type(line_effects[new_line_effects].emitters) == "table" then
        line_effects[line_effects_to_be_changed].emitters = table.clone(line_effects[new_line_effects].emitters)
    else
        line_effects[line_effects_to_be_changed].emitters = nil
    end
    if type(line_effects[new_line_effects].emitters_crit) == "table" then
        line_effects[line_effects_to_be_changed].emitters_crit = table.clone(line_effects[new_line_effects].emitters_crit)
    else
        line_effects[line_effects_to_be_changed].emitters_crit = nil
    end
    mod:echo(line_effects[line_effects_to_be_changed].vfx)
    mod:echo(line_effects[line_effects_to_be_changed].sfx)
end)

-- Sound effects
mod:hook_require("scripts/settings/sound/player_character_sound_event_aliases", function(events)
    mod:echo("sounds")
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
    mod:echo(play_new_ranged_shooting_auto)
    mod:echo(stop_new_ranged_shooting_auto)
    mod:echo(play_new_ranged_braced_shooting_auto)
    mod:echo(stop_new_ranged_braced_shooting_auto)
    mod:echo(play_new_ranged_pre_loop_shot)
    events.play_ranged_shooting.events[weapon_to_be_changed] = play_new_ranged_shooting_auto
    events.stop_ranged_shooting.events[weapon_to_be_changed] = stop_new_ranged_shooting_auto
    events.play_ranged_braced_shooting.events[weapon_to_be_changed] = play_new_ranged_braced_shooting_auto
    events.stop_ranged_braced_shooting.events[weapon_to_be_changed] = stop_new_ranged_braced_shooting_auto
    events.ranged_pre_loop_shot.events[weapon_to_be_changed] = play_new_ranged_pre_loop_shot
end)
