$(document).ready(function () {
    setInterval(refreshListings, 3000);
});

function refreshListings() {
    if(window.location.pathname == '/' || window.location.pathname =='/provider/listings'){
        $.ajax({
            url: "listings/refresh_listings"
        });    
    }

};
