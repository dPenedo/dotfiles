let counter = 0;

const secondsDisplay = document.querySelector('#sec');
const countButton = document.querySelector('#count');

function count() {
    secondsDisplay.innerHTML = counter;
    counter++;
}
document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('button').oncli;
    countButton.onclick = count;
    setInterval(count, 1000);
});