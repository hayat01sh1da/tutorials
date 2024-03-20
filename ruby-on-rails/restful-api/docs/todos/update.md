## update

```bash
$ http put :3000/todos/1 title=test_todo_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: c14bbaac-3016-40e9-b266-81de2b90e453
X-Runtime: 0.088207
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"abba75d4191aedada5cbf9ef2ffe8e91"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: e0ca8851-8114-4d05-8327-0df8aade3364
X-Runtime: 0.074457
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
  "title": "test_todo_1",
  "updated_at": "2020-06-26T03:18:14.203Z"
}
```
