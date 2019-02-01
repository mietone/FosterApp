$(function () {
  console.log('litters.js is loaded...');
  getKittens();
});

function getKittens() {
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault();

    $.ajax({
      url: this.href,
      method: 'get',
      dataType: 'json'
    }).done(function(response) {
      console.log("the data is: ", response);

      let getKitten = new Kitten(response[0]);

      let getKittenHTML = getKitten.kittenHTML();

      let term = $('div#toggle-kittens').attr('data-row_id');
      $('div#toggle-kittens').append(getKittenHTML);
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
    `);
};
