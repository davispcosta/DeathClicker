local composer = require( "composer" )
local widget = require( "widget" )
local base = require( "base" )
local loadsave = require( "loadsave" )

local scene = composer.newScene()

local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()

local deathNumbers = 0
local deathNumbersText 

local grave

local scrollView
local currentArea = 1

local clickerTexts = {}
local buyBtns = {}

loadsave.saveTable(base, "base.json")
local loadedBase = loadsave.loadTable( "base.json" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

function clickGrave()
    deathNumbers = deathNumbers + 1
    deathNumbersText.text = deathNumbers

    local ghost = display.newImageRect("ui/clicker/ghost.png", 50, 50)
    ghost.x = math.random(grave.x - 20, grave.x + 20)
    ghost.y = grave.y
    backGroup:insert(ghost)
    transition.to(ghost, { time = 700, y = -100 })

    for i=1, 3 do
        if(deathNumbers >= loadedBase.areas[currentArea].attributes[i].price) then
            print "JOAO"
            buyBtns[i]:setFillColor(0,0,0)
        end
    end
end

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

   grave = display.newImageRect("ui/clicker/grave.png", 200, 180)
   grave.x = display.contentCenterX  
   grave.y = display.contentCenterY - 80
   mainGroup:insert(grave)

   local areaName = display.newText("CIDADE", 0, 0, "twcm", 30)
   areaName.x = display.contentCenterX
   areaName.y = grave.y - 100
   mainGroup:insert(areaName)

   local areaLeft = display.newImageRect("ui/clicker/areaLeft.png", 30, 40)
   areaLeft.x = display.contentCenterX - 100
   areaLeft.y = grave.y - 100
   areaLeft.isVisible = false
   mainGroup:insert(areaLeft)

   local areaRight = display.newImageRect("ui/clicker/areaRight.png", 30, 40)
   areaRight.x = display.contentCenterX + 100
   areaRight.y = grave.y - 100

   function goRightArea()
        currentArea = currentArea + 1
        areaLeft.isVisible = true
        if(currentArea == base.numAreas) then
            areaRight.isVisible = false
        end
        areaName.text = base.areas[currentArea].name
        scrollView:removeSelf()
        createAttributes()
   end 
   areaRight:addEventListener("tap", goRightArea)
   mainGroup:insert(areaRight)   

   function goLeftArea()
        currentArea = currentArea - 1
        areaRight.isVisible = true
        if(currentArea == 1) then
            areaLeft.isVisible = false
        end
        areaName.text = base.areas[currentArea].name
        scrollView:removeSelf()
        createAttributes()
   end 
   areaLeft:addEventListener("tap", goLeftArea)

   deathNumbersText = display.newText("0", 0, 0, "twcm", 30)
   deathNumbersText.x = display.contentCenterX
   deathNumbersText.y = grave.y + 42
   deathNumbersText:setFillColor(0,0,0)
   uiGroup:insert(deathNumbersText)
   
   local grassBack = display.newRect(0, 0, 400, 400)
   grassBack.x = display.contentCenterX
   grassBack.y = display.contentCenterY + 210
   grassBack:setFillColor(0.549, 0.776, 0.247)
   backGroup:insert(grassBack)

   grave:addEventListener("tap", clickGrave)

   function createAttributes()        
        scrollView = widget.newScrollView{
            left = 20,
            top = 270,
            bottomPadding = 80,
            width = display.contentWidth - 40,
            height = display.contentHeight/2 + 20,
            hideBackground = true,
            horizontalScrollDisabled = true,
            verticalScrollDisabled = false,
        }
        mainGroup:insert(scrollView)

        local yOffset = 50
        for i=1, base.areas[currentArea].numAttributes do

            local clickBack = display.newRect(0, 0, 250, 100)
            clickBack.x = display.contentCenterX - 20
            clickBack.y = yOffset
            clickBack:setFillColor(0.105, 0.078, 0.397)

            local titleBack = display.newRect(0, 0, 235, 30)
            titleBack.x = display.contentCenterX - 20
            titleBack.y = yOffset - 30
            titleBack:setFillColor(255,255,255)
            
            local title = display.newText(base.areas[currentArea].attributes[i].title, 0, 0, "twcm", 17)
            title.x = 140
            title.y = yOffset - 30
            title:setFillColor(0,0,0)

            buyBtns[i] = display.newImageRect("ui/clicker/buyBtn.png", 100, 50)
            buyBtns[i].x = display.contentCenterX + 50
            buyBtns[i].y = yOffset + 50 

            local price = loadedBase.areas[currentArea].attributes[i].price
            if(deathNumbers >= price) then
                buyBtns[i]:setFillColor(0,0,0)
            end

            local buyBtnText = display.newText(price, 0, 0, "twcm", 17)
            buyBtnText.x = display.contentCenterX + 50
            buyBtnText.y = yOffset + 50 
            buyBtnText:setFillColor(0, 0, 0)

            local manyDeathText = display.newText("x"..loadedBase.areas[currentArea].attributes[i].deaths, 0, 0, "twcm", 20)
            manyDeathText.x = display.contentCenterX - 120
            manyDeathText.y = yOffset + 30
            manyDeathText:setFillColor(1, 1, 1)

        local secondsLeft = loadedBase.areas[currentArea].attributes[i].secondsTime 
                
        clickerTexts[i] = display.newText( "CLIQUE!!", 140, yOffset, "twcm", 20 )
        clickerTexts[i]:setFillColor( 1, 1, 1 )
        clickerTexts[i].area = currentArea
        clickerTexts[i].attribute = i

            scrollView:insert(clickBack)
            scrollView:insert(titleBack)
            scrollView:insert(title)
            scrollView:insert(buyBtns[i])
            scrollView:insert(buyBtnText)
            scrollView:insert(manyDeathText)
            scrollView:insert(clickerTexts[i])             

        function clickAttribute()
                if(secondsLeft == loadedBase.areas[currentArea].attributes[i].secondsTime)  then
                    loadedBase.areas[currentArea].attributes[i].clicked = true 
                    loadsave.saveTable(loadedBase, "base.json")              
                end  
        end
        clickBack:addEventListener("tap", clickAttribute)        

        function clickBuyBtn()

                local price = loadedBase.areas[currentArea].attributes[i].price
                if(deathNumbers >= price) then
                    deathNumbers = deathNumbers - price
                    price = price*2
                    local deaths = loadedBase.areas[1].attributes[i].deaths
                    deaths = deaths*2
        
                    loadedBase.areas[1].attributes[i].price = price
                    loadedBase.areas[1].attributes[i].deaths = deaths
        
                    buyBtnText.text = price
                    manyDeathText.text = deaths
                    deathNumbersText.text = deathNumbers
                    loadsave.saveTable(loadedBase, "base.json" )
                end                  
                return true      
        end        
        buyBtns[i]:addEventListener("tap", clickBuyBtn)
        yOffset = yOffset + 150
        end
   end 
   createAttributes()
   
   function updateTime(i, secondsLeft)
        if secondsLeft == 0 then
            loadedBase.areas[currentArea].attributes[i].clicked = false
            clickerTexts[i].text = "CLIQUE!!"
            loadedBase.areas[currentArea].attributes[i].secondsTime = base.areas[currentArea].attributes[i].secondsTime
            deathNumbers = deathNumbers + loadedBase.areas[currentArea].attributes[i].deaths
            deathNumbersText.text = deathNumbers
            for i=1, 3 do
                if(deathNumbers >= loadedBase.areas[currentArea].attributes[i].price) then
                    print "JOAO"
                    buyBtns[i]:setFillColor(0,0,0)
                end
            end
        else
            local minutes = math.floor( secondsLeft / 60 )
            local seconds = secondsLeft % 60            
            -- Make it a formatted string
            local timeDisplay = string.format( "%02d:%02d", minutes, seconds )                
            -- Update the text object
            clickerTexts[i].text = timeDisplay
        end        
   end

   function everySecond()
        for i=1, base.numAreas do
            for j=1, base.areas[i].numAttributes do
                if(loadedBase.areas[i].attributes[j].clicked == true) then
                    secondsLeft = loadedBase.areas[i].attributes[j].secondsTime
                    secondsLeft = secondsLeft - 1
                    loadedBase.areas[i].attributes[j].secondsTime = secondsLeft       
                    
                    if(i == currentArea) then
                        updateTime(j, secondsLeft)
                    end
                    
                    loadsave.saveTable(loadedBase, "base.json")
                end
            end
        end
    end
    timer.performWithDelay(1000, everySecond, -1)

    function goToUpgrades()
        composer.gotoScene("scenes.upgrades")
        return true
    end

    local goToUpgradesBtn = display.newImageRect("ui/clicker/upgradeBtn.png", 70, 50)
    goToUpgradesBtn.x = display.contentCenterX - 100
    goToUpgradesBtn.y = display.contentHeight
    goToUpgradesBtn:addEventListener("tap", goToUpgrades)

    function goToManagers()
        composer.gotoScene("scenes.managers")
        return true
    end

    local goToManagersBtn = display.newImageRect("ui/clicker/managerBtn.png", 70, 50)
    goToManagersBtn.x = display.contentCenterX
    goToManagersBtn.y = display.contentHeight
    goToManagersBtn:addEventListener("tap", goToManagers)

    function goToStore()
        composer.gotoScene("scenes.store")
        return true
    end

    local goToStoreBtn = display.newImageRect("ui/clicker/storeBtn.png", 70, 50)
    goToStoreBtn.x = display.contentCenterX + 100
    goToStoreBtn.y = display.contentHeight
    goToStoreBtn:addEventListener("tap", goToStore)
    
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

   elseif ( phase == "did" ) then
       -- Code here runs immediately after the scene goes entirely off screen

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