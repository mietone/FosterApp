$(function () {
  console.log('litters.js is loaded...')
  $("a.btn.btn-outline-primary").on('click', function(e) {
    e.preventDefault()

    $.ajax({
      url: this.href,
      method: 'get',
      dataType: 'json'
    }).done(function(response) {
      console.log("the data is: ", response)

      let getLitter = new Litter(response)

      let getLitterHTML = getLitter.litterHTML()

      $('div.toggle-kittens').html(getLitterHTML)
    })
  })
})

class Litter {
  constructor(obj) {
    debugger
    this.name = obj.name
    this.kittens = obj.kittens
  }
}

Litter.prototype.litterHTML =  function() {
  return (`
      <p>${this.name}</p>
    `)
}
