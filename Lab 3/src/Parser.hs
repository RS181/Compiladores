{-
  Exercício 3:

  Considere a gramática para expressões aritméticas:

  E -> T  E' 
  E' -> + T E' 
  E' -> - T E'
  E' -> 

  T  -> F T'
  T' -> * F T'
  T' -> / F T'
  T' -> 

  F -> num
  F -> ( E ) 

 Implemente um *parser* para esta gramática usando descida recursiva.
-}

module Parser where

import Lexer

--
-- | parser de expressões; corresponde ao não-terminal E
-- 1) consumir *tokens* 
-- 2) retornar os *tokens* que sobram
-- 3) em caso de erro: invocar parseError
--
-- completar esta definição inicial (que termina imediatamente sem consumir nada)
-- necessita ainda de funções extra parseE', parseT, etc.
-- para para cada um dos não-terminais
--


-- função auxiliar para consumir um token específico ou terminar com erro
consume :: Token -> [Token] -> [Token]
consume tok (t:ts) | tok == t = ts
consume tok ts                = parseError ts
  
parseError :: [Token] -> a
parseError toks = error ("parse error at " ++ show toks)


parseE :: [Token] -> [Token]
parseE toks = let toks1 = parseT toks 
              in          parseE' toks1

parseE' :: [Token] -> [Token]
parseE' [] = []    --Representa a palavra vazia
parseE' (first:toks) = case first of 
  PLUS -> let toks1 = parseT toks 
          in          parseE' toks1
  MINUS ->let toks1 = parseT toks 
          in          parseE' toks1
  _ -> first:toks   --não é erro pq existe  produção de palavra vazia
  

parseT :: [Token] -> [Token]
parseT toks = let toks1 = parseF toks 
              in          parseT' toks1 

parseT' :: [Token] -> [Token]
parseT' [] = []  --Representa a palavra vazia
parseT' (first:toks) = case first of 
  MULT -> let toks1 = parseF toks 
          in          parseT' toks1
  DIV -> let toks1 = parseF toks
          in         parseT' toks1 
  _   -> first:toks  --não é erro pq existe  produção de palavra vazia

parseF :: [Token] -> [Token]
parseF (first:toks) = case first of 
  NUM -> toks 
  LPAREN -> let toks1 = parseE toks
            in  consume RPAREN toks1 --tenho que consumir o token (ver exemplo nos slides Aula5 parecido)
  _ -> error "syntax error"




{-
output1 ✅
output2 ✅ 
output3 ✅
output4 ✅
output5 ✅
-}