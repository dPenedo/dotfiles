function updateTime() {


    const firstClockHours = document.querySelector('.clock__hours-main');
    const firstClockMinutes = document.querySelector('.clock__min-main');
    const firstClockSeconds = document.querySelector('.clock__sec-main');
    const secondClockHours = document.querySelector('.second-clock__hours');
    const secondclockMinutes = document.querySelector('.second-clock__min');
    const secondclockSeconds = document.querySelector('.second-clock__sec');

    // First clock logic
    const now = new Date();
    const firstHours = String(now.getHours()).padStart(2, '0');
    const firstMinutes = String(now.getMinutes()).padStart(2, '0');
    const firstSeconds = String(now.getSeconds()).padStart(2, '0');
    firstClockSeconds.textContent = firstSeconds;
    firstClockMinutes.textContent = firstMinutes;
    firstClockHours.textContent = firstHours;

    // Second clock logic

    fetch('http://worldtimeapi.org/api/timezone/America/Argentina/Salta')
        .then(response => response.json())
        .then(data => {
            let datetimeString = data.datetime;

            console.log(datetimeString);
            // Extract timezone offset
            const secondHours = datetimeString.slice(11, 13);
            const secondMinutes = datetimeString.slice(14, 16);
            const secondSeconds = datetimeString.slice(17, 19);
            secondClockHours.textContent = secondHours;
            secondclockMinutes.textContent = secondMinutes;
            secondclockSeconds.textContent = secondSeconds;
        });



}

setInterval(updateTime, 1000);

// Get the time for the first time
updateTime();
const accordionButton = document.querySelector('.accordion__button');
const accordionContent = document.querySelector('.accordion__content');

accordionButton.addEventListener('click', function () {
    accordionContent.classList.toggle('active');
});

