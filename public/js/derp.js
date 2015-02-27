$(document).ready(function() {
    $(".shorturl-text").click(function() { 
        $(this).select(); 
        //TODO: add copy to clipboard functionality
      });

    /*
    var clip = new ZeroClipboard( $(".shorturl-text"), {
            moviePath: "/js/vendor/ZeroClipboard.swf"
        } );

    clip.on( 'load', function(client) {
        // alert( "movie is loaded" );
        } );

    clip.on( 'complete', function(client, args) {
        alert("Copied text to clipboard: " + args.value );
        } );

    clip.on( 'mouseover', function(client) {
        // alert("mouse over");
        } );

clip.on( 'mouseout', function(client) {
        // alert("mouse out");
        } );

clip.on( 'mousedown', function(client) {

        // alert("mouse down");
        } );

clip.on( 'mouseup', function(client) {
        // alert("mouse up");
        } );
    */
});
