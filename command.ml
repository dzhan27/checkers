type coordinate = (string * string)

type move_phrase = string list

type command = 
  | Move of move_phrase 
  | Help 
  | Quit 

exception Empty

exception Malformed

let parse str = 
  let str_lst = String.split_on_char ' ' str in 
  match str_lst with 
  | [] -> raise Empty 
  | "quit" :: [] -> (Quit)
  | "move" :: t1 :: t2 :: [] -> (Move ([t1; t2]))
  | "help" :: [] -> (Help)
  | _ -> raise Malformed