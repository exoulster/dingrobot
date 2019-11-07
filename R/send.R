#' Send plain text
#' @param content plain text
#' @param atMobiles vector of mobile phone numbers to @
#' @param isAtAll if TRUE, @ all users
#' @param prepare return json request body, for debug use only
#' @param ... url or access_token
#' @export
send_text = function(content, atMobiles=NULL, isAtAll=FALSE, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='text',
    text=list(content=content),
    at=list(
      atMobiles=atMobiles,
      isAtAll=isAtAll
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}


#' Send link
#' @param title title text
#' @param text plain text
#' @param messageUrl URL to redirect to
#' @param picUrl URL of the picture to display
#' @param prepare return json request body, for debug use only
#' @param ... url or access_token
#' @export
send_link = function(title, text, messageUrl, picUrl=NULL, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='link',
    link=list(
      title=title,
      text=text,
      messageUrl=messageUrl,
      picUrl=picUrl
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}


#' Send markdown
#' @param title title text
#' @param text markdown text
#' @param atMobiles vector of mobile phone numbers to @
#' @param isAtAll if TRUE, @ all users
#' @param prepare return json request body, for debug use only
#' @param ... url or access_token
#' @export
send_markdown = function(title, text, atMobiles=NULL, isAtAll=FALSE, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='markdown',
    markdown=list(
      title=title,
      text=text
    ),
    at=list(
      atMobiles=atMobiles,
      isAtAll=isAtAll
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}


#' Send actioncard
#' @param title title text
#' @param text markdown text
#' @param singleTitle title of actioncard
#' @param singleURL URL of actioncard
#' @param prepare return json request body, for debug use only
#' @param ... url or access_token
#' @export
send_actioncard = function(title, text, singleTitle, singleURL,
                           btnOrientation=FALSE, hideAvatar=FALSE, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='actionCard',
    actionCard=list(
      title=title,
      text=text,
      singleTitle=singleTitle,
      singleURL=singleURL,
      btnOrientation=btnOrientation,
      hideAvatar=hideAvatar
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}


#' @rdname send_actioncard
#' @param btns a nested list with each element containing two fields: "title" and "actionURL"
#' @export
send_actioncard_multi = function(title, text, btns,
                           btnOrientation=FALSE, hideAvatar=FALSE, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='actionCard',
    actionCard=list(
      title=title,
      text=text,
      btns=btns,
      btnOrientation=btnOrientation,
      hideAvatar=hideAvatar
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}


#' Send feedcard
#' @param links a nested list with each element containing three fields: "title", "messageURL" and "picURL"
#' @param prepare return json request body, for debug use only
#' @param ... url or access_token
#' @export
send_feedcard = function(links, prepare=FALSE) {
  url = prepare_url()
  body = rjson::toJSON(list(
    msgtype='feedCard',
    feedCard=list(
      links=links
    )
  ))
  if (prepare) return(body)
  httr::POST(url=url, body=body, httr::content_type_json())
}
