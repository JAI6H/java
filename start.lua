serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
print([[


      #  _____  ________      ______  _____  
#  |  __ \|  ____\ \    / / __ \|  __ \ 
#  | |__) | |__   \ \  / / |  | | |__) |
#  |  _  /|  __|   \ \/ /| |  | |  _  / 
#  | | \ \| |____   \  / | |__| | | \ \ 
#  |_|  \_\______|   \/   \____/|_|  \_\

# ππππΎπππ π½ππ ππ πππππΎπ πππππ @REVORB0T
# πππππΎπ π½π πππππΎ @U660P
---------------------------------------------------------------------
      
]])
Server_Tshake = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_Tshake = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Tshake_Info_Sudo = io.open("sudo.lua", 'w')
Tshake_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Tshake_Info_Sudo:close()
end  
if not database:get(Server_Tshake.."Token_Tshake") then
print("\27[1;34mΒ»Β» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31mΒ»Β» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31mΒ»Β» The Token Is Saved\n\27[0;39;49m')
database:set(Server_Tshake.."Token_Tshake",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_Tshake.."UserName_Tshake") then
print("\27[1;34m\nΒ»Β» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://tshake.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31mΒ»Β» Sorry The server is Spsm \nΨͺΩ Ψ­ΨΈΨ± Ψ§ΩΨ³ΩΨ±ΩΨ± ΩΩΨ―Ψ© 5 Ψ―ΩΨ§ΩΩ Ψ¨Ψ³Ψ¨Ψ¨ Ψ§ΩΨͺΩΨ±Ψ§Ψ±\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31mΒ»Β» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31mΒ»Β» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31mΒ»Β» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_Tshake.."UserName_Tshake",Json.Info.Username)
database:set(Server_Tshake.."Id_Tshake",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_Tshake_Info()
Create_Info(database:get(Server_Tshake.."Token_Tshake"),database:get(Server_Tshake.."Id_Tshake"),database:get(Server_Tshake.."UserName_Tshake"))   
local RunTshake = io.open("Tshake", 'w')
RunTshake:write([[
#!/usr/bin/env bash
cd $HOME/TshAkEx
token="]]..database:get(Server_Tshake.."Token_Tshake")..[["
rm -fr Tshake.lua
wget "https://raw.githubusercontent.com/amrjava/alfapro/main/Tshake.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Tshake.lua -p PROFILE --bot=$token
done
]])
RunTshake:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/TshAkEx
while(true) do
rm -fr ../.telegram-cli
screen -S TshAkE -X kill
screen -S TshAkE ./Tshake
done
]])
RunTs:close()
end
Files_Tshake_Info()
database:del(Server_Tshake.."Token_Tshake");database:del(Server_Tshake.."Id_Tshake");database:del(Server_Tshake.."UserName_Tshake")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_Tshake()  
var = true
else   
f:close()  
database:del(Server_Tshake.."Token_Tshake");database:del(Server_Tshake.."Id_Tshake");database:del(Server_Tshake.."UserName_Tshake")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
