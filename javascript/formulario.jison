/* gramatica lexica */

%lex
%%

\s+                 /* se ignoran los espacios */
\#\#titulo          return 'TAG_TITULO'
\#\#texto           return 'TAG_TEXTO'
\"([^"])*?\"        return 'TAG_INPUT'
<<EOF>>             return 'EOF'

/lex



%start formulario

%%

/* gramatica del lenguaje */


formulario
    : f EOF
        {
            return $1;
        }
    ;
    
f
    : titulo texto /*contenido*/
        {
            $$ = CABECERA + $1 + $2 + FINAL;
        }
    ;

titulo
    : TAG_TITULO TAG_INPUT
        {
            var titu = $2.replace(/\"/g,"");
            $$ = P + < + "h1" + > + titu + < + "/h1" + > + P_FIN;
        }
    ;
    
texto
    : TAG_TEXTO TAG_INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + P_END;
        }
    ;
    
/*
contenido
    : 
        {

        }
    ;
*/


var SIG_LINEA = "\n";
var < = "&lt;";
var > = "&gt;";
var P = < + "p" + >;
var P_FIN = < + "/p" + >;
var CABECERA = < + "html" + > + SIG_LINEA + < + "body" + > + SIG_LINEA;
var FINAL = < + "/body" + > + SIG_LINEA + < + "/html" + > + SIG_LINEA;