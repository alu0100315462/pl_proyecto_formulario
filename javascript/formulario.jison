/* gramatica lexica */

%lex
%%

\s+                 /* se ignoran los espacios */
\!title             return 'TITLE'
\!description       return 'DESCRIPTION'
\!truefalse         return 'TRUEFALSE'
\!check             return 'CHECK'
\!lista             return 'LISTA'
\"([^"])*?\"        return 'INPUT'
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
    : TITLE INPUT
        {
            var titu = $2.replace(/\"/g,"");
            $$ = P + MEN + "h1" + MAY + titu + MEN + "/h1" + MAY + P_FIN + SIG_LINEA;
        }
    ;
    
texto
    : DESCRIPTION INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + P_FIN + SIG_LINEA;
        }
    ;
    
sino
    : TRUEFALSE INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + SIG_LINEA + SINO_P + SINO_F + P_FIN + SIG_LINEA;
        }
    ;
    
check
    : CHECK INPUT
        {

        }
    ;
    
lista
    : LISTA INPUT
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