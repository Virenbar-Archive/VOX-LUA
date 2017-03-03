vox = {}
--require("modules.func")
--require ("modules.slam")
local _playing = false
local toplay = {}
local VOX = {}
--
function set(list)
    local set = {}
    for _, l in ipairs(list) do set[string.sub(l,1,-5)] = true end
    return set
end
--
function vox.load()
    --VOX = {}
    files = love.filesystem.getDirectoryItems("vox")
    vox_words = set(files)
    for k,_ in pairs(vox_words) do
      VOX[k] = love.audio.newSource("vox/"..k..".wav","stream")
    end
end
--
function vox.say(T)
    words = {}
    toplay = {}
    for word in T:gmatch("%S+") do 
        table.insert(words, word)
    end
    for _,word in pairs(words) do
        if vox_words[word] then table.insert(toplay,VOX[word])
        else end
    end
    --love.audio.play(VOX["freeman.wav"])
    --[[
    for _,v in ipairs(toplay) do
        v:play()
        love.timer.sleep(0.35)
        --while not v.isStopped() do
        --
        --end
    end
    --]]
    if #toplay > 0 then 
        _playing = true
        toplay[1]:play()
    end
    --sources[1].play()
end
--
function vox.play(key)
    if love.system.getOS == "OS X" then
        if key == "0" then VOX["woop"]:play() end
        if key == "1" then VOX["buzwarn"]:play() end
        if key == "2" then VOX["bizwarn"]:play() end
        if key == "3" then VOX["dadeda"]:play() end
        if key == "4" then VOX["deeoo"]:play() end
        if key == "5" then VOX["doop"]:play() end
        if key == "6" then VOX["bloop"]:play() end        
    else    
        if key == "kp0" then VOX["woop"]:play() end
        if key == "kp1" then VOX["buzwarn"]:play() end
        if key == "kp2" then VOX["bizwarn"]:play() end
        if key == "kp3" then VOX["dadeda"]:play() end
        if key == "kp4" then VOX["deeoo"]:play() end
        if key == "kp5" then VOX["doop"]:play() end
        if key == "kp6" then VOX["bloop"]:play() end
    end
end
--
function vox.update(dt)
    ----[[
    if _playing then 
    
        if toplay[1]:isPlaying() then
            --Wait
        else
            table.remove(toplay,1)
            if #toplay > 0 then
                toplay[1]:play()
            else
                _playing = false
            end
        end
    end
    --]]
end
--
function vox.draw()
    --printl(files,0,460)
    if _playing then 
        printf("_-_",0,200,love.graphics.getWidth(),"center")
        if toplay[1] ~= nil then
            printf(toplay[1]:tell(),0,220,love.graphics.getWidth(),"center")
            if toplay[1]:isPlaying() then printf("Playing",0,240,love.graphics.getWidth(),"center") end
            if toplay[1]:isPaused() then printf("Paused",0,240,love.graphics.getWidth(),"center") end
            if toplay[1]:isStopped() then printf("Stopped",0,240,love.graphics.getWidth(),"center") end
        end
    end
end
--
return vox