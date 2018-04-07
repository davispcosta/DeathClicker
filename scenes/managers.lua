local composer = require( "composer" )
local widget = require( "widget" )
local base = require( "base" )
local loadsave = require( "loadsave" )

local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()

local scene = composer.newScene()
composer.recycleOnSceneChange = true

loadsave.saveTable(base, "base.json")
local loadedBase = loadsave.loadTable( "base.json" )

local exitBtn
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen

   local background = display.newImageRect("ui/clicker/background.png", 400, 700)
   background.x = display.contentCenterX
   background.y = display.contentCenterY 
   backGroup:insert(background)

   local header = display.newImageRect("ui/clicker/header.png", 400, 50)
   header.x = display.contentCenterX
   header.y = -20
   uiGroup:insert(header)  

   local title = display.newText( "ESTAGIÁRIOS", 100, -20, "twcm", 20 )
   uiGroup:insert(title) 
   
   function exit()   
       composer.gotoScene("scenes.clicker")
   end

   exitBtn = display.newImageRect("ui/clicker/exitBtn.png", 70, 50)
   exitBtn.x = display.contentCenterX + 100
   exitBtn.y = 0
   exitBtn:addEventListener("tap", exit)
   uiGroup:insert(exitBtn)

   local scrollView = widget.newScrollView{
        left = 20,
        top = 0,
        topPadding = 50,        
        bottomPadding = 80,
        width = display.contentWidth - 40,
        height = display.contentHeight + 45,
        hideBackground = true,
        horizontalScrollDisabled = true,
        verticalScrollDisabled = false,
    }    

    local yOffset = 50
    for currentArea = 1, base.numAreas do
    for i=1, base.areas[currentArea].numAttributes do
        if(loadedBase.areas[currentArea].attributes[i].managerActive == false) then
        
            local scrollGroup = display.newGroup()
            
            local background = display.newRect(0, 0, scrollView.width, 100)
            background.x = display.contentCenterX - 20
            background.y = yOffset
            background:setFillColor(0.105, 0.078, 0.397)
            scrollGroup:insert(background)

            local nameBack = display.newRect(0, 0, 235, 30)
            nameBack.x = display.contentCenterX - 20
            nameBack.y = yOffset - 30
            nameBack:setFillColor(255,255,255)
            scrollGroup:insert(nameBack)

            local name = display.newText(base.areas[currentArea].attributes[i].managerName, 0, 0, "twcm", 17)
            name.x = 150
            name.y = yOffset - 30
            name:setFillColor(0,0,0)
            scrollGroup:insert(name)

            local managerFunction = display.newText(base.areas[currentArea].attributes[i].managerPhrase, 0, 0, "twcm", 17)
            managerFunction.x = 150
            managerFunction.y = yOffset
            managerFunction:setFillColor(1,1,1)
            scrollGroup:insert(managerFunction)

            function buyManager()
                local price = loadedBase.areas[currentArea].attributes[i].managerPrice
                if(deathNumbers >= price) then
                    deathNumbers = deathNumbers - price
                    loadedBase.areas[currentArea].attributes[i].managerActive = true
                    loadsave.saveTable(base, "base.json")
                    print "Joao"
                end                
                return true
            end

            local buyBtn = display.newImageRect("ui/clicker/buyBtn.png", 100, 50)
            buyBtn.x = display.contentCenterX + 50
            buyBtn.y = yOffset + 50 
            buyBtn:addEventListener("tap", buyManager)            
            scrollGroup:insert(buyBtn)

            local buyBtnText = display.newText(loadedBase.areas[1].attributes[i].managerPrice, 0, 0, native.systemFont, 17)
            buyBtnText.x = display.contentCenterX + 50
            buyBtnText.y = yOffset + 50 
            buyBtnText:setFillColor(0, 0, 0)
            scrollGroup:insert(buyBtnText)

            scrollView:insert(scrollGroup)

            yOffset = yOffset + 150
        end
    end
    end
    mainGroup:insert(scrollView)

    local goToUpgradesBtn = display.newImageRect("ui/clicker/upgradeBtn.png", 70, 50)
    goToUpgradesBtn.x = display.contentCenterX - 100
    goToUpgradesBtn.y = display.contentHeight

    local goToManagersBtn = display.newImageRect("ui/clicker/managerBtn.png", 70, 50)
    goToManagersBtn.x = display.contentCenterX
    goToManagersBtn.y = display.contentHeight

    local goToStoreBtn = display.newImageRect("ui/clicker/storeBtn.png", 70, 50)
    goToStoreBtn.x = display.contentCenterX + 100
    goToStoreBtn.y = display.contentHeight
end


-- show()
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       -- Code here runs when the scene is still off screen (but is about to come on screen)

   elseif ( phase == "did" ) then
       -- Code here runs when the scene is entirely on screen

   end
end


-- hide()
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       -- Code here runs when the scene is on screen (but is about to go off screen)
       exitBtn:removeEventListener("tap", exit)   
       
       display.remove(backGroup)
       display.remove(mainGroup)   
       display.remove(uiGroup)

   elseif ( phase == "did" ) then
       -- Code here runs immediately after the scene goes entirely off screen
       composer.removeScene("scenes.managers")
   end
end


-- destroy()
function scene:destroy( event )

   local sceneGroup = self.view
   -- Code here runs prior to the removal of scene's view
   

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene