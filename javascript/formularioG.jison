/* Analizador Lexico: recibimos una entrada y devolvemos el tokens asociado */

%lex
%%

\s+                 /* Ignoramos espacios en blanco al no devolver nada */
\!Title             return 'TITLE'
\!Date              return 'DATE'
\!Description       return 'DESCRIPTION'
\!Question          return 'QUESTION'
\!TrueFalse         return 'TRUEFALSE'
\!Error             return 'ERROR'
\"(\\.|[^"])*?\"    return 'TEXT'

/* La entrada que más absorbe se pone al final, en este caso es el token TEXT */

/* Seccion de inicializer, hemos creado un objeto que contiene todas las palabras reservadas. */
/* Si la palabra reservada esta en este objeto la devolvemos */
/lex


/* Gramática del lenguaje */

%start S
%%

S: TITULO FECHA DESCRIPCION PREGUNTAS
    { console.log($$); }
;

TITULO: TITLE
    { console.log($$); }
;

FECHA: 
    { console.log($$); }
;

DESCRIPCION:
    { console.log($$); }
;

PREGUNTAS:
    { console.log($$); }
;

%%

function generarHTML(resulthtml) {
    return resulthtml;
}
