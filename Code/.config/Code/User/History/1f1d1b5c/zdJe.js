document.addEventListener('DOMContentLoaded', () => {
    // By default, sumbit button is disabled.
    document.querySelector('#submit').disabled = true;

    document.querySelector('#task').onkeyup = () => {
        document.querySelector('#submit').disabled = false;
    };

    document.querySelector('form').onsubmit = () => {
        if (document.querySelector('#task').value.length > 0) {
            document.querySelector('#submit').disabled = false;

        } else {
            document.querySelector('#submit').disabled = true;
        }

        const task = document.querySelector('#task').value;
        const li = document.createElement('li');
        li.innerHTML = task;

        document.querySelector('#tasks').append(li);
        document.querySelector('#task').value = '';

        document.querySelector('#submit').disabled = true;

        // Stop form from sumbitting
        return false;
    };
});
