var assert = chai.assert;

suite('Generador de formularios', function() {

  setup(function(){
    if (typeof __html__ !== 'undefined') {
      document.body.innerHTML = __html__['public/tests/index.html'];
    }
  });
  
    test("Prueba de !title", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n');
      return assert.deepEqual(result, "<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n");
    });
    
    test("Prueba de !description", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n !description "Texto de explicacion de prueba."\n');
      return assert.deepEqual(result, "<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Texto de explicacion de prueba.&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n");
    });
    
});
