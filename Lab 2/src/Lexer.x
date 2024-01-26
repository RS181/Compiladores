{
module Main where
}
%wrapper "basic"
--interface básica
--alexScanTokens :: String -> [Token]

--regexp definitions
$white = [\ \t\n\r]
$alpha = [_a-zA-Z]
$digit = [0-9]

tokens :-
$white+                         ; -- ignorar carateres brancos
if                          { \_ -> IF }
while                       { \_ -> WHILE}
for                         { \_ -> FOR}
int                         { \_ -> INT}
float                       { \_ -> FLOAT}
\(                          { \_ -> LPAREN}
\)                          { \_ -> RPAREN}
\{                          { \_ -> LBRACE}
\}                          { \_ -> RBRACE}
\,                          { \_ -> COMMA}
\;                          { \_ -> SEMICOLON}
$alpha($alpha|$digit)*      { \s -> ID s }
$digit+                     { \s -> NUM (read s) }
$digit+"."$digit+           { \s -> REAL (read s) }
-- versão abaixo é a tecnicamente correta mas o read falha em casos como 
-- .2 ou 1.
-- ($digit* "." $digit+) | ($digit+ "." $digit*)  {\s -> REAL (read s)  }
 \/\/.*                      ;   --comentario em linha
"/*" ([^\*]|[\r\n] |(\*+ ([^\*\/] | [\r\n])) )*\*+"/"                    ;--comentario multilinha(https://blog.ostermiller.org/finding-comments-in-source-code-using-regular-expressions/)


{
--token type
data Token = ID String       -- e.g. xy123
           | NUM Int         -- e.g. 123
           | REAL Float      -- e.g. 123.45
           | LPAREN          -- (
           | RPAREN          -- )
           | LBRACE          -- {
           | RBRACE          -- }
           | COMMA           -- ,
           | SEMICOLON       -- ;
           | IF              -- if
           | WHILE           -- while
           | FOR             -- for
           | INT             -- int
           | FLOAT           -- float
           deriving (Eq,Show)


main :: IO()
main = do 
    txt <- getContents
    print (alexScanTokens txt)
}