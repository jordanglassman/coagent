/*jslint evil:true */
/**
 * Dynamic thread loader
 *
 * 
 *  * 
 * 
 * 
*/

// 
var DISQUS;
if (!DISQUS || typeof DISQUS == 'function') {
    throw "DISQUS object is not initialized";
}
// 

// json_data and default_json django template variables will close
// and re-open javascript comment tags

(function () {
    var jsonData, cookieMessages, session, key;

    /* */ jsonData = {"reactions": [], "reactions_limit": 10, "ordered_highlighted": [], "posts": {"14586197": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "<p>I&#8217;m not 100% certain this is the case, but isn&#8217;t this what has_many :through is meant to solve? e.g.:</p>\n\n\n<code>class Item &lt; ActiveRecord::Base\r\n  has_many :item_orders\r\n  has_many :orders, :through =&gt; :item_orders\r\nend\r\n\r\nclass Order &lt; ActiveRecord::Base\r\n  has_many :item_orders\r\n  has_many :items, :through =&gt; :item_orders\r\nend\r\n\r\nclass ItemOrders &lt; ActiveRecord::Base\r\n  belongs_to :item\r\n  belongs_to :order\r\n  validates_presence_of :quantity\r\nend</code>\n\n\n\t<p>Or something along those lines. If that doesn&#8217;t work for your requirements, what is it that you need that can&#8217;t be done with this? Just curious :)</p>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_17:09:00", "date": "4 years ago", "message": "<p>I\u2019m not 100% certain this is the case, but isn\u2019t this what has_many :through is meant to solve? e.g.:</p><br><br><br><code>class Item &lt; ActiveRecord::Base\n<br>  has_many :item_orders\n<br>  has_many :orders, :through =&gt; :item_orders\n<br>end\n<br>\n<br>class Order &lt; ActiveRecord::Base\n<br>  has_many :item_orders\n<br>  has_many :items, :through =&gt; :item_orders\n<br>end\n<br>\n<br>class ItemOrders &lt; ActiveRecord::Base\n<br>  belongs_to :item\n<br>  belongs_to :order\n<br>  validates_presence_of :quantity\n<br>end</code><br><br><br>\t<p>Or something along those lines. If that doesn\u2019t work for your requirements, what is it that you need that can\u2019t be done with this? Just curious :)</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "36b4b730bc6d058fd0737fc44119ed6f", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586199": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "Any reason you didn&#8217;t use a has_many :through here?\n<code>class Item &lt; ActiveRecord::Base\r\n  has_many :items_orders\r\n  has_many :orders, :through =&gt; :items_orders\r\nend\r\n\r\nclass Order &lt; ActiveRecord::Base\r\n  has_many :items_orders\r\n  has_many :items, :through =&gt; :items_orders\r\nend\r\n\r\nclass ItemsOrders &lt; ActiveRecord::Base\r\n  belongs_to :item\r\n  belongs_to :order\r\n  validates_presence_of :quantity\r\nend</code>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_17:19:00", "date": "4 years ago", "message": "Any reason you didn\u2019t use a has_many :through here?<br><code>class Item &lt; ActiveRecord::Base\n<br>  has_many :items_orders\n<br>  has_many :orders, :through =&gt; :items_orders\n<br>end\n<br>\n<br>class Order &lt; ActiveRecord::Base\n<br>  has_many :items_orders\n<br>  has_many :items, :through =&gt; :items_orders\n<br>end\n<br>\n<br>class ItemsOrders &lt; ActiveRecord::Base\n<br>  belongs_to :item\n<br>  belongs_to :order\n<br>  validates_presence_of :quantity\n<br>end</code>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "a667482dce34922ec51f6b044d253d47", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586201": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "<p>Heh, serves me right for not reloading before commenting.</p>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_17:20:00", "date": "4 years ago", "message": "<p>Heh, serves me right for not reloading before commenting.</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "a667482dce34922ec51f6b044d253d47", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586202": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "<p>I was about to rip you a new one for not using hm:t but I see I&#8217;ve been beaten to the punch.</p>\n\n\n\t<p>Nice work fellas!</p>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_17:41:00", "date": "4 years ago", "message": "<p>I was about to rip you a new one for not using hm:t but I see I\u2019ve been beaten to the punch.</p><br><br><br>\t<p>Nice work fellas!</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "cca8fd68b777d7e58cee4583bc7b3bad", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586203": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "It doesn&#8217;t seem like a has_many through also picks up the attributes from the join model along the way.  To use the models you both laid out I needed to rename my join model to be singular, ItemsOrder.  Check out the script/console action below:\n<code>&gt;&gt; item = Item.create\r\n&gt;&gt; order = Order.create\r\n&gt;&gt; items_order = ItemsOrder.create :item =&gt; item, :order =&gt; order, :quantity =&gt; 100\r\n&gt;&gt; order.items.collect{|each| each.quantity}\r\nNoMethodError: undefined method `quantity' for #&lt;Item:0xb75f0f0c @attributes={&quot;name&quot;=&gt;nil, &quot;id&quot;=&gt;&quot;20&quot;}&gt;</code>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_17:53:00", "date": "4 years ago", "message": "It doesn\u2019t seem like a has_many through also picks up the attributes from the join model along the way.  To use the models you both laid out I needed to rename my join model to be singular, ItemsOrder.  Check out the script/console action below:<br><code>&gt;&gt; item = Item.create\n<br>&gt;&gt; order = Order.create\n<br>&gt;&gt; items_order = ItemsOrder.create :item =&gt; item, :order =&gt; order, :quantity =&gt; 100\n<br>&gt;&gt; order.items.collect{|each| each.quantity}\n<br>NoMethodError: undefined method `quantity' for #&lt;Item:0xb75f0f0c @attributes={\"name\"=&gt;nil, \"id\"=&gt;\"20\"}&gt;</code>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "15f5e6abf26f57e1838c29a8356ce7f8", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586205": {"edited": false, "author_is_moderator": false, "from_request_user": false, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "<p>That happens because Rails knows that ItemsOrder is more than just a simple join table&#8212;it actually contains attributes you&#8217;ll want to access. So you should do:</p>\n\n\n\t<p>order.items_order.collect{|each| each.quantity}</p>\n\n\n\t<p>This example of an order having many items through items_order is described exactly on page 168 of AWDwR2. But they call items &#8216;products&#8217; and items_order is  called &#8216;line_items&#8217;.</p>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_20:09:00", "date": "4 years ago", "message": "<p>That happens because Rails knows that ItemsOrder is more than just a simple join table\u2014it actually contains attributes you\u2019ll want to access. So you should do:</p><br><br><br>\t<p>order.items_order.collect{|each| each.quantity}</p><br><br><br>\t<p>This example of an order having many items through items_order is described exactly on page 168 of AWDwR2. But they call items \u2018products\u2019 and items_order is  called \u2018line_items\u2019.</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "luigimontanez", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "14586206": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "<p>My class should really have been named ItemOrder, I just messed up. Then you do order.item_orders.collect(&#38;:quantity)</p>", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2007-08-14_21:24:00", "date": "4 years ago", "message": "<p>My class should really have been named ItemOrder, I just messed up. Then you do order.item_orders.collect(&amp;:quantity)</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": null, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "36b4b730bc6d058fd0737fc44119ed6f", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}}, "ordered_posts": [14586197, 14586199, 14586201, 14586202, 14586203, 14586205, 14586206], "realtime_enabled": false, "ready": true, "mediaembed": [], "has_more_reactions": false, "realtime_paused": true, "integration": {"receiver_url": "", "hide_user_votes": true, "reply_position": false, "disqus_logo": false}, "highlighted": {}, "reactions_start": 0, "media_url": "http://mediacdn.disqus.com/1328064413", "users": {"36b4b730bc6d058fd0737fc44119ed6f": {"username": "Shadowfiend", "tumblr": "", "about": "", "display_name": "Shadowfiend", "url": "http://disqus.com/guest/36b4b730bc6d058fd0737fc44119ed6f/", "registered": false, "remote_id": null, "linkedin": "", "blog": "http://blog.withoutincident.com/", "remote_domain": "", "points": null, "facebook": "", "avatar": "http://media.disqus.com/uploads/anonusers/98/4936/avatar92.jpg", "delicious": "", "is_remote": false, "verified": false, "flickr": "", "twitter": "", "remote_domain_name": ""}, "luigimontanez": {"username": "luigimontanez", "tumblr": "", "about": "", "display_name": "Luigi Montanez", "url": "http://disqus.com/luigimontanez/", "registered": true, "remote_id": null, "linkedin": "", "blog": "http://luigimontanez.com", "remote_domain": "", "points": 63, "facebook": "", "avatar": "http://mediacdn.disqus.com/uploads/users/104/9830/avatar92.jpg?1327087733", "delicious": "", "is_remote": false, "verified": true, "flickr": "", "twitter": "http://twitter.com/LuigiMontanez", "remote_domain_name": ""}, "15f5e6abf26f57e1838c29a8356ce7f8": {"username": "Eric Torrey", "tumblr": "", "about": "", "display_name": "Eric Torrey", "url": "http://disqus.com/guest/15f5e6abf26f57e1838c29a8356ce7f8/", "registered": false, "remote_id": null, "linkedin": "", "blog": "", "remote_domain": "", "points": null, "facebook": "", "avatar": "http://mediacdn.disqus.com/1328064413/images/noavatar92.png", "delicious": "", "is_remote": false, "verified": false, "flickr": "", "twitter": "", "remote_domain_name": ""}, "cca8fd68b777d7e58cee4583bc7b3bad": {"username": "DJ", "tumblr": "", "about": "", "display_name": "DJ", "url": "http://disqus.com/guest/cca8fd68b777d7e58cee4583bc7b3bad/", "registered": false, "remote_id": null, "linkedin": "", "blog": "", "remote_domain": "", "points": null, "facebook": "", "avatar": "http://mediacdn.disqus.com/1328064413/images/noavatar92.png", "delicious": "", "is_remote": false, "verified": false, "flickr": "", "twitter": "", "remote_domain_name": ""}, "a667482dce34922ec51f6b044d253d47": {"username": "Michael", "tumblr": "", "about": "", "display_name": "Michael", "url": "http://disqus.com/guest/a667482dce34922ec51f6b044d253d47/", "registered": false, "remote_id": null, "linkedin": "", "blog": "http://gweezlebur.com", "remote_domain": "", "points": null, "facebook": "", "avatar": "http://media.disqus.com/uploads/anonusers/85/1746/avatar92.jpg", "delicious": "", "is_remote": false, "verified": false, "flickr": "", "twitter": "", "remote_domain_name": ""}}, "user_unapproved": {}, "messagesx": {"count": 0, "unread": []}, "thread": {"voters_count": 0, "offset_posts": 0, "slug": "rails_has_and_belongs_to_many_conveniences", "paginate": false, "num_pages": 1, "days_alive": 0, "moderate_none": false, "voters": {}, "total_posts": 7, "realtime_paused": true, "queued": false, "pagination_type": "append", "user_vote": null, "likes": 0, "num_posts": 7, "closed": false, "per_page": 0, "id": 28359759, "killed": true, "moderate_all": false}, "forum": {"use_media": true, "avatar_size": 48, "apiKey": "j7ESYzjPaTFWV2faPZyE3ASE8Aey1M0X8xxHCTkk8EwEvJqGgY2mBZ3Q4DciHRJe", "features": {}, "use_old_templates": false, "comment_max_words": 0, "mobile_theme_disabled": false, "linkbacks_enabled": false, "is_early_adopter": false, "allow_anon_votes": true, "revert_new_login_flow": false, "stylesUrl": "http://mediacdn.disqus.com/uploads/styles/16/4022/giantrobots.css", "login_buttons_enabled": false, "streaming_realtime": false, "show_avatar": true, "reactions_enabled": false, "reply_position": false, "id": 164022, "name": "Giant Robots", "language": "en", "mentions_enabled": true, "url": "giantrobots", "allow_anon_post": true, "disqus_auth_disabled": false, "thread_votes_disabled": false, "default_avatar_url": "http://mediacdn.disqus.com/1328064413/images/noavatar92.png", "ranks_enabled": false, "template": {"url": "http://mediacdn.disqus.com/1328064413/uploads/themes/7884a9652e94555c70f96b6be63be216/theme.js?151", "mobile": {"url": "http://mediacdn.disqus.com/1328064413/uploads/themes/mobile/theme.js", "css": "http://mediacdn.disqus.com/1328064413/uploads/themes/mobile/theme.css"}, "api": "1.1", "name": "Houdini", "css": "http://mediacdn.disqus.com/1328064413/uploads/themes/7884a9652e94555c70f96b6be63be216/theme.css?151"}, "hasCustomStyles": false, "max_depth": 1, "lastUpdate": 1311080008, "moderate_all": false}, "settings": {"realtimeHost": "qq.disqus.com", "uploads_url": "http://media.disqus.com/uploads", "ssl_media_url": "https://securecdn.disqus.com/1328064413", "realtime_url": "http://rt.disqus.com/forums/realtime-cached.js", "facebook_app_id": "52254943976", "minify_js": true, "recaptcha_public_key": "6LdKMrwSAAAAAPPLVhQE9LPRW4LUSZb810_iaa8u", "read_only": false, "facebook_api_key": "52254943976", "realtimePort": "80", "debug": false, "disqus_url": "http://disqus.com", "media_url": "http://mediacdn.disqus.com/1328064413"}, "ranks": {}, "request": {"sort": "oldest", "is_authenticated": false, "user_type": "anon", "subscribe_on_post": 0, "missing_perm": null, "user_id": null, "remote_domain_name": "", "remote_domain": "", "is_verified": false, "profile_url": "", "username": "", "is_global_moderator": false, "sharing": {}, "timestamp": "2012-02-01_01:46:31", "is_moderator": false, "ordered_unapproved_posts": [], "unapproved_posts": {}, "forum": "giantrobots", "is_initial_load": true, "display_username": "", "points": null, "has_email": false, "moderator_can_edit": false, "is_remote": false, "userkey": "", "page": 1}, "context": {"use_twitter_signin": true, "use_fb_connect": false, "show_reply": true, "active_switches": ["autocommitted_thread", "bespin", "community_icon", "embedapi", "google_auth", "mentions", "new_facebook_auth", "new_thread_create", "realtime_cached", "show_captcha_on_links", "ssl", "static_reply_frame", "static_styles", "statsd_created", "upload_media", "use_rs_paginator_60m"], "sigma_chance": 10, "use_google_signin": false, "switches": {"olark_admin_addons": true, "listactivity_replies": true, "es_index_threads": true, "use_master_for_api": true, "google_auth": true, "html_email": true, "statsd.timings": true, "community_icon": true, "show_captcha_on_links": true, "google_analytics": true, "olark_admin_packages": true, "static_styles": true, "firehose": true, "stats": true, "realtime": true, "realtime_cached": true, "statsd_created": true, "bespin": true, "olark_support": true, "firehose_gnip": true, "olark_addons": true, "new_facebook_auth": true, "limit_get_posts_days_30d": true, "use_impermium": true, "discovery_network": true, "phoenix": true, "new_thread_create": true, "edits_to_spam": true, "upload_media": true, "vip_read_slave": true, "embedapi": true, "ssl": true, "autocommitted_thread": true, "send_to_impermium": true, "theme_editor_disabled": true, "train_impermium": true, "listactivity_replies_30d": true, "firehose_gnip_http": true, "moderate_ascending": true, "firehose_message_db_lookup": true, "git_themes": true, "new_moderate": true, "use_rs_paginator_60m": true, "redis_threadcount": true, "mentions": true, "olark_install": true, "static_reply_frame": true}, "forum_facebook_key": "", "use_yahoo": false, "subscribed": false, "active_gargoyle_switches": ["discovery_network", "edits_to_spam", "es_index_threads", "firehose", "firehose_gnip", "firehose_gnip_http", "firehose_message_db_lookup", "git_themes", "google_analytics", "html_email", "limit_get_posts_days_30d", "listactivity_replies", "listactivity_replies_30d", "moderate_ascending", "new_moderate", "olark_addons", "olark_admin_addons", "olark_admin_packages", "olark_install", "olark_support", "phoenix", "realtime", "redis_threadcount", "send_to_impermium", "show_captcha_on_links", "stats", "statsd.timings", "theme_editor_disabled", "train_impermium", "use_impermium", "use_master_for_api", "vip_read_slave"], "realtime_speed": 15000, "use_openid": true}}; /* */
    /* */ cookieMessages = {"user_created": null, "post_has_profile": null, "post_twitter": null, "post_not_approved": null}; session = {"url": null, "name": null, "email": null}; /* */

    DISQUS.jsonData = jsonData;
    DISQUS.jsonData.cookie_messages = cookieMessages;
    DISQUS.jsonData.session = session;

    if (DISQUS.useSSL) {
        DISQUS.useSSL(DISQUS.jsonData.settings);
    }

    // The mappings below are for backwards compatibility--before we port all the code that
    // accesses jsonData.settings to DISQUS.settings

    var mappings = {
        debug:                'disqus.debug',
        minify_js:            'disqus.minified',
        read_only:            'disqus.readonly',
        recaptcha_public_key: 'disqus.recaptcha.key',
        facebook_app_id:      'disqus.facebook.appId',
        facebook_api_key:     'disqus.facebook.apiKey'
    };

    var urlMappings = {
        disqus_url:    'disqus.urls.main',
        media_url:     'disqus.urls.media',
        ssl_media_url: 'disqus.urls.sslMedia',
        realtime_url:  'disqus.urls.realtime',
        uploads_url:   'disqus.urls.uploads'
    };

    if (DISQUS.jsonData.context.switches.realtime_setting_change) {
        urlMappings.realtimeHost = 'realtime.host';
        urlMappings.realtimePort = 'realtime.port';
    }
    for (key in mappings) {
        if (mappings.hasOwnProperty(key)) {
            DISQUS.settings.set(mappings[key], DISQUS.jsonData.settings[key]);
        }
    }

    for (key in urlMappings) {
        if (urlMappings.hasOwnProperty(key)) {
            DISQUS.jsonData.settings[key] = DISQUS.settings.get(urlMappings[key]);
        }
    }
}());

DISQUS.jsonData.context.csrf_token = '21bc467119200cb06806902fa8e2f5b0';

DISQUS.jsonData.urls = {
    login: 'http://disqus.com/profile/login/',
    logout: 'http://disqus.com/logout/',
    upload_remove: 'http://giantrobots.disqus.com/thread/rails_has_and_belongs_to_many_conveniences/async_media_remove/',
    request_user_profile: 'http://disqus.com/AnonymousUser/',
    request_user_avatar: 'http://mediacdn.disqus.com/1328064413/images/noavatar92.png',
    verify_email: 'http://disqus.com/verify/',
    remote_settings: 'http://giantrobots.disqus.com/_auth/embed/remote_settings/',
    edit_profile_window: 'http://disqus.com/embed/profile/edit/',
    embed_thread: 'http://giantrobots.disqus.com/thread.js',
    embed_vote: 'http://giantrobots.disqus.com/vote.js',
    embed_thread_vote: 'http://giantrobots.disqus.com/thread_vote.js',
    embed_thread_share: 'http://giantrobots.disqus.com/thread_share.js',
    embed_queueurl: 'http://giantrobots.disqus.com/queueurl.js',
    embed_hidereaction: 'http://giantrobots.disqus.com/hidereaction.js',
    embed_more_reactions: 'http://giantrobots.disqus.com/more_reactions.js',
    embed_subscribe: 'http://giantrobots.disqus.com/subscribe.js',
    embed_highlight: 'http://giantrobots.disqus.com/highlight.js',
    embed_block: 'http://giantrobots.disqus.com/block.js',
    update_moderate_all: 'http://giantrobots.disqus.com/update_moderate_all.js',
    update_days_alive: 'http://giantrobots.disqus.com/update_days_alive.js',
    show_user_votes: 'http://giantrobots.disqus.com/show_user_votes.js',
    forum_view: 'http://giantrobots.disqus.com/rails_has_and_belongs_to_many_conveniences',
    cnn_saml_try: 'http://disqus.com/saml/cnn/try/',
    realtime: DISQUS.jsonData.settings.realtime_url,
    thread_view: 'http://giantrobots.disqus.com/thread/rails_has_and_belongs_to_many_conveniences/',
    twitter_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/twitter/begin/',
    yahoo_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/yahoo/begin/',
    openid_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/openid/begin/',
    googleConnect: DISQUS.jsonData.settings.disqus_url + '/_ax/google/begin/',
    community: 'http://giantrobots.disqus.com/community.html',
    admin: 'http://giantrobots.disqus.com/admin/moderate/',
    moderate: 'http://giantrobots.disqus.com/admin/moderate/',
    moderate_threads: 'http://giantrobots.disqus.com/admin/moderate-threads/',
    settings: 'http://giantrobots.disqus.com/admin/settings/',
    unmerged_profiles: 'http://disqus.com/embed/profile/unmerged_profiles/',

    channels: {
        def:      'http://disqus.com/default.html', /* default channel */
        auth:     'https://disqus.com/embed/login.html',
        tweetbox: 'http://disqus.com/forums/integrations/twitter/tweetbox.html?f=giantrobots',
        edit:     'http://giantrobots.disqus.com/embed/editcomment.html'
    }
};


// 
//     
DISQUS.jsonData.urls.channels.reply = 'http://mediacdn.disqus.com/1328064413/build/system/reply.html';
DISQUS.jsonData.urls.channels.upload = 'http://mediacdn.disqus.com/1328064413/build/system/upload.html';
DISQUS.jsonData.urls.channels.sso = 'http://mediacdn.disqus.com/1328064413/build/system/sso.html';
DISQUS.jsonData.urls.channels.facebook = 'http://mediacdn.disqus.com/1328064413/build/system/facebook.html';
//     
// 