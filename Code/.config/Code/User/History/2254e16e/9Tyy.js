document.addEventListener('DOMContentLoaded', function () {
    let milliseconds = 0;
    let seconds = 0;
    let minutes = 0;
    let hours = 0;
    let isRunning = false;
    let intervalId;

    const millisecondsDisplay = document.querySelector('#milisec');
    const secondsDisplay = document.querySelector('#sec');
    const minutesDisplay = document.querySelector('#min');
    const hoursDisplay = document.querySelector('#hours');
    const startButton = document.querySelector('#playPause');
    const resetButton = document.querySelector('#reset');

    startButton.addEventListener('click', toggleChronometer);
    resetButton.addEventListener('click', reset);

    function toggleChronometer() {
        if (!isRunning && startButton.innerHTML !== "Start") {
            intervalId = setInterval(count, 10);
            isRunning = true;
            document.querySelector('button').innerHTML = "Pause";
        } else {
            clearInterval(intervalId);
            isRunning = false;
            document.querySelector('button').innerHTML = "Play";
        }
    }
    function count() {
        milliseconds++;
        millisecondsDisplay.innerHTML = milliseconds;
        secondsDisplay.innerHTML = seconds;
        minutesDisplay.innerHTML = minutes;
        hoursDisplay.innerHTML = hours;

        // if (counter % 10 === 0) {
        //     alert(`Count is now ${counter}`);
        // }
        if (milliseconds % 100 === 0 && milliseconds !== 0) {
            milliseconds = 0;
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
        clearInterval(intervalId);
        isRunning = false;
        startButton.innerHTML = "Start";
        millisecondsDisplay.innerHTML = 0;
        secondsDisplay.innerHTML = 0;
        minutesDisplay.innerHTML = 0;
        hoursDisplay.innerHTML = 0;
        milliseconds = seconds = minutes = hours = 0;
        if (isRunning) {
            toggleChronometer();
        }
    }


});