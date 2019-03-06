$(document).ready(function () {
  console.log('litters.js is loaded...');
  viewSingleKitten();
  viewSingleLitter();
  postNewLitters();
  loadLitters();
  uploadImage();
  Litter.templateSource = $('#litter-template').html();
  Litter.template = Handlebars.compile(Litter.templateSource);
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

function viewSingleKitten() {
  $('body').on('click', 'a.kitten-link', function(e) {
    e.preventDefault();
    url = this.href;
    console.log("URL is: ", url);
    $.ajax({
      url: url,
      method: 'GET',
      dataType: 'json'
    }).done(function(data) {
      let kittens = data;
      console.log("kittens are: ", kittens);
      let pathArray = url.split('/');
      let litterId = pathArray[4];
      let kittenId = pathArray[6];
      console.log("litter_ID is:", litterId);
      console.log("kitten_ID is:", kittenId);



      let source = $('#kitten-template').html();
      let template = Handlebars.compile(source);
      let kitCardHtml = template(kittens);

      $(".modal-body").html("");

      $(".modal-body").html(kitCardHtml);
      $('#myModal').modal('show');
    });
  });
}


function viewSingleLitter() {
  $('body').on('click', 'button.modalButton', function(e) {
    e.preventDefault();
    url = "/litters/" + $(this).data("name");

    $.ajax({
      url: url,
      method: 'GET',
      dataType: 'json'
    }).done(function(response) {
      // console.log("data from view click", response);

      $(".modal-body").html("");
      response.forEach(function(kitten) {
        let getKitten = new Kitten(kitten);
        let getKittenHTML = getKitten.kittenHTML();

        $(".modal-body").append(getKittenHTML);
        $('#myModal').modal('show');
      });

    });
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

Litter.prototype.renderCard = function() {
  return Litter.template(this);
};


Kitten.prototype.kittenHTML = function() {
  return (`

    <div class="col-xs-12 col-md-4 ">
      <div class="card bg-light mb-4 ${this.sex ? 'border-boy' : 'border-girl'} ">
        <img class="card-img-top" id="img-preview">
        <label class="file-upload-container">
            <input id="file-upload" type="file">
            Upload An Image
        </label>
        <img_tag(${this.image_url})>
        <div class="card-body">
          <h4 class="card-title">
              <a class="kitten-link ${this.sex ? 'boy' : 'girl'}" href="/litters/${this.litter_id}/kittens/${this.id}">${this.name}</a>
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



const CLOUDINARY_URL = "https://api.cloudinary.com/v1_1/dwewmxnvd/upload";
const CLOUDINARY_UPLOAD_PRESET = "full_500";

function uploadImage() {
  $('body').on('change', "#file-upload", function(event) {
    let file = event.target.files[0];
    let formData = new FormData();
    formData.append('file', file);
    formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);

    $.ajax({
      url: CLOUDINARY_URL,
      method: 'POST',
      processData: false,
      contentType: false,
      header: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      data: formData
    }).done(function(res) {
      $("img-preview").src = res.secure_url;
      console.log(res.secure_url);
    });

    event.preventDefault();
  });
}


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
