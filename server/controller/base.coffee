fs = require 'fs'

module.exports =
  index: (req,res)->
    filename = __dirname + '/../../public/index.html'

    fs.readFile filename, 'binary', (err, file)->
      if err
        res.writeHead 500, 'Content-Type': 'text/plain'
        res.write "#{err} \n"
        res.end()

      else
        res.writeHead 200, 'Content-Type': 'text/html'
        res.write file
        res.end()
