## update

```bash
$ http put :3000/todos/1/items/1 name=test_items_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 3caa7398-f876-4e30-a8d9-b0f9a7b559cb
X-Runtime: 0.155419
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f64558ac844a9dfb21ab3c302a199817"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: b948ccd7-2114-48c4-a49f-bffd954cc0cc
X-Runtime: 0.062878
X-XSS-Protection: 1; mode=block

{
  "created_at": "2020-06-26T03:13:58.216Z",
  "done": null,
  "id": 1,
  "name": "test_items_1",
  "todo_id": 1,
  "updated_at": "2020-06-26T03:29:57.976Z"
}
```
