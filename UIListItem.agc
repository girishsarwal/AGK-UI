
type UIListItem
	_internalId
	width#
	height#
	
	_lastInternalId

	backgroundImageId
	backgroundSpriteId

	foregroundImageId
	foregroundSpriteId
	
	description$
endtype

function UIListItemNew(description, foreground$, background$)
	new as UIListItem
	
	new.foregroundImageId = LoadImage(foreground$)
	new.backgroundSpriteId = CreateSprite(new.foregroundImageId)
	
	
endfunction new

function UIListItemUpdate()
	
endfunction

function UIListItemDestroy()
endfunction
