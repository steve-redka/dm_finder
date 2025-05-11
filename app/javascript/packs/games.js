document.addEventListener('DOMContentLoaded', function() {
    const recurrenceSelect = document.getElementById('recurrence-select') || document.getElementById('q_recurrence_eq');
    const nextGameField = document.getElementById('next-game-field');

    recurrenceSelect.addEventListener('change', function() {
        if (recurrenceSelect.value === 'one-shot' || recurrenceSelect.value === 'weekly') {
            nextGameField.style.display = 'block';
        } else {
            nextGameField.style.display = 'none';
        }
    });

    // Trigger change event on page load to set initial state
    recurrenceSelect.dispatchEvent(new Event('change'));
});