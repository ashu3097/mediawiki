#!/bin/bash

# Get the current user's username
username=$(whoami)

# Navigate to the user's home directory
cd /home/$username

# Download MediaWiki tarball
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz

# Download the GPG signature for the tarball
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz.sig

# get the gpgkeys as bundle
wget https://www.mediawiki.org/keys/keys.txt

# Verify the tarball's integrity
gpg --verify mediawiki-1.41.1.tar.gz.sig mediawiki-1.41.1.tar.gz
~                                        
