(netsh wlan show profiles) `
    | Select-String "\:(.+)$" `
    | ForEach-Object {$ssid=$_.Matches.Groups[1].Value.Trim(); $_} `
    | ForEach-Object {(netsh wlan show profile name="$ssid" key=clear)} `
    | Select-String "Key Content\W+\:(.+)$" `
    | ForEach-Object {$pass=$_.Matches.Groups[1].Value.Trim(); $_} `
    | ForEach-Object {[PSCustomObject]@{ SSID=$ssid;Pass=$pass }} `
    | Sort-Object SSID `
    | Out-GridView -Title "Wifi Passwords"