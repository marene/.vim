import os
import urllib2 as url
import yaml
import sqlite3

home = os.environ['HOME']
sqliteDb = home + "/.vpm.db"
with sqlite3.connect(sqliteDb) as db:
	pageContent = url.urlopen("http://vim-scripts.org/api/scripts_recent.json").read()
	pluginsList = [(plugin['n'].lower(), "https://github.com/vim-scripts/" + plugin['n']) for plugin in yaml.safe_load(pageContent)] # any risks of sql injection by using those ?

	print(pluginsList)
	cursor = db.cursor()
	cursor.execute("""
		CREATE TABLE IF NOT EXISTS plugins(
			id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
			name TEXT NOT NULL,
			url TEXT NOT NULL
		)
	""") # Will add tags/ commit/ version/ other field to identify version of plugin
	db.commit()

	cursor.executemany("""
		INSERT INTO plugins (name, url)
		values(?, ?)
	""", pluginsList)
	db.commit()
