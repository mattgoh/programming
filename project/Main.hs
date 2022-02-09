module Main where
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

data LispVal = Atom String -- Atom stores string naming atom
    | List [LispVal]
    | DottedList [LispVal] LispVal
    | Number Integer
    | String String
    | Bool Bool

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces :: Parser ()
spaces = skipMany1 space

readExpr :: String -> String -- string function returns string
readExpr input = case parse (spaces >> symbol) "lisp" input of
    Left err -> "No match: " ++ show err -- Left constructor indicates error
    Right val -> "Found value"           -- Right constructor indicates normal value

main :: IO ()
main = do
    (expr:_) <- getArgs
    putStrLn (readExpr expr)
