/* gramatica lexica */

%lex
%%

\s+                 /* se ignoran los espacios */
\!title             return 'TITLE'
\!description       return 'DESCRIPTION'
\!truefalse         return 'TRUEFALSE'
\!check             return 'CHECK'
\!insert            return 'INSERT'
\!list              return 'LIST'
\!number            return 'NUMBER'
\"(\\.|[^"])*?\"    return 'INPUT'
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
    
list
    : LIST INPUT
        {
            var text = $2.replace(/\"/g,"");
            var result = text.split(";");
            
            $$ = P + result[0] + SIG_LINEA + LISTA_L ;
            for (i = 1; i < (result.length); i++) {
                $$ += OPTION_L + result[i] + OPTION_R;
            }
            $$ += LISTA_R + P_FIN + SIG;
        }
    ;

insert
    : INSERT INPUT
        {
            var text = $2.replace(/\"/g,"");
            var result = text.split("_");
            
            $$ = P + result[0];
            for (i = 1; i < (result.length); i++) {
                $$ += ENTER + result[i];
            }
            $$ += P_FIN + SIG;
        }
    ;

number
    : NUMBER INPUT
        {
            var text = $2.replace(/\"/g,"");
            var result = text.split(";");
            $$ = P + result[0] + SIG_LINEA ;

            $$ += NUMBER_P + result[1];
            $$ += NUMBER_F + result[2] + "'>" + SIG_LINEA;
            $$ += P_FIN + SIG;
        }
    ;

contenido
    : texto contenido { $$ = ($1 + $2);}
    | sino contenido  { $$ = ($1 + $2);}
    | check contenido { $$ = ($1 + $2);}
    | list contenido { $$ = ($1 + $2);}
    | insert contenido { $$ = ($1 + $2);}
    | number contenido { $$ = ($1 + $2);}
    | /* no hay mas contenido */ { $$ = "";}
    ;


%%

var SIG_LINEA = "<br>";                   
var SIG = "\n";                         /* \n */
var MEN = "&lt;";                       /* < */
var MAY = "&gt;";                       /* > */
var P = MEN + "p" + MAY;                /* <p> */
var P_FIN = MEN + "/p" + MAY;           /* </p> */
var CABECERA = "<html>" + SIG + "<head><meta charset='utf-8'></head>" + SIG + "<body>" + SIG;
var FINAL = MEN + "/body" + MAY + SIG + MEN + "/html" + MAY + SIG;
var SINO_P = "<input type='radio' name='sino' value='1'>Si";
var SINO_F = "<input type='radio' name='sino' value='2'>No";
var CHECK_P = "<input type='checkbox' name='check' value='";
var CHECK_F = "'>";

/* !insert */
var ENTER = "<input type='text' name='enter'>";

/* !list */
var LISTA_L = "<select name='lista'>";
var OPTION_L = "<option>";
var OPTION_R = "</option>";
var LISTA_R = "</select>";

/* !number */
var NUMBER_P = "<input id='amount' name='amount' type='number' min='";
var NUMBER_F = "' pattern='[1-9]*' value='";
