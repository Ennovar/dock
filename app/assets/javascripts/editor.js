var module = require('jsoneditor');
function installJsonEditor(tag) {
  var container = document.getElementById(tag);
  var options = {};
  var editor = new JSONEditor(container, options);

  var json = {
    "Array": [1, 2, 3],
    "Boolean": true,
    "Null": null,
    "Number": 123,
    "Object": {"a": "b", "c": "d"},
    "String": "Hello World"
  };
  editor.set(json);
  var json = editor.get();
}
