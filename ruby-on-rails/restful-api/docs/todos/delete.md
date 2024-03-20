- delete

```bash
$ http delete :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 75e5ee10-945e-4bc0-ada4-f8d00f1c05f6
X-Runtime: 0.140235
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 404 Not Found
Cache-Control: no-cache
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 289663bb-bf0e-4155-94b4-4d1fd6c688b0
X-Runtime: 0.039833
X-XSS-Protection: 1; mode=block

{
  "message": "Couldn't find Todo with 'id'=1"
}
```
