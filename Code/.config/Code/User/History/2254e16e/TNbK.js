document.addEventListener('DOMContentLoaded', function () {
    let miliseconds = 0;
    let seconds = 0;
    let minutes = 0;
    let hours = 0;
    let run = true;
    function playPause() {
        console.log(`El estado de run es ${run}`);
        if (run == true) {
            run = false;
        } else {
            run = true;
        }
        console.log(`El estado de run es ${run}`);
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
        // } else if (minutes % 60 === 0 && minutes !== 0) {
        //     minutes = 0;
        //     hours++;
        // }

    }
    document.querySelector('button').addEventListener('click', playPause);
    if (run == true) {
        setInterval(count, 10);
    } else {
        setInterval(count, 0);

    }

});