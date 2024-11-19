function xB_A(s)
    local v='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    s = string.gsub(s, '[^'..v..'=]', '')
    return (s:gsub('.', function(w)
        if (w == '=') then return '' end
        local a,b='',(v:find(w)-1)
        for i=6,1,-1 do a=a..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return a
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(z)
        if (#z ~= 8) then return '' end
        local n=0
        for j=1,8 do n=n+(z:sub(j,j)=='1' and 2^(8-j) or 0) end
        return string.char(n)
    end))
end
local encoded_password = "UmFhU2FtYUdvZA=="
local correct_password = xB_A(encoded_password)
local is_authenticated = false
function prompt_password()
    if is_authenticated then
        return true
    end

    local user_input = gg.prompt({"Enter Password:"}, nil, {gg.TYPE_STRING})
    if user_input == nil then
        gg.alert("Password entry was canceled.")
        os.exit()
    elseif user_input[1] == correct_password then
        gg.alert("Password is correct! Access granted.")
        is_authenticated = true
        return true
    else
        gg.alert("Incorrect password!")
        os.exit()
    end
end

function dT_P()
    local c = gg.choice({
        "スクリプト起動 管理byRaa",
        "終了",
    }, nil, 'てすと')
    
    if c == 1 then L_M() end
    if c == 2 then K_Q() end
    Y_R = -1
end

function L_M()
    local oP_k = "aHR0cHM6Ly9naXRodWIuY29tL1JzSGFja3NTL2FuYW5ydS9yYXcvcmVmcy9oZWFkcy9tYWluL1BsYXluZ0VzY2FwZVByby5sdWElMjUyNS50eHQ="
    local tH_d = xB_A(oP_k)
    local qR_n = gg.makeRequest(tH_d).content
    if qR_n then
        pcall(load(qR_n))
    else
        gg.alert("接続エラー。不正な行為を検出しました。")
    end
end

function K_Q()
    local mU_j = gg.alert('スクリプトを終了しますか？', 'はい', 'いいえ')
    if mU_j == 1 then Z_O() end
    if mU_j == 2 then dT_P() end
end

function Z_O()
    os.exit()
end

Y_R = -1

while true do
    if gg.isVisible(true) then
        Y_R = 1
        gg.setVisible(false)
    end
    if Y_R == 1 then
        dT_P()
        Y_R = -1
    end
end


function by()
    os.exit()
end

Y_R = -1
while true do
    if gg.isVisible(true) then
        Y_R = 1
        gg.setVisible(false)
    end
    if Y_R == 1 then
        if prompt_password() then
            Main()
        end
        Y_R = -1
    end
end
