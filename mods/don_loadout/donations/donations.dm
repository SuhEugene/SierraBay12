// When i wrote this, it was called at SS_INIT_EARLY - right after SS_INIT_DBCODE
/singleton/modpack/don_loadout/initialize()
	if(!sqlenabled)
		log_debug("Donations system is disabled with SQL!")
		return

	if(establish_db_connection())
		log_debug("Donations system successfully connected to DB!")
		UpdateAllClients()
	else
		log_debug("Donations system failed to connect with DB!")

	return ..()

/singleton/modpack/don_loadout/proc/UpdateAllClients()
	set waitfor = 0
	for(var/client/C in GLOB.clients)
		update_donator(C)
	log_debug("Donators info were updated!")

/singleton/modpack/don_loadout/proc/update_donator(client/player)
	set waitfor = 0

	if(!establish_db_connection())
		return FALSE
	ASSERT(player)

	var/was_donator = player.donator_info.donator

	var/DBQuery/query = sql_query({"
		SELECT CAST(SUM(amount) as UNSIGNED INTEGER)
		FROM budget
		WHERE
			ckey = $ckey AND
			is_valid = TRUE AND
			date_start <= NOW() AND
			(NOW() < date_end OR date_end IS NULL)
		GROUP BY ckey
	"}, dbcon, list(ckey = player.ckey))

	if(query.NextRow())
		var/total = query.item[1]
		var/donator_level = DONATION_TIER_NONE
		if(total >= DONATION_TIER_ONE_SUM)
			donator_level = DONATION_TIER_ONE
		if(total >= DONATION_TIER_TWO_SUM)
			donator_level = DONATION_TIER_TWO
		if(total >= DONATION_TIER_THREE_SUM)
			donator_level = DONATION_TIER_THREE
		if(total >= DONATION_TIER_FOUR_SUM)
			donator_level = DONATION_TIER_FOUR
		player.donator_info.donation_type = donator_level

	if(!was_donator)
		player.donator_info.on_donation_tier_loaded(player)

	return TRUE

/singleton/modpack/don_loadout/proc/show_donations_info(mob/user)
	ASSERT(user)

	var html = {"
	<center>Реквизиты для разовых пожертвований можно найти в разделе <b>#донаты</b> нашего дискорда:</center>
	<br>
	<center><a href="?src=\ref[src];action=discord">Открыть Discord</a></center>
	<br>
	<center>За денежные пожертвования, в благодарность вы получаете доступ к некоторым специальным предметам лодаута</center>
	"}
	var/datum/browser/popup = new(user, "donation_links", "Донат", 400, 230)
	popup.set_content(html)
	popup.open()


/singleton/modpack/don_loadout/Topic(href, href_list)
	var/mob/user = usr

	switch(href_list["action"])
		if("discord")
			log_debug("\[Donations] discord link used by '[user]'")
			send_link(user, config.discord_url)
			return TOPIC_HANDLED

	return TOPIC_NOACTION
