function updateTime() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');

    const clockMinutes = document.querySelector('.clock__min-main');
    const clockSeconds = document.querySelector('.clock__sec-main');
    const clockHours = document.querySelector('.clock__hours-main');

    const secondClockHours = document.querySelector('.second-clock__hours');
    const secondclockMinutes = document.querySelector('.second-clock__min');
    const secondclockSeconds = document.querySelector('.second-clock__sec');

    clockHours.textContent = hours;
    clockMinutes.textContent = minutes;
    clockSeconds.textContent = seconds;

    secondClockHours.textContent = hours;
    secondclockMinutes.textContent = minutes;
    secondclockSeconds.textContent = seconds;
}

setInterval(updateTime, 10);

// Get the time for the first time
updateTime();
