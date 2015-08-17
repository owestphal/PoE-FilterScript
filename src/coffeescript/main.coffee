app = require 'app'
BrowserWindow = require 'browser-window'

mainWindow = null

app.on 'window-all-closed', () -> app.quit()

platform = (require "os").platform()

app.on 'ready', () ->
  # using greater width and heigth for windows 
  w = if platform is "win32" or platform is "win64" then 156 else 143
  h = if platform is "win32" or platform is "win64" then 110 else 80
  
  mainWindow = new BrowserWindow
    useContendSize:true
    width:w
    height:h
    center:true
  mainWindow.setMenuBarVisibility false
  mainWindow.loadUrl 'file://' + __dirname + '/index.html'

  mainWindow.on 'closed', () -> mainWindow = null
