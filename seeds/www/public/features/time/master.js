(function() {
  return {
    onReady : function(data) {
//          console.log(i);
//          console.log(j);
//          for(var i =0; i<50000; ++i) {
//            for(var j =0; j<50000; ++j) {
//            } 
//          }
//          console.log(i);
//          console.log(j);
    },
    onTimeUpdate : function(data) {
      document.querySelector(".time .self").innerHTML = data;
    },
  };
}());