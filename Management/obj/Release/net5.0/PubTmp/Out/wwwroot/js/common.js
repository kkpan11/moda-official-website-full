//判斷NULL
function strIsNull(str) {
    if (str != null
        && str.replace(/(^\s*)|(\s*$)/g, '').length > 0) {
        return false;
    }
    return true;
}
//判斷是否email
function strIsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email)) {
        return false;
    } else {
        return true;
    }
}
function pop(obj) {
    $.fancybox({
        href: obj.popUrl,
        padding: 5,
        type: "iframe",
        autoSize: false,
        fitToView: false,
        hideOnOverlayClick: false,
        hideOnContentClick: false,
        closeBtn: false,
        closeClick: false,
        helpers: {
            overlay: { closeClick: false } // prevents closing when clicking OUTSIDE fancybox
        }
    });
}
// text
function htmlEncode(e) {

    var ele = document.createElement('span');
    ele.appendChild(document.createTextNode(e.val()));
    return ele.innerHTML;
}

//抓去物件的attr內的資料
function getObjAtr(e, attrName) {
    return e.attr(attrName);
}

//<input type="file" class="updatefile" />
//<input type="button" value="更新" data-name="@file.fileNewName" onclick="updateFile($(this))" data-fth="@Utility.WebFileGroupID.CP.InlineImgs" />*@
function updateFile(e) {
    var filename = getObjAtr(e, "data-name");
    var fth = getObjAtr(e, "data-fth");
    var file = e.parent().find(".updatefile");
    var formdata = new FormData();
    formdata.append("file", file[0].files[0]);
    console.log(formdata);
    var url = "/Common/UpdateFile";
    $.ajax({
        url: url + "?" + $.param({ fth: fth, filename: filename }),
        type: "POST",
        data: formdata,
        contentType: false,//必須false才會自動加上正確的Content-Type
        processData: false,//必須false才會避開jQuery對 formdata 的預設處理.XMLHttpRequest會對 formdata 進行正確的處理.
        success: function (data) {
            alert("更新檔案成功!");
        },
        error: function (data) {
            alert("上傳失敗!" + data.Message);
        }
    });
};

////禁止用瀏覽器的上一步功能
function disableBack() {

    if (window.history && window.history.pushState) {
        $(window).on("popstate", function () {
            alert("請使用左邊選單");
            window.history.pushState("forward", null, "");
            window.history.forward(1);
        });
    }
    window.history.pushState("forward", null, "");
    window.history.forward(1);
}
disableBack();


///複製功能 title 標題   txt複製文字
function txtCopy(title, txt) {
   
    navigator.clipboard.writeText(txt)
        .then(() => {
            Swal.fire({
                icon: "warning",
                title: title + "  內容已經複製"
            });
        })
        .catch(err => {
            console.log('Something went wrong', err);
        })

}

function imgerror(e) {    
    var file = e[0].src;
    var filetype = file.split('.')[file.split('.').length - 1];
    var errorImg = filetype + ".png";
    var filePath = "/images/error/file.png";
    e[0].src = filePath;
   // e[0].onerror = null;
}

//function cryptoRand() {
//    const randomBuffer = new Uint32Array(1);
//    (window.crypto || window.msCrypto).getRandomValues(randomBuffer);
//    return (randomBuffer[0] / (0xffffffff + 1));
//}

//抓取顯示筆數
function diCountFunction(preset, perPageShow, backperPageShow) {
    if (perPageShow != "undefined") {
        return perPageShow;
    }
    if (perPageShow == "undefined" && backperPageShow != 0) {
        return backperPageShow;
    }
    return preset;
}
//取cookies函式  
function getCookie(key) {
    var name = key + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0) {
            var EA = c.substring(name.length, c.length);
            return EA;
        }
    }
    return "";
}
//兩個引數，一個是cookie的名子，一個是值
function SetCookie(name, value) {
    var d = new Date();
    var strjson = JSON.stringify(value);
    d.setTime(d.getTime() + (1 * 2 * 60 * 60 * 1000)); //以1 hours 計算
    var expires = "expires=" + d.toGMTString();
    document.cookie = name + "=" + strjson + ";" + expires + ";cookie_flags: 'max-age=7200;secure;samesite=none';path=/;";
}
function RemoveCookie(name) {
    var d = new Date();
    var strjson = JSON.stringify("");
    d.setTime(d.getTime() + (1 * 1 * 1 * 1 * -1)); //立刻過期
    var expires = "expires=" + d.toGMTString();
    document.cookie = name + "=" + strjson + ";" + expires + ";cookie_flags: 'max-age=7200;secure;samesite=none';path=/;";

}
