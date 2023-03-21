
function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email)) {
        return false;
    } else {
        return true;
    }
}
function stripHTML(input) {
    var output = '';
    if (typeof (input) == 'string') {
        var output = input.replace(/(<([^>]+)>)/ig, "");
    }
    return output;
}
function ChkObj(str, txt ,len) {
    if (len == 0 && str.trim().length == 0) return txt + "不能為空 \n";
    if (str.trim().length > len) return txt + "超過" + len +"字元<br>";
}

//use writemail
function Scan(e) {
    FECommon.basicLoadingOn();
    var files = e[0].files;
    if (window.FormData !== undefined) {
        var data = new FormData()
        for (var x = 0; x < files.length; x++) { data.append(files[x].name, files[x]); }
        $.ajax({
            url: '/Common/ScanFile',
            type: 'post',
            data: data,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.statusCode == 200) {
                    FECommon.basicLoadingOff();
                    FileLength(e, "fileitem", "filelength", data.content);
                    InputFileName(e, "fileitem", "fileName", files[0].name);
                } else {
                    FECommon.basicLoadingOff();
                    SetMsgShowAlert(2, "", data.content);
                    e.val("");
                    $(e).parents(".fileitem").children(".filelength").empty();
                    InputFileName(e, "fileitem", "fileName", "未選擇任何檔案");
                }
            }
        });
    }
}
function TempFile() {
    var data = new FormData();
    $(".filesList").each(function () {
        var files = $(this)[0].files;
        for (var x = 0; x < files.length; x++) { data.append(files[x].name, files[x]); }
    });
    $.ajax({
        url: '/Common/TempFile',
        type: 'post',
        data: data,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) { }
    });
}
function TempSave(obj) {
    var saveHref = '/Tempwritemail';
    $.ajax({
        url: saveHref,
        type: 'post',
        data: obj,
        dataType: "json",
        success: function (data) {
            if (data.statusCode == 200) {
                $(".step2").load('/confirmmail');
                $(".step2").show();
                $(".step1").hide();
                FECommon.basicLoadingOff();
                //location.replace('/Home/confirmmail');
            } else {
                var content = data.content;
                var focusOn = MODAhtmlEncode(content.focusOn);
                if (focusOn != '') {
                    if (focusOn == "selectSysCategory" || focusOn == "selectCaseApplyClassSN") {
                        FocusOnByName(focusOn, obj.WebSiteId);
                    } else {
                        FocusOnByName(focusOn);
                    } 
                }
                SetMsgShowAlert(2, "", content.errormsg);
                FECommon.basicLoadingOff();
                turnstile.reset("#myWidget");
            }
        }
    });
}

function Back() {
    FECommon.basicLoadingOn();
    $(".step2").hide();
    $(".step1").show();
    FECommon.basicLoadingOff();
}

function MODAhtmlEncode(txt) {
    var ele = document.createElement('span');
    ele.appendChild(document.createTextNode(txt));
    return MODAhtmlDecode(ele.innerHTML);
}
function MODASelectVal(name) {
    var val = $("select[name=" + name + "] option:selected").val();
    var ele = document.createElement('span');
    ele.appendChild(document.createTextNode(val));
    return MODAhtmlDecode(ele.innerHTML);
}
function MODAhtmlDecode(text) {
    var temp = document.createElement("div");
    temp.innerHTML = text;
    var output = temp.innerText || temp.textContent;
    temp = null;
    return output;
}

function FocusOnByName(name, className) {
    name = MODAhtmlEncode(name);
    if (className == undefined) {
        $('[name=' + name + ']')[0].focus();
    } else {
        $('.'+className+' [name=' + name + ']')[0].focus();
    }    
}
function FileLength(e, parentClass, lengthClass, length) {
    var _lengthClass = e.parents("." + parentClass).find("." + lengthClass);
    _lengthClass.attr("data-length", length);
    _lengthClass.html(GetFileLength(length) );
}
function InputFileName(e, parentClass, Class, FileName) {
    var _Class = e.parents("." + parentClass).find("." + Class);
    _Class.html(FileName);
}


function GetFileLength(Length) {
    if (Length < 1024) { return Length+" B"; }
    var kb = (Length / 1024).toFixed(2);
    if (kb < 1024) { return kb + " KB"; }
    var mb = (kb / 1024).toFixed(2);
    return mb + " MB";
}
//
function ShowClass(className, jsonData) {
    var _className = stripHTML(className);
    $(".".concat(_className)).show();
    if (_className.indexOf("-") > 0) {
        var wid = jsonData.filter(x => x.sck == _className)[0].wid;
        var Items = jsonData.filter(x => x.sck == _className);
        var selectsItem = $("." + wid + "[name=selectCaseApplyClassSN]");
        selectsItem.empty();
        selectsItem.append("<option value=''>請選擇子項目</option>");
        $.each(Items, function (idx, obj) {
            selectsItem.append("<option value='" + obj.sn + "'>" + obj.cn + "</option>");
        });
    } else {
        var selectsItem = $(".MODA [name=selectCaseApplyClassSN]");
        selectsItem.empty();
        selectsItem.append("<option value=''>請選擇子項目</option>");
    }
}
//設定訊息並顯示訊息
function SetMsgShowAlert(status, title, text) {
    var msg = {
        Status: status,
        Title: title,
        Text: text,
        Href: ""
    };
    ShowMsgAlert(msg);
}
//設定訊息、顯示訊息並重新導向
function SetMsgShowAlertRedirect(status, title, text, href) {
  
    var msg = {
        Status: status,
        Title: title,
        Text: text,
        Href: href
    };
    ShowMsgAlert(msg);
}

//顯示訊息
//Msg Status: Success = 0, Error = 1, Warning = 2,
//SweetAlert預設有四種dialog類型，分別是warning，error，success和info
function ShowMsgAlert(msg) {
    if (msg != null) {
        var status = msg.Status;
        switch (msg.Status) {
            case 0:  //成功訊息
                Swal.fire({
                    type: 'success',
                    title: msg.Title,
                    html: msg.Text,
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '確定'
                }).then(function (result) {
                    if (msg.Href) {
                        window.location.href = msg.Href;
                    }
                });
                break;
            case 1://錯誤訊息
                Swal.fire({
                    type: 'error',
                    title: msg.Title,
                    html: msg.Text,
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確定'
                }).then(function (result) {
                    if (msg.Href) {
                        window.location.href = msg.Href;
                    }
                });
                break;
            case 2://警告訊息
                Swal.fire({
                    type: 'warning',
                    title: msg.Title,
                    html: msg.Text,
                    confirmButtonText: '確定'
                }).then(function (result) {
                    if (msg.Href) {
                        window.location.href = msg.Href;
                    }
                });
                break;
            case 3: //確認按鈕
                Swal.fire({
                    type: 'warning',
                    title: msg.Title,
                    html: msg.Text,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: msg.confirmButtonText,
                    showCancelButton: true,
                    cancelButtonText: msg.cancelButtonText,
                }).then(function (result) {
                    if (result.value) {
                        msg.confirmFunc();
                    } else {
                        msg.cancelFunc();
                    }
                });
                break;
        }
    }
}

///強制同步
function serials(tasks, callback) {
    var step = tasks.length;
    var result = [];

    // 檢查的邏輯寫在這裡
    function check(r) {  //---Q3
        result.push(r);
        if (result.length === step) {
            callback();  //---Q2
        }
    }

    tasks.forEach(function (f) {
        f(check);  //---Q1
    });
}

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

function SetCookie(name, value) {
    var d = new Date();
    var strjson = JSON.stringify(value);
    d.setTime(d.getTime() + (1 * 1 * 5 * 60 * 1000)); 
    var expires = "expires=" + d.toGMTString();
    document.cookie = name + "=" + strjson + ";" + expires + ";cookie_flags: 'max-age=7200;secure;samesite=none';path=/;";
}