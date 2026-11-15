local CombatService = {}

function CombatService.HandleRequest(player, combatType, hero)
    if not hero then return end
    if hero.Character ~= player.Character then return end
    if not hero.Humanoid or hero.Humanoid.Health <= 0 then return end
    if not hero.HeroComponent then return end

    if combatType == "M1" then
        hero.HeroComponent:M1()
    end


end

return CombatService