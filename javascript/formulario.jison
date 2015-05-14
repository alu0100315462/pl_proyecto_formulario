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
            $$ = CABECERA + $1 + $2 + FINAL + SIG;
        }
    ;

titulo
    : TITLE INPUT
        {
            var titu = $2.replace(/\"/g,"");
            $$ = P + MEN + "h1" + MAY + titu + MEN + "/h1" + MAY + P_FIN + SIG;
        }
    ;
    
texto
    : DESCRIPTION INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + P_FIN + SIG;
        }
    ;
    
sino
    : TRUEFALSE INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = P + text + SIG_LINEA + SINO_P + SIG_LINEA + SINO_F + P_FIN + SIG;
        }
    ;
    
check
    : CHECK INPUT
        {
            var text = $2.replace(/\"/g,"");
            var result = text.split(";");
            $$ = P + result[0] + SIG_LINEA ;
            for (i = 1; i < (result.length); i++) {
                $$ += CHECK_P + i;
                $$ += CHECK_F + result[i] + SIG_LINEA;
            }
            $$ += P_FIN + SIG;
        }
    ;
    
lista
    : LISTA INPUT
        {

        }
    ;

contenido
    : texto contenido { $$ = ($1 + $2);}
    | sino contenido  { $$ = ($1 + $2);}
    | check contenido { $$ = ($1 + $2);}
    | lista contenido { $$ = ($1 + $2);}
    | /* no hay mas contenido */ { $$ = "";}
    ;


%%

var SIG_LINEA = "<br>";                   
var SIG = "\n";                         /* \n */
var MEN = "&lt;";                       /* < */
var MAY = "&gt;";                       /* > */
var P = MEN + "p" + MAY;                /* <p> */
var P_FIN = MEN + "/p" + MAY;           /* </p> */
var CABECERA = MEN + "html" + MAY + SIG + MEN + "body" + MAY + SIG;
var FINAL = MEN + "/body" + MAY + SIG + MEN + "/html" + MAY + SIG;
var SINO_P = "<input type='radio' name='sino' value='1'>Si";
var SINO_F = "<input type='radio' name='sino' value='2'>No";
var CHECK_P = "<input type='checkbox' name='check' value='";
var CHECK_F = "'>";
