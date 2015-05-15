var assert = chai.assert;

suite('Generador de formularios', function() {

  setup(function(){
    if (typeof __html__ !== 'undefined') {
      document.body.innerHTML = __html__['public/tests/index.html'];
    }
  });
  
    test("Prueba de !title", function() {
      var result;
      result = formulario.parse("!title 'Titulo de prueba');
      return assert.deepEqual(result, "<p><h1>Titulo de prueba</h1></p>");
    });
});
