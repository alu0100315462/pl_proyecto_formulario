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
      result = parser.parse('!title "Titulo de prueba"\n!description "Texto de explicacion de prueba."\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Texto de explicacion de prueba.&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
    
    test("Prueba de !truefalse", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n!truefalse "Pregunta de tipo si/no."\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Pregunta de tipo si/no.<br><input type=\'radio\' name=\'sino\' value=\'1\'>Si<br><input type=\'radio\' name=\'sino\' value=\'2\'>No&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
    
    test("Prueba de !check", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n!check "Pregunta tipo check.;Opcion 1;Opcion 2; Opcion 3"\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Pregunta tipo check.<br><input type=\'checkbox\' name=\'check\' value=\'1\'>Opcion 1<br><input type=\'checkbox\' name=\'check\' value=\'2\'>Opcion 2<br><input type=\'checkbox\' name=\'check\' value=\'3\'> Opcion 3<br>&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
    
    test("Prueba de !insert", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n!insert "La capital de España es _ y posee _ habitantes."\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;La capital de España es <input type=\'text\' name=\'enter\'> y posee <input type=\'text\' name=\'enter\'> habitantes.&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
    
    test("Prueba de !list", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n!list "Probando las listas:;lista 1;lista 2;lista 3"\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Probando las listas:<br><select name=\'lista\'><option>lista 1</option><option>lista 2</option><option>lista 3</option></select>&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
    
    test("Prueba de !number", function() {
      var result;
      result = parser.parse('!title "Titulo de prueba"\n!number "Introduzca su edad:;1900;1980"\n');
      return assert.deepEqual(result, '<html>\n<head><meta charset=\'utf-8\'></head>\n<body>\n&lt;p&gt;&lt;h1&gt;Titulo de prueba&lt;/h1&gt;&lt;/p&gt;\n&lt;p&gt;Introduzca su edad:<br><input id=\'amount\' name=\'amount\' type=\'number\' min=\'1900\' pattern=\'[1-9]*\' value=\'1980\'><br>&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n\n');
    });
});
