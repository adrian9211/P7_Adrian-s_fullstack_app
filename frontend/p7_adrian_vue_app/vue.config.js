module.exports = {
    css: {
      loaderOptions: {
        sass: {
          data: `@import "@/styles/_variables.scss";`
        }
      }
    },
    devServer: {
      overlay: {
        warnings: true,
        errors: true,
        proxy: 'http://localhost:4000'
      }
    },
  
  };