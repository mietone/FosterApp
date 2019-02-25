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



      // $.each(data, function(key, value) {
      //   $('div#litters_container').val("");
      //   $('div#litters_container').append('<div style="display:inline;">' + value.name + '</div><br />');
      // });
    });
  });
}


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


Handlebars.registerHelper('getAge', function(dateString) {
  var now = new Date();
  var today = new Date(now.getYear(),now.getMonth(),now.getDate());

  var yearNow = now.getYear();
  var monthNow = now.getMonth();
  var dateNow = now.getDate();

  var dob = new Date(dateString);

  var yearDob = dob.getYear();
  var monthDob = dob.getMonth();
  var dateDob = dob.getDate();
  var age = {};
  var ageString = "";
  var yearString = "";
  var monthString = "";
  var dayString = "";


  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob)
    var monthAge = monthNow - monthDob;
  else {
    yearAge--;
    var monthAge = 12 + monthNow -monthDob;
  }

  if (dateNow >= dateDob)
    var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
      years: yearAge,
      months: monthAge,
      days: dateAge
      };

  if ( age.years > 1 ) yearString = " years";
  else yearString = " year";
  if ( age.months> 1 ) monthString = " months";
  else monthString = " month";
  if ( age.days > 1 ) dayString = " days";
  else dayString = " day";


  if ( (age.years > 0) && (age.months > 0) && (age.days > 0) )
    ageString = age.years + yearString + ", " + age.months + monthString + ", and " + age.days + dayString + " old.";
  else if ( (age.years == 0) && (age.months == 0) && (age.days > 0) )
    ageString = "Only " + age.days + dayString + " old!";
  else if ( (age.years > 0) && (age.months == 0) && (age.days == 0) )
    ageString = age.years + yearString + " old. Happy Birthday!!";
  else if ( (age.years > 0) && (age.months > 0) && (age.days == 0) )
    ageString = age.years + yearString + " and " + age.months + monthString + " old.";
  else if ( (age.years == 0) && (age.months > 0) && (age.days > 0) )
    ageString = age.months + monthString + " and " + age.days + dayString + " old.";
  else if ( (age.years > 0) && (age.months == 0) && (age.days > 0) )
    ageString = age.years + yearString + " and " + age.days + dayString + " old.";
  else if ( (age.years == 0) && (age.months > 0) && (age.days == 0) )
    ageString = age.months + monthString + " old.";
  else ageString = "Oops! Could not calculate age!";

  return ageString;
});


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
