/* gramatica lexica */

%lex
%%

\s+                 /* se ignoran los espacios */
\#\#titulo          return 'TAG_TITULO'
\#\#texto           return 'TAG_TEXTO'
\"([^"])*?\"        return 'TAG_INPUT'
\#\#sino            return 'SINO'
\#\#check            return 'CHECK'
\#\#lista            return 'LISTA'
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
    : titulo contenido
        {
            $$ = CABECERA + $1 + $2 + FINAL;
        }
    ;

titulo
    : TAG_TITULO TAG_INPUT
        {
            var titu = $2.replace(/\"/g,"");
            $$ = P + MEN + "h1" + MAY + titu + MEN + "/h1" + MAY + P_FIN + SIG_LINEA;
        }
    ;
    
texto
    : TAG_TEXTO TAG_INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + P_FIN + SIG_LINEA;
        }
    ;
    
sino
    : SINO TAG_INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + SIG_LINEA + SINO_P + SINO_F + P_FIN + SIG_LINEA;
        }
    ;
    
check
    : CHECK TAG_INPUT
        {

        }
    ;
    
lista
    : LISTA TAG_INPUT
        {

        }
    ;

contenido
    : texto contenido { $$ = ($1 + $2);}
    | sino contenido { $$ = ($1 + $2);}
    | check contenido { $$ = ($1 + $2);}
    | lista contenido { $$ = ($1 + $2);}
    | /* no hay mas contenido */ { $$ = "";}
    ;


%%

var SIG_LINEA = "\n";
var MEN = "&lt;";
var MAY = "&gt;";
var P = MEN + "p" + MAY;
var P_FIN = MEN + "/p" + MAY;
var CABECERA = MEN + "html" + MAY + SIG_LINEA + MEN + "body" + MAY + SIG_LINEA;
var FINAL = MEN + "/body" + MAY + SIG_LINEA + MEN + "/html" + MAY + SIG_LINEA;
var SINO_P = "<br><input type='radio' name='sino' value='1'>Si";
var SINO_F = "<br><input type='radio' name='sino' value='2'>No";