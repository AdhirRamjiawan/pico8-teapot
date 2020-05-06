function split(text, separator)
    local parts = {}
    local last_separator_index = 1

    for i = 1, #text do
        local c = sub(text, i, i)
        if c == separator then
            local part = sub(text, last_separator_index, i -1)
            last_separator_index = i
            add(parts, part)
        end

        i += 1
    end

    
    return parts
end

function trim(s)
    local res = ""

    -- from the front
    for i = 1, #s do
        local c = sub(s, i,i)
        if c ~= " " and c ~= "\n" and c ~= "\t" then
            res = sub(s, i, #s)
            break
        end
    end

    -- from the back
    for i = #s, 1, -1 do
        local c = sub(s, i,i)
        if c ~= " " and c ~= "\n" and c ~= "\t" then
            res = sub(s, 1, i)
            break
        end
    end

    return res
end