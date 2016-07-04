-- Delete emails in "@Fliers" older than 14 days
-- http://stackoverflow.com/a/22425494

set daysToPreserve to 14
set myAcount to "iCloud"
set dateReference to (current date) - (daysToPreserve * days)

tell application "Mail"
	activate
	set myMailbox to mailbox "@Fliers" of account myAcount
	set accountTrash to mailbox "Trash" of account myAcount
	set messagesToDelete to messages of myMailbox whose date received ² dateReference
	repeat with aMessage in messagesToDelete
		move aMessage to accountTrash
	end repeat
end tell

display dialog (count messagesToDelete) & " old Mail Messages Have Been Purged" as text buttons ["OK"]