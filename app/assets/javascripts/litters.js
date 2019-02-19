$(document).on('turbolinks:load', function () {
  console.log('litters.js is loaded...');
  getKittens();
  postNewLitters();
});

function getKittens() {
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault();
    $('div.insert-kittens').html('');
    let $clicked = $(this);
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
        // $('div.card.border-custom.toggle').after( $("<div></div>").addClass('toggle-kittens row m-4') );
        $('div.insert-kittens').addClass('row m-4');
        $clicked.closest('div.row').next('div.card.border-custom.toggle').find('div.insert-kittens').append(getKittenHTML);
      });
    });

    $('div.card.border-custom.toggle').toggle();
  });
}

class Kitten {
  constructor(obj) {
    this.id = obj.id;
    this.name = obj.name;
    this.sex = obj.sex;
    this.color = obj.color;
    this.litter_id = obj.litter_id;
    this.image = obj.image;
    this.dob = obj.dob;
  }
}

class User {
  constructor(obj) {
    this.id = obj.id;
    this.username = obj.username;
    this.email = obj.email;
  }
}

Kitten.prototype.kittenHTML =  function() {
  return (`

    <div class="col-xs-12 col-md-3 ">
      <div class="card bg-light mb-4 ${this.sex ? 'border-boy' : 'border-girl'} ">
        <img class="card-img-top" src=${this.image.thumb.url}>
        <img_tag(${this.image_url})>
        <div class="card-body">
          <h4 class="card-title">
              <a class="${this.sex ? 'boy' : 'girl'}" href="/litters/${this.litter_id}/kittens/${this.id}">${this.name}</a>
          </h4>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">${this.color}</li>
          <li class="list-group-item">${this.sex ? 'boy' : 'girl'}</li>
        </ul>

      </div>
    </div>

  `);
};

function postNewLitters() {
  $('#new_litter').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(response) {
        console.log(response);
      }
    });

  });
}
