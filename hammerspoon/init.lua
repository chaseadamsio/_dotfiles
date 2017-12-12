-- this is a work in progress configuration for hammerspoon.
-- I'm brand newish to hammerspoon and still very green at Lua,
-- so take this configuration with a grain of salt.
function shiftLeftHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f, .1)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", shiftLeftHalf)

function shiftRightHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f, .1)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", shiftRightHalf)

function shiftTopHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f, .1)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", shiftTopHalf)

function shiftBottomHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y + (max.h / 2)
    f.w = max.w 
    f.h = max.h / 2
    win:setFrame(f, .1)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", shiftBottomHalf)

function maxScreen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y 
    f.w = max.w 
    f.h = max.h 
    win:setFrame(f, 0)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", maxScreen)


function reloadConfig(files)
    shouldReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            shouldReload = true
        end
    end
    if shouldReload then
        hs.reload()
    end
end

luaWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Reloaded Config"}):send()