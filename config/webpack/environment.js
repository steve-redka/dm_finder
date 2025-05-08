const { environment } = require('@rails/webpacker');

environment.loaders.append('babel', {
  test: /\.js$/,
  exclude: /node_modules\/(?!@hotwired\/turbo)/, // Exclude all node_modules except @hotwired/turbo
  use: {
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env'],
      plugins: [
        '@babel/plugin-proposal-optional-chaining',
        '@babel/plugin-proposal-logical-assignment-operators',
        '@babel/plugin-proposal-nullish-coalescing-operator'
      ]
    }
  }
});

module.exports = environment;