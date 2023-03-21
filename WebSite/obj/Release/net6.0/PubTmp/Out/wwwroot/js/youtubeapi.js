//使用 axios.min.js <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  //v=c822a55_D5E
  // &list=PLmusXLhyDliaIsmfH-wpVuKuShfB-ti4D
  //https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84%E8%A9%A6%E7%85%89-%E5%8B%87%E8%80%85%E7%9A%84-100-%E9%81%93-swift-ios-app-%E8%AC%8E%E9%A1%8C/101-%E4%BD%BF%E7%94%A8-youtube-data-api-%E6%8A%93%E5%8F%96%E6%9C%89%E8%B6%A3%E7%9A%84-youtuber-%E5%BD%B1%E7%89%87-mv-d05c3a0c70aa 
  //參考以上網址
  //注意 有呼叫次數限制
  //步驟1. 先去申請API_KEY
  //步驟2. 找到你要的頻道隨便一個列表 輸入 playlistId 找到網址上面 list='PLmusXLhyDliaIsmfH-wpVuKuShfB-ti4D'
  //步驟3. 使用 YouTuBeList() 解析 data[0].snippet.channelId 就是 channelId 
  //步驟4. 使用 GetYouTuBeplaylistId() 找尋頻道 playlistId, 解析  data.items[0].contentDetails.relatedPlaylists.uploads 就是 playlistId
  //步驟5. 使用 YouTuBeList()  拿取步驟 4  的 playlistId可以 呼叫頻道最新的5筆資料


const API_KEY = 'AIzaSyAjLt6qvLJU7HlRS3r96hKMjvByryxaowM'; // you must replace API_KEY
const channelId = 'UCExDf4hkbSU-pmJcyT_sDtg';
const playlistId = 'UUExDf4hkbSU-pmJcyT_sDtg'; //列表id
const youtubeapi = 'https://www.googleapis.com/youtube/v3/';
// GetYouTuBeList()
function GetYouTuBeplaylistId(clId, APIKey) {
    if (clId != '') channelId = clId;
    if (APIKey != '') API_KEY = APIKey;
    axios.get(youtubeapi + 'channels',
        {
            params:
            {
                part: 'snippet,contentDetails',// 必填，把需要的資訊列出來
                id: channelId,//
                maxResults: 1,// 預設為五筆資料，可以設定1~50
                key: API_KEY, // 使用 API 只能取得公開的播放清單
            }
        }).then((response) => console.log(response))
        .catch((error) => console.log(error))
}

function GetYouTuBeList(pId, APIKey) {
    if (pId != '') playlistId = pId;
    if (APIKey != '') API_KEY = APIKey;
    axios.get(youtubeapi + 'playlistItems',
        {
            params:
            {
                part: 'snippet,contentDetails',// 必填，把需要的資訊列出來
                playlistId: playlistId,//
                maxResults: 5,// 預設為五筆資料，可以設定1~50
                key: API_KEY, // 使用 API 只能取得公開的播放清單
            }
        }).then((response) => console.log(response))
        .catch((error) => console.log(error))
}