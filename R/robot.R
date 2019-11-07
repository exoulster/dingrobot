
#' Set Ding Robot webhook address
#' @param url webhook URL address
#' @param access_token token to generate webhook
#' @param secret secret key if signing required
#' @export
set_dingrobot = function(url=NULL, access_token=NULL, secret=NULL) {
  if (!is.null(url)) {
    parts = httr::parse_url(url)
    if (!is.null(parts$query)) {
      Sys.setenv(DING_ACCESS_TOKEN=parts$query$access_token)
    }
  } else if (!is.null(access_token)) {
    Sys.setenv(DING_ACCESS_TOKEN=access_token)
  } else {
    stop('Neither url or access_token is set')
  }
  if (!is.null(secret)) {
    Sys.setenv(DING_SECRET=secret)
  }
}


prepare_url = function(verbose=FALSE) {
  access_token = Sys.getenv('DING_ACCESS_TOKEN')
  if (is.null(access_token)) stop('access_token is not set')
  base_url = 'https://oapi.dingtalk.com/robot/send'

  secret = Sys.getenv('DING_SECRET')
  if (is.null(secret)) { # do not sign
    query = list(
      access_token = access_token
    )
  } else {  # sign request
    ts = round(as.numeric(Sys.time()) * 1000)
    signature = sign_request(secret, ts)
    query = list(
      access_token = access_token,
      timestamp = ts,
      sign = signature
    )
    if (verbose) print(query)
  }

  url = httr::parse_url(base_url)
  url$query = query
  httr::build_url(url)
}

sign_request = function(secret, ts, verbose=FALSE) {
  s = paste0(ts, '\n', secret)
  if (verbose) message(s)
  hmac_code = digest::hmac(key=secret, object=s, algo='sha256', raw=TRUE)
  if (verbose) message(hmac_code)
  base64enc::base64encode(hmac_code)
}
