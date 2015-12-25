var webpack = require('webpack');
module.exports = {

  entry: {
    full: './assets/index.coffee'
  },

  output: {
    path: './dist',
    publicPath: '/',
    filename: "presentation.entry.js"
  },

  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.(png|jpg)$/, loader: "file-loader?name=images/[name].[ext]" },
      { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
      { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader"},
      { test: /\.(md)$/, loader: "html!markdown?gfm=true" },
      { test: /\.(json)$/, loader: "json" },
      { test: /\.css$/, loader: "style!css" },
      { test: /\.sass$/, loader: "style-loader!css-loader!sass?indentedSyntax" }
    ]
  },
  resolve: {
    extensions: ["", ".js", ".coffee", ".sass", ".css", ".md", "eot", "svg", "ttf", "woff", "woff2"]
  },

  plugins: [
    new webpack.ProvidePlugin({
      "React": "react",
      "ReactDOM": "react-dom",
      "_": "lodash",
      "hljs": "highlight.js",
      "Bemmer": "bemmer-node/bemmer-class"
    })
    ]
}
