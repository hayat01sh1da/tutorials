## index

```bash
$ http :3000/todos/1/items Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f256c2cdbf7daa0a39f7c9a600788edf"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 29e6b233-1fcc-40e9-98c8-55b97a4a0b5f
X-Runtime: 0.019615
X-XSS-Protection: 1; mode=block

[
  {
    "created_at": "2020-06-26T03:13:58.216Z",
    "done": null,
    "id": 1,
    "name": "sample_item_1",
    "todo_id": 1,
    "updated_at": "2020-06-26T03:13:58.216Z"
  }
]
```
