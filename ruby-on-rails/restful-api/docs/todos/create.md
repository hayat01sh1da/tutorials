## create

```bash
$ http post :3000/todos title=sample_todo_1 user_id=1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"9869b75dbe5b3ce06189d5df82297f8d"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: d7beffe0-c619-4604-9ad0-5e5f6204ede4
X-Runtime: 0.287665
X-XSS-Protection: 1; mode=block

{
  "created_at": "2020-06-26T03:10:29.148Z",
  "user_id": "1",
  "id": 1,
  "items": [],
  "title": "sample_todo_1",
  "updated_at": "2020-06-26T03:10:29.148Z"
}
```
