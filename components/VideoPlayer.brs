sub Init()
    m.video = m.top.findNode("video")
    m.osd = m.top.findNode("osd")
    m.playPauseBtn = m.top.findNode("playPauseBtn")
    m.rewindBtn = m.top.findNode("rewindBtn")
    m.forwardBtn = m.top.findNode("forwardBtn")
    m.titleLabel = m.top.findNode("titleLabel")
    m.timeLabel = m.top.findNode("timeLabel")
    m.flashToast = m.top.findNode("flashToast")
    m.flashText = m.top.findNode("flashText")

    m.video.observeField("state", "OnVideoStateChange")
    m.video.observeField("position", "OnPositionChange")
    m.vodDuration = 0
end sub

sub OnVideoStateChange()
    state = m.video.state
    if state = "playing"
        m.vodDuration = m.video.duration
        m.playPauseBtn.uri = "pkg:/images/ui/pause.png"
    else if state = "paused"
        m.playPauseBtn.uri = "pkg:/images/ui/play.png"
    end if
end sub

sub OnPositionChange()
    if m.video.position <> invalid and m.vodDuration > 0
        pos = Int(m.video.position)
        dur = Int(m.vodDuration)
        m.timeLabel.text = FormatTime(pos) + " / " + FormatTime(dur)
    end if
end sub

function FormatTime(totalSeconds as Integer) as String
    minutes = Int(totalSeconds / 60)
    seconds = totalSeconds MOD 60
    minStr = minutes.ToStr()
    secStr = seconds.ToStr()
    if minutes < 10 then minStr = "0" + minStr
    if seconds < 10 then secStr = "0" + secStr
    return minStr + ":" + secStr
end function

' Manejo del transporte (Avance, Retroceso y Pausa)
sub OnTransport(cmd as String)
    if cmd = "playpause"
        if m.video.state = "paused"
            m.video.control = "resume"
            FlashAV("Reproduciendo")
        else
            m.video.control = "pause"
            FlashAV("Pausa")
        end if
    else if cmd = "seekfwd"
        SeekBy(15) ' Avance de 15 segundos / capítulo
    else if cmd = "seekback"
        SeekBy(-15) ' Retroceso de 15 segundos / capítulo
    end if
    ShowOSD()
end sub

sub SeekBy(secs as Integer)
    posn = m.video.position
    if posn = invalid then posn = 0
    target = posn + secs
    if target < 0 then target = 0
    if m.vodDuration > 0 and target > m.vodDuration - 2 then target = m.vodDuration - 2
    m.video.seek = target
    if secs > 0
        FlashAV("Avance +15s")
    else
        FlashAV("Retroceso -15s")
    end if
end sub

sub FlashAV(text as String)
    m.flashText.text = text
    m.flashToast.visible = true
end sub

sub ShowOSD()
    m.osd.visible = true
end sub

' Mapeo de botones del control remoto
function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press
        if key = "fastforward" or key = "right"
            OnTransport("seekfwd")
            handled = true
        else if key = "rewind" or key = "left"
            OnTransport("seekback")
            handled = true
        else if key = "play" or key = "OK"
            OnTransport("playpause")
            handled = true
        end if
    end if
    return handled
end function
