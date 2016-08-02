console.log 'hello word'

router = require './router'

express = require('express')
bodyParser = require('body-parser')

app = express()
app.use express.static "#{__dirname}/../public"
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

router.bindRoutes app

port = 3000

app.listen port, ->
  console.log "is runnning on port:  #{port}"
