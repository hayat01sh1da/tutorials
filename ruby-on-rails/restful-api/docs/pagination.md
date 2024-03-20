## Pagination

### Reset DB and creates sample data

```bash
$ docker-compose exec app bin/rails db:migrate:reset
$ docker-compose exec app bin/rails db:seed
```

### Index todos

```bash
$ http :3000/todos page==3 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMjk1OTN9.WI7mA_jvc8o61OTmDob6LgTx02Nh5680ukUInqbCY1Q'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"b1996fe5dddf02aaa79e6924899bfb73"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0b8d0627-d627-4433-87c4-e7e27f1b2328
X-Runtime: 0.582031
X-XSS-Protection: 1; mode=block

[
  {
    "created_at": "2020-06-26T04:52:24.559Z",
    "id": 41,
    "items": [
      {
        "created_at": "2020-06-26T04:52:24.591Z",
        "done": false,
        "id": 41,
        "name": "harum",
        "todo_id": 41,
        "updated_at": "2020-06-26T04:52:24.591Z"
      }
    ],
    "title": "repellendus",
    "updated_at": "2020-06-26T04:52:24.559Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:24.636Z",
    "id": 42,
    "items": [
      {
        "created_at": "2020-06-26T04:52:24.669Z",
        "done": false,
        "id": 42,
        "name": "sit",
        "todo_id": 42,
        "updated_at": "2020-06-26T04:52:24.669Z"
      }
    ],
    "title": "praesentium",
    "updated_at": "2020-06-26T04:52:24.636Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:24.702Z",
    "id": 43,
    "items": [
      {
        "created_at": "2020-06-26T04:52:24.736Z",
        "done": false,
        "id": 43,
        "name": "accusamus",
        "todo_id": 43,
        "updated_at": "2020-06-26T04:52:24.736Z"
      }
    ],
    "title": "et",
    "updated_at": "2020-06-26T04:52:24.702Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:24.836Z",
    "id": 44,
    "items": [
      {
        "created_at": "2020-06-26T04:52:24.905Z",
        "done": false,
        "id": 44,
        "name": "vel",
        "todo_id": 44,
        "updated_at": "2020-06-26T04:52:24.905Z"
      }
    ],
    "title": "molestiae",
    "updated_at": "2020-06-26T04:52:24.836Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:24.946Z",
    "id": 45,
    "items": [
      {
        "created_at": "2020-06-26T04:52:24.979Z",
        "done": false,
        "id": 45,
        "name": "necessitatibus",
        "todo_id": 45,
        "updated_at": "2020-06-26T04:52:24.979Z"
      }
    ],
    "title": "perspiciatis",
    "updated_at": "2020-06-26T04:52:24.946Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.012Z",
    "id": 46,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.046Z",
        "done": false,
        "id": 46,
        "name": "numquam",
        "todo_id": 46,
        "updated_at": "2020-06-26T04:52:25.046Z"
      }
    ],
    "title": "velit",
    "updated_at": "2020-06-26T04:52:25.012Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.079Z",
    "id": 47,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.113Z",
        "done": false,
        "id": 47,
        "name": "impedit",
        "todo_id": 47,
        "updated_at": "2020-06-26T04:52:25.113Z"
      }
    ],
    "title": "quas",
    "updated_at": "2020-06-26T04:52:25.079Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.146Z",
    "id": 48,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.179Z",
        "done": false,
        "id": 48,
        "name": "sint",
        "todo_id": 48,
        "updated_at": "2020-06-26T04:52:25.179Z"
      }
    ],
    "title": "quia",
    "updated_at": "2020-06-26T04:52:25.146Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.215Z",
    "id": 49,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.258Z",
        "done": false,
        "id": 49,
        "name": "totam",
        "todo_id": 49,
        "updated_at": "2020-06-26T04:52:25.258Z"
      }
    ],
    "title": "quam",
    "updated_at": "2020-06-26T04:52:25.215Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.291Z",
    "id": 50,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.324Z",
        "done": false,
        "id": 50,
        "name": "odio",
        "todo_id": 50,
        "updated_at": "2020-06-26T04:52:25.324Z"
      }
    ],
    "title": "ea",
    "updated_at": "2020-06-26T04:52:25.291Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.357Z",
    "id": 51,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.391Z",
        "done": false,
        "id": 51,
        "name": "vero",
        "todo_id": 51,
        "updated_at": "2020-06-26T04:52:25.391Z"
      }
    ],
    "title": "dolores",
    "updated_at": "2020-06-26T04:52:25.357Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.424Z",
    "id": 52,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.457Z",
        "done": false,
        "id": 52,
        "name": "ipsam",
        "todo_id": 52,
        "updated_at": "2020-06-26T04:52:25.457Z"
      }
    ],
    "title": "voluptatem",
    "updated_at": "2020-06-26T04:52:25.424Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.491Z",
    "id": 53,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.525Z",
        "done": false,
        "id": 53,
        "name": "atque",
        "todo_id": 53,
        "updated_at": "2020-06-26T04:52:25.525Z"
      }
    ],
    "title": "iusto",
    "updated_at": "2020-06-26T04:52:25.491Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.557Z",
    "id": 54,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.591Z",
        "done": false,
        "id": 54,
        "name": "qui",
        "todo_id": 54,
        "updated_at": "2020-06-26T04:52:25.591Z"
      }
    ],
    "title": "quia",
    "updated_at": "2020-06-26T04:52:25.557Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.624Z",
    "id": 55,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.658Z",
        "done": false,
        "id": 55,
        "name": "ducimus",
        "todo_id": 55,
        "updated_at": "2020-06-26T04:52:25.658Z"
      }
    ],
    "title": "est",
    "updated_at": "2020-06-26T04:52:25.624Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.697Z",
    "id": 56,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.735Z",
        "done": false,
        "id": 56,
        "name": "at",
        "todo_id": 56,
        "updated_at": "2020-06-26T04:52:25.735Z"
      }
    ],
    "title": "omnis",
    "updated_at": "2020-06-26T04:52:25.697Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.801Z",
    "id": 57,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.869Z",
        "done": false,
        "id": 57,
        "name": "aut",
        "todo_id": 57,
        "updated_at": "2020-06-26T04:52:25.869Z"
      }
    ],
    "title": "temporibus",
    "updated_at": "2020-06-26T04:52:25.801Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.913Z",
    "id": 58,
    "items": [
      {
        "created_at": "2020-06-26T04:52:25.947Z",
        "done": false,
        "id": 58,
        "name": "placeat",
        "todo_id": 58,
        "updated_at": "2020-06-26T04:52:25.947Z"
      }
    ],
    "title": "aperiam",
    "updated_at": "2020-06-26T04:52:25.913Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:25.993Z",
    "id": 59,
    "items": [
      {
        "created_at": "2020-06-26T04:52:27.061Z",
        "done": false,
        "id": 59,
        "name": "modi",
        "todo_id": 59,
        "updated_at": "2020-06-26T04:52:27.061Z"
      }
    ],
    "title": "ut",
    "updated_at": "2020-06-26T04:52:25.993Z",
    "user_id": 1
  },
  {
    "created_at": "2020-06-26T04:52:27.111Z",
    "id": 60,
    "items": [
      {
        "created_at": "2020-06-26T04:52:27.179Z",
        "done": false,
        "id": 60,
        "name": "iure",
        "todo_id": 60,
        "updated_at": "2020-06-26T04:52:27.179Z"
      }
    ],
    "title": "inventore",
    "updated_at": "2020-06-26T04:52:27.111Z",
    "user_id": 1
  }
]
```
