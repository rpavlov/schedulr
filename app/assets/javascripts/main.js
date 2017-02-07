$(document).ready(function () {
    setInterval(refreshListings, 3000)

});

function refreshListings() {
    $.ajax({
        url: "listings/refresh_listings"
    });
};
