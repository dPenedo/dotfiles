document.addEventListener('DOMContentLoaded', function () {

    let miliseconds = 0;
    let seconds = 0;
    let minutes = 0;
    let hours = 0;
    let run = true;
    let intervalId;
    let startButton = document.querySelector('#playPause');

    // if (run) {
    //     setInterval(count, 10);
    // }
    startButton.addEventListener('click', playPause);
    document.querySelector('#reset').addEventListener('click', reset);

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
        document.querySelector('#milisec').innerHTML = miliseconds;
        document.querySelector('#sec').innerHTML = seconds;
        document.querySelector('#min').innerHTML = minutes;
        document.querySelector('#hours').innerHTML = hours;

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
        document.querySelector('#milisec').innerHTML = 0;
        document.querySelector('#sec').innerHTML = 0;
        document.querySelector('#min').innerHTML = 0;
        document.querySelector('#hours').innerHTML = 0;
        miliseconds = 0;
        seconds = 0;
        minutes = 0;
        hours = 0;
        playPause();
        // if (run) {
        //     run = false;
        // }
    }


});