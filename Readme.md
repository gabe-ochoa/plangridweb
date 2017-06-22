# PlanGrid Web Microservice

This is a small microservice for PlanGrid

## Documentation / Specification

This microservice only has 1 endpoint at the index path (`/`)

### `/`

#### Hello World

##### GET

Headers:

`Accept: text/html`

##### Response:

status: 200

`<p>Hello, World</p>`

Sample cURL:

```
curl -H "Accept: text/html" \
     -X GET \
     http://localhost:3000/
```


#### Good Morning

##### GET

Headers:

`Accept: application/json`

##### Response:

status: 200

body:

`<p>Hello, World</p>`

Sample cURL:

```
curl -H "Accept: application/json" \
     -X GET \
     http://localhost:3000/
```


#### Check Server Mode, SERVER_MODE = "true"

##### POST

Body: 

```
{
    "foo": "value_foo"
    "bar": "value_bar"
}
```

#####Response:

Status: 202

Body:

```
{
    "value_foo"
}
```

Sample cURL:

```
curl -H "Content-Type: application/json" \
     -X POST -d '{"foo":"value_foo","bar":"value_bar"}' \
     http://localhost:3000/
```

#### Check Server Mode, SERVER_MODE = "false"

##### POST

Body: 

```
{
    "foo": "value_foo"
    "bar": "value_bar"
}
```

##### Response:

Status: 202

Body:

```
{
    "value_bar"
}
```

Sample cURL:

```
curl -H "Content-Type: application/json" \
     -X POST -d '{"foo":"value_foo","bar":"value_bar"}' \
     http://localhost:3000/
```

