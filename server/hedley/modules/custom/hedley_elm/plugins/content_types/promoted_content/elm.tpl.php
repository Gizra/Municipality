<div id="elm-app"></div>

<script>
  var node = document.getElementById('elm-app');
  var app = Elm.Main.embed(node);
  // Note: if your Elm module is named "MyThing.Root" you
  // would call "Elm.MyThing.Root.embed(node)" instead.
</script>