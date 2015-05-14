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