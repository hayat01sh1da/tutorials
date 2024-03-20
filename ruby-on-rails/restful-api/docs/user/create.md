## create

```bash
$ http post :3000/signup name=sample_user email=sample@example.com password=hogehogefoobar
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"630efc9acb34143cd903d148fa0a5039"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 1998fefd-025f-4b7d-8350-f10fc90813ec
X-Runtime: 1.121861
X-XSS-Protection: 1; mode=block

{
  "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ",
  "message": "Account created successfully"
}
```
