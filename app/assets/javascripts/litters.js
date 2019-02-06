$(function () {
  console.log('litters.js is loaded...');
  getKittens();
});

function getKittens() {
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault();
    $('div.toggle-kittens').html('');
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
        //
        // $('div.card.border-custom.toggle').after( $("<div></div>").addClass('toggle-kittens row m-4') );
        $('div.insert-kittens:first').addClass('toggle-kittens row m-4');
        $clicked.closest('div.row').next('div.card.border-custom.toggle').find('div.insert-kittens.toggle-kittens').append(getKittenHTML);
      });
    });

    $('div.card.border-custom.toggle').toggle();
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

        <div class="col-xs-12 col-md-3 ">
          <div class="card bg-light border-girl">
            <img class="card-img-top" src="/uploads/kitten/image/24/thumb_Zaba.JPG">
            <div class="card-body">
              <h4 class="card-title">
                  <a class="girl" href="/litters/<%= litter.id %>/kittens/{{id}}">${this.name}</a>
              </h4>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">white &amp; gray</li>
              <li class="list-group-item">girl</li>
            </ul>

          </div>
        </div>

  `);
};
