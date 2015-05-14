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
    : titulo texto
        {
            $$ = $1 + $2;
        }
    ;

titulo
    : TAG_TITULO TAG_INPUT
        {
            var titu = $2.replace(/\"/g,"");
            $$ = titu + "\n";
        }
    ;
    
texto
    : TAG_TEXTO TAG_INPUT
        {
            var text = $2.replace(/\"/g,"");
            $$ = text + "\n";
        }
    ;
    
/*
contenido
    : 
        {

        }
    ;
*/

%%
var SIG_LINEA = "\n";