const dropdowns = document.querySelectorAll('#files .file-manager .fm-container .body .dropdown')

for (const dropdown of dropdowns) {
    dropdown.onclick = (event) => {
        event.preventDefault()
        event.stopPropagation()
    }
}

const dropdownButtonSelector = '#files .file-manager .fm-container .body .dropdown .dir-display .dropdown-button'
const dropdownButtons = document.querySelectorAll(dropdownButtonSelector);

for (const dropdownButton of dropdownButtons) {
    dropdownButton.onclick = () => {
        const dropdown = dropdownButton.parentElement.parentElement;

        if (!dropdown.hasAttribute('open')) {
            dropdownButton.style.transform = 'rotateZ(90deg)'
            dropdown.setAttribute('open', '')
        } else {
            dropdownButton.style.transform = 'rotateZ(0)'
            dropdown.removeAttribute('open')
        }
    }
}