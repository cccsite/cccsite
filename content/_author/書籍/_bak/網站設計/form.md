# Web 的前後端通訊方式

設計網站時，前後端通訊的方法，主要有三種技術。

1. 採用傳統的表單，用 Get/Post 的方式傳遞。
2. 採用 AJAX 的方式，用 Get/Post/Add/Remove 的方式傳遞 (其中一種很有系統化的方式稱為 REST)。
3. 採用 WebSocket 的方式，連線後雙方都可以隨時互傳訊息。

## 採用表單方式的通訊範例

採用表單傳遞訊息的範例請參考 Koa 當中的 Blog 範例，其中的 new 功能就有用表單：


程式碼：前端發送部分 -- <https://github.com/koajs/examples/blob/master/blog/views/new.html>

```js
  <h1>New Post</h1>
  <p>Create a new post.</p>
  <form action="/post" method="post">
    <p><input type="text" placeholder="Title" name="title"></p>
    <p><textarea placeholder="Contents" name="body"><` + `/textarea></p>
    <p><input type="submit" value="Create"></p>
  </form>
```

程式碼：後端接收部分 -- <https://github.com/koajs/examples/blob/master/blog/app.js>

```js
router
  .get('/', list)
  .get('/post/new', add)
  .get('/post/:id', show)
  .post('/post', create)
...

async function create (ctx) {
  var post = ctx.request.body
  var id = posts.push(post) - 1
  post.created_at = new Date()
  post.id = id
  ctx.redirect('/')
}
```

由於 koa 已經更新到 2.0 並支持 async/await 的語法，因此我為 koa 做了一些新的範例，請參考 f6 專案。

* <https://github.com/ccckmit/f6>

以下是另外幾篇相關的文章僅供參考！

* [A Simple CRUD Demo with Koa.js](https://weblogs.asp.net/shijuvarghese/a-simple-crud-demo-with-koa-js)

* [Creating and Handling Forms in Node.js](https://www.sitepoint.com/creating-and-handling-forms-in-node-js/)
