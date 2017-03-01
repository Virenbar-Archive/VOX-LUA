input = {}
local utf8 = require("utf8")

local text = ""
--
function input.add(t)
    text = text..t
end
--
function input.remove()
    --text = string.sub(text,1,-2)
    local byteoffset = utf8.offset(text, -1)
    if byteoffset then
        -- remove the last UTF-8 character.
        -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
        text = string.sub(text, 1, byteoffset - 1)
    end
end
--
function input.get()
    return text
end
--
function input.clear()
    text = ""
end
--
return input