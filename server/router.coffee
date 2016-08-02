baseController = require './controller/base'
postsController = require './controller/posts'

appPrefix = '/api'

module.exports =
  bindRoutes: (app)->
    app.get '/', baseController.index
    app.get "#{appPrefix}/posts", postsController.getPosts
    app.post "#{appPrefix}/posts", postsController.postPosts
