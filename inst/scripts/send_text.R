library(dingrobot)
library(argparser)

p = arg_parser('args')
p = add_argument(p, 'url', help='webhook url')
p = add_argument(p, 'content', help='content text')
p = add_argument(p, '--at', help='at someone, seperated by , or ;')
p = add_argument(p, '--secret', help='secret if signature is required')

args = parse_args(p)

content = args$content
if(!is.na(args$at)) {
  at = strsplit(args$at, '[,;]')[[1]]
} else {
  at = NULL
}
if(!is.na(args$secret)) {
  secret = args$secret
} else {
  secret = NULL
}

set_dingrobot(url = args$url, secret = secret)
send_text(content, atMobiles=at)
