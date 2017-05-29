## install:
```bash
npm install
elm package install -y
```

### In case elm version not matching re-install correct version:

```bash
npm remove -g elm
npm install -g elm@0.18.0 # Or whatever version is specified in elm-package.json
```

`gulp` will watch the app and copy it to Jekyll's assets.
