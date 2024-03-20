## show

```bash
$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"37f8d632b296d26588aec3dc9c4801ba"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 24f06764-e9bb-41f7-9122-789f735670de
X-Runtime: 0.070342
X-XSS-Protection: 1; mode=block

{
  "created_at": "2020-06-26T03:10:29.148Z",
  "user_id": "1",
  "id": 1,
  "items": [
    {
      "created_at": "2020-06-26T03:13:58.216Z",
      "done": null,
      "id": 1,
      "name": "sample_item_1",
      "todo_id": 1,
      "updated_at": "2020-06-26T03:13:58.216Z"
    }
  ],
  "title": "sample_todo_1",
  "updated_at": "2020-06-26T03:10:29.148Z"
}
```
