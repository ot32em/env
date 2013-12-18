function silent_mkdir(){
    if [ ! -d $1 ]; then
        mkdir $1
        echo "$1 folder was created."
    else
        echo ".oldrc folder exists..."

    fi
}
function install_conf(){
    mv $HOME/$1 $HOME/.oldrc/
#    echo "$HOME/$1 was backed up to $HOME/.oldrc/$1"
    echo "Installing $HOME/$1."
    cp $HOME/env/install/$1 $HOME/
}


silent_mkdir $HOME/.oldrc
echo "Old RC files was backed up to $HOME/.oldrc"
install_conf .tmux.conf
install_conf .vimrc
install_conf .bashrc

if [ -d "$HOME/.vim" ]; then
    echo "Detected $HOME/.vim folder."
elif [ -h "$HOME/.vim" ]; then
    echo "Detected $HOME/.vim symbol link."
else
    echo "Making a link($HOME/.vim) to $HOME/env/vim ."
    ln -s "$HOME/env/vim" "$HOME/.vim"
fi

