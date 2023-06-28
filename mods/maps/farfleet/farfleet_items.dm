
/* CARDS
 * ========
 */

/obj/item/card/id/farfleet/droptroops
	desc = "An identification card issued to ICCG crewmembers aboard the Farfleet Recon Craft."
	icon_state = "base"
	access = list(access_away_iccgn, access_away_iccgn_droptroops)

/obj/item/card/id/farfleet/droptroops/sergeant
	desc = "An identification card issued to ICCG crewmembers aboard the Farfleet Recon Craft."
	icon_state = "base"
	access = list(access_away_iccgn, access_away_iccgn_droptroops, access_away_iccgn_sergeant)

/obj/item/card/id/farfleet/fleet
	desc = "An identification card issued to ICCG crewmembers aboard the Farfleet Recon Craft."
	icon_state = "base"
	access = list(access_away_iccgn)

/obj/item/card/id/farfleet/fleet/captain
	desc = "An identification card issued to ICCG crewmembers aboard the Farfleet Recon Craft."
	icon_state = "base"
	access = list(access_away_iccgn, access_away_iccgn_captain)

/* CLOTHING
 * ========
 */


/obj/item/clothing/under/iccgn/service_command
	accessories = list(
		/obj/item/clothing/accessory/iccgn_patch/pioneer
	)

/obj/item/clothing/under/iccgn/utility
	accessories = list(
		/obj/item/clothing/accessory/iccgn_patch/pioneer
	)

/obj/item/clothing/under/iccgn/pt
	accessories = list(
		/obj/item/clothing/accessory/iccgn_patch/pioneer
	)

/obj/item/storage/belt/holster/security/tactical/farfleet/New()
	..()
	new /obj/item/gun/projectile/pistol/optimus(src)
	new /obj/item/ammo_magazine/pistol/double(src)
	new /obj/item/ammo_magazine/pistol/double(src)

/obj/item/storage/belt/holster/security/farfleet/iccgn_pawn/New()
	..()
	new /obj/item/gun/projectile/pistol/bobcat(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)


/* WEAPONARY - BALLISTICS
 * ========
 */

/obj/item/gun/projectile/automatic/assault_rifle/heltek
	name = "LA-700"
	desc = "HelTek LA-700 is a standart equipment of ICCG Space-assault Forces. Looks very similiar to STS-35."
	icon = 'mods/maps/farfleet/icons/iccg_rifle.dmi'
	icon_state = "iccg_rifle"

/obj/item/gun/projectile/automatic/assault_rifle/heltek/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "iccg_rifle"
		wielded_item_state = "arifle-wielded"
	else
		icon_state = "iccg_rifle-empty"
		wielded_item_state = "arifle-wielded-empty"

/obj/item/gun/projectile/automatic/mr735
	name = "MR-735"
	desc = "A cheap rifle for close quarters combat, with an auto-firing mode available. HelTek MR-735 is a standard rifle for ICCG Space-assault Forces, designed without a stock for easier storage and combat in closed spaces. Perfect weapon for some ship's crew."
	icon = 'mods/maps/farfleet/icons/mr735.dmi'
	icon_state = "nostockrifle"
	item_state = "nostockrifle"
	item_icons = list(
		slot_r_hand_str = 'mods/maps/farfleet/icons/righthand.dmi',
		slot_l_hand_str = 'mods/maps/farfleet/icons/lefthand.dmi',
		)
	wielded_item_state = "nostockrifle_wielded"
	force = 10
	caliber = CALIBER_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ESOTERIC = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/rifle
	allowed_magazines = /obj/item/ammo_magazine/rifle
	bulk = GUN_BULK_RIFLE
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semi auto",      burst=1,    fire_delay=null, one_hand_penalty=8,  burst_accuracy=null,                dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=null, one_hand_penalty=9,  burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="full auto",      burst=1,    fire_delay=1.7,    burst_delay=1.3,     one_hand_penalty=7,  burst_accuracy=list(0,-1,-1), dispersion=list(1.3, 1.5, 1.7, 1.9, 2.2), autofire_enabled=1)
		)

/obj/item/gun/projectile/automatic/mr735/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "nostockrifle"
		wielded_item_state = "nostockrifle-wielded"
	else
		icon_state = "nostockrifle-empty"
		wielded_item_state = "nostockrifle-wielded-empty"


/obj/item/gun/projectile/automatic/mbr
	name = "MBR"
	desc = "A shabby bullpup carbine. Despite its size, it looks a little uncomfortable, but it is robust. HelTek MBR is a standart equipment of ICCG Space-assault Forces, designed in a bullpup layout. Possesses autofire and is perfect for the ship's crew."
	icon = 'mods/maps/farfleet/icons/mbr_bullpup.dmi'
	icon_state = "mbr_bullpup"
	item_state = "mbr_bullpup"
	item_icons = list(
		slot_r_hand_str = 'mods/maps/farfleet/icons/righthand.dmi',
		slot_l_hand_str = 'mods/maps/farfleet/icons/lefthand.dmi',
		)
	wielded_item_state = "mbr_bullpup-wielded"
	force = 10
	caliber = CALIBER_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ESOTERIC = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/rifle
	allowed_magazines = /obj/item/ammo_magazine/rifle
	bulk = GUN_BULK_RIFLE + 1
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'

	firemodes = list(
		list(mode_name="semi auto",      burst=1,    fire_delay=null, one_hand_penalty=8,  burst_accuracy=null,                dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=null, one_hand_penalty=9,  burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="full auto",      burst=1,    fire_delay=1.7,    burst_delay=1.3,     one_hand_penalty=7,  burst_accuracy=list(0,-1,-1), dispersion=list(1.3, 1.5, 1.7, 1.9, 2.2), autofire_enabled=1)
		)

/obj/item/gun/projectile/automatic/mbr/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mbr_bullpup"
	else
		icon_state = "mbr_bullpup-empty"


/* WEAPONARY - ENERGY
 * ========
 */

/obj/item/gun/energy/laser/bonfire
	name = "Bonfire Carbine"
	desc = "Strange construction: laser carbine with underslung grenade launcher and very capable internal battery. HelTek Bonfire-75 is a weapon designed for suppressive fire in close quarters, where usage of ballistic weaponry will be uneffective or simply hazardous."
	icon = 'mods/maps/farfleet/icons/bonfire.dmi'
	icon_state = "bonfire"
	item_state = "bonfire"
	item_icons = list(
		slot_r_hand_str = 'mods/maps/farfleet/icons/righthand.dmi',
		slot_l_hand_str = 'mods/maps/farfleet/icons/lefthand.dmi',
		)
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 2
	fire_delay = 6
	burst_delay = 2
	max_shots = 30
	bulk = GUN_BULK_RIFLE
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 4)
	matter = list(MATERIAL_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/smalllaser
	wielded_item_state = "bonfire-wielded"

	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-ray bursts", burst=3, fire_delay=null, one_hand_penalty=1, burst_accuracy=list(0,0,-1,-1),       dispersion=list(0.0, 0.0, 0.5, 0.6)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null,  use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/gun/launcher/grenade/underslung/launcher

/obj/item/gun/energy/laser/bonfire/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/energy/laser/bonfire/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/gun/energy/laser/bonfire/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/gun/energy/laser/bonfire/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/energy/ionrifle/small/stupor
	name = "Stupor ion pistol"
	desc = "The HelTek Stupor-45 is a compact anti-drone weapon. Due to their small output of EMP, you need be marksman to disable human-sized synthetic. But it's still better, than nothing."
	icon = 'mods/maps/farfleet/icons/stupor.dmi'
	icon_state = "stupor"
	item_state = "stupor"
	item_icons = list(
		slot_r_hand_str = 'mods/maps/farfleet/icons/righthand.dmi',
		slot_l_hand_str = 'mods/maps/farfleet/icons/lefthand.dmi',
		)
	fire_delay = 40
	one_hand_penalty = 0
	charge_cost = 40
	max_shots = 5

// CSS Anti-psionics stuff

/obj/item/ammo_casing/pistol/nullglass
	desc = "A 10mm bullet casing with a nullglass coating."
	projectile_type = /obj/item/projectile/bullet/nullglass

/obj/item/ammo_casing/pistol/nullglass/disrupts_psionics()
	return src

/obj/item/ammo_magazine/pistol/nullglass
	ammo_type = /obj/item/ammo_casing/pistol/nullglass

/* VOIDSUITS AND RIGS
 * ======== TODO: Make any suits instead of plaseholder
 */



/* MISC
 * ========
 */

/obj/item/paper/farfleet/turrets
	name = "About Turrets"
	info = {"<h1>По поводу турелей.</h1>
			<p>Вася, я не знаю, как ты настраивал эти чёртовы турели, но у них слетает проверка доступа каждый раз как весь экипаж уходит в криосон. Да, я знаю, что они не должны сбоить из-за того, что все спят, но вот они так делают. Наше счастье, что они просто начинают оглушающим лучом бить,а не летальным режимом.</p>
			<h1>ПЕРЕЗАГРУЗИ КОНТРОЛЛЕР ТУРЕЛЕЙ, КАК ПОЙДЁШЬ В АНГАР.</h1>
		"}

/obj/item/paper/farfleet/engines
	name = "Engines Usage"
	info = {"
		<div style="text-align: center;">
			<p>Я не буду сейчас долго расписывать как работает атмосфера на Гарибальди, которую гайцы ТОЧНО не утащили у клятых марсиан, но принцип работы примерно следующий:</p>
			<p>Основные маршевые двигатели - ионные. Да, не слишком быстро, но надёжно если после затухания реакции в токамаке сможете нормально его настроить. А газовые двигатели - УСКОРИТЕЛИ. Но летать на них постоянно не советую, углекислота не бесконечная.</p>
		</div>
		<p><i>Ченков В.П.</i></p>
	"}
