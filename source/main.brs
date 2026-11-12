' Punto de entrada principal para Roku BrightScript
sub Main(args as Dynamic)
    showChannelSGScreen(args)
end sub

sub showChannelSGScreen(args as Dynamic)
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.SetMessagePort(m.port)
    
    scene = screen.CreateScene("MainScene")
    screen.show()
    
    if args <> invalid and args.contentId <> invalid
        scene.jumpToItem = args.contentId
    end if
    
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
