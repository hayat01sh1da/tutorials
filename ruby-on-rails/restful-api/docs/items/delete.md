## delete

```bash
$ http delete :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: cd06b95d-e078-49de-8c71-48195939a825
X-Runtime: 0.119596
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 404 Not Found
Cache-Control: no-cache
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0aca5165-0c92-404d-a3f8-0c5d7561c4a5
X-Runtime: 0.035489
X-XSS-Protection: 1; mode=block

{
  "message": "Couldn't find Item with [WHERE `items`.`todo_id` = ? AND `items`.`id` = ?]"
}
```
