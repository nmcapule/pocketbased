# pocketbased

A fly.io light wrapper for quickly setting up a backend system using
[Pocketbase](https://pocketbase.io/).

If you need a quick backend for the web app or mobile app that you are
prototyping, clone this repository and type:

```sh
$ ./setup_local.sh
```

This will set up a backend running on your local machine at port 8080, with
batteries-included features such as:

- [ ] SQLite-backed database
- [ ] Database Admin UI
- [ ] Authentication
- [ ] ...and more

## Add-ons

- [ ] **Deploy with [fly.io](https://fly.io)**
  - Follow
    [this guide for instructions on how to deploy Dockerfile-based applications](https://fly.io/docs/languages-and-frameworks/dockerfile/).
  - For persistence, either create a
    [fly.io volumes](https://fly.io/docs/reference/volumes/) or integrate with
    [litestream.io](https://litestream.io) for replication to your S3-backed
    file storage.
- [ ] **Integrate with [litestream.io](https://litestream.io)**
  - This requires modification on the Dockerfile, where Litestream will run as a
    sidecar to Pocketbase. For example, see
    [oclz-go Dockerfile](https://github.com/nmcapule/oclz-go/blob/development/Dockerfile).
