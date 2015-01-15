(function() {
  return {
    onReady : function(data) {
      setTimeout(function() {
        this.postMessage({type: "spinnerOff", data: this.name});
      }.bind(this), 3000);
    }
  };
}());