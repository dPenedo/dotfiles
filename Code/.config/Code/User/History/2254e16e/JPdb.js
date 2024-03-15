document.addEventListener('DOMContentLoaded', function () {
    let counter = 0;

    const secondsDisplay = document.querySelector('#sec');
    const startButton = document.querySelector('#playPause');

    function count() {
        millisecondsDisplay.innerHTML = formatTime(milliseconds);
        secondsDisplay.innerHTML = formatTime(seconds);
        minutesDisplay.innerHTML = formatTime(minutes);


    }
});