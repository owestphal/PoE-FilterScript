var button = document.getElementById("runFlc");

button.addEventListener("click", chooseFile);

var remote = require("remote");
var dialog = remote.require("dialog");

function chooseFile() {
  dialog.showOpenDialog(runFlc);
};

function runFlc(filename) {
  console.log(filename);
  var flc = require("child_process").exec("./flc " + filename, {cwd:"."},
    function (error, stdout, stderr){
      if (error == true) {
        console.log(stderr);
        alert(stderr);
      }
      else {
        console.log(stdout);
        alert(stdout.toString());
      }
    });
};
