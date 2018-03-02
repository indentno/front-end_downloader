semproFrontendDownloader() {
 echo ""
 echo "=> Cloning repository from Github"
 git clone git@github.com:Sempro/front-end_style_guide.git

 echo ""
 echo "=> Extracting files"
 rsync -av front-end_style_guide/resources/assets resources
 mv front-end_style_guide/.stylelintrc ./
 mv front-end_style_guide/.nvmrc ./
 if [ ! -f package.json ]; then
  mv front-end_style_guide/package.json ./
 fi
 if [ ! -f webpack.mix.js ]; then
  mv front-end_style_guide/webpack.mix.js ./
 fi

 echo ""
 echo "=> Removing git repository"
 rm -rf front-end_style_guide

 echo ""
 echo "=> Removing unused files"
 rm -f resources/assets/sass/README.md
 rm -f bootstrap-grid-debug.css

 echo ""
 echo "=> Setting node version"
 nvm use

 echo ""
 echo "=> Installing packages"
 npm install jquery --save
 npm install popper.js --save
 npm install bootstrap@4.0.0 --save
 npm install laravel-mix --save-dev
 npm install cross-env --save-dev
 npm install stylelint --save-dev
 npm install stylelint-config-standard --save-dev
 npm install stylelint-order --save-dev

 echo ""
 echo "=> All done"
}

alias front=semproFrontendDownloader