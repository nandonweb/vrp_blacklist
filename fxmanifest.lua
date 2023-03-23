fx_version 'bodacious'
games { 'gta5' }

author 'Nando'
description 'https://github.com/nandonweb' 

client_scripts  {
    '@vrp/lib/utils.lua',
    'config/config-client.lua',
	'client.lua'
}

server_script  {
    '@vrp/lib/utils.lua',
    'config/config.lua',
	'server.lua'
}
