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
    function (err, stdout, stderr){
      alert(stdout.toString());
      console.log(stdout);
      console.log(stderr);
    });
};
