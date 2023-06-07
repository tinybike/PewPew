local mod = get_mod("PewPew")

local LINE_EFFECTS_OPTIONS = {
	{ text="lasbeam", value="lasbeam" },
	{ text="lasbeam_pistol", value="lasbeam_pistol" },
	{ text="lasbeam_pistol_ads", value="lasbeam_pistol_ads" },
	{ text="lasbeam_killshot", value="lasbeam_killshot" },
	{ text="lasbeam_elysian", value="lasbeam_elysian" },
	{ text="lasbeam_charged", value="lasbeam_charged" },
	{ text="lasbeam_bfg", value="lasbeam_bfg" },
	{ text="autogun_bullet", value="autogun_bullet" },
	{ text="heavy_stubber_bullet", value="heavy_stubber_bullet" },
	{ text="pellet_trail", value="pellet_trail" },
	{ text="shotgun_slug_trail", value="shotgun_slug_trail" },
	{ text="shotgun_incendiary_trail", value="shotgun_incendiary_trail" },
	{ text="ripper_trail", value="ripper_trail" },
	{ text="boltshell", value="boltshell" },
	{ text="plasma_beam", value="plasma_beam" },
}
local SOUND_EFFECTS_OPTIONS = {
	{ text="weapon_autopistol_auto", value="weapon_autopistol_auto" },
	{ text="autogun_p1_m1_auto", value="autogun_p1_m1_auto" },
	{ text="autogun_p1_m2_auto", value="autogun_p1_m2_auto" },
	{ text="autogun_p1_m3_auto", value="autogun_p1_m3_auto" },
	{ text="autogun_p2_m1_auto", value="autogun_p2_m1_auto" },
	{ text="autogun_p2_m2_auto", value="autogun_p2_m2_auto" },	
	{ text="autogun_p2_m3_auto", value="autogun_p2_m3_auto" },
	{ text="flamethrower_fire_loop", value="flamethrower_fire_loop" },
	{ text="forcestaff_warp_fire", value="forcestaff_warp_fire" },
	{ text="lasgun_p3_m1_fire_auto", value="lasgun_p3_m1_fire_auto" },
	{ text="lasgun_p3_m2_fire_auto", value="lasgun_p3_m2_fire_auto" },
	{ text="lasgun_p3_m3_fire_auto", value="lasgun_p3_m3_fire_auto" },
	{ text="heavy_stubber_auto", value="heavy_stubber_auto" },
	{ text="heavy_stubber_p1_m2_auto", value="heavy_stubber_p1_m2_auto" },
	{ text="heavy_stubber_p1_m3_auto", value="heavy_stubber_p1_m3_auto" },
	{ text="psyker_chain_lightning", value="psyker_chain_lightning" },
	--charging fx
	{ text="psyker_chain_lightning_charge", value="psyker_chain_lightning_charge" },
	{ text="plasmagun_charge", value="plasmagun_charge" },
	{ text="psyker_headpop_hands", value="psyker_headpop_hands" },
	{ text="forcestaff_warp_fire_charge_loop", value="forcestaff_warp_fire_charge_loop" },
	{ text="lasgun_p2_charge", value="lasgun_p2_charge" },
	{ text="lasgun_p2_m2_charge", value="lasgun_p2_m2_charge" },
	{ text="lasgun_p2_m3_charge", value="lasgun_p2_m3_charge" },
	{ text="forcestaff_p4_charge_loop", value="forcestaff_p4_charge_loop" },
	{ text="weapon_plasmagun_charge_fast", value="weapon_plasmagun_charge_fast" },
	--psyker smite
	{ text="psyker_smite_charge", value="psyker_smite_charge" },
	--plasma vent
	{ text="weapon_plasma_mech_vent", value="weapon_plasma_mech_vent" },
	--weapon special loop
	{ text="thunder_hammer_powered_loop", value="thunder_hammer_powered_loop" },
	{ text="force_sword_loop", value="force_sword_loop" },
	{ text="power_sword_loop", value="power_sword_loop" },
	{ text="ogryn_power_maul_1h_loop", value="ogryn_power_maul_1h_loop" },
}
mod.line_effects_widgets = {
	{ setting_id="lasbeam" },
	{ setting_id="lasbeam_pistol" },
	{ setting_id="lasbeam_pistol_ads" },
	{ setting_id="lasbeam_killshot" },
	{ setting_id="lasbeam_elysian" },
	{ setting_id="lasbeam_charged" },
	{ setting_id="lasbeam_bfg" },
	{ setting_id="autogun_bullet" },
	{ setting_id="heavy_stubber_bullet" },
	{ setting_id="pellet_trail" },
	{ setting_id="shotgun_slug_trail" },
	{ setting_id="shotgun_incendiary_trail" },
	{ setting_id="ripper_trail" },
	{ setting_id="boltshell" },
	{ setting_id="plasma_beam" },
}
for i, line_effects_widget in ipairs(mod.line_effects_widgets) do
	mod.line_effects_widgets[i].type = "dropdown"
	mod.line_effects_widgets[i].default_value = line_effects_widget.setting_id
	mod.line_effects_widgets[i].options = table.clone(LINE_EFFECTS_OPTIONS)
end
mod.sound_effects_widgets = {
	{ setting_id="autopistol_p1_m1", default_value="weapon_autopistol_auto" },
	{ setting_id="autopistol_p1_m2", default_value="weapon_autopistol_auto" },
	{ setting_id="autopistol_p1_m3", default_value="weapon_autopistol_auto" },
	{ setting_id="autogun_p1_m1", default_value="autogun_p1_m1_auto" },
	{ setting_id="autogun_p1_m2", default_value="autogun_p1_m2_auto" },
	{ setting_id="autogun_p1_m3", default_value="autogun_p1_m3_auto" },
	{ setting_id="autogun_p2_m1", default_value="autogun_p2_m1_auto" },
	{ setting_id="autogun_p2_m2", default_value="autogun_p2_m2_auto" },	
	{ setting_id="autogun_p2_m3", default_value="autogun_p2_m3_auto" },
	{ setting_id="flamer_p1_m1", default_value="flamethrower_fire_loop" },
	{ setting_id="forcestaff_p2_m1", default_value="forcestaff_warp_fire" },
	{ setting_id="forcestaff_p2_m2", default_value="forcestaff_warp_fire" },
	{ setting_id="forcestaff_p3_m1", default_value="psyker_chain_lightning" },
	{ setting_id="lasgun_p3_m1", default_value="lasgun_p3_m1_fire_auto" },
	{ setting_id="lasgun_p3_m2", default_value="lasgun_p3_m2_fire_auto" },
	{ setting_id="lasgun_p3_m3", default_value="lasgun_p3_m3_fire_auto" },
	{ setting_id="ogryn_heavystubber_p1_m1", default_value="heavy_stubber_auto" },
	{ setting_id="ogryn_heavystubber_p1_m2", default_value="heavy_stubber_p1_m2_auto" },
	{ setting_id="ogryn_heavystubber_p1_m3", default_value="heavy_stubber_p1_m3_auto" },
}
for i, sound_effects_widget in ipairs(mod.sound_effects_widgets) do
	mod.sound_effects_widgets[i].type = "dropdown"
	mod.sound_effects_widgets[i].options = table.clone(SOUND_EFFECTS_OPTIONS)
end

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	allow_rehooking = true,
	options = {
		widgets = {
			{ setting_id="line_effects_id", type="group", sub_widgets=mod.line_effects_widgets },
			{ setting_id="sound_effects_id", type="group", sub_widgets=mod.sound_effects_widgets },
		},
	},
}
