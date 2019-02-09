$(function () {
  console.log('kittens.js is loaded...');
  showKittens();
});

function showKittens() {
  $("button.next-kitten").on('click', function(e) {
    e.preventDefault();

  });
}
