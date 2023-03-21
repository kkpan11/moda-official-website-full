function MODAhtmlEncode(t,e){var i=document.createElement("span");return i.appendChild(document.createTextNode(t.attr(e))),i.innerHTML}jQuery.fn.setfocus=function(){return this.each(function(){var t=this;setTimeout(function(){try{t.focus()}catch(t){}},0)})};var $window=$(window),$document=$(document),$html=$("html, body"),$body=$("body"),$navbarNav=$("#navbarNav"),$toTopBtn=$("#topBtn"),$loading=$("#loading"),resizeTimer,windowWidthUnder768=!1,windowWidthUnder992=!1,windowWidthUnder1400=!1,windowWidthUpper1200=!1,windowWidthUpper1940=!1,defaultFontSize=2,defaultTheme="",ftH,isZh=!0,wLazyLoad,printRequested=!1,allLoaded=!1,firstLoadPage=!0,wWidth=$window.width(),FECommon=FECommon||{};!function(t){"use strict";var e={init:function(){this.fn_lang(),this.fn_toTopBtnShow(),this.fn_hashRun(),this.fn_wUnder768(),this.fn_wUnder992(),this.fn_wUnder1400(),this.fn_wUpper1200(),this.fn_wUpper1940(),this.fn_defaultStorage()},fn_lang:function(){$("html").is(":lang(zh-tw)")||(isZh=!1)},fn_toTopBtnShow:function(){ftH=$(".ftBtm").outerHeight(),$window.scrollTop()<200?$toTopBtn.removeClass("on"):$toTopBtn.addClass("on"),windowWidthUnder768?$toTopBtn.css("bottom",""):$window.scrollTop()+$window.height()>$document.height()-ftH?$toTopBtn.css("bottom",ftH-27):$toTopBtn.css("bottom",100)},fn_hashRun:function(){function t(t){return""==t?t:t=t.replace(new RegExp("<","g"),"").replace(new RegExp(">","g"),"").replace(new RegExp("'","g"),"").replace(/\"/g,"")}function e(t,e){var i,n;if(""!=t&&"#"==e)return t.preventDefault(),!1;var a=$("#toTop"==e?"html":e);return i=windowWidthUnder1400?windowWidthUnder768?80:118:168,"#___gcse_0"!=e?(n=a.stop().offset().top-i,$html.stop().animate({scrollTop:n},400,"linear",function(){"#toTop"==e&&$("#AU").focus(),"#main"==e&&$("#AC").focus()})):(n=0,$html.stop().animate({scrollTop:n},100,"linear")),!1}var i=t(window.location.hash);""==i||i.includes(".")||$(i).length&&e("",i),$body.on("click",'a[href^="#"]',function(t){$(this).attr("href").indexOf("#qaH")<0&&e(t,$(this).attr("href"))}),$body.on("click",".gsc-cursor-page",function(t){e(t,"#___gcse_0")})},fn_wUnder768:function(){windowWidthUnder768=$window.outerWidth()<=768},fn_wUnder992:function(){windowWidthUnder992=$window.outerWidth()<=992},fn_wUnder1400:function(){windowWidthUnder1400=$window.outerWidth()<=1400},fn_wUpper1200:function(){windowWidthUpper1200=$window.outerWidth()>=1200},fn_wUpper1940:function(){windowWidthUpper1940=$window.outerWidth()>=1940},fn_setStorage:function(t,e){localStorage.setItem(t,e)},fn_getStorage:function(t){function e(t){var e=MODAhtmlEncode(t,"data-lighttitle");t.addClass("on"),t.attr("title",e).find(".visually-hidden").html(e)}if("fontSize"==t){if(localStorage.fontSize)return localStorage.fontSize;localStorage.setItem("fontSize","2")}if("theme"==t){if(void 0!=localStorage.theme)return localStorage.theme;window.matchMedia&&window.matchMedia("(prefers-color-scheme: dark)").matches&&e($(".themeSwitchJs"))}},fn_defaultStorage:function(){defaultFontSize=this.fn_getStorage("fontSize"),defaultTheme=this.fn_getStorage("theme")},fn_loadingOff:function(){$loading.fadeOut("slow")},fn_loadingOn:function(){$loading.fadeIn("slow")}};t.basicInit=function(){e.init()},t.basicToTopBtnShow=function(){e.fn_toTopBtnShow()},t.basicHashRun=function(){e.fn_hashRun()},t.basicWUnder768=function(){e.fn_wUnder768()},t.basicWUnder992=function(){e.fn_wUnder992()},t.basicWUnder1400=function(){e.fn_wUnder1400()},t.basicWUpper1200=function(){e.fn_wUpper1200()},t.basicWUpper1940=function(){e.fn_wUpper1940()},t.basicDefaultStorage=function(){e.fn_defaultStorage()},t.basicSetStorage=function(t,i){e.fn_setStorage(t,i)},t.basicGetStorage=function(){e.fn_getStorage()},t.basicLoadingOff=function(){e.fn_loadingOff()},t.basicLoadingOn=function(){e.fn_loadingOn()};var i={init:function(){this.fn_headerSticky(),this.fn_navSet(),this.fn_navClose(),this.fn_sideNavSwitch(),this.fn_fontSize(),this.fn_theme(),this.fn_searchArea()},fn_headerSticky:function(){$window.scrollTop()>=parseInt($(".header").height())?$body.addClass("hdFixed"):$body.removeClass("hdFixed")},fn_navSet:function(){$("[data-submenu]").submenupicker(),$("#navbarNav .dropdown-toggle").click(function(t){windowWidthUnder1400?t.preventDefault():window.location=$(this).attr("href")}),$("#navbarNav .nav-item").mouseout(function(){windowWidthUnder1400||$(this).find(".nav-link").blur().removeClass("show").next().removeClass("show")})},fn_navClose:function(){windowWidthUnder1400||"true"!=$(".navbarNavSwitchJs").attr("aria-expanded")||$("#navbarNav").offcanvas("hide").find(".show").removeClass("show")},fn_sideNavSwitch:function(){function t(t){t.attr({title:t.data("closetitle"),"aria-expanded":"true"}).find(".visually-hidden").text(t.data("closetitle"))}function e(t){$("#navbarNav .on").removeClass("on"),$("#navbarNav .nav-link").blur(),t.attr({title:t.data("opentitle"),"aria-expanded":"false"}).find(".visually-hidden").text(t.data("opentitle"))}var i=document.getElementById("navbarNav");i.addEventListener("show.bs.offcanvas",function(){t($(".navbarNavSwitchJs"))}),i.addEventListener("hide.bs.offcanvas",function(){e($(".navbarNavSwitchJs"))})},fn_fontSize:function(){function e(){i=f.find("span").html(),n=f.attr("title"),a=f.attr("data-order"),s=f.find("i").attr("class")}var i,n,a,s,o,r,d,l,c=$(".fontSizeDdJs"),f=$(".fontSizeDdNow"),u=c.find(".dropdown-menu");e(),u.find("button").on({click:function(){var s=$(this);o=s.html(),r=s.attr("title"),d=s.attr("data-order"),l="ci ci-font"+d,f.attr({title:r,"data-order":d}).find("span").html(o),f.find("i").attr("class",l),s.attr({title:n,"data-order":a}).html(i),e(),u.find("li").sort(function(t,e){return $(t).find("button").attr("data-order")-$(e).find("button").attr("data-order")}).appendTo(u),1==d&&$("body").removeClass("fontSizeL fontSizeM fontSizeS").addClass("fontSizeL"),2==d&&$("body").removeClass("fontSizeL fontSizeM fontSizeS").addClass("fontSizeM"),3==d&&$("body").removeClass("fontSizeL fontSizeM fontSizeS").addClass("fontSizeS"),t.basicSetStorage("fontSize",d),t.widgetMarqueeUpdate()}}),2!=defaultFontSize&&c.find("button[data-order="+defaultFontSize+"]").click()},fn_theme:function(){function e(e){var i=MODAhtmlEncode(e,"data-lighttitle");e.addClass("on"),e.attr("title",i).find(".visually-hidden").html(i),$("html").removeClass("light").addClass("dark"),t.basicSetStorage("theme","dark")}function i(e){var i=MODAhtmlEncode(e,"data-darktitle");e.removeClass("on"),e.attr("title",i).find(".visually-hidden").html(i),$("html").removeClass("dark").addClass("light"),t.basicSetStorage("theme","light")}"dark"==defaultTheme&&e($(".themeSwitchJs")),$body.on("click",".themeSwitchJs",function(){$("html").hasClass("dark")?i($(this)):e($(this))})},fn_searchArea:function(){$body.on("click",".searchSwitchBtnJs",function(){$(".searchAreaJs").addClass("on"),windowWidthUnder1400&&($(".navbarNavSwitchJs").click(),$("body").addClass("fullH")),setTimeout(function(){$(".searchAreaIptJs").setfocus()},300)}),$body.on("click",".closeBtnJs,.searchAreaMaskJs",function(){$(".searchAreaJs").removeClass("on"),$(".searchAreaIptJs").val(""),$("body").removeClass("fullH")}),$(".searchSwitchBtnJs,.closeBtnJs").on("keydown",function(t){13===t.which&&$(".searchSwitchBtnJs").setfocus()})}};t.headerInit=function(){i.init()},t.headerHeaderSticky=function(){i.fn_headerSticky()},t.headerNavSet=function(){i.fn_navSet()},t.headerNavClose=function(){i.fn_navClose()},t.headerSideNavSwitch=function(){i.fn_sideNavSwitch()},t.headerFontSize=function(){i.fn_fontSize()},t.headerTheme=function(){i.fn_theme()},t.headerSearchArea=function(){i.fn_searchArea()};var n={init:function(){this.fn_ftNavSwitch(),this.fn_ftNavStyle()},fn_ftNavSwitch:function(){function t(t){var e=MODAhtmlEncode(t,"data-closetitle");$(".ftNavLv2").slideDown(350),$(".ftNav").removeClass("off"),t.attr("title",e).find(".visually-hidden").html(e)}function e(t){var e=MODAhtmlEncode(t,"data-opentitle");$(".ftNavLv2").slideUp(350),t.attr("title",e).find(".visually-hidden").html(e),setTimeout(function(){$(".ftNav").addClass("off")},250)}$(".ftNav").hasClass("off")?e($(".ftNavSwitchJs")):t($(".ftNavSwitchJs")),$body.on("click",".ftNavSwitchJs",function(){$(".ftNav").hasClass("off")?t($(this)):e($(this))})},fn_ftNavStyle:function(){$(".ftNavLt > div").length>5?$(".ftNavLt").addClass("itemMoreThen5"):$(".ftNavLt").removeClass("itemMoreThen5")}};t.footerInit=function(){n.init()},t.footerFtNavSwitch=function(){n.fn_ftNavSwitch()},t.footerFtNavStyle=function(){n.fn_ftNavStyle()};var a={init:function(){this.fn_socialShare(),this.fn_sidebar(),this.fn_datePicker(),this.fn_conSearchBar(),this.fn_qaAnchor(),this.fn_hintClose()},fn_socialShare:function(){function t(t){i&&$(".shareBar > li").removeClass("on");var e=window.open(t,"redirect");e.open(t,"redirect")}var e=encodeURIComponent(location.href),i=!1;$body.on("click",".fbShareJs",function(){var i="http://www.facebook.com/share.php?u=".concat(e);t(i)}),$body.on("click",".ttShareJs",function(){var i="https://twitter.com/share?url=".concat(e);t(i)}),$body.on("click",".lineShareJs",function(){var i="https://lineit.line.me/share/ui?url=".concat(e);t(i)}),$body.on("click",".printJs",function(){$(".lazy").length?allLoaded?window.print():(printRequested=!0,wLazyLoad.loadAll()):window.print()}),$body.on("focus",".shareBar > li > a",function(){$(this).parent("li").addClass("on")}),$body.on("keydown",".shareBarMenu li:last-child a",function(t){9!==t.which||t.shiftKey||$(this).parents(".list-inline-item").removeClass("on")}),$body.on("keydown",".shareBar > li > a",function(t){9===t.which&&t.shiftKey&&$(this).parents(".list-inline-item").removeClass("on")}),$body.on("mouseover",".shareBar > li",function(t){i=!0,$(this).addClass("on")}),$body.on("mouseout",".shareBar li",function(t){i=!1,$(this).removeClass("on"),$(this).children("a").blur()})},fn_sidebar:function(){$(".sidebarJs .menuSub").prev("a").addClass("hasSub"),$body.on("click",".sidebarJs .menuI",function(){var t=$(this);t.parent("li").siblings().removeClass("on").find(".menuSub").slideUp(300),t.parent("li").hasClass("on")?t.parent("li").removeClass("on").find(".menuSub").slideUp(300):(t.parent("li").find(".menuSub").slideDown(300),setTimeout(function(){t.parent("li").addClass("on")},50))})},fn_datePicker:function(){function t(t){t.parents(".searchI").find(".datepicker1").datepicker("show")}isZh?($.datepicker.regional["zh-TW"]={dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],dayNamesMin:["日","一","二","三","四","五","六"],monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],prevText:"上月",nextText:"次月",weekHeader:"週",dateFormat:"yy-mm-dd",changeMonth:!0,changeYear:!0,showMonthAfterYear:!0},$.datepicker.setDefaults($.datepicker.regional["zh-TW"])):($.datepicker.regional["en-US"]={dateFormat:"yy-mm-dd",changeMonth:!0,changeYear:!0,showMonthAfterYear:!0},$.datepicker.setDefaults($.datepicker.regional["en-US"])),$(".datepicker1").datepicker(),$body.on("click",".calendarBtn1",function(){t($(this))})},fn_conSearchBar:function(){function t(t){$(".conSearchBarJs").removeClass("off");var e=MODAhtmlEncode(t,"data-closetitle");t.attr("title",e).find(".visually-hidden").html(e),t.find(".ci").removeClass("ci-open").addClass("ci-close")}function e(t){$(".conSearchBarJs").addClass("off");var e=MODAhtmlEncode(t,"data-opentitle");t.attr("title",e).find(".visually-hidden").html(e),t.find(".ci").removeClass("ci-close").addClass("ci-open")}$body.on("click",".searchSwitchJs",function(){$(".conSearchBarJs").hasClass("off")?t($(this)):e($(this))})},fn_qaAnchor:function(){$(".qa").length&&$(".qa .accordion-button").each(function(){$(this).on("click",function(){var t,e="#"+$(this).parent().attr("id");t=windowWidthUnder1400?windowWidthUnder768?80:118:168,setTimeout(function(){var i=$(e).stop().offset().top-t;$html.stop().animate({scrollTop:i},400,"linear")},400)})})},fn_hintClose:function(){$(".closeHintJs").length&&$(".closeHintJs").on("click",function(){$(".hintBar").addClass("off"),$(".hintJs").marquee("pause"),$(".hintJs").removeClass("hintJs"),$(".hintBar").hide(400)})}};t.mainInit=function(){a.init()},t.mainSocialShare=function(){a.fn_socialShare()},t.mainSidebar=function(){a.fn_sidebar()},t.mainDatePicker=function(){a.fn_datePicker()},t.mainConSearchBar=function(){a.fn_conSearchBar()},t.mainQaAnchor=function(){a.fn_qaAnchor()},t.mainHintClose=function(){a.fn_hintClose()};var s={init:function(){this.fn_setVideo(),this.fn_kv1Swiper(),this.fn_idxList1Swiper(),this.fn_idxList2Swiper(),this.fn_idxList3Swiper(),this.fn_idxList4Swiper(),this.fn_idxList5Swiper(),this.fn_magnific(),this.fn_marquee(),this.fn_lazyload(),this.fn_aos()},fn_setVideo:function(t){function e(t){var e=document.createElement("iframe");e.setAttribute("src","https://www.youtube.com/embed/"+t.dataset.id+"?autoplay=1&rel=0"),e.setAttribute("title",t.dataset.title),e.setAttribute("frameborder","0"),e.setAttribute("allowfullscreen","1"),e.setAttribute("allow","accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"),t.parentNode.replaceChild(e,t)}function i(){if(void 0==t)var i=document.getElementsByClassName("ytPlayer");else var i=t.find(".ytPlayer");for(var n=0;n<i.length;n++){var a=i[n].dataset.title,s=i[n].dataset.id,o=document.createElement("div");o.setAttribute("data-id",s),o.setAttribute("data-title",a);var r=document.createElement("img");firstLoadPage?(r.dataset.src="//i.ytimg.com/vi/ID/hqdefault.jpg".replace("ID",s),r.className="lazy"):r.src="//i.ytimg.com/vi/ID/hqdefault.jpg".replace("ID",s),r.alt=a,o.appendChild(r);var d=document.createElement("div");d.setAttribute("class","play"),o.appendChild(d),o.onclick=function(){e(this)},i[n].appendChild(o)}firstLoadPage&&(firstLoadPage=!1)}i()},fn_kv1Swiper:function(){function t(){e=$(".kv1SwiperJs .swiper-slide"),i=$(".kv1SwiperJs .swiper-slide-active"),n=$(".kv1SwiperPageJs .swiper-pagination-bullet"),a=$(".kv1SwiperPageJs .swiper-pagination-bullet-active"),e.attr("aria-hidden","true"),e.find("a, iframe").attr("tabindex",-1),i.attr("aria-hidden",""),i.find("a, iframe").attr("tabindex",""),n.attr("aria-current",""),a.attr("aria-current","true")}if($(".kv1SwiperJs .swiper-slide").length>1){var e,i,n,a,s=[];$(".kv1SwiperJs .swiper-slide").each(function(){$(this).find(".kvTxt").length&&s.push($(this).find(".kvTxt").text()),$(this).find(".ytPlayer").length&&s.push($(this).find(".ytPlayer").data("title"))});var o;o=!$(".kv1SwiperJs").find(".ytWrap").length&&{delay:7e3,disableOnInteraction:!1};var r=new Swiper(".kv1SwiperJs",{preloadImages:!1,pagination:{el:".kv1SwiperPageJs",clickable:!0,renderBullet:function(t,e){return'<span class="'+e+'"><i>'+s[t]+"</i></span>"}},navigation:{nextEl:".kv1SwiperNextBtnJs",prevEl:".kv1SwiperPrevBtnJs"},autoplay:o,loop:!0,observer:!0,observeParents:!0,watchOverflow:!0,on:{afterInit:function(){t()},slideChangeTransitionEnd:function(){t()}}});$(".kv1SwiperPrevBtnJs").on("focus",function(){r.autoplay.stop()}),$(".kv1SwiperPageJs span:last-child").on("focus",function(){r.autoplay.stop()}),$(".kv1SwiperPrevBtnJs,.kv1SwiperPageJs span:last-child").on("mousedown",function(t){t.preventDefault()}),$(".kv1SwiperPrevBtnJs").on("keydown",function(t){9===t.which&&t.shiftKey&&0!=o&&r.autoplay.start()}),$(".kv1SwiperPageJs span:last-child").on("keydown",function(t){9!==t.which||t.shiftKey||0==o||r.autoplay.start()})}else $(".kv1SwiperJs").addClass("oneKv"),$(".kv1SwiperJs").find(".swiper-lazy").each(function(){var t=$(this).data("background");$(this).css("background-image","url("+t+")")}),$(".kv1SwiperJs").find(".swiper-lazy-preloader").remove()},fn_idxList1Swiper:function(){function t(){$(".idxList1SwiperPrevBtnJs").hasClass("swiper-button-lock")?$(".idxList1SwiperJs .swiper-wrapper").css("justify-content","center"):$(".idxList1SwiperJs .swiper-wrapper").css("justify-content","")}function e(t){var e,i,n=t.params.slidesPerView,a=t.slides.length,s=[];if(a>n){for(var o=1;o<=a/n;o++)s.push(n*o);$body.on("keydown",".idxList1SwiperJs .swiper-slide a",function(a){function o(t){$(".idxList1SwiperJs .swiper-wrapper").css("justify-content","flex-end"),setTimeout(function(){t()},10)}e=$(this).parent().attr("aria-label").split(" / "),i=s.some(function(t,i,n){return t==e[0]}),i&&parseInt(e[0])<s.length*n&&9===a.which&&!a.shiftKey&&(t.slideTo(parseInt(e[0]),300,!1),o(function(){$(".idxList1SwiperJs .swiper-wrapper").css("justify-content","flex-start")}))})}}if($(".idxList1SwiperJs").length){var i=$(".idxIssue h2").text();new Swiper(".idxList1SwiperJs",{pagination:{el:".idxList1SwiperPageJs",clickable:!0,renderBullet:function(t,e){return'<span class="'+e+'"><i>第'+(t+1)+"組"+i+"</i></span>"}},navigation:{nextEl:".idxList1SwiperNextBtnJs",prevEl:".idxList1SwiperPrevBtnJs"},observer:!0,observeParents:!0,watchOverflow:!0,breakpoints:{1500:{slidesPerGroup:4,slidesPerView:4},1200:{slidesPerGroup:3,slidesPerView:3},992:{slidesPerGroup:2,slidesPerView:2}},on:{afterInit:function(i){t(),e(i)},resize:function(i){t(),e(i)}}})}},fn_idxList2Swiper:function(){function t(){n=$(".idxPlan h2").text(),i=new Swiper(".tab-pane .idxList2SwiperJs",{pagination:{el:".tab-pane .idxList2SwiperPageJs",clickable:!0,renderBullet:function(t,e){return'<span class="'+e+'"><i>第'+(t+1)+"組"+n+"</i></span>"}},navigation:{nextEl:".idxList2SwiperNextBtnJs",prevEl:".idxList2SwiperPrevBtnJs"},centeredSlides:!0,loop:!0,observer:!0,observeParents:!0,breakpoints:{1940:{slidesPerView:6},1200:{slidesPerView:4},768:{slidesPerView:2}},on:{afterInit:function(t){a.removeClass("lowItem").addClass("initSwiper")}}})}function e(){void 0!=i&&i.destroy(),a.addClass("lowItem").removeClass("initSwiper"),setTimeout(function(){$(".tab-pane .idxList2SwiperJs .swiper-wrapper").css("transform","none")},50)}var i,n,a=$(".tab-pane .idxList2"),s=$(".tab-pane .idxList2SwiperJs .swiper-slide");return a.hasClass("initSwiper")||t(),windowWidthUpper1940?(s.not(".swiper-slide-duplicate").length>5&&!a.hasClass("initSwiper")?t():s.not(".swiper-slide-duplicate").length<=5&&a.hasClass("initSwiper")&&e(),!1):windowWidthUpper1200?(s.not(".swiper-slide-duplicate").length>3&&!a.hasClass("initSwiper")?t():s.not(".swiper-slide-duplicate").length<=3&&a.hasClass("initSwiper")&&e(),!1):windowWidthUpper1200?void 0:(s.not(".swiper-slide-duplicate").length>1&&!a.hasClass("initSwiper")?t():s.not(".swiper-slide-duplicate").length<=1&&a.hasClass("initSwiper")&&e(),!1)},fn_idxList3Swiper:function(){function t(){$(".idxList3SwiperPrevBtnJs").hasClass("swiper-button-lock")?$(".idxList3SwiperJs .swiper-wrapper").css("justify-content","center"):$(".idxList3SwiperJs .swiper-wrapper").css("justify-content","")}if($(".idxList3SwiperJs").length){var e=$(".idxPartner h2").text();new Swiper(".idxList3SwiperJs",{pagination:{el:".idxList3SwiperPageJs",clickable:!0,renderBullet:function(t,i){return'<span class="'+i+'"><i>第'+(t+1)+"組"+e+"</i></span>"}},navigation:{nextEl:".idxList3SwiperNextBtnJs",prevEl:".idxList3SwiperPrevBtnJs"},observer:!0,observeParents:!0,breakpoints:{1200:{slidesPerGroup:5,slidesPerView:5},992:{slidesPerGroup:4,slidesPerView:4},768:{slidesPerGroup:3,slidesPerView:3},541:{slidesPerGroup:2,slidesPerView:2}},on:{afterInit:function(){t()},resize:function(){t()}}})}},fn_idxList4Swiper:function(){function e(){s=$(".idxList4SwiperJs .swiper-slide"),i=$(".idxList4SwiperJs .swiper-slide-active"),n=$(".idxList4SwiperPageJs .swiper-pagination-bullet"),a=$(".idxList4SwiperPageJs .swiper-pagination-bullet-active"),s.attr("aria-hidden","true"),s.find(".ytPlayer .play").attr("tabindex",-1),i.attr("aria-hidden",""),i.find(".ytPlayer .play").attr("tabindex",0),n.attr("aria-current",""),a.attr("aria-current","true"),$body.on("keyup",".ytPlayer > div",function(t){"Enter"!==t.key&&13!==t.keyCode||$(this).click()})}if($(".idxList4SwiperJs .swiper-slide").length>1){var i,n,a,s=$(".idxList4SwiperJs .swiper-slide"),o=[],r=[];s.each(function(t){o[t]=$(this).find(".ytPlayer").data("id"),r[t]=$(this).find(".ytPlayer").data("title")});var d=[];$(".idxList4SwiperJs .swiper-slide").each(function(){d.push($(this).find(".ytPlayer").data("title"))});new Swiper(".idxList4SwiperJs",{pagination:{el:".idxList4SwiperPageJs",clickable:!0,renderBullet:function(t,e){return'<span class="'+e+'"><i>'+d[t]+"</i></span>"}},navigation:{nextEl:".idxList4SwiperNextBtnJs",prevEl:".idxList4SwiperPrevBtnJs"},slidesPerView:2,centeredSlides:!0,loop:!0,observer:!0,observeParents:!0,watchOverflow:!0,breakpoints:{0:{slidesPerView:1},992:{slidesPerView:2}},on:{afterInit:function(){e()},slideChangeTransitionStart:function(e){function i(e){$(".idxList4SwiperJs").find("[data-swiper-slide-index='"+e+"']").html('<div class="ytWrap"><div class="ytPlayer rounded-4" data-id="'+o[e]+'" data-title="'+r[e]+'"></div></div><b class="title">'+r[e]+"</b>"),t.widgetSetVideo($(".idxList4SwiperJs").find("[data-swiper-slide-index='"+e+"']"))}var n=this.previousIndex-2,a=e.pagination.bullets.length-1;n>-1&&i(n),0==n&&i(a)},slideChangeTransitionEnd:function(){e()}}})}else $(".idxList4").addClass("lowItem")},fn_idxList5Swiper:function(){function t(){e=$(".idxList5SwiperJs .swiper-slide"),i=$(".idxList5SwiperJs .swiper-slide-active"),n=$(".idxList5SwiperPageJs .swiper-pagination-bullet"),a=$(".idxList5SwiperPageJs .swiper-pagination-bullet-active"),e.attr("aria-hidden","true"),e.find("a, iframe").attr("tabindex",-1),i.attr("aria-hidden",""),i.find("a, iframe").attr("tabindex",""),n.attr("aria-current",""),a.attr("aria-current","true")}if($(".idxList5SwiperJs .swiper-slide").length>1){var e,i,n,a,s=[];$(".idxList5SwiperJs .swiper-slide").each(function(){s.push($(this).find(".pic img").attr("alt"))});var o;o=1!=$(".idxList5SwiperJs").data("notautoplay")&&{delay:7e3,disableOnInteraction:!1};var r=new Swiper(".idxList5SwiperJs",{preloadImages:!1,pagination:{el:".idxList5SwiperPageJs",clickable:!0,renderBullet:function(t,e){return'<span class="'+e+'"><i>'+s[t]+"</i></span>"}},navigation:{nextEl:".idxList5SwiperNextBtnJs",prevEl:".idxList5SwiperPrevBtnJs"},slidesPerView:2,centeredSlides:!0,autoplay:o,loop:!0,observer:!0,observeParents:!0,watchOverflow:!0,breakpoints:{0:{slidesPerView:1},992:{slidesPerView:2}},on:{afterInit:function(){t()},slideChangeTransitionEnd:function(){t()}}});$(".idxList5SwiperPrevBtnJs").on("focus",function(){r.autoplay.stop()}),$(".idxList5SwiperPageJs span:last-child").on("focus",function(){r.autoplay.stop()}),$(".idxList5SwiperPrevBtnJs,.idxList5SwiperPageJs span:last-child").on("mousedown",function(t){t.preventDefault()}),$(".idxList5SwiperPrevBtnJs").on("keydown",function(t){9===t.which&&t.shiftKey&&0!=o&&r.autoplay.start()}),$(".idxList5SwiperPageJs span:last-child").on("keydown",function(t){9!==t.which||t.shiftKey||0==o||r.autoplay.start()})}else $(".idxList5").addClass("lowItem")},fn_magnific:function(){$(".picZoomJs").each(function(){var t=$(this),e=t.data("mctxtclose"),i=t.data("mctxtprev"),n=t.data("mctxtnext"),a=t.data("mctxtnum");t.magnificPopup({delegate:"a",type:"image",closeOnContentClick:!1,closeBtnInside:!1,tClose:e,mainClass:"mfp-with-zoom mfp-img-mobile",image:{verticalFit:!0,titleSrc:function(t){return t.el.find("b").html()}},gallery:{enabled:!0,tPrev:i,tNext:n,tCounter:'<span title="'+a+'">%curr% of %total%</span>'},zoom:{enabled:!0,duration:300,opener:function(t){return t.find("img")}}})})},fn_marquee:function(){$(".hintJs").length&&($(".hintJs a").attr("tabindex",-1),$(".hintJs").marquee({pauseSpeed:7e3,pauseOnHover:!1,show:function(t,e){$(e).find("a").attr("tabindex","")},aftershow:function(t,e){$(e).find("a").attr("tabindex",-1)}}),$(".hintJs a").on("focus",function(){$(".hintJs").marquee("pause")}),$(".closeHintJs").on("focus",function(){t.widgetMarqueeUpdate()}),$(".hintJs a,.closeHintJs").on("mousedown",function(t){t.preventDefault()}))},fn_marqueeUpdate:function(){$(".hintJs").length&&($(".hintJs").marquee("pause"),setTimeout(function(){$(".hintJs").find("li:not(.marquee-showing)").css("left","-3000px"),$(".hintJs").find("li.marquee-showing").css("left",0),$(".hintJs").marquee("update"),$(".hintJs").marquee("resume")},500),wWidth=$window.width())},fn_lazyload:function(){if($(".lazy").length){printRequested=!1,allLoaded=!1;var t=function(t){t.src="/assets/img/pic_wait1.jpg"},e=function(){allLoaded=!0,printRequested&&window.print()};wLazyLoad=new LazyLoad({class_applied:"lz-applied",class_loading:"lz-loading",class_loaded:"lz-loaded",class_error:"lz-error",class_entered:"lz-entered",class_exited:"lz-exited",cancel_on_exit:!1,threshold:100,callback_error:t,callback_finish:e});var i=/^((?!chrome|android).)*safari/i.test(navigator.userAgent);if(i){var n=window.matchMedia("print");n.addListener(function(t){t.matches&&wLazyLoad.loadAll()})}else window.onbeforeprint=function(){wLazyLoad.loadAll()}}},fn_aos:function(){AOS.init({offset:0,delay:100,duration:800}),$("#idxNewsTab").length&&$body.on("click","#idxNewsTab .nav-link",function(){setTimeout(function(){AOS.refreshHard()},300)})}};t.widgetInit=function(){s.init()},t.widgetSetVideo=function(t){s.fn_setVideo(t)},t.widgetKv1Swiper=function(){s.fn_kv1Swiper()},t.widgetIdxList1Swiper=function(){s.fn_idxList1Swiper()},t.widgetIdxList2Swiper=function(){s.fn_idxList2Swiper()},t.widgetIdxList3Swiper=function(){s.fn_idxList3Swiper()},t.widgetIdxList4Swiper=function(){s.fn_idxList4Swiper()},t.widgetIdxList5Swiper=function(){s.fn_idxList5Swiper()},t.widgetMagnific=function(){s.fn_magnific()},t.widgetMarquee=function(){s.fn_marquee()},t.widgetMarqueeUpdate=function(){s.fn_marqueeUpdate()},t.widgetLazyload=function(){s.fn_lazyload()},t.widgetAos=function(){s.fn_aos()};var o={init:function(){this.fn_navFocus(),this.fn_searchPop()},fn_navFocus:function(){$body.on("focus","#navbarNav .dropdown-toggle",function(){$(this).closest("li").addClass("on")}),$body.on("click","#navbarNav .dropdown-toggle",function(){$(this).parent("li").removeClass("on"),$(this).parent("li").siblings(".on").removeClass("on")}),$body.on("keydown","#navbarNav .dropdown-menu > li:nth-last-child(1) a",function(t){$(this).parent("li").next("li").length||($(this).parent("li").parent("ul").parent(".nav-item").length?$(this).next("ul").length||9!==t.which||t.shiftKey||$(this).parents(".on").removeClass("on"):(9!==t.which||t.shiftKey||$(this).parent("li").parent("ul").parent(".dropdown").removeClass("on"),$(this).parent("li").parent("ul").parent(".dropdown").next("li").length||$(this).parent("li").parent("ul").parent(".dropdown").parent("ul").parent(".nav-item").removeClass("on")))}),$body.on("keydown","#navbarNav .nav-link",function(t){9===t.which&&t.shiftKey&&$(this).parents(".on").removeClass("on")}),$document.on("click",function(){$navbarNav.find("on")&&$("#navbarNav .on").removeClass("on")})},fn_searchPop:function(){$(".searchAreaJs .closeBtnJs").on("keydown",function(t){9!==t.which||t.shiftKey||($(".searchAreaJs").removeClass("on"),$(".searchAreaIptJs").val(""))})}};t.a11yInit=function(){o.init()},t.a11yNavFocus=function(){o.fn_navFocus()};var r={init:function(){t.basicInit(),t.headerInit(),t.footerInit(),t.widgetInit(),t.a11yInit()}};t.documentOnReadyInit=function(){r.init()};var d={init:function(){t.mainInit()}};t.documentOnLoadInit=function(){d.init()};var l={init:function(){t.basicWUnder768(),t.basicWUnder992(),t.basicWUnder1400(),t.basicWUpper1200(),t.basicWUpper1940(),t.headerNavClose(),t.widgetIdxList2Swiper(),$(window).width()!=wWidth&&t.widgetMarqueeUpdate(),this.fn_lazyUpdate()},fn_lazyUpdate:function(){$(".idxList4Swiper").length&&wLazyLoad.update()}};t.documentOnResizeInit=function(){l.init()},t.documentOnResizeLazyUpdate=function(){l.fn_lazyUpdate()};var c={init:function(){t.basicToTopBtnShow(),t.headerHeaderSticky()}};t.documentOnScrollInit=function(){c.init()}}(FECommon),$(document).ready(function(){FECommon.documentOnReadyInit()}),$window.on("load",FECommon.documentOnLoadInit),$window.on("scroll",FECommon.documentOnScrollInit),$window.on("resize",function(){clearTimeout(resizeTimer),resizeTimer=setTimeout(function(){FECommon.documentOnResizeInit()},250)});