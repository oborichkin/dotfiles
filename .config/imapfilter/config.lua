options.timeout = 120
options.subscribe = true
options.charset = 'UTF-8'

status, password = pipe_from('bw get password oborin_p@protei-lab.ru')
protei = IMAP {
    server = 'imap.protei-lab.ru',
    username = 'oborin_p@protei-lab.ru',
    password = password,
    port = 993,
    ssl = 'ssl3'
}

protei.Inbox:check_status()
mailboxes, folders = protei:list_subscribed()
results = protei.Inbox:select_all()

youtrack = protei.Inbox:contain_from('youtrack@protei.ru')
youtrack:move_messages(protei['Inbox/YouTrack'])

teamcity = protei.Inbox:contain_from('TeamCity@protei.ru')
teamcity:move_messages(protei['Inbox/TeamCity'])

gitlab = protei.Inbox:contain_from('gitlab@protei.ru')
gitlab:move_messages(protei['Inbox/GitLab'])
