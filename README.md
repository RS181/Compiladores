# Compiladores &mdash; Trabalho Laboratorial

## Compilador para a Linguagem C0 

Prentende-se que implementem um compilador básico da *linguagem C0*,
um dialeto da linguagem C para ensino desenvolvido em CMU.  O
compilador deverá ler código fonte C0 e gerar linguagem *assembly*
MIPS.

Consultar a [documentação](trabalho.pdf) para mais informação.

---

## Grupo 2
### Componentes
- up202201926 Carla Henriques
- up202109728 Rui Santos

### Apresentação
- Quarta-feira, 08 de Novembro de 2023, 9h.

---
## Testes

Os testes estão na diretoria `/tests`.

Cada ficheiro de teste tem o nome `input$.txt`.
Dentro de cada ficheiro dissemos o que que é testado, e se é um exemplo *NEGATIVO* ou *POSITIVO*.

Para correr os testes executar (por exemplo para o teste número 4):
- `cabal build`
- `cabal run < tests/input4.txt`

Alternadamente executar:
- `cabal build`
- `cabal run < tests/input4.txt | diff - tests/output4.txt`