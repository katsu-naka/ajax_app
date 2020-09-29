// check関数を定義する
function check(){
  const posts = document.querySelectorAll(".post"); //postクラスから要素を取得
  posts.forEach(function(post) {   // 要素1つずつに対しての処理を記述する

    // addEventListenerが重複して追加されるのを回避する
    if (post.getAttribute("data-load") != null) {
      return null;
    }
    post.setAttribute("data-load", "true");

    post.addEventListener("click",() => { //クリックした時に動作するイベントを設定
      // リクエストの処理
      const postId = post.getAttribute("data-id"); //メモのidを取得する
      const XHR = new XMLHttpRequest(); //XMLHttpRequestのメソッドを使用するためにオブジェクトを作成
      XHR.open("GET", `/posts/${postId}`, true); //openメソッドでリクエストの内容を記述
      XHR.responseType = "json"; //レスポンスのデータ形式を指定
      XHR.send(); //リクエストを送信する

      //レスポンスの処理
      XHR.onload = () => {
        //レスポンスがエラーの場合にエラー表示を行う
        if(XHR.status != 200){
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        // 既読であるかの判断を実行し情報を切り替える処理を行う
        const item = XHR.response.post;
        if (item.checked === true){
          post.setAttribute("data-check", "true");
        }else if(item.checked === false){
          post.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);
// window.addEventListener("load", check);
