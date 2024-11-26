#!/bin/bash

# this script is run once inside the developer container at creation time

# copy in the opinionated default settings from the feature
cp $CONFIG_STAGING/feature_settings_rc $CONFIG_FOLDER/feature_settings_rc

# copy in the user editable settings unless they already exist
if [[ ! -f $CONFIG_FOLDER/bashrc ]] ; then
    cp $CONFIG_STAGING/bashrc $CONFIG_FOLDER
    cp $CONFIG_STAGING/inputrc $CONFIG_FOLDER
fi

# hook in the config to the root account
ln -s $CONFIG_FOLDER/inputrc /root/.inputrc
echo "source $CONFIG_FOLDER/bashrc" >> /root/.bashrc