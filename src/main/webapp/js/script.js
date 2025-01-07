// script.js

function submitDonation() {
    // Get form values
    const userName = document.getElementById('userName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const foodName = document.getElementById('foodName').value.trim();
    const quantity = document.getElementById('quantity').value.trim();
    const expiryDate = document.getElementById('expiryDate').value.trim();
    const location = document.getElementById('location').value.trim();

    // Validate form fields
    if (!userName || !email || !phone || !foodName || !quantity || !expiryDate || !location) {
        alert('Please fill out all fields before submitting.');
        return;
    }

    // Create a donation entry
    const donationItem = document.createElement('li');
    donationItem.innerHTML = `
        <strong>Donor:</strong> ${userName}<br>
        <strong>Email:</strong> ${email}<br>
        <strong>Phone:</strong> ${phone}<br>
        <strong>Food:</strong> ${foodName}<br>
        <strong>Quantity:</strong> ${quantity}<br>
        <strong>Expiry Date:</strong> ${expiryDate}<br>
        <strong>Pickup Location:</strong> ${location}
    `;

    // Append the new donation to the donation list
    const donationList = document.getElementById('donations');
    donationList.appendChild(donationItem);

    // Clear the form
    document.getElementById('foodDonationForm').reset();

    alert('Thank you for your donation!');
}
