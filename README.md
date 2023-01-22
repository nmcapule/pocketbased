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

### Deploying with fly.io

1. Install fly.io with:

   ```sh
   $ curl -L https://fly.io/install.sh | sh
   ```

   This will output some instruction on how you can setup your shell environment
   with fly.io.

2. Login / authenticate using your fly.io account

   ```sh
   $ flyctl auth login
   ```

3. Create the project.

   ```sh
   $ fly launch
   ```

   This will prompt you if you want to install a few additional things and if
   you'd like to deploy now. Type `N` to all of them.

4. Create a fly.io volume for database persistence.

   ```sh
   $ fly volumes create data --region sin --size 1
   ```

   This creates a volume named `data` attached to your fly.io project.

5. Update the generated `fly.toml` file from step 3 to mount the volume you
   created from step 4. At the bottom from `fly.toml`, add the lines:

   ```toml
   # Makes sure that your Pocketbase data persists using fly.io volumes.
   [mounts]
   source="data"
   destination="/pb_data"
   ```

6. Deploy!

   ```sh
   $ flyctl deploy
   ```

   > Sometimes, this command fails because the free builder provided by fly.io
   > is unresponsive. In this case, try this command to build the binary locally
   > before you deploy it to fly.io:
   >
   > ```sh
   > $ flyctl deploy --local-only
   > ```
