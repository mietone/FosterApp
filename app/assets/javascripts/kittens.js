$(function () {
  console.log('kittens.js is loaded...');
  showKittens();
});

function showKittens() {
  $("button.next-kitten").on('click', function(e) {
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
  }
}

Kit.prototype.showKittenHTML =  function() {
  return (`
    <h1>${this.name}</h1>
  `);
};
