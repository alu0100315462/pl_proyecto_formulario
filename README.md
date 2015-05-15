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
  <b>!title</b> "Titulo de prueba"
  <br>
  <b>!description</b> "Texto de explicacion de prueba."
  <br>
  <b>!truefalse</b> "Pregunta de tipo si/no."
  <br>
  <b>!check</b> "Pregunta tipo check.;Opcion 1;Opcion 2; Opcion 3"
  <br>
  <b>!insert</b> "Añade al formulario _ un tipo insertar _ para introducir texto en los guiones bajos."
  <br>
  <b>!list</b> "Añade al formulario una lista;lista 1;lista 2;lista 3"
  <br>
  <b>!number</b> "Añade al formulario un selector de numeros;numero minimo;numero predeterminado"
<br>
<br>
<a href="http://plproyectoformulario.herokuapp.com/">VER LA WEB EN HEROKU</a>
###AUTORES
<a href="http://alu0100315462.github.io/">Álvaro Suárez Chausson</a>
<br>
<a href="http://gcpmendez.github.io/">Germán Paz Méndez</a>
<br>
###TRAVIS.
<a href='https://travis-ci.org/alu0100315462/pl_proyecto_formulario'>
<img src='https://travis-ci.org/alu0100315462/pl_proyecto_formulario.svg?branch=gh-pages' alt='Build Status' /></a>