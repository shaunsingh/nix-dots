local awful = require('awful')
local gears = require('gears')

-- Volume Fetching and Signal Emitting
--------------------------------------
-- Emit a volume level signal
local volume_old = -1
local muted_old  = -1
local function volume_emit()
    awful.spawn.easy_async_with_shell(
        "bash -c 'wpctl get-volume @DEFAULT_AUDIO_SINK@'", function(stdout)
            local volume     = string.match(stdout:match('(%d%.%d+)')*100, '(%d+)')
            local muted      = stdout:match('MUTED')
            local muted_int  = muted and 1 or 0
            local volume_int = tonumber(volume) -- integer 
            if volume_int ~= volume_old or muted_int ~= muted_old then
                awesome.emit_signal('signal::volume', volume_int, muted) -- integer
                volume_old  = volume_int
                muted_old   = muted_int
            end
        end)
end

-- Microphone Fetching and Signal Emitting
------------------------------------------
-- Emit a volume level signal
local mic_old        = -1
local mic_muted_old  = -1
local function microphone_emit()
    awful.spawn.easy_async_with_shell(
        "bash -c 'wpctl get-volume @DEFAULT_AUDIO_SOURCE@'", function(stdout)
            local mic           = string.match(stdout:match('(%d%.%d+)')*100, '(%d+)')
            local mic_muted     = stdout:match('MUTED')
            local mic_muted_int = muted and 1 or 0
            local mic_int       = tonumber(volume) -- integer 
            if mic_int ~= mic_old or mic_muted_int ~= mic_muted_old then
                awesome.emit_signal('signal::microphone', mic_int, mic_muted) -- integer
                mic_old       = mic_int
                mic_muted_old = mic_muted_int
            end
        end)
end

-- Refreshing
-------------
gears.timer {
    timeout     = 1,
    call_now    = true,
    autostart   = true,
    callback    = function()
        volume_emit()
        microphone_emit()
    end
}
