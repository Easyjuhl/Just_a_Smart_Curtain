const http = require('http')
const qs = require('querystring');
const axios = require('axios')

var server = http.createServer(function(req, res) {
    if (req.method == 'POST') {
        var body = "";

        req.on('data', function(data){
            body += data;

            // Too much POST data, kill the connection!
            // 1e6 === 1 * Math.pow(10, 6) === 1 * 1000000 ~~~ 1MB
            if (body.length > 1e6) {
                request.connection.destroy();
            }
        });

        req.on('end', function(){
            var post = qs.parse(body);
            console.log(post);
            axios.post('https://ptsv2.com/t/msuhl/post', JSON.stringify(post.INTENT))
        });
    }
});

console.log("online")
server.listen(5000)