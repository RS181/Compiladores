{-
  Um analisador lexical simples em Haskell
  Pedro Vasconcelos, 2022
-}
module Main where

import Data.Char (isDigit, isSpace, isAlpha, isAlphaNum)

-- Tipo algébrico para tokens;
-- alguns dos casos ainda não estão implementados
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

--
-- transformar lista de carateres numa lista de tokens
--
lexer :: [Char] -> [Token]
lexer [] = []
lexer (',':xs) = COMMA : lexer xs
lexer (';':xs) = SEMICOLON : lexer xs 
lexer ('(':xs) = LPAREN : lexer xs
lexer (')':xs) = RPAREN  : lexer xs
lexer ('{':xs) = LBRACE : lexer xs
lexer ('}':xs) = RBRACE : lexer xs      --todo CONFIRMAR TRATAMENTO DE COMENTARIOS
lexer ('/':'/':xs) = lexer (dropWhile (/= '\n') xs)             -- ! o '\\'  vem antes do \n , portanto temos de por no dropWhile /= '\\' em vez de /= '\n' (da erro)
lexer ('\\':xs) = lexer (drop 1 xs)                 -- xs = "ola \n adeus"   , se estivesse assim definido : lexer xs => [ID "ola",ID "n", ID "adeus" ] (evitei isto com o drop 1 xs )
lexer ('\n':xs) = lexer xs 
lexer ('\r':xs) = lexer xs 

lexer ('/':'*':xs)                      --supondo que é invalido ter '*' da seguinte forma /* (...) * (...)  */
  | take 2 xs' == "*/" = lexer xs''    
  where 
    xs' = dropWhile (/='*') xs 
    xs'' = drop 2 xs' 

lexer (x:xs)
  | isSpace x = lexer xs        -- consumir carateres brancos 
      

lexer (x:xs) 
  | take 1 xs'' == "." = REAL (read (x:xs''')) : lexer xs''''                    --todo  CONFIRMAR ESTA LINHA e xs''' e xs'''' , da erro com ".3" 
  | isDigit x = NUM (read (x:xs')) : lexer xs''
  where 
    xs'   = takeWhile isDigit xs
    xs''  = dropWhile isDigit xs
    xs''' =                                                                     
      takeWhile isDigit xs ++                                   --apanha os primeiros digitos antes da virgula
      takeWhile (\a -> a /= ' ' ) (dropWhile (isDigit) xs  )    --apanha o resto dos digitos apos a virgula
    xs''''=  
      dropWhile (\a -> a /= ' ' ) (dropWhile (isDigit) xs)      --"123.14 etc.." -> apanha o etc... 

lexer (x:xs)
  | isAlpha x || x == '_'  = lexerText (x:xs') : lexer xs''        --letras e _ 
  where 
    xs' = takeWhile (\a ->isAlphaNum a || a == '_') xs          --todo CONFITMAR ESTAS DUAS LINHAS
    xs''= dropWhile (\a ->isAlphaNum a || a == '_') xs
     
lexer (x:_)       -- outros carateres: erro
  = error ("invalid character: " ++ show x)


-- função auxiliar para distinguir palavras reservadas de identificadores
lexerText :: String -> Token
lexerText "if" = IF
lexerText "while" = WHILE
lexerText "for" = FOR
lexerText "int" = INT
lexerText "float" = FLOAT
lexerText xs   = ID xs



-- ler toda a entrada e imprimir a lista de tokens
main :: IO ()
main = do
  txt <- readFile "../tests/input5.txt"   --Leitura apartir de um ficheiro 
  --txt <- getContents
  print (lexer txt)

  
{-
output1 ✅
output2 ✅ 
output3 ✅
output4 ✅
output5 ✅ 
-}