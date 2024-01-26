{
-- Analisador lexical para a calculador simples
module Lexer where
}
%wrapper "basic"
$digit = [0-9]


tokens :-

$white+                  ;   -- ignorar carateres "brancos"
$digit+                 { \s -> TOK_NUM (read s) }
$digit+"."$digit+       { \s -> TOK_NUM (read s) }
"+"                     { \_ -> TOK_PLUS }
"-"                     { \_ -> TOK_MINUS }
"*"                     { \_ -> TOK_MUL }
"/"                     { \_ -> TOK_DIV }
"("                     { \_ -> TOK_LPAREN }
")"                     { \_ -> TOK_RPAREN }
"sqrt"                  { \_ -> TOK_SQRT }
"exp"                   { \_ -> TOK_EXP }
"log"                   { \_ -> TOK_LOG } 


-- completar as regras de tokens

{

data Token 
    = TOK_NUM  Float -- completar a definição dos tokens
    | TOK_PLUS    
    | TOK_MINUS
    | TOK_MUL
    | TOK_DIV
    | TOK_LPAREN
    | TOK_RPAREN
    | TOK_SQRT
    | TOK_EXP 
    | TOK_LOG

}
