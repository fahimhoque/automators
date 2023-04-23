#!/bin/bash

# Ask the user for the project name
function ask_project_name() {
    echo "Enter the name of your Flutter project:"
    read project_name
}

# Create the project
function create_project() {
    flutter create $project_name
}

# Ask the user if they want to delete some folders
function ask_delete_folders() {
    echo "Do you want to delete any of the following folders? Enter y/n for each folder."

    if [ -d "$project_name/web" ]; then
        read -p "Delete web/ folder? " delete_web
    fi

    if [ -d "$project_name/macos" ]; then
        read -p "Delete macos/ folder? " delete_macos
    fi

    if [ -d "$project_name/windows" ]; then
        read -p "Delete windows/ folder? " delete_windows
    fi

    if [ -d "$project_name/linux" ]; then
        read -p "Delete linux/ folder? " delete_linux
    fi
}

# Delete the selected folders
function delete_folders() {
    if [ "$delete_web" == "y" ] || [ "$delete_web" == "Y" ]; then
        rm -rf $project_name/web
    fi

    if [ "$delete_macos" == "y" ] || [ "$delete_macos" == "Y" ]; then
        rm -rf $project_name/macos
    fi

    if [ "$delete_windows" == "y" ] || [ "$delete_windows" == "Y" ]; then
        rm -rf $project_name/windows
    fi

    if [ "$delete_linux" == "y" ] || [ "$delete_linux" == "Y" ]; then
        rm -rf $project_name/linux
    fi
}

# Add app.dart and router.dart files in lib/
function add_lib_files() {
    echo "Adding app.dart and router.dart files in lib/"
    touch $project_name/lib/app.dart
    touch $project_name/lib/router.dart
}

# Create src/ folder and its subfolders
function create_src_folders() {
    echo "Creating src/ folder and its subfolders"
    mkdir $project_name/lib/src
    cd $project_name/lib/src
    mkdir pages components blocs services utilities models clients repos
}

# Add .gitkeep files to the newly created folders
function add_gitkeep_files() {
    echo "Adding .gitkeep files to the newly created folders"
    for folder in pages components blocs services utilities models clients repos; do
        touch $folder/.gitkeep
    done
}

# function init_git() {
#     git init

#     read -p "Do you want to add a remote origin? [y/n]" add_remote

#     if [ "$add_remote" == "y" ] || [ "$add_remote" == "Y" ]; then
#         read -p "Enter the remote origin path:" remote_origin
#         git remote add origin $remote_origin
#     fi
# }

# Ask the user for the project name
ask_project_name

# Create the project
create_project

ask_delete_folders
delete_folders
add_lib_files
create_src_folders
add_gitkeep_files


echo "Flutter project created successfully!"


