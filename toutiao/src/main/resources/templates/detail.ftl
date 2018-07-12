<#include "header.ftl">
    <div id="main">
        <div class="container">
            <div class="post detail">
                <div class="votebar">
                <#if like gt 0>
                    <button class="click-like up pressed" data-id="${news.id!}" title="赞同"><i class="vote-arrow"></i><span class="count">${news.likeCount!}</span></button>
                <#else >
                    <button class="click-like up" data-id="${news.id!}" title="赞同"><i class="vote-arrow"></i><span class="count">${news.likeCount!}</span></button>
                </#if>
                <#if like lt 0>
                    <button class="click-dislike down pressed" data-id="${news.id!}" title="反对"><i class="vote-arrow"></i></button>
                <#else >
                    <button class="click-dislike down" data-id="${news.id!}" title="反对"><i class="vote-arrow"></i></button>
                </#if>
                </div>

                <div class="content" data-url="http://nowcoder.com/posts/5l3hjr">
                      <div class="content-img">
                          <img src="${news.image!}?imageView2/1/w/100/h/80" alt="">
                      </div>
                      <div class="content-main">
                          <h3 class="title">
                              <a target="_blank" rel="external nofollow" href="${news.link!}">${news.title!}</a>
                          </h3>
                          <div class="meta">
                              ${news.link!}
                              <span>
                                  <i class="fa icon-comment"></i> ${news.commentCount!}
                              </span>
                          </div>
                      </div>
                  </div>
            <div class="user-info">
                <div class="user-avatar">
                    <a href="http://nowcoder.com/u/125701"><img width="32" class="img-circle" src="${owner.headUrl!}"></a>
                </div>
                <!--
                <div class="info">
                    <h5>分享者</h5>

                    <a href="http://nowcoder.com/u/125701"><img width="48" class="img-circle" src="http://images.nowcoder.com/images/20141231/622873_1420036789276_622873_1420036771761_%E8%98%91%E8%8F%87.jpg@0e_200w_200h_0c_1i_1o_90Q_1x" alt="Thumb"></a>

                    <h4 class="m-b-xs">影浅</h4>
                    <a class="btn btn-default btn-xs" href="http://nowcoder.com/signin"><i class="fa icon-eye"></i> 关注TA</a>
                </div>
                -->
                </div>

                <div class="subject-name">来自 <a href="/user/${owner.id!}">${owner.name!}</a></div>
            </div>
            <!--
            <div class="social-share-button text-center" data-title="读《Web 全栈工程师的自我修养》 http://nowcoder.com/posts/wt2rwy 分享自 @影浅 创建的《web开发的愚人之旅》 http://nowcoder.com/subjects/2245( 想看更多？下载 @牛客网 app：http://nowcoder.com/download )" data-type="text" data-url="null" data-img="http://nowcoder.com/screenshots/8/469448.png">
                <h5>分享到</h5>
                <a href="javascript:;" class="btn btn-danger" rel="external nofollow" data-site="weibo" onclick="return SocialShareButton.share(this);"><i class="fa icon-weibo"></i> 微博</a>
                <span class="dropdown weixin-qrcode-dropdown">
                    <button class="btn btn-success" id="weixin-qrcode" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa icon-weixin"></i> 微信</button>
                    <span class="dropdown-menu weixin-qrcode-dropdown-menu" aria-labelledby="weixin-qrcode" data-url="http://nowcoder.com/posts/wt2rwy">
                        <span class="weixin-qrcode" aria-labelledby="weixin-qrcode" data-url="http://nowcoder.com/posts/wt2rwy"><canvas width="132" height="132"></canvas></span>扫描二维码<br>下载牛客网
                    </span>
                </span>
            </div>
            <div role="alert" class="alert alert-warning subscribe-banner">
                使用《头条八卦》客户端，拥有更好的阅读体验。
                <a href="http://nowcoder.com/download?ref=web_posts" target="_blank" title="牛客网客户端" class="btn btn-info btn-sm pull-right">立即体验</a>
            </div>
            -->

            <div class="post-comment-form">
                <#if user??>
                <span>评论 (${news.commentCount!})</span>
                <form method="post" action="/addComment">
                  <div class="form-group text required comment_content">
                      <label class="text required sr-only">
                          <abbr title="required">*</abbr> 评论
                      </label>
                      <input type="hidden" name="newsId" value="${news.id!}"/>
                      <textarea rows="5" class="text required comment-content form-control" required name="content" id="content"></textarea>
                  </div>
                  <div class="text-right">
                    <input type="submit" value="提 交" class="btn btn-default btn-info">
                  </div>
                </form>
                <#else>
                <div class="login-actions">
                    <div class="js-login"><a class="btn btn-success" href="javascript:void(0);">登录后评论</a>
                    </div>
                </div>
                </#if>
            </div>

            <div id="comments" class="comments">

                <#list comments as commentvo>
                <div class="media">
                    <a class="media-left" href="/user/${commentvo.user.id!}">
                        <img src="${commentvo.user.headUrl!}">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading"> <small class="date">${commentvo.comment.createdDate?string('dd.MM.yyyy HH:mm:ss')}</small></h4>
                        <div>${commentvo.comment.content!}</div>
                    </div>
                </div>
                </#list>
            </div>

        </div>
        <script type="text/javascript">
          $(function(){

            // If really is weixin
            $(document).on('WeixinJSBridgeReady', function() {

              $('.weixin-qrcode-dropdown').show();

              var options = {
                "img_url": "",
                "link": "http://nowcoder.com/j/wt2rwy",
                "desc": "",
                "title": "读《Web 全栈工程师的自我修养》"
              };

              WeixinJSBridge.on('menu:share:appmessage', function (argv){
                WeixinJSBridge.invoke('sendAppMessage', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

              WeixinJSBridge.on('menu:share:timeline', function (argv) {
                WeixinJSBridge.invoke('shareTimeline', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

               $(window).on('touchmove scroll', function() {
                 if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                   $('div.backdrop').show();
                   $('div.share-help').show();
                 } else {
                   $('div.backdrop').hide();
                   $('div.share-help').hide();
                 }
               });

            });

          })
        </script>
    </div>
<#include "footer.ftl">