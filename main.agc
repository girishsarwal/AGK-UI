
// Project: test 
// Created: 2017-01-09
#include "UIList.agc"
// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "test" )
SetWindowSize( 1024, 768, 0 )

// set display properties
SetVirtualResolution( 1024, 768 )
SetOrientationAllowed( 1, 1, 1, 1 )
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
UseNewDefaultFonts( 1 ) // since version 2.0.20 we can use nicer default fonts

models as UIList
models = UIListNew("Choose...", 5)

UIListSetPosition(models, 100, 100)
UIListSetSize(models, 500, 200)


menuItem as UIListItem
menuItem = UIListItemNew(1, "First Item")
UIListItemSetBackground(menuItem, "1.png")

anotherItem as UIListItem
anotherItem = UIListItemNew(2, "New Item")
UIListItemSetBackground(anotherItem, "2.png")

anotherItem2 as UIListItem
anotherItem2 = UIListItemNew(3, "Still Another Item")
UIListItemSetBackground(anotherItem2, "3.png")

anotherItem3 as UIListItem
anotherItem3 = UIListItemNew(4, "Yet Another Item")
UIListItemSetBackground(anotherItem3, "4.png")

anotherItem4 as UIListItem
anotherItem4 = UIListItemNew(5, "And Another Item")
UIListItemSetBackground(anotherItem4, "5.png")

models._currentVisibleFirstItemIndex = 0


UIListAddItem(models, menuItem)
UIListAddItem(models, anotherItem)
UIListAddItem(models, anotherItem2)
UIListAddItem(models, anotherItem3)
UIListAddItem(models, anotherItem4)

yesno as UICheckBox
yesno = UICheckBoxNew("yes no", "checkbox-off.png", "checkbox-on.png")

UICheckBoxSetPosition(yesno, 500, 500)
UICheckBoxSetSize(yesno, 32, 32)
UICheckBoxSetColor(yesno, 255, 0, 0, 255)

do
	Print( ScreenFPS() )
	if GetRawKeyPressed(38)  //Up
		UIListScroll(models, -1)
    elseif GetRawKeyPressed(40)  //Down
		UIListScroll(models, 1)
	endif
	UIListUpdate(models, 0, 0)
	checkedValue = UICheckBoxUpdate(yesno)
	Print(checkedValue)
	if GetRawKeyPressed(27)  //Up
		if(checkedValue = 0)
			UICheckBoxSetState(yesno, 1)
		elseif(checkedValue = 1)
			UICheckBoxSetState(yesno, 0)
		endif
	endif
    Sync()
loop
