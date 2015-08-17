app = require 'app'
BrowserWindow = require 'browser-window'

mainWindow = null

app.on 'window-all-closed', () -> app.quit()

app.on 'ready', () ->
  mainWindow = new BrowserWindow(
    width:143
    height:80
    resizable:false
    center:true)
  mainWindow.setMenuBarVisibility false
  mainWindow.loadUrl 'file://' + __dirname + '/index.html'

  mainWindow.on 'closed', () -> mainWindow = null
