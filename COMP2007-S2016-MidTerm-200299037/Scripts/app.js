$(document).ready(function () {

    console.log("app started");

    $(".Delete").click(function () {
        return confirm("Are you sure you want to delete this record?");
    });
});