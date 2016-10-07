# docker-aports

> Build alpine packages according to [aports](http://git.alpinelinux.org/cgit/aports)

For more in-depth on how to build Alpine Linux Package, see [Creating an Alpine Package](https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package).


## Usage

Let's say we want to build the latest `git` package. It's located under `aports/main/git`. Running the `cirocosta/aports` container, just specify the `-build` command along with the location `main/git`:

  ```sh
  docker run --rm cirocosta/aports -build main/git
  ```

Now your results will be under `

