
function getTime() {
    fetch('URL_DE_TU_API')
        .then(response => response.json())
        .then(data => {
            const ethiopiaTime = new Date(data.zones.find(zone => zone.countryCode === 'ET').timestamp * 1000);
            const formattedTime = ethiopiaTime.toLocaleTimeString('en-US', { timeZone: 'Africa/Addis_Ababa' });
            document.getElementById('time').innerText = formattedTime;
        })
        .catch(error => console.error('Error fetching time:', error));
}

// Actualizar la hora cada segundo
setInterval(getTime, 1000);

// Obtener la hora por primera vez
getTime();