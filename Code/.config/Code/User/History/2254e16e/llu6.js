let counter = 0;

function count() {
    secondsDisplay.innerHTML = counter;
    counter++;
}
document.addEventListener('DOMContentLoaded', function () {
    // document.querySelector('button').oncli
    countButton.onclick = count;
    setInterval(count, 1000);
});