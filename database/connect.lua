--[[
- author : coockie hunt
- version : 1.0
- manage database data
--]]


db = false

-- Package events
function OnPackageStart()
    mariadb_log("debug")
    print("::Onset developement server running")
    print("> Attempting to connect to MariaDB server ...")

    db = mariadb_connect(mariadb.host, mariadb.user, mariadb.password, mariadb.database)
    if(db ~= false) then
        print("> Successfully connected to MariaDB")
        mariadb_set_charset(db, "utf8mb4")
    else
        print("> Failed to connect to MariaDB, stopping the server ...")
        ServerExit()
    end
end
AddEvent("OnPackageStart", OnPackageStart)

function OnPackageStop()
    print(":: Disconncted MariaDB server ...")
    mariadb_close(db)
end
AddEvent("OnPackageStop", OnPackageStop)

function getDb()
    return db
end
AddFunctionExport("getDb", getDb)