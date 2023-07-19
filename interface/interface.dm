/client/proc/link_url(url, name, skip_confirmation)
	if (!url)
		to_chat(src, SPAN_WARNING("The server configuration does not include \a [name] URL."))
		return
	if (!skip_confirmation)
		var/cancel = alert("You will open [url]. Are you sure?", "Visit [name]", "Yes", "No") != "Yes"
		if (cancel)
			return
	send_link(src, url)


/client/verb/link_wiki()
	set name = "link wiki"
	set hidden = TRUE
	link_url(config.wiki_url, "Wiki", TRUE)


/client/verb/link_source()
	set name = "link source"
	set hidden = TRUE
	link_url(config.source_url, "Source", TRUE)


/client/verb/link_issue()
	set name = "link issue"
	set hidden = TRUE
	link_url(config.issue_url, "Issue", TRUE)


/client/verb/link_forum()
	set name = "link forum"
	set hidden = TRUE
	link_url(config.forum_url, "Forum", TRUE)


/client/verb/link_rules()
	set name = "link rules"
	set hidden = TRUE
	link_url(config.rules_url, "Rules", TRUE)


/client/verb/link_lore()
	set name = "link lore"
	set hidden = TRUE
	link_url(config.lore_url, "Lore", TRUE)

/client/verb/link_discord()
	set name = "link discord"
	set hidden = TRUE
	link_url(config.discord_url, "Discord", TRUE)

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/admin = SPAN_COLOR("purple", {"Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin"})

	var/macro_list = SPAN_COLOR("purple", {"Hotkey mode off:
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+x or Middle Mouse = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tF1 = adminhelp
\tF2 = ooc
\tF3 = say
\tF4 = emote
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP or Middle Mouse = swap-hand
\tPGDN = activate held object
\tEND = throw
\tCtrl + Click = drag
\tShift + Click = examine
\tAlt + Click = show entities on turf
\tCtrl + Alt + Click = point"})

	to_chat(src, macro_list)
	if(holder)
		to_chat(src, admin)
