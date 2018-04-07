local base = {}

    base.numAreas = 3
    base.areas = {}

    base.areas[1] = {}
        base.areas[1].name = "CIDADE"
        base.areas[1].numAttributes = 3
        base.areas[1].attributes = {}

            base.areas[1].attributes[1] = {}
                base.areas[1].attributes[1].title = "Contratar Estagiários!"
                base.areas[1].attributes[1].secondsTime = 3
                base.areas[1].attributes[1].price = 5
                base.areas[1].attributes[1].deaths = 10
                    base.areas[1].attributes[1].managerName = "Beusebú"
                    base.areas[1].attributes[1].managerPhrase = "Automatiza a contratação"
                    base.areas[1].attributes[1].managerPrice = 5
                    base.areas[1].attributes[1].managerActive = false
                    base.areas[1].attributes[1].clicked = false
            base.areas[1].attributes[2] = {}
                base.areas[1].attributes[2].title = "Influenciar Serial Killers!"
                base.areas[1].attributes[2].secondsTime = 10
                base.areas[1].attributes[2].price = 100
                base.areas[1].attributes[2].deaths = 50
                    base.areas[1].attributes[2].managerName = "Beusebú"
                    base.areas[1].attributes[2].managerPhrase = "Automatiza a contratação"
                    base.areas[1].attributes[2].managerPrice = 10
                    base.areas[1].attributes[2].managerActive = false
                    base.areas[1].attributes[2].clicked = false

            base.areas[1].attributes[3] = {}
                base.areas[1].attributes[3].title = "Causar Depressão!"
                base.areas[1].attributes[3].secondsTime = 60
                base.areas[1].attributes[3].price = 1000
                base.areas[1].attributes[3].deaths = 500
                    base.areas[1].attributes[3].managerName = "Beusebú"
                    base.areas[1].attributes[3].managerPhrase = "Automatiza a contratação"
                    base.areas[1].attributes[3].managerPrice = 5
                    base.areas[1].attributes[3].managerActive = false
                    base.areas[1].attributes[3].clicked = false

    base.areas[2] = {}
        base.areas[2].name = "PAÍS"
        base.areas[2].numAttributes = 3
        base.areas[2].attributes = {}
            
        base.areas[2].attributes[1] = {}
            base.areas[2].attributes[1].title = "Exterminar Imigrantes!"
            base.areas[2].attributes[1].secondsTime = 3
            base.areas[2].attributes[1].price = 5
            base.areas[2].attributes[1].deaths = 10
                base.areas[2].attributes[1].managerName = "Beusebú"
                base.areas[2].attributes[1].managerPhrase = "Automatiza a contratação"
                base.areas[2].attributes[1].managerPrice = 5
                base.areas[2].attributes[1].managerActive = false
                base.areas[2].attributes[1].clicked = false
            
                base.areas[2].attributes[2] = {}
                base.areas[2].attributes[2].title = "Influenciar Serial Killers!"
                base.areas[2].attributes[2].secondsTime = 10
                base.areas[2].attributes[2].price = 100
                base.areas[2].attributes[2].deaths = 50
                    base.areas[2].attributes[2].managerName = "Beusebú"
                    base.areas[2].attributes[2].managerPhrase = "Automatiza a contratação"
                    base.areas[2].attributes[2].managerPrice = 10
                    base.areas[2].attributes[2].managerActive = false
                    base.areas[2].attributes[2].clicked = false                    
            
                base.areas[2].attributes[3] = {}
                base.areas[2].attributes[3].title = "Causar Depressão!"
                base.areas[2].attributes[3].secondsTime = 60
                base.areas[2].attributes[3].price = 1000
                base.areas[2].attributes[3].deaths = 500
                    base.areas[2].attributes[3].managerName = "Beusebú"
                    base.areas[2].attributes[3].managerPhrase = "Automatiza a contratação"
                    base.areas[2].attributes[3].managerPrice = 5
                    base.areas[2].attributes[3].managerActive = false
                    base.areas[2].attributes[3].clicked = false
                    
    base.areas[3] = {}
        base.areas[3].name = "GALÁXIA"
        base.areas[3].numAttributes = 3
        base.areas[3].attributes = {}
                        
        base.areas[3].attributes[1] = {}
            base.areas[3].attributes[1].title = "Causar Guerras!"
            base.areas[3].attributes[1].secondsTime = 3
            base.areas[3].attributes[1].price = 5
            base.areas[3].attributes[1].deaths = 10
                base.areas[3].attributes[1].managerName = "Beusebú"
                base.areas[3].attributes[1].managerPhrase = "Automatiza a contratação"
                base.areas[3].attributes[1].managerPrice = 5
                base.areas[3].attributes[1].managerActive = false
                base.areas[3].attributes[1].clicked = false
                        
        base.areas[3].attributes[2] = {}
            base.areas[3].attributes[2].title = "Influenciar Serial Killers!"
            base.areas[3].attributes[2].secondsTime = 10
            base.areas[3].attributes[2].price = 100
            base.areas[3].attributes[2].deaths = 50
                base.areas[3].attributes[2].managerName = "Beusebú"
                base.areas[3].attributes[2].managerPhrase = "Automatiza a contratação"
                base.areas[3].attributes[2].managerPrice = 10
                base.areas[3].attributes[2].managerActive = false
                base.areas[3].attributes[2].clicked = false                
                        
        base.areas[3].attributes[3] = {}
            base.areas[3].attributes[3].title = "Causar Depressão!"
            base.areas[3].attributes[3].secondsTime = 60
            base.areas[3].attributes[3].price = 1000
            base.areas[3].attributes[3].deaths = 500
                base.areas[3].attributes[3].managerName = "Beusebú"
                base.areas[3].attributes[3].managerPhrase = "Automatiza a contratação"
                base.areas[3].attributes[3].managerPrice = 5
                base.areas[3].attributes[3].managerActive = false
                base.areas[3].attributes[3].clicked = false                
                
    base.numUpgrades = 3
    base.upgrades = {}

        base.upgrades[1] = {}
            base.upgrades[1].name = "Foice da Morte"
            base.upgrades[1].upgradeFuction = "2x Contratação de Estagiários"

        base.upgrades[2] = {}
            base.upgrades[2].name = "Foice da Morte"
            base.upgrades[2].upgradeFuction = "2x Contratação de Estagiários"

        base.upgrades[3] = {}
            base.upgrades[3].name = "Foice da Morte"
            base.upgrades[3].upgradeFuction = "2x Contratação de Estagiários"

return base