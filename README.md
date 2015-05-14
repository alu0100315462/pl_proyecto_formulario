# Proyecto Final PL: Implementar un Lenguaje de Dominio Específico
#Grado en Ingeniería Informática ULL
##Procesadores de Lenguajes
###Lenguaje de diseño de formularios en HTML
Con nuestro proyecto hemos querido aplicar lo aprendido durante el curso para crear una web en la 
que, un no entendido del lenguaje HTML, pueda facilmente diseñar cualquier tipo de formulario y tener
disponible el código HTML de este para publicarlo en internet.
Para ello hemos diseñado ciertas reglas gramáticales que son interpretadas por un parser, que transforma 
lo recibido en otro lenguaje, en este caso HTML.

La sintaxis usada para este lenguaje de dominio específico es la siguiente:
<br>
  !title "Establece el título del formulario."
  <br>
  !description "Establece la descripción del formulario."
  <br>
  !description "Texto de explicacion de prueba."
  <br>
  !truefalse "Añade al formulario un tipo Verdadero/Falso."
  <br>
  !check "Añade al formulario un tipo chequear."
  <br>
  !insert "Añade al formulario un tipo insertar."
  <br>
  !list "Añade al formulario un tipo lista."
  <br>
  !number "Añade al formulario un tipo lista de numeros."
<br>
<a href="http://plproyectoformulario.herokuapp.com/">Ver la web en Heroku</a>
###AUTORES
<a href="http://alu0100315462.github.io/">Álvaro Suárez Chausson</a>
<br>
<a href="http://gcpmendez.github.io/">Germán Paz Méndez</a>
<br>
###TRAVIS.
<a href='https://travis-ci.org/alu0100315462/pl_proyecto_formulario'>
<img src='https://travis-ci.org/alu0100315462/pl_proyecto_formulario.svg?branch=gh-pages' alt='Build Status' /></a>