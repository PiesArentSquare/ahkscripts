term(elevated){
    term_window_id := WinExist('ahk_exe WindowsTerminal.exe')
    window_already_exists := term_window_id > 0

    if window_already_exists == True {
        active_window_id := WinExist('A')
        window_is_active := active_window_id == term_window_id

        term_id := Format('ahk_id {1}', term_window_id)

        if window_is_active {
            WinMinimize term_id
        } else {
            WinActivate term_id
            WinShow term_id
        }
    } else {
        if elevated == True {
            Run '*RunAs wt'
        } else
            Run 'wt'
    }
}

^!t::term False
^+!t::term True