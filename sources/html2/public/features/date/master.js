(function() {
  return {
    onReady : function(data) {
      var date = new Date().toISOString().substring(0, 10),
      field = document.querySelector('.date input');
      field.value = date;
    },
  };
}());