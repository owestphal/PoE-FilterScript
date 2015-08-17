button = document.getElementById "runFlc"
footer = document.getElementById "status"

runFlc = (args, callback) ->
  flc = require("child_process").exec "./flc " + args, {cwd:"."}, callback

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
    console.log stderr
  else
    console.log "found flc version " + stdout
    footer.innerHTML = "flc v" + stdout
