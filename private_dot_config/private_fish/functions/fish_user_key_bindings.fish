function fish_user_key_bindings
    fish_vi_key_bindings
    fzf_key_bindings

    bind --mode insert --sets-mode default jj repaint
end
