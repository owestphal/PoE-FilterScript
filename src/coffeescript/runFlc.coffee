button = document.getElementById "runFlc"
footer = document.getElementById "status"

platform = (require "os").platform()
exec = require("child_process").exec

runFlc = (args, callback) ->
  if platform is "win32" or platform is "win64"
    console.log "windows platform detected"
    exec "flc.exe " + args, {cwd:"."}, callback
  else
    console.log "linux/unix/os x platform detected"
    exec "./flc " + args, {cwd:"."}, callback
	

remote = require "remote"
dialog = remote.require "dialog"

chooseFile = () -> dialog.showOpenDialog compileFile

compileFile = (filename) ->
  runFlc filename, showResult

showResult = (e, stdout, stderr) ->
  if e isnt null
    console.log stderr
    alert stderr
  else
    console.log stdout
    alert stdout

button.addEventListener "click", chooseFile

version = runFlc "--version", (e, stdout, stderr) ->
  if e isnt null
    console.log "no version on flc found"
    console.log stderr
  else
    console.log "found flc version " + stdout
    footer.innerHTML = "flc v" + stdout
