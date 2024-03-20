## index

```bash
$ http :3000/todos Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f0af191e340b4bec1716d7580c6dc8c0"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 60712237-60b3-4662-98b9-0d8a78a2530c
X-Runtime: 0.069824
X-XSS-Protection: 1; mode=block

[
  {
    "created_at": "2020-06-26T03:10:29.148Z",
    "user_id": "1",
    "id": 1,
    "items": [],
    "title": "sample_todo_1",
    "updated_at": "2020-06-26T03:10:29.148Z"
  }
]
```
