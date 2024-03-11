const dropdowns = document.querySelectorAll('#files .file-manager .fm-container .body .dropdown')

for (const dropdown of dropdowns) {
    const anchor = dropdown.querySelector('.dir-display > .directory-node')

    anchor.addEventListener('click', () => document.location.href = anchor.href)
    dropdown.addEventListener('click', (event) => event.preventDefault())
}

const buttons = document.querySelectorAll('#files .file-manager .fm-container .body .dropdown .dir-display .dropdown-button')

for (const button of buttons) {
    button.addEventListener('click', () => {
        const dropdown = button.parentElement.parentElement

        if (!dropdown.hasAttribute('open')) {
            dropdown.setAttribute('open', '')
            button.style.transform = 'rotateZ(90deg)'
        } else {
            dropdown.removeAttribute('open')
            button.style.transform = 'rotateZ(0)'
        }
    })
}