$(function () {
  console.log('litters.js is loaded...');
  getKittens();
});

function getKittens() {
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault();
    $('div.toggle-kittens').html('');
    $clicked = $(this);
    // $clicked.addClass("active");

    $.ajax({
      url: this.href,
      method: 'get',
      dataType: 'json'
    }).done(function(response) {
      console.log("the data is: ", response);

      response.forEach(function(kitten) {
        console.log(kitten);
        let getKitten = new Kitten(kitten);

        let getKittenHTML = getKitten.kittenHTML();

        // $(getKittenHTML).insertAfter($(".row"));
        // $('div.toggle-kittens').append(getKittenHTML);
        $clicked.closest('.row').next('div.toggle-kittens').append(getKittenHTML);
      });
    });
  });
}


class Kitten {
  constructor(obj) {
    this.name = obj.name;
    this.color = obj.color;
    this.dob = obj.dob;
  }
}

Kitten.prototype.kittenHTML =  function() {
  return (`
      <p>${this.name}</p>
      <p>${this.color}</p>
    `);
};
