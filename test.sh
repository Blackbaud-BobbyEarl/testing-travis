if [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo -e "No changes to commit to skyux2."
else
    echo -e "Found changes"
fi