$(function () {
  console.log('kittens.js is loaded...');
  nextKitten();
  prevKitten();
});

function nextKitten() {
  $("body").on('click', 'button.next-kitten', function(e) {
    e.preventDefault();
    let pathArray = window.location.pathname.split('/');
    let litterId = pathArray[2];
    let kittenId = pathArray[4];
    fetch(`/litters/${litterId}/kittens/${kittenId}/next`)
      .then(res => res.json())
      .then(kitten => {
        $('div.card.bg-light.showKitten').html('');
        let newKitten = new Kit(kitten);
        let kittenHTML = newKitten.showKittenHTML();
        $('div.card.bg-light.showKitten').append(kittenHTML);
        history.pushState(null, null, `${newKitten.id}`);
      });
  });
}

function prevKitten() {
  $("body").on('click', 'button.prev-kitten', function(e) {
    e.preventDefault();
    let pathArray = window.location.pathname.split('/');
    let litterId = pathArray[2];
    let kittenId = pathArray[4];
    fetch(`/litters/${litterId}/kittens/${kittenId}/prev`)
      .then(res => res.json())
      .then(kitten => {
        $('div.card.bg-light.showKitten').html('');
        let newKitten = new Kit(kitten);
        let kittenHTML = newKitten.showKittenHTML();
        $('div.card.bg-light.showKitten').append(kittenHTML);
        history.pushState(null, null, `${newKitten.id}`);
      });
  });
}

class Kit {
  constructor(obj) {
    this.id = obj.id;
    this.name = obj.name;
    this.sex = obj.sex;
    this.color = obj.color;
    this.litter_id = obj.litter_id;
    this.image = obj.image;
    this.dob = obj.dob;
    this.user = obj.user;
  }
}

Kit.prototype.showKittenHTML =  function() {
  return (`

      <div class="row">

        <div class="col-lg-6">
            <img class="rounded m-2" src=${this.image.full.url}>
        </div>

        <div class="col-lg-6">
          <div class="card-body">
            <h2 class="card-title text-center ${this.sex ? 'boy' : 'girl'}">
                ${this.name}
            </h2>

            <ul class="list-group list-group-flush mr-4 ml-4">
              <li class="list-group-item">${this.color}</li>
              <li class="list-group-item">${this.sex ? 'boy' : 'girl'}</li>
              <li class="list-group-item">${this.dob}</li>
              <li class="list-group-item">"age"</li>
              <h6>
                <li class="list-group-item text-muted">Fostered By:
                <span class="font-weight-normal d-inline-block mb-0.5 ml-1">${this.user.username}</span>
                </li>
              </h6>
            </ul>

            <div class="text-center m-4">
              <h4 class="litter-name"><a href="/litters/7">${this.litter_id.name}</a></h4>

            </div>
          </div>
        </div>
      </div>


      <div class="row adjust-width">
        <div class="col-xs-12 col-md-6 btn-margin">
          <button class="btn btn-outline-primary btn-block prev-kitten"> &lt;&lt; Previous Kitten </button>
        </div>

        <div class="col-xs-12 col-md-6 btn-margin">
         <button class="btn btn-outline-primary btn-block next-kitten"> Next Kitten &gt;&gt; </button>
        </div>
      </div>

      <div class="row adjust-width">
        <a class="btn btn-outline-primary btn-block" href="/litters/7">Back to ${this.litter_id.name} Litter</a>
      </div>



  `);
};
