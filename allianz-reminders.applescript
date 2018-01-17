-- add a reminder for shows in Allianz so I can avoid traffic around the area :)
on run argv
	if (count of argv) = 4 then
		set evento to item 1 of argv
		set y to item 2 of argv as string
		set m to item 3 of argv as string
		set d to item 4 of argv as string
		set dat_evento to date ("" & d & "/" & m & "/" & y & " 18:00" as string)
		set dat_reminder to date ("" & d & "/" & m & "/" & y & " 18:00" as string)
		set achei to 0 as integer
		
		tell application "Reminders"
			repeat with thisReminder in (get reminders of list "Allianz")
				tell thisReminder
					set nome to name of thisReminder as string
					if (nome = evento) then
						set achei to 1 as integer
						exit repeat
					end if
				end tell
			end repeat
			if (achei = 0) then
				set shows to list "Allianz"
				tell shows
					make new reminder at end with properties {name:evento, due date:dat_evento, remind me date:dat_reminder}
				end tell
			end if
		end tell
	else
		log "Use: script <event description> <day> <month> <year> "
	end if
end run
