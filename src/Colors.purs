module Colors where

data Color =
  Black | White | Red
  | RGB Int Int Int
  | CMYK { cyan :: Int, magenta :: Int, yellow :: Int } Number