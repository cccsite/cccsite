hugo new site $1
cd $1
git init
# git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
git submodule add https://github.com/thingsym/hugo-theme-techdoc.git themes/hugo-theme-techdoc
echo "theme = 'hugo-theme-techdoc'" >> hugo.toml
hugo server
