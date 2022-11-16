fx_version'cerulean'
game'gta5'

author'At0m_.'
description'Scoreboard'
version'1.0.0'

lua54        'yes'
license      'GPL-3.0-or-later'

ui_page'ui/dist/index.html'

server_scripts ({
    "@oxmysql/lib/MySQL.lua",
    'server.lua'
})

shared_script {
    '@es_extended/imports.lua',
    'config.lua'
}

client_script {
    'client.lua',
}

files{
    'ui/dist/**'
}

dependency '/assetpacks'