test_that('test send_actioncard_multi', {
  res = send_actioncard_multi(
    title='乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
    text='![screenshot](@lADOpwk3K80C0M0FoA)
 ### 乔布斯 20 年前想打造的苹果咖啡厅
 Apple Store 的设计正从原来满满的科技感走向生活化，而其生活化的走向其实可以追溯到 20 年前苹果一个建立咖啡馆的计划',
    btns=list(
      list(
        title='内容不错',
        actionURL='https://www.dingtalk.com/'
      ),
      list(
        title='不感兴趣',
        actionURL='https://www.dingtalk.com/'
      )
    )
  )
  expect_equal(httr::status_code(res), 200)
})

test_that('test send_feedcard', {
  res = send_feedcard(links=list(
    list(
      title='时代的火车向前开',
      messageURL='https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI',
      picURL='https://www.dingtalk.com/'
    ),
    list(
      title='时代的火车向前2',
      messageURL='https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI',
      picURL='https://www.dingtalk.com/'
    )
  ))
  expect_equal(httr::status_code(res), 200)
})
