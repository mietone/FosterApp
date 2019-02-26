$(document).on('turbolinks:load', function () {
  console.log('litters.js is loaded...');
  getKittens();
  postNewLitters();
  loadLitters();
});


class Litter {
  constructor(obj) {
    this.id = obj.id;
    this.name = obj.name;
    this.kittens = obj.kittens;
    this.start_date = obj.start_date;
    this.end_date = obj.end_date;
    this.with_mom = obj.with_mom;
    this.mom_name = obj.mom_name;
    this.users = obj.users;
  }
}

class Kitten {
  constructor(obj) {
    this.id = obj.id;
    this.user_id = obj.user_id;
    this.litter_id = obj.litter_id;
    this.name = obj.name;
    this.sex = obj.sex;
    this.color = obj.color;
    this.image = obj.image;
    this.dob = obj.dob;
    this.image = obj.image;
  }
}

class User {
  constructor(obj) {
    this.id = obj.id;
    this.username = obj.username;
    this.email = obj.email;
  }
}


function getKittens() {
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault();
    $('div.insert-kittens').html('');
    let $clicked = $(this);
    // $clicked.addClass("active");

    $.ajax({
      url: this.href,
      method: 'GET',
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

function loadLitters() {
  $('a.nav-link.load_litters').on('click', function(e) {
    e.preventDefault();

    // show or hide 'Show All Litters'
    $('a.nav-link.load_litters').css('visibility', $('div#litters_container').css('visibility') == 'hidden' ? 'visible' : 'hidden');

    $.ajax({
      url: this.href,
      method: 'GET',
      dataType: 'json'
    }).done(function(data){
      console.log("load_litters data is: ", data);

      data.forEach(function(litter) {
        let getLitter = new Litter(litter);
        let litterCard = getLitter.renderCard();
        $('div#litters_container').append(litterCard);
      });

    });
  });
}

function postNewLitters() {
  $('body').on('submit', '#new_litter', function(e) {
    e.preventDefault();

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json"
    }).done(function(litter) {
      let getLitter = new Litter(litter);
      let litterCard = getLitter.renderCard();
      $('div#litters_container').prepend(litterCard);
    });
    $('#modal-window').modal( 'hide');
  });
}

$(function() {
  Litter.templateSource = $('#litter-template').html();
  Litter.template = Handlebars.compile(Litter.templateSource);
});


Litter.prototype.renderCard = function() {
  return Litter.template(this);
};


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





Handlebars.registerHelper('plural', function(number, text) {
	var singular = number === 1;
	// If no text parameter was given, just return a conditional s.
	if ( typeof text !== 'string' ) return singular ? '' : 's';
	// Split with regex into group1/group2 or group1(group3)
	var match = text.match( /^([^()\/]+)(?:\/(.+))?(?:\((\w+)\))?/ );
	// If no match, just append a conditional s.
	if ( !match ) return text + ( singular ? '' : 's' );
	// We have a good match, so fire away
	return singular && match[1] // Singular case
		|| match[2] // Plural case: 'bagel/bagels' --> bagels
		|| match[1] + ( match[3] || 's' ); // Plural case: 'bagel(s)' or 'bagel' --> bagels
});
