(function() {
  return {
    onReady : function(data) {
    //console.log("Hello from " + "'" + this.name + "'");
    },
    onSpinnerOff : function(feature) {
      var overlay = document.querySelector("." + feature + " .spinner");
      document.querySelector("." + feature + " .spinning-wheel").setAttribute("style", "display:none");
      setTimeout(function() {
        overlay.setAttribute("style", "display:none");
      }, 200);
    }
  };
}());