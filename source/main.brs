sub RunScreenSaver()
    screen = CreateObject("roScreen")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)

    ' Load frames
    frames = []
    for i = 0 to 299 ' Adjust to how many frames you have
        frameNum = Right("000" + i.ToStr(), 3)
        framePath = "pkg:/images/ScreenSaver_" + frameNum + ".png"
        if FileExists(framePath)
            frames.Push(CreateObject("roBitmap", framePath))
        end if
    end for

    ' Loop playback
    while true
        for each frame in frames
            screen.DrawObject(0, 0, frame)
            screen.SwapBuffers()
            sleep(33) ' 100ms = 10 fps
        end for
    end while
end sub
