function enter_re --wraps='nix develop $HOME/source/practice/ctf/env/re/ --command fish' --description 'alias enter_re=nix develop $HOME/source/practice/ctf/env/re/ --command fish'
  nix develop $HOME/source/practice/ctf/env/re/ --command fish $argv
end
