webpack = require('webpack')
path = require('path')
BrowserSyncPlugin = require('browser-sync-webpack-plugin');

module.exports = {
  devtool: 'sourcemap',
  entry: './app/index.coffee',
  output: {
      path: './public/js',
      filename: 'index.bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        loader: "coffee-loader"
      },
      {
        test: /\.css$/,
        loader: "style-loader!css-loader"
      },
      { test: /\.hbs$/, loader: "handlebars-loader" }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery",
      "_": "underscore",
      Backbone: 'backbone',
      Marionette: 'backbone.marionette'
    }),
    new BrowserSyncPlugin({
      // browse to http://localhost:3000/ during development,
      // ./public directory is being served
      host: 'localhost',
      port: 3000,
      server: { baseDir: ['public'] }
    })
  ],
  resolveLoader: {
    root: path.join(__dirname, 'node_modules')
  }
};
