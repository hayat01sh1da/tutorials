## create

```bash
$ http post :3000/todos/1/items name=sample_item_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"37f8d632b296d26588aec3dc9c4801ba"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0bad78ba-2e2d-422e-8468-7265fd0bef9f
X-Runtime: 0.414634
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
