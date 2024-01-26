{-
  Exercícios para a Aula Laboratorial 1

  Escrever um interpretador em Haskell da sintaxe abstrata de
  programas sequenciais.

  Pedro Vasconcelos, 2022.

  Baseado num exercício do livro "Modern Compiler Implementation in
  ML", A. Appel.
-}

module Interpreter where
import Data.Char
import Data.List
--
-- sintaxe abstrata de programas sequenciais
--
type Ident = String  -- identificadores (nomes de variaveis)

data BinOp = Plus | Minus | Times | Div -- operações binárias
           deriving (Eq, Show)

data Stm = AssignStm Ident Exp   -- ident = exp
         | IncrStm Ident         -- ident++
         | CompoundStm Stm Stm   -- stm1; stm2
         deriving (Eq, Show)

data Exp = IdExp Ident           -- x, y, z ..
         | NumExp Int            -- 123
         | Num Int               -- todo (Adicionei pq acho que e precisso para exercicio 2)
         | OpExp Exp BinOp Exp   -- e1+e2, e1*e2, ...
         deriving (Eq, Show)


{- Exercício 1. 

todo CONFIRMAR E VER SE O OUTPUT ESTA NO FORMATO ESPERADO!!

Escrever duas funções recursivas para listar todos os identificadores
em comandos e expressões.

NOTA: escreva uma equação para cada construtor da sintaxe abstrata
acima. A função idsStm deve chamar idsExpr os comandos contêm sub-expressões.
-}

remove_dup :: [Ident] -> [Ident]    --remove duplicados
remove_dup list = ans
    where
      aux = nub (concat (list))     --lista sem duplicados 
      ans = [x:[] | x <- aux]

idsStm :: Stm -> [Ident]
idsStm (AssignStm id expr) =      --casos base
  [id] ++ idsExp expr    

idsStm (IncrStm id) = [ ]

idsStm (CompoundStm stm1 stm2) =  --caso recursivo
  remove_dup(idsStm stm1 ++ idsStm stm2) 


idsExp :: Exp -> [Ident]  
idsExp (IdExp "") = []            --casos base 
idsExp (IdExp a) = [a]          
idsExp (NumExp _) = []
idsExp (Num _) = []

idsExp (OpExp expr1 op expr2) =   --caso recursivo
  idsExp expr1 ++ idsExp expr2  

-- NB: o que acontece se um identificador ocorrer mais do que uma vez?
--todo (CONFIRMAR) R: exemplo ->  (OpExp (IdExp "a") Times (IdExp "a")) devolve ["a","Times","a"]


{- Exercício 2: um interpretador funcional 

Escreva duas funções mutuamente recursivas para interpretar comandos
e expressões.

Represente tabelas associações de valores (inteiros) aos
identificadores como listas de pares.
Por exemplo, a lista [("x", 2), ("y", 0)] associa x -> 2, y -> 0.

Sugestões: use a função do prelúdio

lookup :: Eq a => a -> [(a,b)] -> Maybe b

para procurar o valor (se existir) associado a um identificador.
-}

type Table = [(Ident, Int)]    

        
interpStm :: Stm -> Table -> Table
interpStm (AssignStm id expr) t = new_t     -- caso base (var = qq coisa)
  where 
    value = (interpExp  expr t)             --valor 
    new_t = (update id value t)             -- Atualização da tabela

interpStm (IncrStm id) t = new_t            -- var++
  where 
    value = (get_value id t) + 1
    new_t = (update id value t)


interpStm (CompoundStm stm1 stm2) t = interpStm stm2 t'
  where 
    t'= interpStm stm1 t 

update :: Ident -> Int ->Table -> Table         --atualiza o valor associado a um ident. na tabela 
update id val t 
  | lookup id t == Nothing = t ++ [(id,val)]    --nova par var->valor
  | length t == 0  = []
  | id == fst(head t) = [(id,val)] ++ tail t 
  | otherwise = [head t] ++ (update id val (tail t ))


interpExp :: Exp -> Table -> Int     --Modificar para Int 
interpExp (expr) (t) = eval str2
  where
    str1 = translate_expr expr 
    str2 = switch_values  (str1) (t)


eval :: String -> Int                 -- "2+3+4" -> 9 (exemplo)
eval str 
  | aux2 == "" = read(str)::Int
  | str == "" = 0
  | op == "+" = val + (eval rest)
  | op == "-" = val - (eval rest)
  | op == "*" = val * (eval rest)
  | op == "/" = div (val)  (eval rest)
  where
    aux  = takeWhile (isDigit) str 
    val  = (read aux) :: Int
    aux2 = dropWhile (isDigit) str 
    op = take 1 aux2 
    rest = tail aux2 


translate_expr :: Exp -> String         -- Expressao -> string "legivel"  
translate_expr (IdExp a) = a  
translate_expr (NumExp a) = show(a) 
translate_expr (Num a) = show(a)
translate_expr (OpExp e1 op e2) 
  | op == Plus = translate_expr e1 ++ "+" ++ translate_expr e2 
  | op == Minus = translate_expr e1 ++ "-" ++ translate_expr e2 
  | op == Times = translate_expr e1 ++ "*" ++ translate_expr e2 
  | op == Div = translate_expr e1 ++ "/" ++ translate_expr e2
  | otherwise = error  "INPUT INVALIDO"


get_value :: Ident -> Table -> Int        -- vai buscar o valor de um variavel em concreto
get_value var t 
  | lookup var t == Nothing = error "Não existe esta variavel na tabela associações"
  | otherwise = snd assoc
  where 
    assoc = (filter (\(x,y) -> x == var) t)!!0   -- associação var -> ass


switch_values :: Ident -> Table -> Ident   -- substitui a var por o seu valor
switch_values x [] = x                    --caso tabela seja vazia
switch_values [] _ = []
switch_values (x:xs) t
  | isAlpha x = show ((get_value  (x:[]) t))  ++ ( switch_values xs t) 
  | otherwise = x : (switch_values(xs) t )