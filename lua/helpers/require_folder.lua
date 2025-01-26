local RequireFolder = {}

function RequireFolder.set(path)
    local pfile = io.popen('ls -a ~/.config/nvim/lua/' .. path)
    local i = 0
    for filename in pfile:lines() do
        if i > 1 then require(path .. '/' .. filename:sub(1, -5)) end
        i = i + 1
    end
    pfile:close()
end

return RequireFolder
