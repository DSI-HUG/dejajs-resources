VERSION=$(cat package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g')

git tag $VERSION

# Get the deploy key by using Travis's stored variables to decrypt id_rsa.enc
# ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
# ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
# ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
# ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
# openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in id_rsa.enc -out deploy_key -d
# chmod 600 deploy_key
# eval `ssh-agent -s`
# ssh-add deploy_key

git remote rm origin
git remote add origin https://rtrompier:${GITHUB_TOKEN}@github.com/DSI-HUG/dejajs-resources.git
git push --tags