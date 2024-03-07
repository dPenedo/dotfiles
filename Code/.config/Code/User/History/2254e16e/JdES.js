document.addEventListener('DOMContentLoaded', function () {
    let miliseconds = 0;
    let seconds = 0;
    let minutes = 0;
    let hours = 0;
    let run = true;
    let intervalId;

    const milisecondsDisplay = document.querySelector('#milisec');
    const secondsDisplay = document.querySelector('#sec');
    const minutesDisplay = document.querySelector('#min');
    const hoursDisplay = document.querySelector('#hours');
    const startButton = document.querySelector('#playPause');
    const resetButton = document.querySelector('#reset');

    startButton.addEventListener('click', playPause);
    resetButton.addEventListener('click', reset);

    function playPause() {
        if (run && startButton.innerHTML !== "Start") {
            clearInterval(intervalId);
            run = false;
            document.querySelector('button').innerHTML = "Play";
        } else {
            intervalId = setInterval(count, 10);
            run = true;
            document.querySelector('button').innerHTML = "Pause";
        }
    }
    function count() {
        miliseconds++;
        milisecondsDisplay.innerHTML = miliseconds;
        secondsDisplay.innerHTML = seconds;
        minutesDisplay.innerHTML = minutes;
        hoursDisplay.innerHTML = hours;

        // if (counter % 10 === 0) {
        //     alert(`Count is now ${counter}`);
        // }
        if (miliseconds % 100 === 0 && miliseconds !== 0) {
            miliseconds = 0;
            seconds++;
        } else if (seconds % 60 === 0 && seconds !== 0) {
            seconds = 0;
            minutes++;
        } else if (minutes % 60 === 0 && minutes !== 0) {
            minutes = 0;
            hour++;
        }
    }
    function reset() {
        milisecondsDisplay.innerHTML = 0;
        secondsDisplay.innerHTML = 0;
        minutesDisplay.innerHTML = 0;
        hoursDisplay.innerHTML = 0;
        miliseconds = 0;
        seconds = 0;
        minutes = 0;
        hours = 0;
        if (run) {
            playPause();
        }
    }


});