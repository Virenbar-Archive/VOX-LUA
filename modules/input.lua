input = {}
local utf8 = require("utf8")
local prefix = ""
local postfix = ""
local sel = "|"
--local sel_pos = 1
--
function input.add(t)
    prefix = prefix..t
end
--
function input.remove()
    --text = string.sub(text,1,-2)
    local byteoffset = utf8.offset(prefix, -1)
    if byteoffset then
        -- remove the last UTF-8 character.
        -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
        prefix = string.sub(prefix, 1, byteoffset - 1)
    end
end
--
function input.left()
    if prefix ~= "" then
        local byteoffset = utf8.offset(prefix, -1)
        postfix = string.sub(prefix, byteoffset, -1)..postfix
        prefix = string.sub(prefix, 1, byteoffset - 1)
    end
end
--
function input.right()
    if postfix ~= "" then
        
    end
end
--
function input.get()
    return prefix..sel..postfix
end
--
function input.get_raw()
    return prefix..postfix
end
--
function input.clear()
    prefix = ""
    postfix = ""
end
--
return input