var derpsum = new function() {

    var self = this;

    this.init = function() {
        self.masonry();
        self.bookmarklet();
    };
    
    this.masonry = function() {
        var $container = $('.images');

        $container.isotope({
            itemSelector: '.image',
            animationEngine: 'best-available',
            layoutMode: 'masonry'
        });
    };
    
    this.bookmarklet = function() {
        $('.header-buttons .bookmarklet, .derp-it .x').on('click', function() {
            $('.derp-it').slideToggle();
        });
    };
    
};
jQuery(document).ready(function($){
    derpsum.init();
});

$(window).load(function($){
    derpsum.masonry();
});