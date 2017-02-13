document.addEventListener("DOMContentLoaded", function() {
  var readButton = document.getElementsByClassName("read-button")

  for (var i = 0; i < readButton.length; i++) {
    readButton[i].addEventListener('click',  function(e){
    e.preventDefault();
    var that = this;
    axios.patch("/api/v1/links/" + this.id, {
        read: true
      })
      .then(function (response) {
        console.log(response);
        axios.post("https://agile-anchorage-71618.herokuapp.com/links", {
          link: { 'url': that.previousSibling.previousSibling.href }
        })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
      })
      .catch(function (error) {
        console.log(error);
    });

  });
  }
});
