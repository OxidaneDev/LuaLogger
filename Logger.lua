local function consoleLog(...)
    local function printTable(t, indent)
        indent = indent or ""
        if type(t) ~= "table" then
            io.write(tostring(t))
            return
        end
        io.write("{\n")
        for k, v in pairs(t) do
            io.write(indent, "  ", tostring(k), ": ")
            if type(v) == "table" then
                printTable(v, indent .. "  ")
            else
                io.write(tostring(v))
            end
            io.write(",\n")
        end
        io.write(indent, "}")
    end

    local args = {...}
    for i = 1, #args do
        if type(args[i]) == "table" then
            printTable(args[i])
        else
            io.write(tostring(args[i]))
        end
        if i < #args then
            io.write(" ")
        end
    end
    io.write("\n")
end

-- Test code below

--[[local TestTable = {
    "Hi",
    "\27",
    13345834,
    1e8,
    0x51,
    0X0543,
    "#",
    ["lua"] = 5.1,
    521.543,
    {
        First = "First",
        "Second",
        3
    },
    ["Test"] = {"Test2"},
    nil,

}

TestTable.null = nil

consoleLog("Hello World")

for i = 1, 10 do
    consoleLog("Iteration: ", i)
end

consoleLog(TestTable) -- The ability to log things in tables.]]