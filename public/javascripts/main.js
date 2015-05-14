$(document).ready(function () {
  $('#BOT_GENERAR').click(function () {
    try {
      var result = parser.parse($('#TA_INPUT').val())
      $('#TA_OUTPUT').html(result);
    } catch (e) {
      $('#TA_OUTPUT').html(String(e));
    }
  });
});


$(document).ready(function () {
  $('#BOT_DESCARGAR').click(function saveTextAsFile()
{
    var textToWrite = $('#TA_OUTPUT').val();
    var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
    var fileNameToSaveAs = "formulario.html"

    var downloadLink = document.createElement("a");
    downloadLink.download = fileNameToSaveAs;
    downloadLink.innerHTML = "Download File";
    if (window.webkitURL != null)
    {
        // Chrome allows the link to be clicked
        // without actually adding it to the DOM.
        downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
    }
    else
    {
        // Firefox requires the link to be added to the DOM
        // before it can be clicked.
        downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
        downloadLink.onclick = destroyClickedElement;
        downloadLink.style.display = "none";
        document.body.appendChild(downloadLink);
    }

    downloadLink.click();
});
});


$(document).ready(function () {
  $('#BOT_PESTANA').click(function () {
//output = 'Hello, World!';
//window.open().document.write(output);
output = $('#TA_OUTPUT').val();
window.open().document.write(output);
   //   var result = $('#TA_OUTPUT').val()
//var OpenWindow = window.open("formulario.html", "mywin", '');
  //      OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
    //    OpenWindow.init();
  });
});