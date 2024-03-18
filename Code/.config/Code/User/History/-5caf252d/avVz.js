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
            let hours = datetimString.slice(10, 12);
            let minutes = datetimeString.slice(13, 16);
            let seconds = datetimeString.slice(17, 19);
            console.log(hours);
            console.log(minutes);
            console.log(seconds);

            // // Remove timezone offset from datetime string
            // let datetimeWithoutOffset = datetimeString.slice(0, -6);

            // // Create a new Date object with the datetime string and apply the timezone offset
            // let date = new Date(datetimeWithoutOffset + "Z");
            // date.setUTCMinutes(date.getUTCMinutes() + timezoneOffset);

            // // Get the hours, minutes, and seconds
            // let hours = date.getUTCHours();
            // let minutes = date.getUTCMinutes();
            // let seconds = date.getUTCSeconds();

            // // Display the time
            // console.log("Hours:", hours);
            // console.log("Minutes:", minutes);
            // console.log("Seconds:", seconds);
        });

    const secondTimestamp = 1710767984;
    const secondMilliseconds = secondTimestamp * 1000;
    const secondDateObject = new Date(secondMilliseconds);
    const secondHours = ('0' + secondDateObject.getHours()).slice(-2);
    const secondMinutes = ('0' + secondDateObject.getMinutes()).slice(-2);
    const secondSeconds = ('0' + secondDateObject.getSeconds()).slice(-2);




    secondClockHours.textContent = secondHours;
    secondclockMinutes.textContent = secondMinutes;
    secondclockSeconds.textContent = secondSeconds;


}

setInterval(updateTime, 1000);

// Get the time for the first time
updateTime();
const accordionButton = document.querySelector('.accordion__button');
const accordionContent = document.querySelector('.accordion__content');

accordionButton.addEventListener('click', function () {
    accordionContent.classList.toggle('active');
});

