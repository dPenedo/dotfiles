let counter = 0;

function count() {
    counter++;
    secondsDisplay.innerHTML = counter;
}
document.addEventListener('DOMContentLoaded', function () {
    // document.querySelector('button').oncli
    countButton.onclick = count;
    setInterval(count, 1000);
});