function silent_mkdir(){
    if [ ! -d $1 ]; then
        mkdir $1 && echo "$1 folder was created." || echo "$1 folder failed to be created."
    else
        echo ".oldrc backup usage folder already exists..."

    fi
}
function place_forward_conf()
{
    echo "Forward the $HOME/$1 to $HOME/.env/real/${1#.}"
    mv $HOME/$1 $HOME/.oldrc/
    cp $HOME/.env/symlink/$1 $HOME/
}


before_env="env"
after_env=".env"
cd $HOME
mv $before_env $after_env

silent_mkdir $HOME/.oldrc
echo "Old RC files will be backed up to $HOME/.oldrc before replaced new."
place_forward_conf .tmux.conf
place_forward_conf .vimrc
place_forward_conf .bashrc


# Forward the $HOME/.vim to $HOME/.env/.vim via symbolic link
if [ -d "$HOME/.vim" ]; then
    echo "Detected $HOME/.vim folder."
else
    echo "Making a link($HOME/.vim) to $HOME/${after_env}/vim ."
    mv $HOME/.vim $HOME/.oldrc/ && ln -s "$HOME/${after_env}/real/vim" "$HOME/.vim"
fi

