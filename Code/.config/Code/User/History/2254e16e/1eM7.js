let counter = 0;

const secondsDisplay = document.querySelector('h1');
const countButton = document.querySelector('button');

function count() {
    secondsDisplay.innerHTML = counter;
    counter++;
}
document.addEventListener('DOMContentLoaded', function () {
    // document.querySelector('button').oncli
    countButton.oncli;
    setInterval(count, 1000);
});