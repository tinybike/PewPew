local mod = get_mod("PewPew")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "line_effects_to_be_changed",
				type = "dropdown",
				default_value = "autogun_bullet",
				options = {
					{ text = "lasbeam_id", value = "lasbeam" },
					{ text = "lasbeam_pistol_id", value = "lasbeam_pistol" },
					{ text = "lasbeam_pistol_ads_id", value = "lasbeam_pistol_ads" },
					{ text = "lasbeam_killshot_id", value = "lasbeam_killshot" },
					{ text = "lasbeam_elysian_id", value = "lasbeam_elysian" },
					{ text = "lasbeam_charged_id", value = "lasbeam_charged" },
					{ text = "lasbeam_bfg_id", value = "lasbeam_bfg" },
					{ text = "autogun_bullet_id", value = "autogun_bullet" },
					{ text = "heavy_stubber_bullet_id", value = "heavy_stubber_bullet" },
					{ text = "pellet_trail_id", value = "pellet_trail" },
					{ text = "shotgun_slug_trail_id", value = "shotgun_slug_trail" },
					{ text = "shotgun_incendiary_trail_id", value = "shotgun_incendiary_trail" },
					{ text = "ripper_trail_id", value = "ripper_trail" },
					{ text = "boltshell_id", value = "boltshell" },
					{ text = "plasma_beam_id", value = "plasma_beam" },
				},
			},
			{
				setting_id = "new_line_effects",
				type = "dropdown",
				default_value = "autogun_bullet",
				options = {
					{ text = "lasbeam_id", value = "lasbeam" },
					{ text = "lasbeam_pistol_id", value = "lasbeam_pistol" },
					{ text = "lasbeam_pistol_ads_id", value = "lasbeam_pistol_ads" },
					{ text = "lasbeam_killshot_id", value = "lasbeam_killshot" },
					{ text = "lasbeam_elysian_id", value = "lasbeam_elysian" },
					{ text = "lasbeam_charged_id", value = "lasbeam_charged" },
					{ text = "lasbeam_bfg_id", value = "lasbeam_bfg" },
					{ text = "autogun_bullet_id", value = "autogun_bullet" },
					{ text = "heavy_stubber_bullet_id", value = "heavy_stubber_bullet" },
					{ text = "pellet_trail_id", value = "pellet_trail" },
					{ text = "shotgun_slug_trail_id", value = "shotgun_slug_trail" },
					{ text = "shotgun_incendiary_trail_id", value = "shotgun_incendiary_trail" },
					{ text = "ripper_trail_id", value = "ripper_trail" },
					{ text = "boltshell_id", value = "boltshell" },
					{ text = "plasma_beam_id", value = "plasma_beam" },
				},
			},
			{
				setting_id = "weapon_to_be_changed",
				type = "dropdown",
				default_value = "autopistol_p1_m1",
				options = {
					{ text = "autopistol_p1_m2_id", value = "autopistol_p1_m2" },
					{ text = "autogun_p2_m2_id", value = "autogun_p2_m2" },
					{ text = "forcestaff_p2_m2_id", value = "forcestaff_p2_m2" },
					{ text = "flamer_p1_m1_id", value = "flamer_p1_m1" },
					{ text = "forcestaff_p2_m1_id", value = "forcestaff_p2_m1" },
					{ text = "lasgun_p3_m1_id", value = "lasgun_p3_m1" },
					{ text = "lasgun_p3_m3_id", value = "lasgun_p3_m3" },
					{ text = "autopistol_p1_m3_id", value = "autopistol_p1_m3" },
					{ text = "autogun_p2_m1_id", value = "autogun_p2_m1" },
					{ text = "autogun_p1_m1_id", value = "autogun_p1_m1" },
					{ text = "ogryn_heavystubber_p1_m2_id", value = "ogryn_heavystubber_p1_m2" },
					{ text = "ogryn_heavystubber_p1_m1_id", value = "ogryn_heavystubber_p1_m1" },
					{ text = "lasgun_p3_m2_id", value = "lasgun_p3_m2" },
					{ text = "autogun_p1_m2_id", value = "autogun_p1_m2" },
					{ text = "autopistol_p1_m1_id", value = "autopistol_p1_m1" },
					{ text = "autogun_p2_m3_id", value = "autogun_p2_m3" },
					{ text = "autogun_p1_m3_id", value = "autogun_p1_m3" },
					{ text = "ogryn_heavystubber_p1_m3_id", value = "ogryn_heavystubber_p1_m3" },
					{ text = "forcestaff_p3_m1_id", value = "forcestaff_p3_m1" },
				},  
			},
			{
				setting_id = "new_ranged_shooting_sfx",
				type = "dropdown",
				default_value = "weapon_autopistol_auto",
				options = {
					{ text = "autopistol_p1_m2_id", value = "weapon_autopistol_auto" },
					{ text = "autogun_p2_m2_id", value = "autogun_p2_m2_auto" },
					{ text = "forcestaff_p2_m2_id", value = "forcestaff_warp_fire" },
					{ text = "flamer_p1_m1_id", value = "flamethrower_fire_loop" },
					{ text = "lasgun_p3_m1_id", value = "lasgun_p3_m1_fire_auto" },
					{ text = "lasgun_p3_m3_id", value = "lasgun_p3_m3_fire_auto" },
					{ text = "autogun_p2_m1_id", value = "autogun_p2_m1_auto" },
					{ text = "autogun_p1_m1_id", value = "autogun_p1_m1_auto" },
					{ text = "ogryn_heavystubber_p1_m2_id", value = "heavy_stubber_p1_m2_auto" },
					{ text = "ogryn_heavystubber_p1_m1_id", value = "heavy_stubber_auto" },
					{ text = "lasgun_p3_m2_id", value = "lasgun_p3_m2_fire_auto" },
					{ text = "autogun_p1_m2_id", value = "autogun_p1_m2_auto" },
					{ text = "autogun_p2_m3_id", value = "autogun_p2_m3_auto" },
					{ text = "autogun_p1_m3_id", value = "autogun_p1_m3_auto" },
					{ text = "ogryn_heavystubber_p1_m3_id", value = "heavy_stubber_p1_m3_auto" },
					{ text = "forcestaff_p3_m1_id", value = "psyker_chain_lightning" },
				},
			},
		}
	}
}
