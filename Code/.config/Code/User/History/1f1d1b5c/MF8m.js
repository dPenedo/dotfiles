document.addEventListener('DOMContentLoaded', () => {
    // By default, sumbit button is disabled.
    document.querySelector('#submit').disabled = true;

    document.querySelector('#task').onkeyup = () => {
        document.querySelector('#submit').disabled = false;
    };

    document.querySelector('form').onsubmit = () => {
        const task = document.querySelector('#task').value;

        const li = document.createElement('li');
        li.innerHTML = task;

        document.querySelector('#tasks').append(li);
        document.querySelector('#task').value = '';

        // Stop form from sumbitting
        return false;
    };
});